Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF07CCD193
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 16:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E1F611DF;
	Tue, 14 Oct 2025 16:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0TpEXWWHX9q; Tue, 14 Oct 2025 16:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D4760F3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D4760F3F;
	Tue, 14 Oct 2025 16:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFA26BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 16:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0D16404C3
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 16:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ho9JrZv0Cps for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 16:11:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED3DB4049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED3DB4049F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED3DB4049F
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 16:11:35 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 53E882C89163;
 Tue, 14 Oct 2025 18:11:33 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 18:11:33 +0200
Message-ID: <20251014161134.2592291-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760458293; bh=uJRtWYlBhrlb307fJ/AfS1K31XXNvAKV6DXsN3ONgBg=;
 h=From:To:Cc:Subject:Date;
 b=TsO3i1umKCJoQrgks2Qfy8cmL7rojibSZsZZ+FliXyXTd2TLndOm/FIbwQVi2Re2z
 rpqKl9aaJpwVZnE0vLtHK1TF3Xo/4Ntsg4xj2KbwI4ckkP98qDahXVjrj0vjryJERw
 zXWhIppBNT8swYqRBkJ2vWd9H7v6IN2mB1Pwkaz51BYIQe2SKGE/gs8gyu7s+YJ4k9
 j04AwDudo9u7ZEDmBobM4PFPfYJ68oEfpUJsii+n7F3BBriwZ+Fzo4aCE2PciSrf5P
 IHSey0fM5RSBKojAubZFBabHzFFyNKYV1hzxVI+32TUMSZHAvXz6EzVqjVj/WLiCOU
 q4NNhQGtNS+/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=TsO3i1um
Subject: [Buildroot] [PATCH] package/python-trio: bump to 0.31.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://trio.readthedocs.io/en/latest/history.html#trio-0-31-0-2025-09-09

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index 0dd367a236..35f582311a 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  e6d930a02a7ddf370083b9c9efa39e85  trio-0.28.0.tar.gz
-sha256  4e547896fe9e8a5658e54e4c7c5fa1db748cbbbaa7c965e7d40505b928c73c05  trio-0.28.0.tar.gz
+md5  26bb7f0669385e47347e4d8177552653  trio-0.31.0.tar.gz
+sha256  f71d551ccaa79d0cb73017a33ef3264fde8335728eb4c6391451fe5d253a9d5b  trio-0.31.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index f298619fe4..8d8720be36 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.28.0
+PYTHON_TRIO_VERSION = 0.31.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/b3/73/57efab729506a8d4b89814f1e356ec8f3369de0ed4fd7e7616974d09646d
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/76/8f/c6e36dd11201e2a565977d8b13f0b027ba4593c1a80bed5185489178e257
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
