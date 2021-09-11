Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D25C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:59:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9FDE60F24
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9FDE60F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 990BB415B0;
	Sat, 11 Sep 2021 20:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urmvYPZjKp0E; Sat, 11 Sep 2021 20:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF0DD40505;
	Sat, 11 Sep 2021 20:59:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D61DB1BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFA214029A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWNMe1i76rNM for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:58:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0F5E4027C
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 060058A258; Sat, 11 Sep 2021 20:57:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 22:51:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb6a9acfe19b35a53c666c4ae9eac6a71049b735
X-Git-Newrev: c09f126f570355b8ec134724b453300a4811339c
X-Patchwork-Hint: ignore
Message-Id: <20210911205709.060058A258@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump to version
 e355ca0087cd93ef80f74c61018e9e9228a93313
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

commit: https://git.buildroot.net/buildroot/commit/?id=c09f126f570355b8ec134724b453300a4811339c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com.
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...bcamera-add-dependencies-to-libcamera_dep.patch | 37 ----------------------
 package/libcamera/libcamera.hash                   |  2 +-
 package/libcamera/libcamera.mk                     |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch b/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
deleted file mode 100644
index aa8d659cf3..0000000000
--- a/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1a2fd4526e0858827f47a7e9359df34f0d0e3108 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 27 May 2021 21:00:21 +0200
-Subject: [PATCH] libcamera: add dependencies to libcamera_dep
-
-Add dependencies to libcamera_dep to avoid the following build failure
-with qcam on sparc v8 which is raised since commit
-a8310248fc26cc1e1b791af5e9394c1d20bee269:
-
-FAILED: src/qcam/qcam
-/srv/storage/autobuild/run/instance-0/output-1/host/bin/sparc-linux-g++  -o src/qcam/qcam src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o src/qcam/qcam.p/.._cam_options.cpp.o src/qcam/qcam.p/.._cam_stream_options.cpp.o src/qcam/qcam.p/format_converter.cpp.o src/qcam/qcam.p/main.cpp.o src/qcam/qcam.p/main_window.cpp.o src/qcam/qcam.p/message_handler.cpp.o src/qcam/qcam.p/viewfinder_qt.cpp.o src/qcam/qcam.p/dng_writer.cpp.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wshadow -include config.h '-Wl,-rpath,$ORIGIN/../libcamera' -Wl,-rpath-link,/srv/storage/autobuild/run/instance-0/output-1/build/libcamera-3a1f67a8031ac5ad96a11d5dc8b2e8976290497b/build/src/libcamera -Wl,--start-group src/libcamera/libcamera.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.so /srv/storage/autobuild/run/instance-0/output-1/
 host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Widgets.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libtiff.so -Wl,--end-group
-/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/qcam/qcam.p/main_window.cpp.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
-/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
-
-Fixes:
- - http://autobuild.buildroot.org/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugs.libcamera.org/show_bug.cgi?id=39]
----
- src/libcamera/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libcamera/meson.build b/src/libcamera/meson.build
-index cc2b8669..af3533ad 100644
---- a/src/libcamera/meson.build
-+++ b/src/libcamera/meson.build
-@@ -160,6 +160,7 @@ libcamera_dep = declare_dependency(sources : [
-                                        libcamera_public_headers,
-                                    ],
-                                    include_directories : libcamera_includes,
-+                                   dependencies : libcamera_deps,
-                                    link_with : libcamera)
- 
- subdir('proxy/worker')
--- 
-2.30.2
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 78197b9aeb..52c584bc16 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  fa9efe38397392a338c0ed9d0bf3ac1480d4d1c96b0597e422f8b9fb36f43398  libcamera-3a1f67a8031ac5ad96a11d5dc8b2e8976290497b-br1.tar.gz
+sha256  a5ed581416719b914140eda76ca8a4e0e9c944b859f8fb018fc17497278c5ae1  libcamera-e355ca0087cd93ef80f74c61018e9e9228a93313-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 11a6961da5..677da8ac4c 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = 3a1f67a8031ac5ad96a11d5dc8b2e8976290497b
+LIBCAMERA_VERSION = e355ca0087cd93ef80f74c61018e9e9228a93313
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
