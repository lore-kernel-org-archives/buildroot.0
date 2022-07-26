Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BF0C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7444440519;
	Tue, 26 Jul 2022 08:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7444440519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eoWGvKvC9IJv; Tue, 26 Jul 2022 08:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BE8C40502;
	Tue, 26 Jul 2022 08:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BE8C40502
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA401BF9AF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17F5960BB0
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17F5960BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8hHiEViC1Ch for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:55:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CED160B2A
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CED160B2A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D37ED85EC2; Tue, 26 Jul 2022 08:42:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 10:55:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c00fda3c59bfa216a8111ed3c281ce214c9f5242
X-Git-Newrev: a40a516c8ae2e8c11549115e10aa74d98a4fab5d
X-Patchwork-Hint: ignore
Message-Id: <20220726084209.D37ED85EC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: fix build without C++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a40a516c8ae2e8c11549115e10aa74d98a4fab5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without C++ raised since bump to version
16.1 in commit 6f3131296484767f037d3535ab69f328e94351db:

../output-1/build/pulseaudio-16.1/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++']]
The following exception(s) were encountered:
Running "/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/6526a21bd4da3b8458188f27c1ec04c381e4b673

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0004-meson.build-fix-build-without-C.patch     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
new file mode 100644
index 0000000000..e6453d641d
--- /dev/null
+++ b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
@@ -0,0 +1,42 @@
+From 9de058e15a4caba4939a864fb7caf67e0164f07e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 25 Jul 2022 21:49:25 +0200
+Subject: [PATCH] meson.build: fix build without C++
+
+Fix the following build failure without C++:
+
+../output-1/build/pulseaudio-16.1/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++']]
+The following exception(s) were encountered:
+Running "/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++'"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6526a21bd4da3b8458188f27c1ec04c381e4b673
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/737]
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c5135330f..8248f263b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('pulseaudio', 'c', 'cpp',
++project('pulseaudio', 'c',
+         version : run_command(find_program('git-version-gen'), join_paths(meson.current_source_dir(), '.tarball-version')).stdout().strip(),
+         meson_version : '>= 0.50.0',
+         default_options : [ 'c_std=gnu11', 'cpp_std=c++11' ]
+@@ -433,6 +433,7 @@ endif
+ # Code coverage
+ 
+ if get_option('gcov')
++  add_languages('cpp')
+   add_project_arguments('--coverage', language: ['c', 'cpp'])
+   add_project_link_arguments('--coverage', language: ['c', 'cpp'])
+ endif
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
