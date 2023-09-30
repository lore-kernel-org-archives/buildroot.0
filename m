Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF417E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F41341DD0;
	Sat, 30 Sep 2023 16:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F41341DD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAFKkim6NkaY; Sat, 30 Sep 2023 16:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 128374226E;
	Sat, 30 Sep 2023 16:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128374226E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A75F1BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33CCE402BC
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33CCE402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mo6eYr76esOe for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:28:25 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B1594017A
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B1594017A
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32167a4adaaso14460388f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696091303; x=1696696103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eUceZBZZw/pvKnlCVrmYcJA4WhdLrtbMKV+lpzQktr4=;
 b=SJLxA0tpL6VncKyoUuKbXif9O8XezEuPqyOsHjurN4STWfeZMT3Y2841rqgel2/p8+
 q+CSUr9rgZMDjW60/ZnpG5zA4mqLPyKw3BT4K7oqvmMBHDtj/hkDWpOtvxQtWL4OdalC
 eYNUptKpWwgRdNsZFZG37M8D7EWzacGzhQAGc1Ro9LQbpuFqEmJX7VOw45i7nyDKB2Yf
 NAGV+/GHdrikqCeb2mbayEixPijbes6J8u+oGcXIeTQD9TocKAKX9cVB3LtaEu136Egm
 9i83ngM726VW3nVdSXVhseIO7q+/XPOu9YybM6xrSVuDlzkFmBz+IsqbmBRWo9eSmjQa
 8alA==
X-Gm-Message-State: AOJu0YwS+ZrBPqA7uOJDcFRmkCfyurQjtlnNFkr17z+lIrzrU5KYSj0n
 vB5MC3fRMWbBl81APFRHOVVOfGIoy0k=
X-Google-Smtp-Source: AGHT+IHvY5V3skBD2kRE0HXkZbs1T1qg6ATz8DlU23iYTZz+2wYFYZ93ZTR2Rp0KYtAC+GfeXNIexQ==
X-Received: by 2002:adf:f74a:0:b0:317:e5ec:8767 with SMTP id
 z10-20020adff74a000000b00317e5ec8767mr6055737wrp.21.1696091302514; 
 Sat, 30 Sep 2023 09:28:22 -0700 (PDT)
Received: from scaer.home
 (2a01cb0404ad0b00e4d10b92e94d73af.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a5d4a8b000000b0031fc4c31d77sm24116368wrq.88.2023.09.30.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 09:28:22 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:28:20 +0200
Message-Id: <4e13b2dcd07b334b461649e9072f52e8336a04a9.1696091295.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1696091295.git.yann.morin.1998@free.fr>
References: <cover.1696091295.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696091303; x=1696696103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUceZBZZw/pvKnlCVrmYcJA4WhdLrtbMKV+lpzQktr4=;
 b=jLHkz84kaMvpgQZVj2CaBouHwRwh+GQrkWrn3FXk4EbTEjEa5tSzUM1/4rdz+NvZVN
 KpUBP+HhNVTsnRIFx0QYKjcb1SvqC+eMPC73G9Tnnixsyklc85M6ITAZm3v+J+Mc46xb
 RIkyh/ptxVhbMw8zgfyPqbVes4+Rbj4Dil5TANJ8tmjVhohGJhdL+PcKHKu4ZGgD6+pg
 wf6+FQVMxtWIUu8+qMLadR5dl1txdoziviUc5oDhvgMYJPVnXbz+uYfHgE17KofPNnDN
 ASiMxScr6IWF528gvfd22PZOvTMDwPh1L0aCU+PeZ0nfzIkrHHgtcTXiChCPdV68Rl/U
 4osg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jLHkz84k
Subject: [Buildroot] [PATCH 1/2] support/runtime-test: add helper to test
 graphics rendering
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In 4edb0e3456ef (support/testing/tests/package/test_weston.py: new
runtime test),the weston test was introduced, and thus was the first
that needed to test that rendering was happening.

Now we also have a test for a flutter application, and we'll want to
have it test the rendering too.

Move the corresponding code to a helper that can be reused by other
tests, rather than duplicate (or reinvent) it.

Switch weston to using that new helper.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/graphics_base.py       | 39 +++++++++++++
 support/testing/tests/package/test_weston.py | 61 ++++----------------
 2 files changed, 49 insertions(+), 51 deletions(-)
 create mode 100644 support/testing/tests/graphics_base.py

diff --git a/support/testing/tests/graphics_base.py b/support/testing/tests/graphics_base.py
new file mode 100644
index 0000000000..15a4c00bb2
--- /dev/null
+++ b/support/testing/tests/graphics_base.py
@@ -0,0 +1,39 @@
+class GraphicsBase:
+    def get_n_fb_crc(self, *, count=10, uniq=False, timeout=-1):
+        """
+        Return count DRM CRC from the framebuffer. If uniq is True,
+        only unique CRCs are returned (which may be less than the
+        requested cont).
+        Returns a possibly empty list of integers.
+        Set timeout to -1 for no timeout, or to a positive number for
+        a timeout of that many seconds.
+        """
+        # DRM CRCs are exposed through a sysfs pseudo file
+        try:
+            self.debugfs_mounted
+        except AttributeError:
+            # Note: some init system (e.g. systemd) may have this already
+            # mounted, so check beforehand
+            self.assertRunOk("mountpoint /sys/kernel/debug/ || mount -t debugfs none /sys/kernel/debug/")
+            self.debugfs_mounted = True
+
+        # The first column is the frame number, the second column is the
+        # CRC measure. We use "head" to get the needed CRC count.
+        disp_crc_path = "/sys/kernel/debug/dri/0/crtc-0/crc/data"
+        cmd = f"head -{count} {disp_crc_path}"
+
+        # The DRM CRC sysfs pseudo file lines are terminated by '\n'
+        # and '\0'. We remove the '\0' to have a text-only output.
+        cmd += " | tr -d '\\000'"
+
+        # Finally, we drop the frame counter, and keep only the second
+        # column (CRC values)
+        cmd += " | cut -f 2 -d ' '"
+
+        if uniq:
+            cmd += " | sort -u"
+
+        output, exit_code = self.emulator.run(cmd, timeout=timeout)
+        self.assertTrue(exit_code == 0, f"'{cmd}' failed with exit code {exit_code}")
+
+        return [int(crc, 16) for crc in output]
diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index df1b7a4135..f37a73565f 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -2,9 +2,10 @@ import os
 import time
 
 import infra.basetest
+from ..graphics_base import GraphicsBase
 
 
-class TestWeston(infra.basetest.BRTest):
+class TestWeston(infra.basetest.BRTest, GraphicsBase):
     config = \
         """
         BR2_aarch64=y
@@ -36,31 +37,6 @@ class TestWeston(infra.basetest.BRTest):
                 infra.filepath("tests/package/test_weston/linux-vkms.fragment")
              )
 
-    def gen_read_disp_crcs_cmd(self, count=1):
-        # DRM CRCs are exposed through a sysfs pseudo file, one measure
-        # per line. The first column is the frame number, the second
-        # column is the CRC measure. We use "head" to get the needed
-        # CRC count.
-        disp_crc_path = "/sys/kernel/debug/dri/0/crtc-0/crc/data"
-        cmd = f"head -{count} {disp_crc_path}"
-
-        # The DRM CRC sysfs pseudo file lines are terminated by '\n'
-        # and '\0'. We remove the '\0' to have a text-only output.
-        cmd += " | tr -d '\\000'"
-
-        # Finally, we drop the frame counter, and keep only the second
-        # column (CRC values)
-        cmd += " | cut -f 2 -d ' '"
-
-        return cmd
-
-    def gen_count_unique_disp_crcs_cmd(self, count=10):
-        # We get the command generating one CRC per line...
-        cmd = self.gen_read_disp_crcs_cmd(count)
-        # ...then count the number of unique values
-        cmd += " | uniq | wc -l"
-        return cmd
-
     def start_weston(self):
         self.assertRunOk("export XDG_RUNTIME_DIR=/tmp")
 
@@ -106,25 +82,14 @@ class TestWeston(infra.basetest.BRTest):
         # Check a simple info client can communicate with the compositor
         self.assertRunOk("wayland-info", timeout=10)
 
-        # This test will use the Kernel VKMS DRM Display CRC support,
-        # which is exposed in debugfs. See:
-        # https://docs.kernel.org/gpu/drm-uapi.html#display-crc-support
-        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
-
         # We get 10 consecutive DRM frame CRCs and count how many
         # unique CRCs we have. Since weston is supposed to run idle,
         # we should have 10 times the same display CRC.
-        cmd = self.gen_count_unique_disp_crcs_cmd()
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(int(output[0]), 1)
+        self.assertTrue(len(self.get_n_fb_crc(uniq=True)) == 1)
 
         # We save the CRC value of an empty weston desktop for
         # later...
-        cmd = self.gen_read_disp_crcs_cmd()
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        weston_desktop_crc = int(output[0], 16)
+        weston_desktop_crc = self.get_n_fb_crc(count=1)[0]
 
         # We start the weston-simple-egl in background...  Every
         # rendered frame is supposed to be different (as the triangle
@@ -138,10 +103,8 @@ class TestWeston(infra.basetest.BRTest):
         # display something, we are now supposed to measure a
         # different display CRC than the one we measured when the
         # desktop was empty.
-        cmd = self.gen_read_disp_crcs_cmd()
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertNotEqual(int(output[0], 16), weston_desktop_crc)
+        crc = self.get_n_fb_crc(count=1)[0]
+        self.assertNotEqual(crc, weston_desktop_crc)
 
         # While weston-simple-egl is running, we check the VKMS DRM
         # CRCs are now changing. We get many CRCs, one per display
@@ -152,10 +115,8 @@ class TestWeston(infra.basetest.BRTest):
         # remain very permissive to slow emulation situations.
         # Increase timeout, as the command is expected to run about 5s,
         # which is the default timeout.
-        cmd = self.gen_count_unique_disp_crcs_cmd(300)
-        output, exit_code = self.emulator.run(cmd, timeout=10)
-        self.assertEqual(exit_code, 0)
-        self.assertGreaterEqual(int(output[0]), 5)
+        crcs = self.get_n_fb_crc(count=300, timeout=10)
+        self.assertGreaterEqual(len(crcs), 5)
 
         # We stop weston-simple-egl, and sleep a bit to let Weston do
         # its cleanup and desktop repaint refresh...
@@ -165,10 +126,8 @@ class TestWeston(infra.basetest.BRTest):
         # After we stopped the application, we should have the initial
         # weston desktop background. The CRC we measure now should be
         # the same as the one we saved earlier.
-        cmd = self.gen_read_disp_crcs_cmd()
-        output, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(int(output[0], 16), weston_desktop_crc)
+        crc = self.get_n_fb_crc(count=1)[0]
+        self.assertEqual(crc, weston_desktop_crc)
 
         self.stop_weston()
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
