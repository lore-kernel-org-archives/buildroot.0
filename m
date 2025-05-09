Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61549C3ABBC
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 20:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E463A83A6F;
	Fri,  9 May 2025 20:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mTu-BCndEi0; Fri,  9 May 2025 20:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1EE883A64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1EE883A64;
	Fri,  9 May 2025 20:07:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFDA1A9
 for <buildroot@buildroot.org>; Fri,  9 May 2025 20:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 002DE83A5F
 for <buildroot@buildroot.org>; Fri,  9 May 2025 20:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MF_Q2NxdfBt for <buildroot@buildroot.org>;
 Fri,  9 May 2025 20:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1639F83A5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1639F83A5B
 for <buildroot@buildroot.org>; Fri,  9 May 2025 20:07:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E4E8866DF; Fri,  9 May 2025 20:07:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 May 2025 21:48:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c65b4484e1ed414496488cf8eb4fe967b10c087
X-Git-Newrev: 8cdeeb536cae5fa4fb0271b5b8fb5571ff468c0a
X-Patchwork-Hint: ignore
Message-Id: <20250509200745.0E4E8866DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libical: bump to version 3.0.20
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8cdeeb536cae5fa4fb0271b5b8fb5571ff468c0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/libical/libical/blob/v3.0.20/ReleaseNotes.txt

Update license info: the source code is now licensed under MPL-2.0
instead of MPL-1.0.

Remove upstreamed patches.

Add a build-time dependency to host-perl.

Disable unneeded options.

Use ON/OFF instead of true/false for CMake options.

Fixes:
https://autobuild.buildroot.org/results/dc2a6d9e50759e948a5f9952eaa1a866d52400fe/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien:
 - reword commit title
 - update change log url to use tag
 - update .checkpackageignore to fix check-package errors
 - reorder LIBICAL_CONF_OPTS alphabetically
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  2 --
 package/libical/0001-no-tests.patch                | 19 ---------------
 ...stattype_from_string-copy-the-reqstattype.patch | 27 ----------------------
 package/libical/libical.hash                       |  5 ++--
 package/libical/libical.mk                         | 21 ++++++++++-------
 5 files changed, 16 insertions(+), 58 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2e0f07617a..cc6e1c2fd5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -648,8 +648,6 @@ package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk2/0001-reduce-dependencies.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
 package/libhdhomerun/0001-dont-strip.patch lib_patch.Upstream
-package/libical/0001-no-tests.patch lib_patch.Upstream
-package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch lib_patch.Upstream
 package/libiio/S99iiod Shellcheck lib_sysv.Variables
 package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch lib_patch.Upstream
 package/libiqrf/0002-use-only-c-language.patch lib_patch.Upstream
diff --git a/package/libical/0001-no-tests.patch b/package/libical/0001-no-tests.patch
deleted file mode 100644
index 324c04f643..0000000000
--- a/package/libical/0001-no-tests.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Disable tests to avoid MMU dependency due to fork.
-
-Fixes
-CMakeFiles/regression.dir/regression.c.o: In function `_test_file_locks':
-/home/br/br4/output/build/libical-v1.0.1/src/test/regression.c:(.text+0x96d8): undefined reference to `_fork'
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libical-1.0.1.org/src/CMakeLists.txt libical-1.0.1/src/CMakeLists.txt
---- libical-1.0.1.org/src/CMakeLists.txt	2014-10-09 17:07:05.000000000 +0200
-+++ libical-1.0.1/src/CMakeLists.txt	2015-04-25 17:41:22.657345548 +0200
-@@ -1,7 +1,6 @@
- add_subdirectory(libical)
- add_subdirectory(libicalss)
- add_subdirectory(libicalvcal)
--add_subdirectory(test)
- 
- if(MSVC)
-   install(FILES
diff --git a/package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch b/package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch
deleted file mode 100644
index 0d74835e44..0000000000
--- a/package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 6b9438d746cec6e4e632d78c5244f4be6314d1c9 Mon Sep 17 00:00:00 2001
-From: Allen Winter <allen.winter@kdab.com>
-Date: Sun, 28 May 2017 12:51:10 -0400
-Subject: [PATCH] icaltypes.c - icalreqstattype_from_string(), copy the
- reqstattype's debug string into its own memory in the ring buffer.
-
-Issue#253
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/libical/libical/commit/6b9438d746cec6e4e632d78c5244f4be6314d1c9]
----
- src/libical/icaltypes.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libical/icaltypes.c b/src/libical/icaltypes.c
-index 70c50d29..85c33545 100644
---- a/src/libical/icaltypes.c
-+++ b/src/libical/icaltypes.c
-@@ -140,7 +140,7 @@ struct icalreqstattype icalreqstattype_from_string(const char *str)
- 
-   p2 = strchr(p1+1,';');
-   if (p2 != 0 && *p2 != 0){
--    stat.debug = p2+1;
-+    stat.debug = icalmemory_tmp_copy(p2+1);
-   } 
- 
-   return stat;
diff --git a/package/libical/libical.hash b/package/libical/libical.hash
index 52046bd843..4c47c9347b 100644
--- a/package/libical/libical.hash
+++ b/package/libical/libical.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  089ce3c42d97fbd7a5d4b3c70adbdd82115dd306349c1f5c46a8fb3f8c949592  libical-1.0.1.tar.gz
-sha256  c393726f82e6f21df5262110215f6a4382b32046d10afdcfcc49338aa7a191f2  LICENSE
+sha256  e73de92f5a6ce84c1b00306446b290a2b08cdf0a80988eca0a2c9d5c3510b4c2  libical-3.0.20.tar.gz
+sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE.MPL2.txt
+sha256  051753f11d7bb731d178eb3a972560f65a1dbc8f207b166a1c7c090e5d85f582  LICENSE.LGPL21.txt
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index 992ef51375..56489b4e98 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -4,20 +4,25 @@
 #
 ################################################################################
 
-LIBICAL_VERSION = 1.0.1
+LIBICAL_VERSION = 3.0.20
 LIBICAL_SITE = https://github.com/libical/libical/releases/download/v$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
-LIBICAL_LICENSE = MPL-1.0 or LGPL-2.1
-LIBICAL_LICENSE_FILES = LICENSE
+LIBICAL_LICENSE = MPL-2.0 or LGPL-2.1
+LIBICAL_LICENSE_FILES = LICENSE.MPL2.txt LICENSE.LGPL21.txt
 LIBICAL_CPE_ID_VALID = YES
+LIBICAL_DEPENDENCIES = host-perl
 
-# 0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch
-LIBICAL_IGNORE_CVES += CVE-2016-9584
-
+LIBICAL_CONF_OPTS = \
+	-DGOBJECT_INTROSPECTION=OFF \
+	-DICAL_BUILD_DOCS=OFF \
+	-DICAL_GLIB=OFF \
+	-DLIBICAL_BUILD_EXAMPLES=OFF \
+	-DLIBICAL_BUILD_TESTING=OFF \
+	-DWITH_CXX_BINDINGS=OFF
 # building without this option is broken, it is used by
 # Gentoo/alpinelinux as well
-LIBICAL_CONF_OPTS = -DSHARED_ONLY=true
+LIBICAL_CONF_OPTS += -DSHARED_ONLY=ON
 # never build time zone info, always use system's tzinfo
-LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=false
+LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
