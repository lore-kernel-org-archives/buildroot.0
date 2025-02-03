Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BF2C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25C92703D4;
	Fri, 28 Feb 2025 17:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QwqoX-y6Kno; Fri, 28 Feb 2025 17:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12DC470834
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12DC470834;
	Fri, 28 Feb 2025 17:09:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0600868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BFF240020
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pd7zWAygTnfC for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37CD42F3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C37CD42F3A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4FD487A92; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 23:13:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 03fcf6034012c069e975330e831ef79b4bdb70d4
X-Git-Newrev: da66b838e4792338bd066d78261d70c80ea029a5
X-Patchwork-Hint: ignore
Message-Id: <20250228163027.B4FD487A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: new
 gstreamer1 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=da66b838e4792338bd066d78261d70c80ea029a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                       |  1 +
 support/testing/tests/package/test_gstreamer1.py | 82 ++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3992a82351..2da5d178b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1897,6 +1897,7 @@ F:	support/testing/tests/package/test_gnuradio.py
 F:	support/testing/tests/package/test_gnuradio/
 F:	support/testing/tests/package/test_gpsd.py
 F:	support/testing/tests/package/test_gpsd/
+F:	support/testing/tests/package/test_gstreamer1.py
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_gstreamer1.py b/support/testing/tests/package/test_gstreamer1.py
new file mode 100644
index 0000000000..aa4b67d1a6
--- /dev/null
+++ b/support/testing/tests/package/test_gstreamer1.py
@@ -0,0 +1,82 @@
+import os
+
+import infra.basetest
+
+
+class TestGstreamer1(infra.basetest.BRTest):
+    # This test creates a full, yet simple, Gstreamer pipeline which
+    # encodes/decodes a video, using only plugins from Base and Good
+    # packages. It will use Tesseract OCR to validate the final
+    # output. The DejaVu font package is also installed, in order to
+    # have few fonts for the Pango plugin.
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_DEJAVU=y
+        BR2_PACKAGE_GSTREAMER1=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
+        BR2_PACKAGE_GST1_PLUGINS_GOOD=y
+        BR2_PACKAGE_GST1_PLUGINS_GOOD_PNG=y
+        BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIFILE=y
+        BR2_PACKAGE_TESSERACT_OCR=y
+        BR2_PACKAGE_TESSERACT_OCR_LANG_ENG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        video_file = "videotest.ogg"
+        num_frames = 10
+        msg_prefix = "Hello Buildroot:"
+
+        # We check the main program can execute.
+        self.assertRunOk("gst-launch-1.0 --version")
+
+        # We check we can list installed plugins.
+        self.assertRunOk("gst-inspect-1.0")
+
+        # We check we can query one of the plugin we requested.
+        self.assertRunOk("gst-inspect-1.0 theoraenc")
+
+        # We create a Ogg/Theora video file. We use the "videotestsrc"
+        # with the ball animation which will create a small file. We
+        # add a time overlay with a message. We encode with the Theora
+        # codec and store everything in an Ogg container file.
+        enc_pipeline = \
+            f"videotestsrc num-buffers={num_frames} pattern=ball ! " \
+            f"timeoverlay text=\"{msg_prefix}\" font-desc=\"Sans, 24\" ! " \
+            f"theoraenc ! oggmux ! filesink location={video_file}"
+        cmd = f"gst-launch-1.0 -v {enc_pipeline}"
+        self.assertRunOk(cmd)
+
+        # We decode our previous video file and store each frame in a
+        # PNG image file.
+        dec_pipeline = \
+            f"filesrc location={video_file} ! " \
+            "decodebin ! videoconvert ! pngenc ! " \
+            "multifilesink index=1 location=frame%02d.png"
+        cmd = f"gst-launch-1.0 -v {dec_pipeline}"
+        self.assertRunOk(cmd)
+
+        # We extract the text from our last image.
+        img_file = f"frame{num_frames}.png"
+        cmd = f"tesseract {img_file} output"
+        self.assertRunOk(cmd)
+
+        # We check we have our initial message.
+        out, ret = self.emulator.run("cat output.txt")
+        self.assertEqual(ret, 0)
+        self.assertTrue(out[0].startswith(msg_prefix))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
