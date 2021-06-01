Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE71C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:53:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF0B60F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAF0B60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84CA1415D8;
	Tue,  3 Aug 2021 22:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HisQoR58eei1; Tue,  3 Aug 2021 22:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B796F415D0;
	Tue,  3 Aug 2021 22:53:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 171871BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED0F5404BF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFJMQ84mnnXa for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6A44405F5
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0C6E1843F5; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 22:24:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 689033a8c22829cd68b318d51fe04e997466c837
X-Git-Newrev: dc34fa5c6cd99ae748a18e2ce0467ac6e117f8eb
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.0C6E1843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera: fix build
 on sparc v8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=dc34fa5c6cd99ae748a18e2ce0467ac6e117f8eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix build failure with sparc v8 which is raised since commit
bd9b7b092cf34dc065a4b40268c18a9fe319f5e4 due to
https://git.linuxtv.org/libcamera.git/commit/?id=a8310248fc26cc1e1b791af5e9394c1d20bee269

Fixes:
 - http://autobuild.buildroot.org/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...bcamera-add-dependencies-to-libcamera_dep.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch b/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
new file mode 100644
index 0000000000..aa8d659cf3
--- /dev/null
+++ b/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
@@ -0,0 +1,37 @@
+From 1a2fd4526e0858827f47a7e9359df34f0d0e3108 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 27 May 2021 21:00:21 +0200
+Subject: [PATCH] libcamera: add dependencies to libcamera_dep
+
+Add dependencies to libcamera_dep to avoid the following build failure
+with qcam on sparc v8 which is raised since commit
+a8310248fc26cc1e1b791af5e9394c1d20bee269:
+
+FAILED: src/qcam/qcam
+/srv/storage/autobuild/run/instance-0/output-1/host/bin/sparc-linux-g++  -o src/qcam/qcam src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o src/qcam/qcam.p/.._cam_options.cpp.o src/qcam/qcam.p/.._cam_stream_options.cpp.o src/qcam/qcam.p/format_converter.cpp.o src/qcam/qcam.p/main.cpp.o src/qcam/qcam.p/main_window.cpp.o src/qcam/qcam.p/message_handler.cpp.o src/qcam/qcam.p/viewfinder_qt.cpp.o src/qcam/qcam.p/dng_writer.cpp.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wshadow -include config.h '-Wl,-rpath,$ORIGIN/../libcamera' -Wl,-rpath-link,/srv/storage/autobuild/run/instance-0/output-1/build/libcamera-3a1f67a8031ac5ad96a11d5dc8b2e8976290497b/build/src/libcamera -Wl,--start-group src/libcamera/libcamera.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.so /srv/storage/autobuild/run/instance-0/output-1/
 host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Widgets.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libtiff.so -Wl,--end-group
+/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/qcam/qcam.p/main_window.cpp.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
+/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.libcamera.org/show_bug.cgi?id=39]
+---
+ src/libcamera/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libcamera/meson.build b/src/libcamera/meson.build
+index cc2b8669..af3533ad 100644
+--- a/src/libcamera/meson.build
++++ b/src/libcamera/meson.build
+@@ -160,6 +160,7 @@ libcamera_dep = declare_dependency(sources : [
+                                        libcamera_public_headers,
+                                    ],
+                                    include_directories : libcamera_includes,
++                                   dependencies : libcamera_deps,
+                                    link_with : libcamera)
+ 
+ subdir('proxy/worker')
+-- 
+2.30.2
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
