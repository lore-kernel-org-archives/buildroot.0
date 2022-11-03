Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297C2C4708D
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEDA681C2F;
	Mon,  5 Dec 2022 11:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEDA681C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UpbCrbFDKYjG; Mon,  5 Dec 2022 11:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09DCE81403;
	Mon,  5 Dec 2022 11:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09DCE81403
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 137501BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D5AE41610
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D5AE41610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-dtJagAlaA8 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CA39415E3
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA39415E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55E2385B9E; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90c35b2c14544143d1f18c22f425f1de7bd19b2b
X-Git-Newrev: 6a7801f1a1feaa8b84f8f56699a001c1d71e3ffd
X-Patchwork-Hint: ignore
Message-Id: <20221205112602.55E2385B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-huepy: bump to version 1.2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a7801f1a1feaa8b84f8f56699a001c1d71e3ffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is no longer needed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-huepy/0001-fix-import-with-python3.patch | 8 --------
 package/python-huepy/python-huepy.hash                  | 7 ++++---
 package/python-huepy/python-huepy.mk                    | 5 +++--
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/package/python-huepy/0001-fix-import-with-python3.patch b/package/python-huepy/0001-fix-import-with-python3.patch
deleted file mode 100644
index e04eacb228..0000000000
--- a/package/python-huepy/0001-fix-import-with-python3.patch
+++ /dev/null
@@ -1,8 +0,0 @@
---- a/huepy/__init__.py
-+++ b/huepy/__init__.py
-@@ -1,4 +1,4 @@
--from hue import COMMANDS
-+from .hue import COMMANDS
- 
- __all__ = list(COMMANDS.keys())
- __version__ = '1.0.1'
diff --git a/package/python-huepy/python-huepy.hash b/package/python-huepy/python-huepy.hash
index 32d0eb2674..74b02864d3 100644
--- a/package/python-huepy/python-huepy.hash
+++ b/package/python-huepy/python-huepy.hash
@@ -1,4 +1,5 @@
-# Locally computer sha256 checksums
-md5  da6514d9d61fb75ac9470f6863ce1aca  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
-sha256  63147cef5ecae5c1ab38000be91def351710e6bef2c5f67b5303418becf6c0f2  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
+# md5, sha256 from https://pypi.org/pypi/huepy/json
+md5  394a1072bec18c27097b053c40ddf0ea  huepy-1.2.1.tar.gz
+sha256  5b29beef797312fb7606188bc5cd98f78ab8f7e01576427a9312f1c9b20b759d  huepy-1.2.1.tar.gz
+# Locally computed sha256 checksums
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/python-huepy/python-huepy.mk b/package/python-huepy/python-huepy.mk
index 5c1041205d..cca3c3429e 100644
--- a/package/python-huepy/python-huepy.mk
+++ b/package/python-huepy/python-huepy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUEPY_VERSION = a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e
-PYTHON_HUEPY_SITE = $(call github,s0md3v,hue,$(PYTHON_HUEPY_VERSION))
+PYTHON_HUEPY_VERSION = 1.2.1
+PYTHON_HUEPY_SOURCE = huepy-$(PYTHON_HUEPY_VERSION).tar.gz
+PYTHON_HUEPY_SITE = https://files.pythonhosted.org/packages/d6/4e/2dae447d8858a31158ca6c313f5d1902bc83b8542bb5f10c0307de2973bc
 PYTHON_HUEPY_LICENSE = GPL-3.0
 PYTHON_HUEPY_LICENSE_FILES = LICENSE
 PYTHON_HUEPY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
