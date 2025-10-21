Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231A6CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 08:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 297D881080;
	Tue, 21 Oct 2025 08:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQku_ZMkA5I4; Tue, 21 Oct 2025 08:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70B1980F88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70B1980F88;
	Tue, 21 Oct 2025 08:10:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90A6B277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8193A60874
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6HPEs9Eo8hH for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 08:10:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85D5060720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D5060720
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85D5060720
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:10:30 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 201302C80CE3;
 Tue, 21 Oct 2025 10:10:28 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 10:10:28 +0200
Message-ID: <20251021081029.693626-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761034228; bh=Njp9pJX++gevlKTwpRNvSJGnSmtxPFNnSqUNQ0OU0qk=;
 h=From:To:Cc:Subject:Date;
 b=Y5B826kUNaaRMHSNky1QrC0p4lseZkNj4lK2XESjN+Puu30HAEdiYeDOOBjIRDxPn
 aeMJs1MmAJkq5xGujTd2iZeWOothUl76Fp1OSkVgye08o94LPgdAHn4y3Rurl1juX3
 GmXv8g0eNYxois6hgwn0VODQ4nnBaJoolbkcAcuGy+cUxCTBqIuIcRhHJZvpq5p35M
 OeuqYZSRW5IpGANDmMsAOeEY4swpDDyv6vBMasNIlAVvYmVigeYD38Guo+U5OtSXw6
 uk0OMJ94vZU2JV3Jd8KD8AqUC/Q0BI3slyibTzhO4IkhJd0H+D0sOaR3Va452E8HTq
 x4/+f2y2ujEdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Y5B826kU
Subject: [Buildroot] [PATCH] package/python-wrapt: bump to 2.0.0
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

LICENSE file changes due to copyright year update:
https://github.com/GrahamDumpleton/wrapt/commit/ad97a2aa802391e2cffd31b601801214436d7ddd

CHANGELOG: https://wrapt.readthedocs.io/en/latest/changes.html#version-2-0-0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-wrapt/python-wrapt.hash | 6 +++---
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index ae1fb94a2b..69a464ff49 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  5e7d9b1296ef5dc87339acc951a52d18  wrapt-1.17.3.tar.gz
-sha256  f66eb08feaa410fe4eebd17f2a2c8e2e46d3476e9f8c783daa8e09e0faa666d0  wrapt-1.17.3.tar.gz
+md5  bdc6d3460db4cdee3383dfe318b5c317  wrapt-2.0.0.tar.gz
+sha256  35a542cc7a962331d0279735c30995b024e852cf40481e384fd63caaa391cbb9  wrapt-2.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5974efbbc8b626b2050810d63c3a907ee21c92bf64b3740fc623ad05eb3448ab  LICENSE
+sha256  9abc41aa6b8690c07ede9b44b7c6233d014290ed1e3b5ccc37e292295b5d058f  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index d1871a7e2e..8fff0cf3fa 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 1.17.3
+PYTHON_WRAPT_VERSION = 2.0.0
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/95/8f/aeb76c5b46e273670962298c23e7ddde79916cb74db802131d49a85e4b7d
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/49/19/5e5bcd855d808892fe02d49219f97a50f64cd6d8313d75df3494ee97b1a3
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
