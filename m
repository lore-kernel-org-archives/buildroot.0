Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFC5C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 22:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29C4040116;
	Mon,  3 Jan 2022 22:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teWxIqo4HaCB; Mon,  3 Jan 2022 22:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15A7340350;
	Mon,  3 Jan 2022 22:08:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0E2B1BF358
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A20AD81BC2
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8MiXTvZ5uOS for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 22:08:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5527A81BBD
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 22:08:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n10-20020a7bc5ca000000b00345c520d38eso18978284wmk.1
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rGeYQ1hZCwJNgIzxB89X/yttXcb9ZtkY08DOpAT7lEU=;
 b=RInjE95F0AlLdeVTGAloAZf4f6nQNloc2HS2O1r+W7o1XVjy8RN1zIQANaLWnzmqWe
 WYlUF+7aZLIYngMeOuv56TPjKv9mCT0P6CPUzPjKPGnF6LseRjSDp+/WFSR2Vd+psePm
 i+TeSONNslP541LGhIHb3/Wr+uPCM7PLHBxYLosicSm0jMQxRDakR7Dn+YqNeNgljzkA
 ix2i7k/hU9u/mxc/c9417YztOTWeVfl4VSr2XqZZOAgxJfw7Xzk19TwG3zpFXaFqcKJk
 HtAb5tcgq2oRgixgaMF43upNIYifNoD00p2eWxtKnriaNQqFckqWu+QeqBfw1Hl3neZV
 4qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rGeYQ1hZCwJNgIzxB89X/yttXcb9ZtkY08DOpAT7lEU=;
 b=JNnMc8mV1KnymhzkPFsJlWGlPGICW6go7UBswz3CXSlr3wMzucWCVTxjdzbt60L9OG
 w0p/2M8E2apB0LXxrpnqGmvXv+LUv8H5pbIDq51nwotW3i7PshlP9Rwx15aXfx4+uFck
 cL+K5tWc4Fmifu/NVbhJfWwyr96JX5oTqnvIl2E3bYM1wE+IC0PBbUIDgf3DZrNdzqLm
 JQy2bAPWfY6zu4u5pGQ/aPU7LI8WkzxT1t4WKZvnBMh9BmaImdssKB4WUddWtePvCRfa
 dHRcCG3XflOHQh9rNj2p7wzy1BM0jorB+VRXrgpQ0oPu1KNxSF5gdmCeuhgX6rtibG+J
 zDvA==
X-Gm-Message-State: AOAM531QmHNmx17G9uwQjsNqmjS+jN7H+Xg/vW56bX66oti2+lZVGlg4
 dLCgvblhkHFqcWa2LB3UNnvIQtFGr68=
X-Google-Smtp-Source: ABdhPJzevZOtYhLRBYUeWCSDOtUNwceHZvPozoJIvEvY8X5RCP7UzmIRi/2Fsn462aNeXJvVgc01gA==
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr39277215wma.170.1641247705450; 
 Mon, 03 Jan 2022 14:08:25 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id n12sm28748941wmq.30.2022.01.03.14.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 14:08:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 23:07:24 +0100
Message-Id: <20220103220724.559180-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpi-rgb-led-matrix: fix musl build
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on musl raised since the addition of the
package in commit e821078031e14df69e5142f23e9cb7b5a1ea0e77:

text-scroller.cc: In function 'int main(int, char**)':
text-scroller.cc:220:3: error: 'uint' was not declared in this scope; did you mean 'rint'?
  220 |   uint frame_counter = 0;
      |   ^~~~
      |   rint

Fixes:
 - http://autobuild.buildroot.org/results/1a230bd46eac35081bdb6fe9aaacbb7b62ea6b73

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-utils-text-scroller.cc-replace-uint.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch

diff --git a/package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch b/package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch
new file mode 100644
index 0000000000..627415bac8
--- /dev/null
+++ b/package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch
@@ -0,0 +1,50 @@
+From a56338db0f003d5236f2ce98c73a591d64a70852 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 3 Jan 2022 22:57:11 +0100
+Subject: [PATCH] utils/text-scroller.cc: replace uint (#1383)
+
+Replace uint by uint64_t to avoid the following build failure on musl:
+
+text-scroller.cc: In function 'int main(int, char**)':
+text-scroller.cc:220:3: error: 'uint' was not declared in this scope; did you mean 'rint'?
+  220 |   uint frame_counter = 0;
+      |   ^~~~
+      |   rint
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1a230bd46eac35081bdb6fe9aaacbb7b62ea6b73
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/hzeller/rpi-rgb-led-matrix/commit/a56338db0f003d5236f2ce98c73a591d64a70852]
+---
+ utils/text-scroller.cc | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/utils/text-scroller.cc b/utils/text-scroller.cc
+index a64ba0c89..28d4f7182 100644
+--- a/utils/text-scroller.cc
++++ b/utils/text-scroller.cc
+@@ -21,6 +21,7 @@
+ #include <getopt.h>
+ #include <math.h>
+ #include <signal.h>
++#include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -217,12 +218,12 @@ int main(int argc, char *argv[]) {
+ 
+   struct timespec next_frame = {0, 0};
+ 
+-  uint frame_counter = 0;
++  uint64_t frame_counter = 0;
+   while (!interrupt_received && loops != 0) {
+     ++frame_counter;
+     offscreen_canvas->Fill(bg_color.r, bg_color.g, bg_color.b);
+     const bool draw_on_frame = (blink_on <= 0)
+-      || (frame_counter % (blink_on + blink_off) < (uint)blink_on);
++      || (frame_counter % (blink_on + blink_off) < (uint64_t)blink_on);
+ 
+     if (draw_on_frame) {
+       if (outline_font) {
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
