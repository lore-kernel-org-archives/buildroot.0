Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFBFD5AE72
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB6DF408DA;
	Thu,  7 Nov 2024 08:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsSaLNCAuTUK; Thu,  7 Nov 2024 08:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFFB441981
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFFB441981;
	Thu,  7 Nov 2024 08:02:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 120C0C0
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D271820BC
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzIDjtvqWLyS for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:01:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12242820EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12242820EB
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0975D85C67; Thu,  7 Nov 2024 08:01:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Nov 2024 08:56:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d01cba194d1fdfbc684f37817b4c86625c438a7
X-Git-Newrev: 580d899382e28beb518d697315e9364c4dfd73d3
X-Patchwork-Hint: ignore
Message-Id: <20241107080154.0975D85C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zopfli: bump to version
 0.2.3.post1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=580d899382e28beb518d697315e9364c4dfd73d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from zip archive to tar.gz archive.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zopfli/python-zopfli.hash |  4 ++--
 package/python-zopfli/python-zopfli.mk   | 12 +++---------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index c397808029..0fd009879c 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  7c8761eac18a9c6c16049192fc4fe119  zopfli-0.2.3.zip
-sha256  dbc9841bedd736041eb5e6982cd92da93bee145745f5422f3795f6f258cdc6ef  zopfli-0.2.3.zip
+md5  2c42e8d5918059b84a42c0d53c5a6852  zopfli-0.2.3.post1.tar.gz
+sha256  96484dc0f48be1c5d7ae9f38ed1ce41e3675fd506b27c11a6607f14b49101e99  zopfli-0.2.3.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index df76845a7f..47a27b1084 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,18 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.2.3
-PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).zip
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/92/d8/71230eb25ede499401a9a39ddf66fab4e4dab149bf75ed2ecea51a662d9e
+PYTHON_ZOPFLI_VERSION = 0.2.3.post1
+PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).tar.gz
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/5e/7c/a8f6696e694709e2abcbccd27d05ef761e9b6efae217e11d977471555b62
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
 PYTHON_ZOPFLI_DEPENDENCIES = host-python-setuptools-scm
 
-define PYTHON_ZOPFLI_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(PYTHON_ZOPFLI_DL_DIR)/$(PYTHON_ZOPFLI_SOURCE)
-	mv $(@D)/zopfli-$(PYTHON_ZOPFLI_VERSION)/* $(@D)
-	$(RM) -r $(@D)/zopfli-$(PYTHON_ZOPFLI_VERSION)
-endef
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
