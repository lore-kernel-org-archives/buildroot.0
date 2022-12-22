Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEEDC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C05308322A;
	Mon, 20 Feb 2023 23:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C05308322A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddhRdyJqSMEG; Mon, 20 Feb 2023 23:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0123082C21;
	Mon, 20 Feb 2023 23:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0123082C21
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 030FE1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B8D3612D0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B8D3612D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R76eJpGE6Lwj for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B5CA612E0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B5CA612E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BE2781979; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 17:41:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d668cd0b2967346668423b564e4e149f14787def
X-Git-Newrev: 5b62ea01369b11f5a4320bb2c909168b21c2642c
X-Patchwork-Hint: ignore
Message-Id: <20230220205214.5BE2781979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tiff: security bump to
 version 4.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5b62ea01369b11f5a4320bb2c909168b21c2642c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix CVE-2022-2056, CVE-2022-2057, CVE-2022-2058, CVE-2022-2519,
CVE-2022-2520, CVE-2022-2521, CVE-2022-2953, CVE-2022-34526,
CVE-2022-3570, CVE-2022-3597, CVE-2022-3598, CVE-2022-3599,
CVE-2022-3626, CVE-2022-3627 and CVE-2022-3970

- COPYRIGHT renamed to LICENSE.md and year updated with
  https://gitlab.com/libtiff/libtiff/-/commit/fa1d6d787fc67a1eeb3abccb790b5bee969d424b
- Use new --{en,dis}able options added by
  https://gitlab.com/libtiff/libtiff/-/commit/1ab0e2696a368a556b793a0941b5365e4d9f56ef

http://www.simplesystems.org/libtiff/releases/v4.5.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.hash |  4 ++--
 package/tiff/tiff.mk   | 16 +++++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 6bd28a0f59..73732892a5 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed  tiff-4.4.0.tar.gz
-sha256  fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
+sha256  c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464  tiff-4.5.0.tar.gz
+sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 525712c9e9..7981bdf2c9 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,16 +4,18 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.4.0
+TIFF_VERSION = 4.5.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
-TIFF_LICENSE_FILES = COPYRIGHT
+TIFF_LICENSE_FILES = LICENSE.md
 TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
 TIFF_CONF_OPTS = \
+	--disable-contrib \
 	--disable-cxx \
+	--disable-tests \
 	--without-x
 
 TIFF_DEPENDENCIES = host-pkgconf
@@ -23,7 +25,8 @@ HOST_TIFF_CONF_OPTS = \
 	--without-x \
 	--disable-zlib \
 	--disable-lzma \
-	--disable-jpeg
+	--disable-jpeg \
+	--disable-tests
 HOST_TIFF_DEPENDENCIES = host-pkgconf
 
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
@@ -84,12 +87,11 @@ ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
 TIFF_CONF_OPTS += --disable-jbig
 endif
 
-TIFF_SUBDIRS = port libtiff
 ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
-TIFF_SUBDIRS += tools
+TIFF_CONF_OPTS += --enable-tools
+else
+TIFF_CONF_OPTS += --disable-tools
 endif
 
-TIFF_MAKE = $(MAKE) SUBDIRS="$(TIFF_SUBDIRS)"
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
