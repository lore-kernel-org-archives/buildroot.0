Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F223BEB64DC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 08:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7535B60AD5;
	Sat, 24 Jun 2023 08:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7535B60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pge7VvZ2ovG3; Sat, 24 Jun 2023 08:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83A3F60AE7;
	Sat, 24 Jun 2023 08:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83A3F60AE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD5841BF401
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 08:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82FB041EBD
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 08:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82FB041EBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mv0VY6dKwGXQ for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 08:10:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 651E241EBA
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 651E241EBA
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 08:10:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.189]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N8GQs-1pzgch3BK4-014BkW; Sat, 24 Jun 2023 10:10:07 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 10:10:07 +0200
Message-ID: <20230624081007.19409-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:6rQk2yYiMoHwFXXDPe0H97DtHxuvWypARaXoCdcyzmqM6K2Xu07
 LhyofS3sDc3yEQ7Eq7cbq32wlycAM4wHOgYH4KScZARCzkgHh2y0mw7T8HpAAK6hVwGaASL
 EXfV1rQB88+jObCrp1SUM9QlvZ/ZxN7KneFebbu6SXtBiEZERSylnPpA86Xv4n82j8XBo0y
 ls8qZ/VyfvUqlTEyEQyAA==
UI-OutboundReport: notjunk:1;M01:P0:mkG5snh8+/Y=;Magxm6GuLfnvFYnXP0HNhSsZrKD
 MXsuraDSjFwH7kKULOIVhAX+DCYIgyF5jO7iutH1txhnLJnrTYZ01ouXBm0H38zECwRly52y+
 u8SqJ78N2v5pu/QjTImLX8P4LfmQdCAv+QZT/09IpETu6MqZKR7HWfBUPdeOf9sDtVZG2nq0R
 3eZinWygee+VYm4dLfVv2+7Q0PRnQCJE2oOMEyn7BJlDJjnMZfTeUYgS2bcP86M+pUgku7kxy
 Sr5QX7ArT/SkvlUyhLBZipwQ2AXo2q/fXIMccsiPwXo6sFK2ZLaOaDzzlfC4boWbbg4rnYL7J
 8mPPS6I9DVCReXhVkqGgstUvo5YGdR0jDgBi712360uzPzm3i2ZeV/EPhmGRWmOb8Q2RHrXd3
 8neVyv4PAJU8jw0YxBoVnPU112Ep0VSyh+Nw5G4qS87WYOgFDgojYzXOWZlAF21RIIdEvQJsH
 TugMjA6otEhMOOlMKNynMDrng/M0z/8mYRpt7pNGShlGT/1KK01GQ2U0GUI4KxSrA7H2qOnsu
 9kDIKyXYkR5626c3zBCKJY+wkMb5wx2zqvk48wrjCHP7WJ2RfV23apazh4xdioT866eCYMOKx
 QBnsOVMVW5xiQBCLrLkH0ZDO1X1y7/LjmlfD9ImOBcIuPog0DqO8Xf/SmlW1w7EevsTwf9/FS
 bTm3B6PehpXSlS8iZn6C8zkx7D4Fm1gZDHDkHbHLRJiE43ZFgQKYQiczdG9r55FOsjyG7NZqO
 WvD53UQ+5n5H9nQppJ+cc8lvgJ5o/j8M1HYS2UkTYnIEkOXXGZZSTLotvT/b9i+6Ee8fhcHkM
 2bz5oH6EOBs4KSO5VyQCsJefO6KgAJuB5YLx6l8eCuphgWIsuSaqJubcjcJvZv67/8Y3DQ7pN
 pnn6Pyt7+e2Hkfi6zpAQenYKNjV4HN278X5YBacsUQsR4kTwi2ibbtEd0sNKb093N/s2NbZo+
 SXEBUOcDorWCytmHGWu084yQJpg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1687594208; x=1688199008; i=ps.report@gmx.net;
 bh=K06Kqh0fK0Jgxpo9GBLeK6ww31xyVfPuxKcZn72H+zA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=U0RZbW4fc6xQ1TlybdUt1BZnHJFOURIjXoxiLr1X/UlAE/aC2aSAkjhSUIzJtz6xMKd1LaG
 f5QVHVZnU030uJbl/1N/LBBzowSInCMKgh7adXBH45/bedFoNbi5YB53L1w4teeuuF1uC1RKe
 DT+WVtVBE8XPjDcqhIhdm3kKvE4FtEdsMlFfPq/Eka9UWDDsTzE6MEJfraDm7WuM6IwAC1JIx
 pgOEhp7V3/XNGUVX8OIvRnPS1Dd0Dwx1LxhGWlgnKrRVAi8ideJAHh7rPrntm3yBtvN0DO75Q
 oNQzrOgxPlAdbcoRQcq8dCaWa13F6XJUq4FH3Nsz31h36ww0wKIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=U0RZbW4f
Subject: [Buildroot] [PATCH v1] package/mesa3d: fix
 002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update 002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch to
fix an syntax error introduced by commit 'package/{mesa3d, mesa3d-headers}:
bump version to 23.1.0' ([1])

Fixes:

  .../build/mesa3d-23.1.2/src/gallium/drivers/vc4/meson.build:87:76: ERROR:
  Trying to compare values of different types (UserFeatureOption, str) using !=.
  This was deprecated and undefined behavior previously and is as of 0.60.0 a hard error.

[1] https://git.buildroot.net/buildroot/commit/?id=e6203db11ed40122a2d9f29012db5683a7eb10d0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...tion-to-disable-optional-neon-suppor.patch | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index a5564fcf3a..430bd3b4b9 100644
--- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -1,4 +1,4 @@
-From e3b47c1b84964c62b3e1fa782f1ffa4be0ae62f9 Mon Sep 17 00:00:00 2001
+From f719e942dde0a46a9ff0080001cb3466012ffcc0 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Mon, 9 Mar 2020 13:01:14 +0100
 Subject: [PATCH] vc4: add meson option to disable optional neon support
@@ -11,6 +11,8 @@ Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [rebased for 20.2.0, 20.3.0, 21.1.0 & 23.1.0]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[fix syntax error after previous rebases]
 ---
  meson_options.txt                    | 7 +++++++
  src/gallium/drivers/vc4/meson.build  | 4 ++--
@@ -18,25 +20,25 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  3 files changed, 11 insertions(+), 4 deletions(-)
 
 diff --git a/meson_options.txt b/meson_options.txt
-index a39596a6f19..0f6b6c62b55 100644
+index 8e0bf2a..1cf0e07 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -117,6 +117,13 @@
+@@ -116,6 +116,13 @@ option(
+   description : 'enable gallium va frontend.',
  )
  
- option(
++option(
 +  'gallium-vc4-neon',
 +  type : 'feature',
 +  deprecated: {'true': 'enabled', 'false': 'disabled'},
 +  description : 'enable gallium vc4 optional neon support.',
 +)
 +
-+option(
+ option(
    'va-libs-path',
    type : 'string',
-   value : '',
 diff --git a/src/gallium/drivers/vc4/meson.build b/src/gallium/drivers/vc4/meson.build
-index 5ce5af5f6b4..e3f7d8d62ae 100644
+index 84da951..7f950de 100644
 --- a/src/gallium/drivers/vc4/meson.build
 +++ b/src/gallium/drivers/vc4/meson.build
 @@ -84,7 +84,7 @@ files_libvc4 = files(
@@ -44,7 +46,7 @@ index 5ce5af5f6b4..e3f7d8d62ae 100644
  
  libvc4_neon = []
 -if host_machine.cpu_family() == 'arm'
-+if host_machine.cpu_family() == 'arm' and get_option('gallium-vc4-neon') != 'disabled'
++if host_machine.cpu_family() == 'arm' and not get_option('gallium-vc4-neon').disabled()
    libvc4_neon = static_library(
      'vc4_neon',
      'vc4_tiling_lt_neon.c',
@@ -58,7 +60,7 @@ index 5ce5af5f6b4..e3f7d8d62ae 100644
  
  if dep_simpenrose.found()
 diff --git a/src/gallium/drivers/vc4/vc4_tiling.h b/src/gallium/drivers/vc4/vc4_tiling.h
-index 66767e7f1f8..7446f1c3d0c 100644
+index 5afe329..919b299 100644
 --- a/src/gallium/drivers/vc4/vc4_tiling.h
 +++ b/src/gallium/drivers/vc4/vc4_tiling.h
 @@ -89,7 +89,7 @@ vc4_load_lt_image(void *dst, uint32_t dst_stride,
@@ -80,5 +82,5 @@ index 66767e7f1f8..7446f1c3d0c 100644
                  vc4_store_lt_image_neon(dst, dst_stride, src, src_stride,
                                          cpp, box);
 -- 
-2.25.1
+2.41.0
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
