Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E56C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:30:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1615160F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1615160F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E67E2605EB;
	Tue,  3 Aug 2021 23:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3ZcdJdqyH5x; Tue,  3 Aug 2021 23:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1FF96061A;
	Tue,  3 Aug 2021 23:30:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0372A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A910240E64
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 342A8kwsZCXF for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39A0840644
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 91B1C87F55; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jul 2021 22:42:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 82f5293d735c19c3cd33dcfdca87ab3be857353b
X-Git-Newrev: 464d0be380c84ac7c3f1684e49153c3868280d7e
X-Patchwork-Hint: ignore
Message-Id: <20210803211002.91B1C87F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmodsecurity:
 security bump to version 3.0.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=464d0be380c84ac7c3f1684e49153c3868280d7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Security Impacting Issues

    Handle URI received with uri-fragment
    [@martinhsv]

- Drop patches (already in version) and so drop autoreconf
- Static linking is supported since
  https://github.com/SpiderLabs/ModSecurity/commit/f76a1a667b8fdbcfe0d943daca9b41eb59cc61f3
- Update indentation in hash file (two spaces)

https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-when-CANONICAL_HOST-cannot-be-determined.patch | 31 ----------------------
 ...0002-test-for-uClinux-in-configure-script.patch | 28 -------------------
 package/libmodsecurity/Config.in                   |  6 ++---
 package/libmodsecurity/libmodsecurity.hash         |  6 ++---
 package/libmodsecurity/libmodsecurity.mk           |  4 +--
 package/nginx-modsecurity/Config.in                |  6 ++---
 6 files changed, 8 insertions(+), 73 deletions(-)

diff --git a/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch b/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
deleted file mode 100644
index ab00a14e2a..0000000000
--- a/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0832208360aab69fbaec76225db67801840a33fe Mon Sep 17 00:00:00 2001
-From: Frank Vanbever <frank.vanbever@essensium.com>
-Date: Fri, 10 Jan 2020 11:14:43 +0100
-Subject: [PATCH] Fail when CANONICAL_HOST cannot be determined
-
-When the CANONICAL_HOST is unknown the configure script exits
-with exit code 0 even though no makefile was produced.
-
-Upstream: https://github.com/SpiderLabs/ModSecurity/pull/2235
-
-Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 95e48843..5e6971f4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -193,7 +193,7 @@ case $host in
-     ;;
-        *)
-     echo "Unknown CANONICAL_HOST $host"
--    exit
-+    exit 1
-     ;;
- esac
- 
--- 
-2.20.1
-
diff --git a/package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch b/package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch
deleted file mode 100644
index ccd96fea95..0000000000
--- a/package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 13c505e30474c919ed9ae552e459769c456da21e Mon Sep 17 00:00:00 2001
-From: Frank Vanbever <frank.vanbever@essensium.com>
-Date: Fri, 10 Jan 2020 11:24:43 +0100
-Subject: [PATCH] test for uClinux in configure script
-
-Upstream: https://github.com/SpiderLabs/ModSecurity/pull/2235
-
-Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5e6971f4..51d38071 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -156,7 +156,7 @@ case $host in
-     AC_DEFINE([MACOSX], [1], [Define if the operating system is Macintosh OSX])
-     PLATFORM="MacOSX"
-     ;;
--  *-*-linux*)
-+  *-*-linux* | *-*uclinux*)
-     echo "Checking platform... Identified as Linux"
-     AC_DEFINE([LINUX], [1], [Define if the operating system is LINUX])
-     PLATFORM="Linux"
--- 
-2.20.1
-
diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index ea58c6d0e2..87f7a9c103 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBMODSECURITY
 	bool "libmodsecurity"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PCRE
 	help
@@ -16,6 +15,5 @@ config BR2_PACKAGE_LIBMODSECURITY
 
 	  https://github.com/SpiderLabs/ModSecurity
 
-comment "libmodsecurity needs a toolchain w/ C++, dynamic library, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+comment "libmodsecurity needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index ddce3ef9c6..dff39569c1 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.4/modsecurity-v3.0.4.tar.gz.sha256
-sha256  b4231177dd80b4e076b228e57d498670113b69d445bab86db25f65346c24db22  modsecurity-v3.0.4.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.5/modsecurity-v3.0.5.tar.gz.sha256
+sha256  751bf95a7a8d39c440d0c26ec1f73961550ca2eb2ac9e2e7a56dce2dd7b959e9  modsecurity-v3.0.5.tar.gz
 # Localy calculated
-sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 605f7eb03e..b2637257b6 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.4
+LIBMODSECURITY_VERSION = 3.0.5
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
@@ -12,8 +12,6 @@ LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
-# 0002-test-for-uClinux-in-configure-script.patch
-LIBMODSECURITY_AUTORECONF = YES
 
 LIBMODSECURITY_DEPENDENCIES = pcre
 LIBMODSECURITY_CONF_OPTS = \
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index e754aab71e..b1fcbadd7a 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	bool "nginx-modsecurity"
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
-	depends on !BR2_STATIC_LIBS # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
@@ -12,7 +11,6 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 
 	  https://github.com/SpiderLabs/ModSecurity-nginx
 
-comment "nginx-modsecurity needs a toolchain w/ C++, dynamic library, threads"
+comment "nginx-modsecurity needs a toolchain w/ C++, threads"
 	depends on BR2_PACKAGE_NGINX_HTTP
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
