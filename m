Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFC1C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C66812DB;
	Tue,  4 Jan 2022 18:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPXW_qmPA_cU; Tue,  4 Jan 2022 18:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 907ED812E6;
	Tue,  4 Jan 2022 18:09:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E59881BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E391D40920
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkdJMVDuppY4 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B8A44030D
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F2D248324A; Tue,  4 Jan 2022 18:02:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:32:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a30732769c0ca54c2a7e0eeca64f42d8479e7f1
X-Git-Newrev: 5f6f3b99fbac974e4b8d977810e97500126ef4d1
X-Patchwork-Hint: ignore
Message-Id: <20220104180256.F2D248324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbredir: bump to version 0.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f6f3b99fbac974e4b8d977810e97500126ef4d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop all patches (already in version)

https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.12.0/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/usbredir/0001-meson-add-tests-option.patch | 46 -----------------
 .../0002-meson-add-stack_protector-option.patch    | 60 ----------------------
 .../0003-meson.build-make-C-optional.patch         | 39 --------------
 package/usbredir/usbredir.hash                     |  4 +-
 package/usbredir/usbredir.mk                       |  2 +-
 5 files changed, 3 insertions(+), 148 deletions(-)

diff --git a/package/usbredir/0001-meson-add-tests-option.patch b/package/usbredir/0001-meson-add-tests-option.patch
deleted file mode 100644
index b2df1587b1..0000000000
--- a/package/usbredir/0001-meson-add-tests-option.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 8490a7ac101d4ee0a78c44b252d3b7a6c2508c74 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 21 Aug 2021 11:55:48 +0200
-Subject: [PATCH] meson: add tests option
-
-Add tests option to allow the user to disable them
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://gitlab.freedesktop.org/spice/usbredir/-/commit/8490a7ac101d4ee0a78c44b252d3b7a6c2508c74]
----
- meson.build       | 4 +++-
- meson_options.txt | 5 +++++
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 6e773a7..a6d21b8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -106,7 +106,9 @@ if host_machine.system() != 'windows'
-         subdir('fuzzing')
-     endif
- endif
--subdir('tests')
-+if get_option('tests').enabled()
-+    subdir('tests')
-+endif
- subdir('data')
- 
- summary(summary_info, bool_yn: true)
-diff --git a/meson_options.txt b/meson_options.txt
-index b35732b..63e8c85 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -21,3 +21,8 @@ option('tools',
-     type : 'feature',
-     value : 'enabled',
-     description : 'Build usbredir\'s tools such as usbredirect')
-+
-+option('tests',
-+    type : 'feature',
-+    value : 'enabled',
-+    description : 'Build usbredir\'s tests such as filter')
--- 
-GitLab
-
diff --git a/package/usbredir/0002-meson-add-stack_protector-option.patch b/package/usbredir/0002-meson-add-stack_protector-option.patch
deleted file mode 100644
index 613e2714e3..0000000000
--- a/package/usbredir/0002-meson-add-stack_protector-option.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 54cf1897ef3aa4d0a35b5f4eb1f5c6928b033af5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 24 Sep 2021 17:24:43 +0200
-Subject: [PATCH] meson: add stack_protector option
-
-Add stack_protector option to allow the user to disable it as some
-embedded toolchains don't support it which will result in the following
-build failure:
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: usbredirparser/libusbredirparser.so.1.1.0.p/usbredirparser.c.o: in function `va_log':
-usbredirparser.c:(.text+0x1c4): undefined reference to `__stack_chk_guard'
-
-Fixes:
- - http://autobuild.buildroot.org/results/40de5443e98157ad50c6841ea70a835cd5ad4fe9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/53]
----
- meson.build       | 6 +++++-
- meson_options.txt | 5 +++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index a6d21b8..4350f53 100644
---- a/meson.build
-+++ b/meson.build
-@@ -17,8 +17,12 @@ cc_flags = [
- if host_machine.system() != 'windows'
-     cc_flags += [
- 	'-Wp,-D_FORTIFY_SOURCE=2',
--	'-fstack-protector',
-     ]
-+    if get_option('stack_protector').enabled()
-+        cc_flags += [
-+	    '-fstack-protector',
-+        ]
-+    endif
- endif
- 
- # Check if we are building from .git
-diff --git a/meson_options.txt b/meson_options.txt
-index 63e8c85..34dd392 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -17,6 +17,11 @@ option('fuzzing-install-dir',
-     type : 'string',
-     description : 'Installation directory for fuzzing binaries')
- 
-+option('stack_protector',
-+    type : 'feature',
-+    value : 'enabled',
-+    description : 'Build usbredir\'s with stack-protector')
-+
- option('tools',
-     type : 'feature',
-     value : 'enabled',
--- 
-2.33.0
-
diff --git a/package/usbredir/0003-meson.build-make-C-optional.patch b/package/usbredir/0003-meson.build-make-C-optional.patch
deleted file mode 100644
index fe1ed3f698..0000000000
--- a/package/usbredir/0003-meson.build-make-C-optional.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 55fc307d23d657b52433d1c8508467d0589754d5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 16 Oct 2021 15:45:57 +0200
-Subject: [PATCH] meson.build: make C++ optional
-
-Remove cpp from meson project statement to make C++ optional and avoid
-the following build failure when the toolchain does not provide a C++
-compiler:
-
-../output-1/build/usbredir-0.11.0/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++']]
-The following exception(s) were encountered:
-Running "/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++ --version" gave "[Errno 2] No such file or directory: '/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++'"
-
-Indeed C++ is only required for fuzzing which is already handled by
-meson through add_languages('cpp', required: true)
-
-Fixes:
- - http://autobuild.buildroot.org/results/eca1d8a2b73a769354ab1d24c7996be30f152138
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/55]
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 49dbce4..ca19f22 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('usbredir', 'c', 'cpp',
-+project('usbredir', 'c',
-     version: '0.11.0',
-     license: 'LGPLv2.1+',
-     meson_version : '>= 0.53',
--- 
-2.33.0
-
diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index e11d4aa720..f738c36690 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,5 +1,5 @@
-# https://spice-space.org/download/usbredir/usbredir-0.11.0.tar.xz.sha256sum
-sha256  72dd5f3aa90dfbc0510b5149bb5b1654c8f21fdc405dfce7b5dc163dcff19cba  usbredir-0.11.0.tar.xz
+# https://spice-space.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256sum
+sha256  fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1c9761e6d  usbredir-0.12.0.tar.xz
 
 # Hash for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 0a8dbf012d..6792a3e758 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.11.0
+USBREDIR_VERSION = 0.12.0
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
 USBREDIR_SITE = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
