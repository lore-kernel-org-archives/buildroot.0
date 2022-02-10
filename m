Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565D7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A2A440122;
	Thu, 10 Feb 2022 21:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id at5YBwm8i0xp; Thu, 10 Feb 2022 21:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF63A40142;
	Thu, 10 Feb 2022 21:53:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1DC1BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 487A2402C1
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZMmN1i57ZMh for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:51:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BC1C40761
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:51:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 29001826C1; Thu, 10 Feb 2022 21:44:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 22:47:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ca3cee910a174412a30bc87aa1b9b7cf41c15f0
X-Git-Newrev: f68a5faf201ea176361055517ff655b6e59c9c3b
X-Patchwork-Hint: ignore
Message-Id: <20220210214420.29001826C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-rtsp-server: bump version to
 1.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f68a5faf201ea176361055517ff655b6e59c9c3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed 0001-gst-rtsp-server-meson.build-add-gst_dep.patch
  (upstream accepted [1])

- update COPYING/COPYING.LIB hash (license text update from LGPL-2.0+ to
  LGPL-2.1+, see [2]) and adjust GST1_RTSP_SERVER_LICENSE accordingly

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/e637aae629f5b95b748a6f23abecc2b502272822.patch
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/cc5cdab0165e3bdf5f4f748b3ba2a3493d304e70.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-gst-rtsp-server-meson.build-add-gst_dep.patch | 41 ----------------------
 .../gst1-rtsp-server/gst1-rtsp-server.hash         |  8 ++---
 .../gst1-rtsp-server/gst1-rtsp-server.mk           |  4 +--
 3 files changed, 6 insertions(+), 47 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch b/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch
deleted file mode 100644
index b63f634598..0000000000
--- a/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b6bc8fbb72d6d3914c616dc64d15b961493cb9c2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 20 Dec 2021 10:09:36 +0100
-Subject: [PATCH] gst/rtsp-server/meson.build: add gst_dep
-
-Add gst_dep to gst_rtsp_server_deps, in the context of buildroot, this
-will avoid the following build failure, because the correct girdir
-location will be retrieved from gstreamer-1.0.pc:
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler gst/rtsp-server/GstRtspServer-1.0.gir --output gst/rtsp-server/GstRtspServer-1.0.typelib --includedir=/usr/share/gir-1.0
-Could not find GIR file 'Gst-1.0.gir'; check XDG_DATA_DIRS or use --includedir
-error parsing file gst/rtsp-server/GstRtspServer-1.0.gir: Failed to parse included gir Gst-1.0
-If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
-Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
-
-Fixes:
- - http://autobuild.buildroot.org/results/04af6b22cfa0cffb6a3109a3b32b27137ad2e0b0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/gst-rtsp-server/-/merge_requests/217]
----
- gst/rtsp-server/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/rtsp-server/meson.build b/gst/rtsp-server/meson.build
-index 24d7c39..874da14 100644
---- a/gst/rtsp-server/meson.build
-+++ b/gst/rtsp-server/meson.build
-@@ -55,7 +55,7 @@ rtsp_server_headers = [
- 
- install_headers(rtsp_server_headers, subdir : 'gstreamer-1.0/gst/rtsp-server')
- 
--gst_rtsp_server_deps = [gstrtsp_dep, gstrtp_dep, gstsdp_dep, gstnet_dep, gstapp_dep]
-+gst_rtsp_server_deps = [gstrtsp_dep, gstrtp_dep, gstsdp_dep, gstnet_dep, gstapp_dep, gst_dep]
- gst_rtsp_server = library('gstrtspserver-@0@'.format(api_version),
-   rtsp_server_sources,
-   include_directories : rtspserver_incs,
--- 
-2.33.0
-
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index fadef41351..00ff974c6e 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.18.6.tar.xz.sha256sum
-sha256  826f32afbcf94b823541efcac4a0dacdb62f6145ef58f363095749f440262be9  gst-rtsp-server-1.18.6.tar.xz
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.0.tar.xz.sha256sum
+sha256  c209f5ed906da713fdd44a8844e909aa6c8af3dfb630259b092cfb77a7755843  gst-rtsp-server-1.20.0.tar.xz
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 55403754f3..d22dd5e7cc 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.18.6
+GST1_RTSP_SERVER_VERSION = 1.20.0
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
-GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
+GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
 GST1_RTSP_SERVER_LICENSE_FILES = COPYING COPYING.LIB
 GST1_RTSP_SERVER_CPE_ID_VENDOR = gstreamer_project
 GST1_RTSP_SERVER_CPE_ID_PRODUCT = gst-rtsp-server
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
