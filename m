Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A451E77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0577142248;
	Sat, 30 Sep 2023 16:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0577142248
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfmIp7lAEIHD; Sat, 30 Sep 2023 16:28:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 880B9424EB;
	Sat, 30 Sep 2023 16:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880B9424EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57D1E1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 337D960D58
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 337D960D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tE0smbAA8Te4 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:28:25 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61A6360A5C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61A6360A5C
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32320381a07so10765844f8f.0
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696091303; x=1696696103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lj++xgGhxlCss5wBa0pp3ApTf4opgH+wNc7OhQDH2rg=;
 b=SgzsZkS1OX6MYDUJ98VZCTa8oLvScMo+Y1mIYDR9ioigeSYd8SGe/ovnm+0oU3tsvH
 3qJOU5YW6qDGoDWpvgpunyDpSYvFzpAmakEkoJJKM4S4/N5gQpXI0n0w3Sp5+aX4Lie7
 3g6yWM0KHUKVdTObVc/OJkTQSTWTw9ZM08RqJS71tkwUm9VEoWSyd8FBUO8xCo96vZQQ
 oqX8BO3NSoBzvZrbMiPeVfpVlKPstKc10RSAOiNuoYM/OFpE3KGKRdphu7b8A/CZ9HOx
 re95fFtfay0gtyEydi7T52xOm5ySBoB4iI4ykGpwx7zEhttQgBSGc+LAp9zzAJ5iY3Wv
 NjGg==
X-Gm-Message-State: AOJu0YxjD9teAxDW6XeTA3rTImoibMEGBCCtWzCDnH7zrgRVilM0KRkt
 XRAAivYUtklSbIPJJrezFipIe/+h3nY=
X-Google-Smtp-Source: AGHT+IH9VV+77nw08AYTiNX6XFRxhj7LToMX89qfR56VhDzDqyl6Pb4DHn4wTZnBXMSCMaKcSt7Stw==
X-Received: by 2002:adf:e543:0:b0:317:f714:3be6 with SMTP id
 z3-20020adfe543000000b00317f7143be6mr6332409wrm.61.1696091303011; 
 Sat, 30 Sep 2023 09:28:23 -0700 (PDT)
Received: from scaer.home
 (2a01cb0404ad0b00e4d10b92e94d73af.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a5d4a8b000000b0031fc4c31d77sm24116368wrq.88.2023.09.30.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 09:28:22 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:28:21 +0200
Message-Id: <7cf874f127f56c8132862163aa2c4d44f6f39efe.1696091295.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1696091295.git.yann.morin.1998@free.fr>
References: <cover.1696091295.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696091303; x=1696696103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj++xgGhxlCss5wBa0pp3ApTf4opgH+wNc7OhQDH2rg=;
 b=jOdjtwEcqH6nmdn6BdpD0LM3w4R5DSvvdkaxu2i1/+XL5hGHp0oVjxlCEuCfMGBeue
 PmJ5J9xPotSFd6OWa3mqdV94D/YoG5XUQNWOjdTy+XMlRv1ZPJdNIX4bDln/Em+u5pgA
 4uFjDhL7JQ/eaiAOfqXj+r8eq/aPqOJEdhhgsElidJCm+2YlF0ZyvIpuE5r7FjLPipNB
 ML2jU2VB+CbvN4n6Cdq3VK3BKbIEZZXIBtJAdcS/vnMDLwhovALzk/uXe1TcnCpN4UfG
 G8v3LB5B1aag/OGknQULQ0ygCh7Oha/KcyFZxZLfbiIXeeA7r9HVjdQ0fitzsRL64Pwm
 yx5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jOdjtwEc
Subject: [Buildroot] [PATCH 2/2] suport/runtime-test: extend flutter test to
 check rendering is happening
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 7f0af11cee31 (support/testing/tests/package/test_flutter.py: new
runtime test) added a simple test that just checked that the systemd
unit launching the application, was active.

It is perfectly possible, from a systemd perspective, that the unit is
active, while the application actually crashes.

Instead, what we need to check, is that the application does actually
render "something" we don't really care what, as long as we know it is
actually rendering, thus the graphical stack is working and the
aplication stack is running).

Extend the fultter runtime test to also check that the framebuffer is
modified by the application when it is running, similarly to what we do
in the weston test.

We drop the activation of the unit and start it manually, as we want to
check the state of the CRC before, during, and after the application
runs.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 support/testing/tests/package/test_flutter.py | 33 ++++++++++++++++---
 .../flutter-gallery.service                   |  1 -
 2 files changed, 28 insertions(+), 6 deletions(-)
 delete mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service

diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index a3e98a43e5..6368bd1372 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -1,8 +1,11 @@
 import os
+import time
 import infra.basetest
 
+from ..graphics_base import GraphicsBase
 
-class TestFlutter(infra.basetest.BRTest):
+
+class TestFlutter(infra.basetest.BRTest, GraphicsBase):
     config = f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
@@ -48,7 +51,27 @@ class TestFlutter(infra.basetest.BRTest):
                      "-vnc", "none",
                      "-drive", f"file={img},if=virtio,format=raw"])
         self.emulator.login()
-        cmd = "systemctl is-active flutter-gallery"
-        output, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "active")
+
+        # Get the CRC from the current ramebuffer
+        empty_crc = self.get_n_fb_crc(count=1)[0]
+
+        # Start the gallery Aapp. It can take a bit of time to start,
+        # so lets try a few times. 600 samples should cover about 10s
+        # @60Hz (although, the rendering could be much slower on slow
+        # machines)
+        self.assertRunOk("systemctl start flutter-gallery", timeout=10)
+        for i in range(600):
+            gallery_crc = self.get_n_fb_crc(count=1)[0]
+            if gallery_crc != empty_crc:
+                break
+            time.sleep(1)
+        self.assertNotEqual(gallery_crc, empty_crc, "gallery app did not render anything on screen")
+
+        # Stop the application, and check it restored the framebuffer content
+        self.assertRunOk("systemctl start flutter-gallery", timeout=10)
+        for i in range(600):
+            gallery_crc = self.get_n_fb_crc(count=1)[0]
+            if gallery_crc == empty_crc:
+                break
+            time.sleep(1)
+        self.assertEqual(gallery_crc, empty_crc, "gallery app did stop rendering")
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
deleted file mode 120000
index 40993fb16c..0000000000
--- a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
+++ /dev/null
@@ -1 +0,0 @@
-../../../../usr/lib/systemd/system/flutter-gallery.service
\ No newline at end of file
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
