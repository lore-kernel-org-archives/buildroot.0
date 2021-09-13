Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A82C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:41:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41E861103
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D41E861103
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A534E40135;
	Mon, 13 Sep 2021 20:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPuGuH28iKEO; Mon, 13 Sep 2021 20:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AADB40182;
	Mon, 13 Sep 2021 20:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7833C1BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BF3540134
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTf8-xSLGfdU for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:40:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1085440135
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:40:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BAD278A6A0; Mon, 13 Sep 2021 20:38:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:38:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df826eb5cd94775b9614ba1c3c1599720b54c955
X-Git-Newrev: d8f3c6e8b8e11387fe0d2c65af3124fb33489ec7
X-Patchwork-Hint: ignore
Message-Id: <20210913203830.BAD278A6A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: bump to version 2.18.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8f3c6e8b8e11387fe0d2c65af3124fb33489ec7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/randombit/botan/blob/2.18.1/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...and-group-l-flags-from-LDFLAGS-to-the-end.patch | 75 ----------------------
 package/botan/0002-Avoid-empty-l.patch             | 25 --------
 package/botan/0003-Add-support-for-riscv32.patch   | 31 ---------
 package/botan/botan.hash                           |  2 +-
 package/botan/botan.mk                             |  2 +-
 5 files changed, 2 insertions(+), 133 deletions(-)

diff --git a/package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch b/package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch
deleted file mode 100644
index 8aa5c68652..0000000000
--- a/package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From af63fe89228172e5a395f7e6491fae3bfa9da4b1 Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Mon, 15 Feb 2021 15:01:38 -0500
-Subject: [PATCH] Add --extra-libs option and group -l flags from LDFLAGS to
- the end
-
-Ref #2622
-
-[Retrieved from:
-https://github.com/randombit/botan/commit/af63fe89228172e5a395f7e6491fae3bfa9da4b1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.py               | 14 ++++++++++++++
- src/build-data/makefile.in |  2 +-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/configure.py b/configure.py
-index 73fc0271e9..865a6c8e62 100755
---- a/configure.py
-+++ b/configure.py
-@@ -333,6 +333,9 @@ def process_command_line(args): # pylint: disable=too-many-locals,too-many-state
-     target_group.add_option('--ldflags', metavar='FLAGS',
-                             help='set linker flags', default=None)
- 
-+    target_group.add_option('--extra-libs', metavar='LIBS',
-+                            help='specify extra libraries to link against', default='')
-+
-     target_group.add_option('--ar-command', dest='ar_command', metavar='AR', default=None,
-                             help='set path to static archive creator')
- 
-@@ -2020,6 +2023,12 @@ def choose_cxx_exe():
-         else:
-             return '%s %s' % (options.compiler_cache, cxx)
- 
-+    def extra_libs(libs, cc):
-+        if libs is None:
-+            return ''
-+
-+        return ' '.join([(cc.add_lib_option % lib) for lib in libs.split(',')])
-+
-     variables = {
-         'version_major':  Version.major(),
-         'version_minor':  Version.minor(),
-@@ -2149,6 +2158,7 @@ def choose_cxx_exe():
-         'cc_sysroot': sysroot_option(),
-         'cc_compile_flags': options.cxxflags or cc.cc_compile_flags(options),
-         'ldflags': options.ldflags or '',
-+        'extra_libs': extra_libs(options.extra_libs, cc),
-         'cc_warning_flags': cc.cc_warning_flags(options),
-         'output_to_exe': cc.output_to_exe,
-         'cc_macro': cc.macro_name,
-@@ -3029,6 +3039,10 @@ def canonicalize_build_targets(options):
-     if options.build_fuzzers == 'libfuzzer' and options.fuzzer_lib is None:
-         options.fuzzer_lib = 'Fuzzer'
- 
-+    if options.ldflags is not None:
-+        libs = [m.group(1) for m in re.finditer(r'-l([a-z0-9]+)', options.ldflags)]
-+        options.extra_libs += ','.join(libs)
-+
- # Checks user options for consistency
- # This method DOES NOT change options on behalf of the user but explains
- # why the given configuration does not work.
-diff --git a/src/build-data/makefile.in b/src/build-data/makefile.in
-index 4692d00f71..82f6576650 100644
---- a/src/build-data/makefile.in
-+++ b/src/build-data/makefile.in
-@@ -20,7 +20,7 @@ LDFLAGS        = %{ldflags}
- EXE_LINK_CMD   = %{exe_link_cmd}
- 
- LIB_LINKS_TO   = %{external_link_cmd} %{link_to}
--EXE_LINKS_TO   = %{link_to_botan} $(LIB_LINKS_TO)
-+EXE_LINKS_TO   = %{link_to_botan} $(LIB_LINKS_TO) %{extra_libs}
- 
- BUILD_FLAGS    = $(ABI_FLAGS) $(LANG_FLAGS) $(CXXFLAGS) $(WARN_FLAGS)
- 
diff --git a/package/botan/0002-Avoid-empty-l.patch b/package/botan/0002-Avoid-empty-l.patch
deleted file mode 100644
index 9102360244..0000000000
--- a/package/botan/0002-Avoid-empty-l.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 4b2225ea54988e09b649768848b3c14b43e064de Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Mon, 15 Feb 2021 15:11:12 -0500
-Subject: [PATCH] Avoid empty -l
-
-[Retrieved from:
-https://github.com/randombit/botan/commit/4b2225ea54988e09b649768848b3c14b43e064de]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.py b/configure.py
-index 865a6c8e62..a79f672eca 100755
---- a/configure.py
-+++ b/configure.py
-@@ -2027,7 +2027,7 @@ def extra_libs(libs, cc):
-         if libs is None:
-             return ''
- 
--        return ' '.join([(cc.add_lib_option % lib) for lib in libs.split(',')])
-+        return ' '.join([(cc.add_lib_option % lib) for lib in libs.split(',') if lib != ''])
- 
-     variables = {
-         'version_major':  Version.major(),
diff --git a/package/botan/0003-Add-support-for-riscv32.patch b/package/botan/0003-Add-support-for-riscv32.patch
deleted file mode 100644
index d8978b2f11..0000000000
--- a/package/botan/0003-Add-support-for-riscv32.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 443bf46ee2b1b1d7acd63e3f00dcbe66646138f8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 2 Apr 2021 20:37:03 +0200
-Subject: [PATCH] Add support for riscv32
-
-Fix the following build failure:
-
-  ERROR: Unknown or unidentifiable processor "riscv32"
-
-Fixes:
- - http://autobuild.buildroot.org/results/1c399312dbec5d7a28ec90d62fdd8f47fa14ff4b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/randombit/botan/commit/aa7958880bee2091a8a71bf9e1f6e6efb34581e3]
----
- src/build-data/arch/riscv32.txt | 2 ++
- 1 file changed, 2 insertions(+)
- create mode 100644 src/build-data/arch/riscv32.txt
-
-diff --git a/src/build-data/arch/riscv32.txt b/src/build-data/arch/riscv32.txt
-new file mode 100644
-index 000000000..ba88b42e9
---- /dev/null
-+++ b/src/build-data/arch/riscv32.txt
-@@ -0,0 +1,2 @@
-+family riscv32
-+endian little
--- 
-2.30.2
-
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index d1b1d14acb..b7804ce9d7 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  79123b654445a4abba486e09a431788545c708237382a3e765664c9f55b03b88  Botan-2.17.3.tar.xz
+sha256  f8c7b46222a857168a754a5cc329bb780504122b270018dda5304c98db28ae29  Botan-2.18.1.tar.xz
 # Locally computed
 sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 2e3f99b49b..c23aba99dd 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.17.3
+BOTAN_VERSION = 2.18.1
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
