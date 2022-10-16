Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFCFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 08:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D41D408ED;
	Sun, 16 Oct 2022 08:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D41D408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRuNM2xTTCQm; Sun, 16 Oct 2022 08:06:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A60B40585;
	Sun, 16 Oct 2022 08:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A60B40585
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7049C1BF28C
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 08:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49B4C41516
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 08:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49B4C41516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EtXQWKgpQ6pj for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 08:06:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83A6E410A1
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83A6E410A1
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 08:06:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u10so13903633wrq.2
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 01:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HK4/RDpJ5axu2LqP9aibPSM5t7oEqhWkPACZ9MINfLw=;
 b=WazRhpmsVqYScJOlCUEuaDbvAlhnO2Z+NWZG7Ui4KI4ZODzXOrlO2RUh5av8Y8E2rP
 oEkDslLcemww+zXKNnIeDGqMxtw9iOcdLMNXNFqwUMRWlJVh/MnOnjlU6K77i5L/s8s3
 pWDqcHzlEd/SkK5V1pkIo788bmFDVn3/QEyL5EjvVFPDMhHhmjDEdoz8a/Re5oyDIV7v
 NIenQl2lEba1vSfngBVHsRYbiYg2LCa0cohMkKFZNy1i+TtyzVBuBdLU72/aE726BH6Q
 wR+ybuxXZvWlI/ae2jknivdfBhUC5dr0wfVbAisWJ67WWatfS1v/5cFBDf0HB7ISBsgi
 lsFg==
X-Gm-Message-State: ACrzQf369RBRw4wh9nTRP1LAiLDvWwNoHh13P086x86g0nIlT+I/CWvt
 2Dv7TlKlS9ZXq5TQ7Oc5hpFrCb9g2wsW4cbz
X-Google-Smtp-Source: AMsMyM7hxkVZhfULsqYpaInuGS/CbTtPWbstpk21TEwvTHYqY3tb80GtC76iZfvP777oc9NZ9b28ZQ==
X-Received: by 2002:a5d:5552:0:b0:22e:6941:81f8 with SMTP id
 g18-20020a5d5552000000b0022e694181f8mr2973580wrw.521.1665907594626; 
 Sun, 16 Oct 2022 01:06:34 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 bv16-20020a0560001f1000b0022e6f0d0d7csm6824384wrb.18.2022.10.16.01.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 01:06:34 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 08:06:29 +0000
Message-Id: <20221016080629.3354482-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HK4/RDpJ5axu2LqP9aibPSM5t7oEqhWkPACZ9MINfLw=;
 b=lxg4vCvWOS8Z4XlbSyJ97BwV8cLpeBdpsYfTrifIwA2BFi9FBMX1yod+5KQy8+TQGO
 pI+9b+EOMPDG0wZIDbsjP6D9AujrRe7mRUZlsDjpExFSg9w5+wxBwTlzQ4wx0rAhrSAD
 HzGwnoh358xa0+MRX0/2qpoRSVpPQnyMuLwlQBros5T+bPUKPjFqFWmTv8G6/OEM9maw
 9EDQ4egdfyKEaXwJ3omeklNDpPT16c17yLiRrdm45EWtLpe9fUFLBpcrCW/51x1QzrMC
 /pyuWukllLIa7kvzFv8yjNSVmPX1C6gdZ4pbskuYM+jA+U4EAMFAJ5uO4Bej8751Rg0g
 H7Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=lxg4vCvW
Subject: [Buildroot] [PATCH] package/ffmpeg: handle new SDL2 version scheme
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
Cc: Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Current ffmpeg package does not install ffplay.
The root cause is that ffmpeg configure does not detect SDL2 due to
version mismatch.
The patch fixing that is taken from gentoo portage tree.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 ...peg-4.4.2-libsdl2-new-version-scheme.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/ffmpeg/0005-ffmpeg-4.4.2-libsdl2-new-version-scheme.patch

diff --git a/package/ffmpeg/0005-ffmpeg-4.4.2-libsdl2-new-version-scheme.patch b/package/ffmpeg/0005-ffmpeg-4.4.2-libsdl2-new-version-scheme.patch
new file mode 100644
index 0000000000..b592c2f9b7
--- /dev/null
+++ b/package/ffmpeg/0005-ffmpeg-4.4.2-libsdl2-new-version-scheme.patch
@@ -0,0 +1,25 @@
+https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/839f98ff6719cf2db0cbd88cd787a1b19b9cbf47
+
+From: Christopher Degawa <ccom@randomderp.com>
+Date: Wed, 11 May 2022 15:11:04 -0500
+Subject: [PATCH] configure: extend SDL check to accept all 2.x versions
+
+sdl2 recently changed their versioning, moving the patch level to minor level
+https://github.com/libsdl-org/SDL/commit/cd7c2f1de7d9e418bb554047d714dd7cacc020ff
+and have said that they will instead ship sdl3.pc for 3.0.0
+
+Fixes ticket 9768
+
+Signed-off-by: Christopher Degawa <ccom@randomderp.com>
+Signed-off-by: Gyan Doshi <ffmpeg@gyani.pro>
+--- a/configure
++++ b/configure
+@@ -6383,7 +6383,7 @@ fi
+ 
+ if enabled sdl2; then
+     SDL2_CONFIG="${cross_prefix}sdl2-config"
+-    test_pkg_config sdl2 "sdl2 >= 2.0.1 sdl2 < 2.1.0" SDL_events.h SDL_PollEvent
++    test_pkg_config sdl2 "sdl2 >= 2.0.1 sdl2 < 3.0.0" SDL_events.h SDL_PollEvent
+     if disabled sdl2 && "${SDL2_CONFIG}" --version > /dev/null 2>&1; then
+         sdl2_cflags=$("${SDL2_CONFIG}" --cflags)
+         sdl2_extralibs=$("${SDL2_CONFIG}" --libs)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
