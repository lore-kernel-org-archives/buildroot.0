Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8487EC54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 19:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45AD88212B;
	Wed, 20 Mar 2024 19:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJKWHnil7Pq2; Wed, 20 Mar 2024 19:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A955D8131A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A955D8131A;
	Wed, 20 Mar 2024 19:56:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99DB11BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 19:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8671060621
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 19:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vl5QqK3CRANe for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 19:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3075160591
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3075160591
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 19:56:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 195B1836C0; Wed, 20 Mar 2024 19:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Mar 2024 20:53:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 455ce5fc02488983a6732087bcbbb15e04c75937
X-Git-Newrev: 87504a1b7948dbfa3648ad02c3c034a3c36dcd92
X-Patchwork-Hint: ignore
Message-Id: <20240320195617.195B1836C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: bump to version 17.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=87504a1b7948dbfa3648ad02c3c034a3c36dcd92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop three upstreamed patches
- This bump will fix the following build failure raised since bump of
  webrtc-audio-processsing to version 1.3 in commit
  ef0fa986eb7ff25c0a5db70ec0b62032e2d71538:

  ../output-1/build/pulseaudio-16.1/meson.build:723:15: ERROR: Dependency "webrtc-audio-processing" not found, tried pkgconfig and cmake

https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/blob/v17.0/NEWS

Fixes: ef0fa986eb7ff25c0a5db70ec0b62032e2d71538
 - http://autobuild.buildroot.org/results/528717c7481adbb5333d77758ef94830f46bc3f1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                |   3 -
 ...02-build-sys-Fix-atomic-support-detection.patch |  59 ----------
 ...ys-Add-missing-libatomic_ops-dependencies.patch | 129 ---------------------
 .../0004-meson.build-fix-build-without-C.patch     |  56 ---------
 package/pulseaudio/pulseaudio.hash                 |   4 +-
 package/pulseaudio/pulseaudio.mk                   |   2 +-
 6 files changed, 3 insertions(+), 250 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a99309682..3b64c90d8b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1030,9 +1030,6 @@ package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch Upst
 package/ptpd2/0003-Solve-issue-25-Removing-type-U64-from-net-snmp-relat.patch Upstream
 package/ptpd2/S65ptpd2 Indent Shellcheck Variables
 package/pulseaudio/0001-shm.c-use-_Static_assert-instead-of-static_assert-fo.patch Upstream
-package/pulseaudio/0002-build-sys-Fix-atomic-support-detection.patch Upstream
-package/pulseaudio/0003-build-sys-Add-missing-libatomic_ops-dependencies.patch Upstream
-package/pulseaudio/0004-meson.build-fix-build-without-C.patch Upstream
 package/pulseaudio/S50pulseaudio ConsecutiveEmptyLines EmptyLastLine Indent Variables
 package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch Upstream
 package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch Upstream
diff --git a/package/pulseaudio/0002-build-sys-Fix-atomic-support-detection.patch b/package/pulseaudio/0002-build-sys-Fix-atomic-support-detection.patch
deleted file mode 100644
index 631cb7f016..0000000000
--- a/package/pulseaudio/0002-build-sys-Fix-atomic-support-detection.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From a5392576ceba92d04706cefc1929ddd5ace5537a Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Fri, 1 Jul 2022 14:03:44 +0200
-Subject: [PATCH] build-sys: Fix atomic support detection
-
-Attempting to use atomics operations on an architecture that does not
-support them generally results in a link error:
-
-ld: /tmp/ccjYcMPP.o: in function `func':
-testfile.c:(.text+0x1c): undefined reference to `__sync_bool_compare_and_swap_4'
-
-The current build system uses cc.compiles() to check if atomic ops are
-supported, but cc.compiles() does not attempt to link, so the test fails
-to enable libatomics_opts.
-
-Fix this by using cc.links() instead of cc.compiles().
-
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Upstream-status: Submitted [https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/732]
----
- meson.build | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index c6db7e670..c5135330f 100644
---- a/meson.build
-+++ b/meson.build
-@@ -498,22 +498,24 @@ endif
- 
- need_libatomic_ops = false
- 
--atomictest = '''void func() {
-+atomictest = '''int main() {
-   volatile int atomic = 2;
-   __sync_bool_compare_and_swap (&atomic, 2, 3);
-+  return 0;
- }
- '''
- 
--if cc.compiles(atomictest)
-+if cc.links(atomictest)
-   cdata.set('HAVE_ATOMIC_BUILTINS', 1)
- 
--  newatomictest = '''void func() {
-+  newatomictest = '''int main() {
-     int c = 0;
-     __atomic_store_n(&c, 4, __ATOMIC_SEQ_CST);
-+    return 0;
-   }
-   '''
- 
--  if(cc.compiles(newatomictest))
-+  if(cc.links(newatomictest))
-     cdata.set('HAVE_ATOMIC_BUILTINS_MEMORY_MODEL', 1)
-   endif
- 
--- 
-2.36.1
-
diff --git a/package/pulseaudio/0003-build-sys-Add-missing-libatomic_ops-dependencies.patch b/package/pulseaudio/0003-build-sys-Add-missing-libatomic_ops-dependencies.patch
deleted file mode 100644
index fac441e7dd..0000000000
--- a/package/pulseaudio/0003-build-sys-Add-missing-libatomic_ops-dependencies.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 96361ff2a8f37dd3ce7ea188ce4e7b038bb6a5aa Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Mon, 4 Jul 2022 13:49:34 +0200
-Subject: [PATCH] build-sys: Add missing libatomic_ops dependencies
-
-Add libatomic_ops dependencies to libraries/modules that showed a
-failure on an arch that does not have native atomic operations support.
-
-Not all optional dependencies were tested, so it is possible that
-some optional modules are still missing libatomic_ops dependencies.
-
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Upstream-status: Submitted [https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/732]
----
- src/meson.build           |  2 +-
- src/modules/meson.build   |  6 +++---
- src/pulse/meson.build     |  2 +-
- src/pulsecore/meson.build | 10 +++++-----
- 4 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 96dcec354..9efb561d8 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -205,7 +205,7 @@ else
-       libm_dep, thread_dep, dl_dep, shm_dep, iconv_dep, sndfile_dep, dbus_dep,
-       x11_dep, libsystemd_dep, glib_dep.partial_dependency(compile_args: true),
-       gtk_dep.partial_dependency(compile_args: true), asyncns_dep, libintl_dep,
--      platform_dep, platform_socket_dep, execinfo_dep,
-+      platform_dep, platform_socket_dep, execinfo_dep, libatomic_ops_dep,
-     ],
-     implicit_include_directories : false)
- 
-diff --git a/src/modules/meson.build b/src/modules/meson.build
-index 1d8004300..1e12569dc 100644
---- a/src/modules/meson.build
-+++ b/src/modules/meson.build
-@@ -14,7 +14,7 @@ all_modules = [
-   [ 'module-cli-protocol-tcp', 'module-protocol-stub.c', [], ['-DUSE_PROTOCOL_CLI', '-DUSE_TCP_SOCKETS'], [], libprotocol_cli ],
-   [ 'module-cli-protocol-unix', 'module-protocol-stub.c', [], ['-DUSE_PROTOCOL_CLI', '-DUSE_UNIX_SOCKETS'], [], libprotocol_cli ],
-   [ 'module-combine', 'module-combine.c' ],
--  [ 'module-combine-sink', 'module-combine-sink.c' ],
-+  [ 'module-combine-sink', 'module-combine-sink.c', [], [], [libatomic_ops_dep] ],
- #  [ 'module-coreaudio-detect', 'macosx/module-coreaudio-detect.c' ],
- #  [ 'module-coreaudio-device', 'macosx/module-coreaudio-device.c' ],
-   [ 'module-default-device-restore', 'module-default-device-restore.c', [], [], [], libprotocol_native ],
-@@ -73,7 +73,7 @@ endif
- 
- if host_machine.system() != 'windows'
-   all_modules += [
--    [ 'module-rtp-recv', 'rtp/module-rtp-recv.c', [], [], [], librtp ],
-+    [ 'module-rtp-recv', 'rtp/module-rtp-recv.c', [], [], [libatomic_ops_dep], librtp ],
-     [ 'module-rtp-send', 'rtp/module-rtp-send.c' , [], [], [], librtp ],
-   ]
- endif
-@@ -243,7 +243,7 @@ module_echo_cancel_sources = [
- ]
- module_echo_cancel_orc_sources = []
- module_echo_cancel_flags = []
--module_echo_cancel_deps = []
-+module_echo_cancel_deps = [libatomic_ops_dep]
- module_echo_cancel_libs = []
- 
- if get_option('adrian-aec')
-diff --git a/src/pulse/meson.build b/src/pulse/meson.build
-index c2128e087..1b82c807c 100644
---- a/src/pulse/meson.build
-+++ b/src/pulse/meson.build
-@@ -85,7 +85,7 @@ libpulse = shared_library('pulse',
-   link_args : [nodelete_link_args, versioning_link_args],
-   install : true,
-   install_rpath : privlibdir,
--  dependencies : [libm_dep, thread_dep, libpulsecommon_dep, dbus_dep, dl_dep, iconv_dep, libintl_dep, platform_dep, platform_socket_dep],
-+  dependencies : [libm_dep, thread_dep, libpulsecommon_dep, dbus_dep, dl_dep, iconv_dep, libintl_dep, platform_dep, platform_socket_dep, libatomic_ops_dep],
-   implicit_include_directories : false)
- 
- libpulse_dep = declare_dependency(link_with: libpulse)
-diff --git a/src/pulsecore/meson.build b/src/pulsecore/meson.build
-index b30264b3a..b37fec499 100644
---- a/src/pulsecore/meson.build
-+++ b/src/pulsecore/meson.build
-@@ -251,7 +251,7 @@ libcli = shared_library('cli',
-   c_args : [pa_c_args, server_c_args, database_c_args],
-   link_args : [nodelete_link_args],
-   include_directories : [configinc, topinc],
--  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep],
-+  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libatomic_ops_dep],
-   install : true,
-   install_rpath : privlibdir,
-   install_dir : modlibexecdir,
-@@ -268,7 +268,7 @@ libprotocol_cli = shared_library('protocol-cli',
-   c_args : [pa_c_args, server_c_args, database_c_args],
-   link_args : [nodelete_link_args],
-   include_directories : [configinc, topinc],
--  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libcli_dep],
-+  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libcli_dep, libatomic_ops_dep],
-   install : true,
-   install_rpath : rpath_dirs,
-   install_dir : modlibexecdir,
-@@ -280,7 +280,7 @@ libprotocol_http = shared_library('protocol-http',
-   c_args : [pa_c_args, server_c_args, database_c_args],
-   link_args : [nodelete_link_args],
-   include_directories : [configinc, topinc],
--  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep],
-+  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libatomic_ops_dep],
-   install : true,
-   install_rpath : privlibdir,
-   install_dir : modlibexecdir,
-@@ -292,7 +292,7 @@ libprotocol_native = shared_library('protocol-native',
-   c_args : [pa_c_args, server_c_args, database_c_args],
-   link_args : [nodelete_link_args],
-   include_directories : [configinc, topinc],
--  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, dbus_dep],
-+  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, dbus_dep, libatomic_ops_dep],
-   install : true,
-   install_rpath : privlibdir,
-   install_dir : modlibexecdir,
-@@ -304,7 +304,7 @@ libprotocol_simple = shared_library('protocol-simple',
-   c_args : [pa_c_args, server_c_args, database_c_args],
-   link_args : [nodelete_link_args],
-   include_directories : [configinc, topinc],
--  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep],
-+  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libatomic_ops_dep],
-   install : true,
-   install_rpath : privlibdir,
-   install_dir : modlibexecdir,
--- 
-2.36.1
-
diff --git a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
deleted file mode 100644
index e770927f54..0000000000
--- a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ac88536d7c3fde3c22933368296c9029bb67b9fc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 25 Jul 2022 21:49:25 +0200
-Subject: [PATCH] meson.build: fix build without C++
-
-Fix the following build failure without C++:
-
-../output-1/build/pulseaudio-16.1/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++']]
-The following exception(s) were encountered:
-Running "/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++'"
-
-Fixes:
- - http://autobuild.buildroot.org/results/6526a21bd4da3b8458188f27c1ec04c381e4b673
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/737]
----
- meson.build                         | 3 ++-
- src/modules/echo-cancel/meson.build | 2 ++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index c5135330f..8248f263b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('pulseaudio', 'c', 'cpp',
-+project('pulseaudio', 'c',
-         version : run_command(find_program('git-version-gen'), join_paths(meson.current_source_dir(), '.tarball-version')).stdout().strip(),
-         meson_version : '>= 0.50.0',
-         default_options : [ 'c_std=gnu11', 'cpp_std=c++11' ]
-@@ -433,6 +433,7 @@ endif
- # Code coverage
- 
- if get_option('gcov')
-+  add_languages('cpp')
-   add_project_arguments('--coverage', language: ['c', 'cpp'])
-   add_project_link_arguments('--coverage', language: ['c', 'cpp'])
- endif
-diff --git a/src/modules/echo-cancel/meson.build b/src/modules/echo-cancel/meson.build
-index 641cd35e7..3b998364e 100644
---- a/src/modules/echo-cancel/meson.build
-+++ b/src/modules/echo-cancel/meson.build
-@@ -6,6 +6,8 @@
- # '-Wl,--unresolved-symbols=ignore-in-object-files' otherwise it fails
- # at link time.
- 
-+add_languages('cpp')
-+
- libwebrtc_util_sources = [
-   'webrtc.cc'
- ]
--- 
-GitLab
-
diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index acbb56a07d..67f6cc6ef2 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2022-June/032287.html
-sha256  8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72863251751e504ae4  pulseaudio-16.1.tar.xz
+# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2024-January/032426.html
+sha256  053794d6671a3e397d849e478a80b82a63cb9d8ca296bd35b73317bb5ceb87b5  pulseaudio-17.0.tar.xz
 # Locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 89191db541..254e05348d 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 16.1
+PULSEAUDIO_VERSION = 17.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = https://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
