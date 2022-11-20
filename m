Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45C1C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BDBA81778;
	Mon,  5 Dec 2022 12:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BDBA81778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ztos9YKhMPKz; Mon,  5 Dec 2022 12:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84FCA81E29;
	Mon,  5 Dec 2022 12:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84FCA81E29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28DFD1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20150408AF
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20150408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5VevG6hm236 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11E46408B6
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11E46408B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FD5285BA2; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 10:19:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f94d91ed8e486e43b7fcf58b040d26960589eb2
X-Git-Newrev: dda1c73bf32a030f340d5a703413704d8d663fad
X-Patchwork-Hint: ignore
Message-Id: <20221205112610.0FD5285BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakeroot: bump to version 1.30.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dda1c73bf32a030f340d5a703413704d8d663fad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove upstream patch

remove mkdir build-aux (no longer needed, like AUTORECONF)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998@free.fr: keep using snapshot.debian.org]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../fakeroot/0001-fix-prototype-generation.patch   | 61 ----------------------
 package/fakeroot/fakeroot.hash                     |  4 +-
 package/fakeroot/fakeroot.mk                       |  9 +---
 3 files changed, 4 insertions(+), 70 deletions(-)

diff --git a/package/fakeroot/0001-fix-prototype-generation.patch b/package/fakeroot/0001-fix-prototype-generation.patch
deleted file mode 100644
index 960bad2129..0000000000
--- a/package/fakeroot/0001-fix-prototype-generation.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Subject: Fix prototype generation for openat
-Author: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
-Date: 2021-12-30
-Bug-Debian: https://bugs.debian.org/995393
-Forwarded: Yes (implicitely)
-
-    As jrtc27 pointed out in IRC, ppc64el is more strict than other
-    architectures when it comes to va_arg handling:
-
-        it's that ppc64le uses the elfv2 abi, and for variadic calls you
-        must reserve space for a parameter save area
-
-    So enhance wrapawk to create a proper prototype and argument
-    handling although it's specific to the openat call. Also add the
-    missing documentation for the sixth column to wrapfunc.inp.
-
-Signed-off-by: Joel Stanley <joel@jms.id.au>
-
---- a/wrapawk
-+++ b/wrapawk
-@@ -37,7 +37,25 @@
-   argtype=$3;
-   argname=$4;
-   MACRO=$5;
--  if(MACRO){
-+  openat_extra=$6;
-+  if(openat_extra){
-+    print "  {(void(*))&next_" name ", \"" name "\"},"  > structfile;
-+    print "extern " ret " (*next_" name ")" openat_extra ";" > headerfile;
-+    print ret " (*next_" name ")" openat_extra "=tmp_" name ";"> deffile;
-+
-+    print ret " tmp_" name,  openat_extra "{"           > tmpffile;
-+    print "  mode_t mode = 0;"                          > tmpffile;
-+    print "  if (flags & O_CREAT) {"                    > tmpffile;
-+    print "    va_list args;"                           > tmpffile;
-+    print "    va_start(args, flags);"                  > tmpffile;
-+    print "    mode = va_arg(args, int);"               > tmpffile;
-+    print "    va_end(args);"                           > tmpffile;
-+    print "  }"                                         > tmpffile;
-+    print "  load_library_symbols();"                   > tmpffile;
-+    print "  return  next_" name,  argname ";"          > tmpffile;
-+    print "}"                                           > tmpffile;
-+    print ""                                            > tmpffile;
-+  } else if(MACRO){
-     print "  {(void(*))&NEXT_" MACRO "_NOARG, " name "_QUOTE},"  > structfile;
-     print "extern " ret " (*NEXT_" MACRO "_NOARG)" argtype ";" > headerfile;
-     print ret " (*NEXT_" MACRO "_NOARG)" argtype "=TMP_" MACRO ";"> deffile;
---- a/wrapfunc.inp
-+++ b/wrapfunc.inp
-@@ -9,8 +9,10 @@
- /**/									  */
- /* each line of this file lists 4 fields, seperated by a ";".		  */
- /* The first field is the name of the wrapped function, then it's return  */
--/* value. After that come the function arguments with types, and the last */
-+/* value. After that come the function arguments with types, and the fifth */
- /* field contains the function arguments without types.                   */
-+/* A sixth field is a special needed when wrapping the openat syscall.    */
-+/* Otherwise it's like the third (function arguments with types).         */
- /**/
- 
- /* __*xstat are used on glibc systems instead of just *xstat. */
diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 3d53eeb097..5c50c83e13 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,4 +1,4 @@
-# From http://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.26-1.dsc
-sha256  480a578ffdc5592e73df4c086950d321b4adc78dbdaec56c82e4fe1fb68de8e9  fakeroot_1.26.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.30.1-1.dsc
+sha256  32ebb1f421aca0db7141c32a8c104eb95d2b45c393058b9435fbf903dd2b6a75  fakeroot_1.30.1.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 3fadf1c0f0..20c75d6966 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.26
+FAKEROOT_VERSION = 1.30.1
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20210907T092512Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20221120T030258Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -18,9 +18,4 @@ HOST_FAKEROOT_CONF_ENV = \
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
-define HOST_FAKEROOT_BUILD_AUX
-	mkdir -p $(@D)/build-aux
-endef
-HOST_FAKEROOT_POST_PATCH_HOOKS += HOST_FAKEROOT_BUILD_AUX
-
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
