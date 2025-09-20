Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15DACAC5A5
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 20:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CAD14175D;
	Sat, 20 Sep 2025 20:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NcWVvvP5Iw3; Sat, 20 Sep 2025 20:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D66D41774
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D66D41774;
	Sat, 20 Sep 2025 20:03:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABD99E7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 992924175D
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyPiHnxK2ZSh for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 20:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C826A41713
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C826A41713
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:02:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4C2186014; Sat, 20 Sep 2025 20:02:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Sep 2025 22:00:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 713fbb1f39f91a7f6b5ac70d8ceec1860ff11da4
X-Git-Newrev: 308735139901237bef012150f39ad815275f107a
X-Patchwork-Hint: ignore
Message-Id: <20250920200259.B4C2186014@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmocka: bump to version 1.1.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=308735139901237bef012150f39ad815275f107a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removed patch has been merged in version 1.1.6.

Release notes:
https://gitlab.com/cmocka/cmocka/-/tags/cmocka-1.1.6
https://gitlab.com/cmocka/cmocka/-/tags/cmocka-1.1.7
https://gitlab.com/cmocka/cmocka/-/tags/cmocka-1.1.8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 package/cmocka/0001-Don-t-redefine-uintptr_t.patch | 77 ----------------------
 package/cmocka/cmocka.hash                         |  2 +-
 package/cmocka/cmocka.mk                           |  2 +-
 4 files changed, 2 insertions(+), 80 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8779b26823..f5e550736c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -291,7 +291,6 @@ package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
 package/chrony/S49chronyd lib_sysv.Variables
 package/cmake/0001-rename-cmake-rootfile.patch lib_patch.Upstream
-package/cmocka/0001-Don-t-redefine-uintptr_t.patch lib_patch.Upstream
 package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch lib_patch.Upstream
 package/connman/S45connman lib_sysv.Variables
 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch lib_patch.Upstream
diff --git a/package/cmocka/0001-Don-t-redefine-uintptr_t.patch b/package/cmocka/0001-Don-t-redefine-uintptr_t.patch
deleted file mode 100644
index 4123d8db22..0000000000
--- a/package/cmocka/0001-Don-t-redefine-uintptr_t.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 28ce16b29911e5adc60140b572dee177adc7a178 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 18 Nov 2019 18:56:46 +0100
-Subject: [PATCH] Don't redefine uintptr_t
-
-Add a call to check_type_size in ConfigureChecks.cmake and use it in
-include/cmocka.h to avoid the following redefinition error on riscv64:
-
-In file included from /data/buildroot/buildroot-test/instance-0/output/build/cmocka-1.1.5/src/cmocka.c:62:
-/data/buildroot/buildroot-test/instance-0/output/build/cmocka-1.1.5/include/cmocka.h:132:28: error: conflicting types for 'uintptr_t'
-       typedef unsigned int uintptr_t;
-                            ^~~~~~~~~
-In file included from /data/buildroot/buildroot-test/instance-0/output/host/riscv64-buildroot-linux-musl/sysroot/usr/include/stdint.h:20,
-                 from /data/buildroot/buildroot-test/instance-0/output/host/riscv64-buildroot-linux-musl/sysroot/usr/include/inttypes.h:9,
-                 from /data/buildroot/buildroot-test/instance-0/output/build/cmocka-1.1.5/src/cmocka.c:27:
-/data/buildroot/buildroot-test/instance-0/output/host/riscv64-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:104:24: note: previous declaration of 'uintptr_t' was here
- typedef unsigned _Addr uintptr_t;
-                        ^~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/30922c18150ea62aefe123d1b7cd1444efab963f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-[Retrieved from:
-https://gitlab.com/cmocka/cmocka/commit/28ce16b29911e5adc60140b572dee177adc7a178]
----
- ConfigureChecks.cmake | 3 +++
- config.h.cmake        | 4 ++++
- include/cmocka.h      | 2 +-
- 3 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/ConfigureChecks.cmake b/ConfigureChecks.cmake
-index fe8da35..028774f 100644
---- a/ConfigureChecks.cmake
-+++ b/ConfigureChecks.cmake
-@@ -70,6 +70,9 @@ if (HAVE_TIME_H)
-     check_struct_has_member("struct timespec" tv_sec "time.h" HAVE_STRUCT_TIMESPEC)
- endif (HAVE_TIME_H)
- 
-+# TYPES
-+check_type_size(uintptr_t UINTPTR_T)
-+
- # FUNCTIONS
- check_function_exists(calloc HAVE_CALLOC)
- check_function_exists(exit HAVE_EXIT)
-diff --git a/config.h.cmake b/config.h.cmake
-index f8d79da..55fc69f 100644
---- a/config.h.cmake
-+++ b/config.h.cmake
-@@ -75,6 +75,10 @@
- 
- #cmakedefine HAVE_STRUCT_TIMESPEC 1
- 
-+/***************************** TYPES *****************************/
-+
-+#cmakedefine HAVE_UINTPTR_T 1
-+
- /*************************** FUNCTIONS ***************************/
- 
- /* Define to 1 if you have the `calloc' function. */
-diff --git a/include/cmocka.h b/include/cmocka.h
-index 3e923dd..0aa557e 100644
---- a/include/cmocka.h
-+++ b/include/cmocka.h
-@@ -120,7 +120,7 @@ typedef uintmax_t LargestIntegralType;
-     ((LargestIntegralType)(value))
- 
- /* Smallest integral type capable of holding a pointer. */
--#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
-+#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && !defined(HAVE_UINTPTR_T)
- # if defined(_WIN32)
-     /* WIN32 is an ILP32 platform */
-     typedef unsigned int uintptr_t;
--- 
-2.22.0
-
diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index 74d67d6ecb..8dc0532388 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f0ccd8242d55e2fd74b16ba518359151f6f8383ff8aef4976e48393f77bba8b6  cmocka-1.1.5.tar.xz
+sha256  58435b558766d7f4c729ba163bdf3aec38bed3bc766dab684e3526ed0aa7c780  cmocka-1.1.8.tar.xz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 297f95f465..04a0640f4c 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 1.1.5
+CMOCKA_VERSION = 1.1.8
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
 CMOCKA_SITE = https://cmocka.org/files/1.1
 CMOCKA_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
