Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0896DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6E1D40BD8;
	Tue, 29 Mar 2022 20:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDzC3tggyruZ; Tue, 29 Mar 2022 20:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EB1C40BCA;
	Tue, 29 Mar 2022 20:31:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 929611BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ED4661119
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-0LbP4CNpdy for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9090B61039
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4C27F85F8A; Tue, 29 Mar 2022 20:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 21:55:40 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0009e18a52ad6bb7152a6de9910dad863157537f
X-Git-Newrev: 06e2a7273572f4264eda6538391adb2da2b65c48
X-Patchwork-Hint: ignore
Message-Id: <20220329202022.4C27F85F8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rygel: fix
 g_ir_compiler calls
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

commit: https://git.buildroot.net/buildroot/commit/?id=06e2a7273572f4264eda6538391adb2da2b65c48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since bump to version 0.40.2 in
commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:

[108/298] Generating src/librygel-core/RygelCore-2.6.typelib with a custom command
FAILED: src/librygel-core/RygelCore-2.6.typelib
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler --output src/librygel-core/RygelCore-2.6.typelib /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir
Could not find GIR file 'GUPnP-1.2.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir: Failed to parse included gir GUPnP-1.2

Fixes:
 - http://autobuild.buildroot.org/results/2b8956818f03f66a53480f7ed5fc0abb4f05288d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 94515b902c74d51aeb32654a4795ca92d6dd7279)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-meson.build-fix-g_ir_compiler-calls.patch | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch b/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch
new file mode 100644
index 0000000000..3961ad0564
--- /dev/null
+++ b/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch
@@ -0,0 +1,84 @@
+From bed9e2effae60f7d736731e93d9e699cb173f04e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 15 Mar 2022 19:20:33 +0100
+Subject: [PATCH] meson.build: fix g_ir_compiler calls
+
+Fix the following build failure when cross-compiling which is raised
+because rygel is using a custom_target target instead of the standard
+gnome.generate_gir:
+
+[108/298] Generating src/librygel-core/RygelCore-2.6.typelib with a custom command
+FAILED: src/librygel-core/RygelCore-2.6.typelib
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler --output src/librygel-core/RygelCore-2.6.typelib /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir
+Could not find GIR file 'GUPnP-1.2.gir'; check XDG_DATA_DIRS or use --includedir
+error parsing file /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir: Failed to parse included gir GUPnP-1.2
+
+Indeed, the custom_target command is unable to retrieve the correct
+--includedir from glib-2.0.pc so add an ugly hack to custom_target calls
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2b8956818f03f66a53480f7ed5fc0abb4f05288d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: probably not upstreamable]
+---
+ src/librygel-core/meson.build         | 4 +++-
+ src/librygel-renderer-gst/meson.build | 1 +
+ src/librygel-renderer/meson.build     | 1 +
+ src/librygel-server/meson.build       | 1 +
+ 4 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/librygel-core/meson.build b/src/librygel-core/meson.build
+index fd43bebe..e6be2b5e 100644
+--- a/src/librygel-core/meson.build
++++ b/src/librygel-core/meson.build
+@@ -70,7 +70,9 @@ core_gir = custom_target('RygelCore-2.6.gir',
+ # so we depend on the custom_target from that step and pass the input through
+ # commandline.
+ custom_target('RygelCore-2.6.typelib',
+-               command: [g_ir_compiler, '--output', '@OUTPUT@', join_paths(meson.current_build_dir(), 'RygelCore-2.6.gir')],
++               command: [g_ir_compiler, '--output', '@OUTPUT@',
++                         '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
++                         join_paths(meson.current_build_dir(), 'RygelCore-2.6.gir')],
+                output: 'RygelCore-2.6.typelib',
+                depends: [ core_lib, core_gir ],
+                install: true,
+diff --git a/src/librygel-renderer-gst/meson.build b/src/librygel-renderer-gst/meson.build
+index ad98a3a7..e8baefe1 100644
+--- a/src/librygel-renderer-gst/meson.build
++++ b/src/librygel-renderer-gst/meson.build
+@@ -36,6 +36,7 @@ custom_target('RygelRendererGst-2.6.typelib',
+                         '--output', '@OUTPUT@',
+                         '--includedir', core_girdir,
+                         '--includedir', renderer_girdir,
++                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
+                         join_paths(meson.current_build_dir(), 'RygelRendererGst-2.6.gir')],
+                output: 'RygelRendererGst-2.6.typelib',
+                depends: [renderer_gst_lib, renderer_lib, renderer_gst_gir, renderer_gir],
+diff --git a/src/librygel-renderer/meson.build b/src/librygel-renderer/meson.build
+index 5f401527..821273ff 100644
+--- a/src/librygel-renderer/meson.build
++++ b/src/librygel-renderer/meson.build
+@@ -43,6 +43,7 @@ custom_target('RygelRenderer-2.6.typelib',
+                command: [g_ir_compiler,
+                         '--output', '@OUTPUT@',
+                         '--includedir', core_girdir,
++                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
+                         join_paths(meson.current_build_dir(), 'RygelRenderer-2.6.gir')],
+                output: 'RygelRenderer-2.6.typelib',
+                depends: [ renderer_lib, renderer_gir, core_gir ],
+diff --git a/src/librygel-server/meson.build b/src/librygel-server/meson.build
+index a3bd77d9..6b084eb6 100644
+--- a/src/librygel-server/meson.build
++++ b/src/librygel-server/meson.build
+@@ -122,6 +122,7 @@ custom_target('RygelServer-2.6.typelib',
+                command: [g_ir_compiler,
+                         '--output', '@OUTPUT@',
+                         '--includedir', core_girdir,
++                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
+                         join_paths(meson.current_build_dir(), 'RygelServer-2.6.gir')],
+                output: 'RygelServer-2.6.typelib',
+                depends: [ server_lib, server_gir, core_gir ],
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
