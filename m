Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D504EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 780CE400C8;
	Mon,  6 Dec 2021 18:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDNnbUedJNDy; Mon,  6 Dec 2021 18:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C70940453;
	Mon,  6 Dec 2021 18:45:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14FE11BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DC7F41C59
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Frt3lc_nr9wo for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DFF141C27
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B9D9681468; Mon,  6 Dec 2021 18:07:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 11:10:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa27346fc8723fde88e4ff255cf2744cc7f5f483
X-Git-Newrev: 736932c71552adc4dfa95c5236d1064860900e8a
X-Patchwork-Hint: ignore
Message-Id: <20211206180743.B9D9681468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmalloc: bump to version 5.6.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=736932c71552adc4dfa95c5236d1064860900e8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop second to fifth patches (already in version)
- License is ISC since version 5.6.2 and
  https://github.com/j256/dmalloc/commit/eda734a8ba3ab4c03b3593636186dc3fc777b09d
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dmalloc/0001-mips.patch               | 18 ++++++-----
 package/dmalloc/0002-fix-parallel-build.patch | 18 -----------
 package/dmalloc/0003-fix-shlibs.patch         | 46 ---------------------------
 package/dmalloc/0004-fix-strdup.patch         | 24 --------------
 package/dmalloc/0005-fix-strndup.patch        | 24 --------------
 package/dmalloc/dmalloc.hash                  |  4 +--
 package/dmalloc/dmalloc.mk                    |  7 ++--
 7 files changed, 15 insertions(+), 126 deletions(-)

diff --git a/package/dmalloc/0001-mips.patch b/package/dmalloc/0001-mips.patch
index 3e6b00e361..3150d030ec 100644
--- a/package/dmalloc/0001-mips.patch
+++ b/package/dmalloc/0001-mips.patch
@@ -1,14 +1,16 @@
+[Fabrice: Updated for 5.6.5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 --- a/configure
 +++ b/configure
 @@ -7107,7 +7107,7 @@
- echo $ECHO_N "checking return.h macros work... $ECHO_C" >&6
- if test "$cross_compiling" = yes; then
-    cat >>confdefs.h <<\_ACEOF
--#define RETURN_MACROS_WORK 0
-+#define RETURN_MACROS_WORK 1
- _ACEOF
-  echo "$as_me:$LINENO: result: no" >&5
- echo "${ECHO_T}no" >&6
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking return.h macros work" >&5
+ $as_echo_n "checking return.h macros work... " >&6; }
+ if test "$cross_compiling" = yes; then :
+-   $as_echo "#define RETURN_MACROS_WORK 0" >>confdefs.h
++   $as_echo "#define RETURN_MACROS_WORK 1" >>confdefs.h
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+ $as_echo "no" >&6; }
+ 
 --- a/return.h
 +++ b/return.h
 @@ -106,26 +106,16 @@
diff --git a/package/dmalloc/0002-fix-parallel-build.patch b/package/dmalloc/0002-fix-parallel-build.patch
deleted file mode 100644
index c521a114bb..0000000000
--- a/package/dmalloc/0002-fix-parallel-build.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Fix parallel build issue
-
-Missing dmallocc.o <- dmalloc.h dependency may break parallel builds.
-dmalloc.h is generated,and may not be around by the time gcc starts
-parsing dmallocc.cc.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -401,6 +401,7 @@
- compat.o: compat.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h
- dmalloc.o: dmalloc.c conf.h settings.h dmalloc_argv.h dmalloc.h compat.h \
-   debug_tok.h dmalloc_loc.h env.h error_val.h version.h
-+dmallocc.o: dmallocc.cc dmalloc.h return.h conf.h settings.h
- dmalloc_argv.o: dmalloc_argv.c conf.h settings.h dmalloc_argv.h \
-   dmalloc_argv_loc.h compat.h
- dmalloc_fc_t.o: dmalloc_fc_t.c conf.h settings.h dmalloc.h dmalloc_argv.h \
diff --git a/package/dmalloc/0003-fix-shlibs.patch b/package/dmalloc/0003-fix-shlibs.patch
deleted file mode 100644
index a99d926daf..0000000000
--- a/package/dmalloc/0003-fix-shlibs.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Fix shared library rules
-
-dmalloc uses ld -shared --whole-archive -o lib.so lib.a,
-but for some reason lists regular objects in addition
-to the archive, ending up with two copies of each symbol.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -257,7 +257,7 @@ shlib : $(BUILD_SL)
- # via: http://256.com/gray/email.html
- $(LIB_SL) : $(LIBRARY)
- 	rm -f $@ $@.t
--	@shlinkargs@ $(LIBRARY) $(OBJS) $(NORMAL_OBJS)
-+	@shlinkargs@ $(LIBRARY)
- 	mv $@.t $@
- 
- $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
-@@ -270,7 +270,7 @@ $(LIB_TH) : $(OBJS) $(THREAD_OBJS)
- 
- $(LIB_TH_SL) : $(LIB_TH)
- 	rm -f $@ $@.t
--	@shlinkargs@ $(LIB_TH) $(OBJS) $(THREAD_OBJS)
-+	@shlinkargs@ $(LIB_TH)
- 	mv $@.t $@
- 
- $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
-@@ -279,7 +279,7 @@ $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
- 
- $(LIB_CXX_SL) : $(LIB_CXX)
- 	rm -f $@ $@.t
--	@shlinkargs@ $(LIB_CXX) $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
-+	@shlinkargs@ $(LIB_CXX)
- 	mv $@.t $@
- 
- $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
-@@ -288,7 +288,7 @@ $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
- 
- $(LIB_TH_CXX_SL) : $(LIB_TH_CXX)
- 	rm -f $@ $@.t
--	@shlinkargs@ $(LIB_TH_CXX) $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
-+	@shlinkargs@ $(LIB_TH_CXX)
- 	mv $@.t $@
- 
- threadssl : $(LIB_TH_SL)
diff --git a/package/dmalloc/0004-fix-strdup.patch b/package/dmalloc/0004-fix-strdup.patch
deleted file mode 100644
index 5884df6a89..0000000000
--- a/package/dmalloc/0004-fix-strdup.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 59d73a473f1c1a31bcba90d314f956d0bcc3de95 Mon Sep 17 00:00:00 2001
-From: Siana Gearz <siana.sg@live.de>
-Date: Sat, 8 Sep 2012 22:55:17 +0200
-Subject: [PATCH] Fix strdup
-
-[Retrieved from:
-https://github.com/siana/dmalloc/commit/59d73a473f1c1a31bcba90d314f956d0bcc3de95]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- dmalloc.h.3 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dmalloc.h.3 b/dmalloc.h.3
-index d3d1c13..3fc573a 100644
---- a/dmalloc.h.3
-+++ b/dmalloc.h.3
-@@ -459,6 +459,7 @@ DMALLOC_PNT	valloc(DMALLOC_SIZE size);
-  *
-  * string -> String we are duplicating.
-  */
-+#undef strdup
- extern
- char	*strdup(const char *string);
- #endif /* ifndef DMALLOC_STRDUP_MACRO */
diff --git a/package/dmalloc/0005-fix-strndup.patch b/package/dmalloc/0005-fix-strndup.patch
deleted file mode 100644
index a1865acb85..0000000000
--- a/package/dmalloc/0005-fix-strndup.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 005d92c2cebbde5c8623daa29725f7a62b18df7c Mon Sep 17 00:00:00 2001
-From: Siana Gearz <siana.sg@live.de>
-Date: Sat, 8 Sep 2012 22:44:35 +0200
-Subject: [PATCH] Fix strndup
-
-[Retrieved from:
-https://github.com/siana/dmalloc/commit/005d92c2cebbde5c8623daa29725f7a62b18df7c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- dmalloc.h.3 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dmalloc.h.3 b/dmalloc.h.3
-index 8bda997..fb538a8 100644
---- a/dmalloc.h.3
-+++ b/dmalloc.h.3
-@@ -429,6 +429,7 @@ char	*strdup(const char *string);
-  *
-  * len -> Length of the string to duplicate.
-  */
-+#undef strndup
- extern
- char	*strndup(const char *string, const DMALLOC_SIZE len);
- 
diff --git a/package/dmalloc/dmalloc.hash b/package/dmalloc/dmalloc.hash
index 113751656c..f4cc98e813 100644
--- a/package/dmalloc/dmalloc.hash
+++ b/package/dmalloc/dmalloc.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e911e428a  dmalloc-5.5.2.tgz
-sha256  8659d49ceeeb006288ad246164e504ccfe33f7a4c1680439fb6ff6a393b0722b  dmalloc.h.1
+sha256  480e3414ab6cedca837721c756b7d64b01a84d2d0e837378d98444e2f63a7c01  dmalloc-5.6.5.tgz
+sha256  8657f6bc5ebb765dd792b2c3c54d5dc37b8b4e6bbe8aa48d464fd92081b1e720  LICENSE.txt
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 749c35359c..05943943d6 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-DMALLOC_VERSION = 5.5.2
+DMALLOC_VERSION = 5.6.5
 DMALLOC_SOURCE = dmalloc-$(DMALLOC_VERSION).tgz
 DMALLOC_SITE = http://dmalloc.com/releases
 
-DMALLOC_LICENSE = MIT-like
-# license is in each file, dmalloc.h.1 is the smallest one
-DMALLOC_LICENSE_FILES = dmalloc.h.1
+DMALLOC_LICENSE = ISC
+DMALLOC_LICENSE_FILES = LICENSE.txt
 
 DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CFLAGS = $(TARGET_CFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
