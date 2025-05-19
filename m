Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19479C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3E3881EFF;
	Thu, 12 Jun 2025 08:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZWcUG89lbt9; Thu, 12 Jun 2025 08:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4B0481E4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4B0481E4D;
	Thu, 12 Jun 2025 08:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A1D01E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91877405C7
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASy8mJpKB3fd for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6022405A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6022405A6
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B320882D97; Thu, 12 Jun 2025 08:38:26 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:46:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccf17145024fff8d56f5240227c8df0c233b12fc
X-Git-Newrev: 75891397abe60dbe3d82a1ec39654ff81d1b1406
X-Patchwork-Hint: ignore
Message-Id: <20250612083826.B320882D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add support for GCC 15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=75891397abe60dbe3d82a1ec39654ff81d1b1406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  https://gcc.gnu.org/gcc-15/changes.html

NIOS II support has been removed, and we removed it from Buildroot
some time ago.

AArch64 ILP32 support has been deprecated, but we never supported it
in Buildroot.

In the stack of patches, just keep patch 0001.

Indeed, from 14.2.0:

- 0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch is
  upstream as of commit fa321004f3f6288d3ee2eefa6b02177131882dca

- 0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch is
  upstream as of commit 3ac02e67503ccffa3dfeeffc0a60fce6bdaca43b

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 +
 ...disable-split-stack-for-non-thread-builds.patch | 26 ++++++++++++++++++++++
 package/gcc/Config.in.host                         | 11 +++++++++
 package/gcc/gcc.hash                               |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index fe736e3185..c8f708217b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -478,6 +478,7 @@ package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/15.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
diff --git a/package/gcc/15.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/15.1.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..052c31cf04
--- /dev/null
+++ b/package/gcc/15.1.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From d5fe709ddf2ba97ed94ea8339655230322456d1b Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.49.0
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 10fe4bf609..68ffa793e4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -49,6 +49,16 @@ config BR2_GCC_VERSION_14_X
 	depends on !BR2_microblaze
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
+config BR2_GCC_VERSION_15_X
+	bool "gcc 15.x"
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_POWERPC_CPU_HAS_SPE
+	# Severely broken on Microblaze
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
+	depends on !BR2_microblaze
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+
 endchoice
 
 # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
@@ -79,6 +89,7 @@ config BR2_GCC_VERSION
 	default "12.4.0"    if BR2_GCC_VERSION_12_X
 	default "13.3.0"    if BR2_GCC_VERSION_13_X
 	default "14.2.0"    if BR2_GCC_VERSION_14_X
+	default "15.1.0"    if BR2_GCC_VERSION_15_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index b7c53f8fbe..8c4e39c71d 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,6 +8,8 @@ sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656
 sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.2.0/sha512.sum
 sha512  932bdef0cda94bacedf452ab17f103c0cb511ff2cec55e9112fc0328cbf1d803b42595728ea7b200e0a057c03e85626f937012e49a7515bc5dd256b2bf4bc396  gcc-14.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.1.0/sha512.sum
+sha512  ddd35ca6c653dffa88f7c7ef9ee4cd806e156e0f3b30f4d63e75a8363361285cd566ee73127734cde6a934611de815bee3e32e24bfd2e0ab9f7ff35c929821c1  gcc-15.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  4dca20f517a42bb027fec605965b09fb917a535eebf3fe3e811d93476b02b1962df5ad4665f117bd44c2ec8e8015d51a44c00591761fe5f259c201ac5c7d920f  gcc-arc-2023.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
