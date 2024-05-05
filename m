Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE49C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 15:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8D740690;
	Sun,  5 May 2024 15:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFTsr2EsPJzT; Sun,  5 May 2024 15:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2226A40372
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2226A40372;
	Sun,  5 May 2024 15:38:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CED811BF82D
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7640605F1
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O83EhGftFRzD for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 15:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD130605A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD130605A4
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:38:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98AF98666D; Sun,  5 May 2024 15:38:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 17:28:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a239b6440e90d7cdea3c1a3ef3ec1ff7b24ce52c
X-Git-Newrev: 6534c7fb98edec8a0bde5e95a34987c1939f3761
X-Patchwork-Hint: ignore
Message-Id: <20240505153817.98AF98666D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gptfdisk: bump to version 1.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=6534c7fb98edec8a0bde5e95a34987c1939f3761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second to fourth patches (already in version)

https://sourceforge.net/p/gptfdisk/code/ci/53ac725a88a616b9f3395500d6e520aa04742fa5/tree/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 ...-crash-of-sgdisk-when-compiled-with-lates.patch | 60 ----------------------
 ...reference-when-duplicating-string-argumen.patch | 44 ----------------
 ...d.cc-to-deal-with-minor-change-in-libuuid.patch | 41 ---------------
 package/gptfdisk/gptfdisk.hash                     |  6 +--
 package/gptfdisk/gptfdisk.mk                       |  2 +-
 6 files changed, 4 insertions(+), 150 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8dd76ac53e..fd39d6e0b6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -762,7 +762,6 @@ package/gpm/0005-fix-building-w-newer-glibc.patch lib_patch.Upstream
 package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch lib_patch.Upstream
 package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
-package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch lib_patch.Upstream
 package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
 package/grpc/0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch lib_patch.Upstream
 package/grpc/0003-host-grpc-only-cpp-plugin.patch lib_patch.Upstream
diff --git a/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch b/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
deleted file mode 100644
index bdeedd95cc..0000000000
--- a/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5d5e76d369a412bfb3d2cebb5fc0a7509cef878d Mon Sep 17 00:00:00 2001
-From: Rod Smith <rodsmith@rodsbooks.com>
-Date: Fri, 15 Apr 2022 18:10:14 -0400
-Subject: [PATCH] Fix failure & crash of sgdisk when compiled with latest
- popt (commit 740; presumably eventually release 1.19)
-
-[Retrieved from:
-https://sourceforge.net/p/gptfdisk/code/ci/5d5e76d369a412bfb3d2cebb5fc0a7509cef878d/]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- NEWS      | 8 ++++++++
- gptcl.cc  | 2 +-
- support.h | 2 +-
- 3 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index c7add56..9e153fd 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,3 +1,11 @@
-+1.0.10 (?/??/2022):
-+-------------------
-+
-+- Fixed problem that caused sgdisk to crash with errors about being unable
-+  to read the disk's partition table when compiled with the latest popt
-+  (commit 740, which is pre-release as I type; presumably version 1.19 and
-+  later once released).
-+
- 1.0.9 (4/14/2022):
- ------------------
- 
-diff --git a/gptcl.cc b/gptcl.cc
-index 34c9421..0d578eb 100644
---- a/gptcl.cc
-+++ b/gptcl.cc
-@@ -155,7 +155,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
-    } // while
- 
-    // Assume first non-option argument is the device filename....
--   device = (char*) poptGetArg(poptCon);
-+   device = strdup((char*) poptGetArg(poptCon));
-    poptResetContext(poptCon);
- 
-    if (device != NULL) {
-diff --git a/support.h b/support.h
-index 8ba9ad1..f91f1bc 100644
---- a/support.h
-+++ b/support.h
-@@ -8,7 +8,7 @@
- #include <stdlib.h>
- #include <string>
- 
--#define GPTFDISK_VERSION "1.0.9"
-+#define GPTFDISK_VERSION "1.0.9.1"
- 
- #if defined (__FreeBSD__) || defined (__FreeBSD_kernel__) || defined (__APPLE__)
- // Darwin (Mac OS) & FreeBSD: disk IOCTLs are different, and there is no lseek64
--- 
-2.35.1
-
diff --git a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
deleted file mode 100644
index 250c071582..0000000000
--- a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
-Message-Id: <f5de3401b974ce103ffd93af8f9d43505a04aaf9.1680094621.git.stefan@agner.ch>
-From: Damian Kurek <starfire24680@gmail.com>
-Date: Thu, 7 Jul 2022 03:39:16 +0000
-Subject: [PATCH] Fix NULL dereference when duplicating string argument
-
-poptGetArg can return NULL if there are no additional arguments, which
-makes strdup dereference NULL on strlen
-
-Signed-off-by: Stefan Agner <stefan@agner.ch>
-Upstream: https://sourceforge.net/p/gptfdisk/code/ci/f5de3401b974ce103ffd93af8f9d43505a04aaf9
----
- gptcl.cc | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gptcl.cc b/gptcl.cc
-index 0d578eb..ab95239 100644
---- a/gptcl.cc
-+++ b/gptcl.cc
-@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
-    } // while
- 
-    // Assume first non-option argument is the device filename....
--   device = strdup((char*) poptGetArg(poptCon));
--   poptResetContext(poptCon);
-+   device = (char*) poptGetArg(poptCon);
- 
-    if (device != NULL) {
-+      device = strdup(device);
-+      poptResetContext(poptCon);
-       JustLooking(); // reset as necessary
-       BeQuiet(); // Tell called functions to be less verbose & interactive
-       if (LoadPartitions((string) device)) {
-@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
-          cerr << "Error encountered; not saving changes.\n";
-          retval = 4;
-       } // if
-+      free(device);
-    } // if (device != NULL)
-    poptFreeContext(poptCon);
-    return retval;
--- 
-2.40.0
-
diff --git a/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch b/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
deleted file mode 100644
index 22c34ced6f..0000000000
--- a/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6a8416cbd12d55f882bb751993b94f72d338d96f Mon Sep 17 00:00:00 2001
-From: Rod Smith <rodsmith@rodsbooks.com>
-Date: Sat, 16 Apr 2022 09:32:04 -0400
-Subject: [PATCH] Updated guid.cc to deal with minor change in libuuid
-
-Upstream: https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f
-Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
----
- NEWS    | 2 ++
- guid.cc | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/NEWS b/NEWS
-index 9e153fd..9ec7e63 100644
---- a/NEWS
-+++ b/NEWS
-@@ -6,6 +6,8 @@
-   (commit 740, which is pre-release as I type; presumably version 1.19 and
-   later once released).
- 
-+- Updated guid.cc to deal with minor change in libuuid.
-+
- 1.0.9 (4/14/2022):
- ------------------
- 
-diff --git a/guid.cc b/guid.cc
-index 1e73ab7..d3e4fd5 100644
---- a/guid.cc
-+++ b/guid.cc
-@@ -141,7 +141,7 @@ void GUIDData::Zero(void) {
- void GUIDData::Randomize(void) {
-    int i, uuidGenerated = 0;
- 
--#ifdef _UUID_UUID_H
-+#if defined (_UUID_UUID_H) || defined (_UL_LIBUUID_UUID_H)
-    uuid_generate(uuidData);
-    ReverseBytes(&uuidData[0], 4);
-    ReverseBytes(&uuidData[4], 2);
--- 
-2.42.0
-
diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index 0b98677afb..14a8d59a08 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.9/
-sha1  284bd000edaf7874b472bd01719c6a71a8030e13  gptfdisk-1.0.9.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.10/
+sha1  70c0bfe4290c2893fc957ef7f6156c5e74e469fc  gptfdisk-1.0.10.tar.gz
 # Locally computed
-sha256  dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2  gptfdisk-1.0.9.tar.gz
+sha256  2abed61bc6d2b9ec498973c0440b8b804b7a72d7144069b5a9209b2ad693a282  gptfdisk-1.0.10.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 393ea9469a..b35899bf9b 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.9
+GPTFDISK_VERSION = 1.0.10
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
