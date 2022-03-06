Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AA0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 20:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 544D14089A;
	Sun,  6 Mar 2022 20:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8l3l2OuQWjf; Sun,  6 Mar 2022 20:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F610408B6;
	Sun,  6 Mar 2022 20:30:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DF421BF401
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 20:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E0B06076A
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 20:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGdtetBiK3Mf for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 20:30:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3552660769
 for <buildroot@buildroot.org>; Sun,  6 Mar 2022 20:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C153082945; Sun,  6 Mar 2022 20:22:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Mar 2022 21:28:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87f1dd7b52deedb5a7f50a43e4b1dd1d23313395
X-Git-Newrev: acf5b437cc329a392f26e5367de1f64b3601b605
X-Patchwork-Hint: ignore
Message-Id: <20220306202200.C153082945@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxslt: security bump to version
 1.1.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=acf5b437cc329a392f26e5367de1f64b3601b605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fix CVE-2021-30560
- remove merged patch, drop autoreconf
- moved from xmlsoft.org to gnome.org
- spaces in hash file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998@free.fr:
  - drop autoreconf as no longer patching
  - also switch home in Config.in
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...Fix-xml2-config-check-in-configure-script.patch | 31 ----------------------
 package/libxslt/Config.in                          |  2 +-
 package/libxslt/libxslt.hash                       |  6 ++---
 package/libxslt/libxslt.mk                         |  7 +++--
 4 files changed, 7 insertions(+), 39 deletions(-)

diff --git a/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch b/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch
deleted file mode 100644
index 3848dcb235..0000000000
--- a/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 90c34c8bb90e095a8a8fe8b2ce368bd9ff1837cc Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Fri, 15 Nov 2019 11:53:11 +0100
-Subject: [PATCH] Fix xml2-config check in configure script
-
-A 'print' option has never been supported. After a recent change to
-libxml2, invalid options cause xml2-config to fail.
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/libxslt/-/commit/90c34c8bb90e095a8a8fe8b2ce368bd9ff1837cc]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3da57b18..585b9d7c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -548,7 +548,7 @@ dnl make sure xml2-config is executable,
- dnl test version and init our variables
- dnl
- 
--if test "x$LIBXML_LIBS" = "x" && ${XML_CONFIG} --libs print > /dev/null 2>&1
-+if test "x$LIBXML_LIBS" = "x" && ${XML_CONFIG} --libs > /dev/null 2>&1
- then
-     AC_MSG_CHECKING(for libxml libraries >= $LIBXML_REQUIRED_VERSION)
-     XMLVERS=`$XML_CONFIG --version`
--- 
-GitLab
-
diff --git a/package/libxslt/Config.in b/package/libxslt/Config.in
index dfe5b99f04..643bce2a61 100644
--- a/package/libxslt/Config.in
+++ b/package/libxslt/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBXSLT
 	  to describe how the document is transformed into another
 	  XML document that uses the formatting vocabulary.
 
-	  http://xmlsoft.org/xslt/
+	  https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home
diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 25aa30839e..39523a6953 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256	98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f	libxslt-1.1.34.tar.gz
+# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.35.sha256sum
+sha256  8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79  libxslt-1.1.35.tar.xz
 
 # Hash for license file:
-sha256	7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819	COPYING
+sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index d0f79d2521..df0286e986 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.34
-LIBXSLT_SITE = http://xmlsoft.org/sources
+LIBXSLT_VERSION = 1.1.35
+LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
+LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
 LIBXSLT_LICENSE_FILES = COPYING
 LIBXSLT_CPE_ID_VENDOR = xmlsoft
-# We're patching configure.ac
-LIBXSLT_AUTORECONF = YES
 
 LIBXSLT_CONF_OPTS = \
 	--with-gnu-ld \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
