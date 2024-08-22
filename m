Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAD6C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 12:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7BD76066B;
	Thu, 22 Aug 2024 12:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i08XqAsVgRoI; Thu, 22 Aug 2024 12:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D29326080E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D29326080E;
	Thu, 22 Aug 2024 12:17:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A05B1BF3B5
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 12:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43ECE40154
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 12:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHvqsgafKDjY for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 12:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF15A400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF15A400F9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF15A400F9
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 12:17:13 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 0E2902C85C6D;
 Thu, 22 Aug 2024 14:17:11 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 14:17:09 +0200
Message-Id: <20240822121710.709074-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724329031; bh=vfG6uDxUa3eQEmoVIYhzSusUFrN2FL2KW6yRLMcYWuo=;
 h=From:To:Cc:Subject:Date;
 b=Oz0GTLdFXUKpuuYTSCtS020Qr6MN5cavIWGIkNVloT0gJEHycHksJiZ/1DLu6/bxQ
 Y+VtHsdFXrUz49O33U3Fga/kUB5FWq8ByNpMICKrE5t1MAHCiqM+k8ZD9etqa7sUP2
 2K6elcGd3T8jHXwfYvEW9qCPbc0fDmoaUFfBZYVSRJN2+SIjJXNIin8llsxAfpngau
 KC/Wzt+jLBzrMF4lS6pQTMH6R5g37aTIisR3L/85kKwbgeXuWZsGMGvRFh9RXTKYH4
 NWYvi/HCr6MyZZKu6YpzrgWYU0rGGBd+hImKpaDYxDmyC6lF2vBslHF1y/Gw66F5u3
 DRFWMA3ofK+OQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Oz0GTLdF
Subject: [Buildroot] [PATCH] package/python-sqlparse: security bump to
 version 0.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
* https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-1-jul-15-2024
* https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-0-apr-13-2024

Version 0.5.0 fixes the following security issue [1]:
Parsing heavily nested list leads to Denial of Service

Build backend switched from flit to hatchling in [2].

[1] https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-2m57-hf25-phgg
[2] https://github.com/andialbrecht/sqlparse/commit/326a316446c3e091a93950251e3e376ebf0d4127

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index 0b7c14d9ae..1fe8429724 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  67798c7a0dae90f263d20e9ecf62c8cd  sqlparse-0.4.4.tar.gz
-sha256  d446183e84b8349fa3061f0fe7f06ca94ba65b426946ffebe6e3e8295332420c  sqlparse-0.4.4.tar.gz
+md5  969a64f03d7da1144fc74aad390f9db4  sqlparse-0.5.1.tar.gz
+sha256  bb6b4df465655ef332548e24f08e205afc81b9ab86cb1c45657a7ff173a3a00e  sqlparse-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 3f99eb6476..57cef1d672 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.4.4
+PYTHON_SQLPARSE_VERSION = 0.5.1
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/65/16/10f170ec641ed852611b6c9441b23d10b5702ab5288371feab3d36de2574
-PYTHON_SQLPARSE_SETUP_TYPE = flit
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/73/82/dfa23ec2cbed08a801deab02fe7c904bfb00765256b155941d789a338c68
+PYTHON_SQLPARSE_SETUP_TYPE = pep517
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
+PYTHON_SQLPARSE_DEPENDENCIES = host-python-hatchling
 PYTHON_SQLPARSE_CPE_ID_VENDOR = sqlparse_project
 PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
