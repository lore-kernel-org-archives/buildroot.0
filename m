Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2909C4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 15:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA8260F20;
	Wed,  7 Dec 2022 15:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AA8260F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZrv--rynFFp; Wed,  7 Dec 2022 15:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D49F60EE4;
	Wed,  7 Dec 2022 15:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D49F60EE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D90CF1BF95D
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A2360EE4
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A2360EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8ACUaPFhw08 for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 15:08:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDEC360E84
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 15:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDEC360E84
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD85785E04; Wed,  7 Dec 2022 15:08:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 16:01:54 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8bac160a21f4452e62a4ddab8df3aa67b55a52f3
X-Git-Newrev: 1a76f043465a2ef59c6245c89005b6512c0a6e48
X-Patchwork-Hint: ignore
Message-Id: <20221207150805.AD85785E04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/exim: bump
 version to 4.96
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
Content-Type: multipart/mixed; boundary="===============4635152675820521411=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4635152675820521411==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1a76f043465a2ef59c6245c89005b6512c0a6e48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Changelog:
https://github.com/Exim/exim/blob/22ed7a5295f196fce32563f6e9c669110dd36f4d/doc/doc-txt/ChangeLog

Removed patch 0004 which was applied upstream:
https://github.com/Exim/exim/commit/3083c9ca60beb9aacae81d0d108117251da5f276

Renumbered remaining patches.

Switched from pcre to pcre2:
https://github.com/Exim/exim/commit/22ed7a5295f196fce32563f6e9c669110dd36f4d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e19616fb59352f3f27405806fbb9e8cd7c36cf98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/0004-Fix-uClibc-build.patch           | 35 ----------------------
 ...exim_lock-fix-lstat-related-build-errors.patch} |  0
 ...ors.patch => 0005-sieve-fix-build-errors.patch} |  0
 package/exim/Config.in                             |  2 +-
 package/exim/exim.hash                             |  4 +--
 package/exim/exim.mk                               |  8 ++---
 6 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/package/exim/0004-Fix-uClibc-build.patch b/package/exim/0004-Fix-uClibc-build.patch
deleted file mode 100644
index 9d5452bb56..0000000000
--- a/package/exim/0004-Fix-uClibc-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 68ea4fc7ca53bf010e5ec738ad078452f0eaa639 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Tue, 23 Jul 2019 18:48:06 +0200
-Subject: [PATCH] Fix uClibc build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-structs.h:757:18: error: ‘NS_MAXMSG’ undeclared here (not in a function); did you mean ‘N_MASC’?
-   uschar  answer[NS_MAXMSG];      /* the answer itself */
-
-Patch sent upstream: https://github.com/Exim/exim/pull/70
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- OS/os.h-Linux | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/OS/os.h-Linux b/OS/os.h-Linux
-index 63cf9babd..1d82e9bad 100644
---- a/OS/os.h-Linux
-+++ b/OS/os.h-Linux
-@@ -87,5 +87,9 @@ then change the 0 to 1 in the next block. */
- # define TCPI_OPT_SYN_DATA 32
- #endif
- 
-+/* Needed for uClibc */
-+#ifndef NS_MAXMSG
-+# define NS_MAXMSG 65535
-+#endif
- 
- /* End */
--- 
-2.20.1
-
diff --git a/package/exim/0005-exim_lock-fix-lstat-related-build-errors.patch b/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
similarity index 100%
rename from package/exim/0005-exim_lock-fix-lstat-related-build-errors.patch
rename to package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
diff --git a/package/exim/0006-sieve-fix-build-errors.patch b/package/exim/0005-sieve-fix-build-errors.patch
similarity index 100%
rename from package/exim/0006-sieve-fix-build-errors.patch
rename to package/exim/0005-sieve-fix-build-errors.patch
diff --git a/package/exim/Config.in b/package/exim/Config.in
index aa50a86736..2557251fd1 100644
--- a/package/exim/Config.in
+++ b/package/exim/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_EXIM
 	bool "exim"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_BERKELEYDB
 	help
 	  Exim is a message transfer agent (MTA) developed at the
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 5cbad08a4b..2336aaa5c6 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  cc9cb653fff2ea947c3702680b59c99ac0bd1bbf19976d37e22a463cd804f167  exim-4.95.tar.xz
+sha256  299a56927b2eb3477daafd3c5bda02bc67e5c4e5898a7aeaf2740875278cf1a3  exim-4.96.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  93d09c20d99f27da5edbe3e6dc7d25aa4548faa2b67ca26f2cc0b4aeaf58398dd468e0263714fcf0df97531f05d16fcd3f1f0e9d0656ead7858a66b248a44a65  exim-4.95.tar.xz
+sha512  6b863661465a0b9897c1b71875c5196a1903cf560dd85de45b08242b9731edb2bc10eb56945d62e477e5d15cc7a8d493915bff2ca81689673a8091c66f62c89e  exim-4.96.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 0098e3884f..9c54eeec44 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.95
+EXIM_VERSION = 4.96
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_CPE_ID_VENDOR = exim
 EXIM_SELINUX_MODULES = exim mta
-EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
+EXIM_DEPENDENCIES = host-berkeleydb host-pcre2 pcre2 berkeleydb host-pkgconf
 
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
@@ -46,8 +46,8 @@ define EXIM_USE_DEFAULT_CONFIG_FILE
 	$(call exim-config-change,EXIM_USER,ref:exim)
 	$(call exim-config-change,EXIM_GROUP,mail)
 	$(call exim-config-change,TRANSPORT_LMTP,yes)
-	$(call exim-config-change,PCRE_LIBS,-lpcre)
-	$(call exim-config-change,PCRE_CONFIG,no)
+	$(call exim-config-change,PCRE_LIBS,-lpcre2-8)
+	$(call exim-config-change,PCRE2_CONFIG,no)
 	$(call exim-config-change,HAVE_ICONV,no)
 	$(call exim-config-unset,EXIM_MONITOR)
 	$(call exim-config-change,AUTH_PLAINTEXT,yes)

--===============4635152675820521411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4635152675820521411==--
