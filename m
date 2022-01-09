Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778E5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 17:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF3ED60B03;
	Sun,  9 Jan 2022 17:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pbAlPQ2P9NUy; Sun,  9 Jan 2022 17:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3081460B27;
	Sun,  9 Jan 2022 17:15:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36FA31BF475
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FBC260B27
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGY0kUUYBJw0 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 17:15:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23EC860B03
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 17:15:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o3so22338143wrh.10
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 09:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KUuomL4h/ikrvPBsV2/1MnFLeyUtUdlgwj83Ep1ijk=;
 b=U6wi7vL+znjpFz5jVBxR722HyBbUzDOgea3Rc5heY157l4mYAUzm+GJSXvTG5UghxU
 aMWEgjrUpBmRCqdTtp4bFp8sy6fs20mkmEX6TR4SbtDp3s5gegZ9nFuWKuxINeBPNJxc
 B5xh148EHdosrR2Ncw0LcgkK9eOL0azAKQ5DPRNr61uWqCgShs5ajELIBw8Qfptxo1yB
 yQCpdcq1YUmdv6FyoV+HozrbV7UJg2zna0/vj234/8EIDGG0vmeO5CEd4lpJpjnD8xjo
 7FsG5UJWXBjjiSLU8229sOtb2i26XfW4j1g5C6ebCLj6MXNVb7ZGcg0zr1qPNQ/HtUac
 D61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KUuomL4h/ikrvPBsV2/1MnFLeyUtUdlgwj83Ep1ijk=;
 b=FScegFCfMfFhf+JxKohul8p+a4hdu8U4kBKAIPl4BiRoqbLyj2dbQg3joHZilshx1P
 zMAuF26tygUOJiJE5jS6G1EAENfJLHWhXY4KlCEX0bTgRt64H/Af55OMv9MSo+MeImcG
 dWyPDTG4UZeQOEMXRxo0ZEoomxL+LJkh1OkiBVoQEztfsJICU+oKuFJaJYLDjkUMcGU2
 Mqr1HxlAFCk3Uehbc96q/O3nQPV03qProqzmXjGec/GKMXqXS3BZt5R7mWQjGsCPOvNS
 00niBLXwrM+IZJWT0fWeFW+WiKVSgbQJxgAKvUvT9IMPqYr7Oodn6N+PgO7ijJsT8Qmx
 0drw==
X-Gm-Message-State: AOAM532ge3H1G1Qcfi08J5vHiVNcYqiZIsozy0PQ3B0w4wUBbhuPu2rm
 nRjr6x18L0bcKP+AbaA1i+1EsJOgV/k6rvhb
X-Google-Smtp-Source: ABdhPJyAy4ya5DdkscWr+dhMnvcJNxYjizhedFKYQeUQUVKWjFJd+qFgjqnu9bw9eTRvz2PPqCBltg==
X-Received: by 2002:adf:fec9:: with SMTP id q9mr2816129wrs.72.1641748513342;
 Sun, 09 Jan 2022 09:15:13 -0800 (PST)
Received: from arnoutx1.home ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id 1sm4894667wrb.13.2022.01.09.09.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:15:13 -0800 (PST)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 18:15:11 +0100
Message-Id: <20220109171511.3293111-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mesa3d: Gallium VC4 driver depends on
 NEON
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 21.3.0 of mesa3d, the generic broadcom infrastructure
(which is called v3d but is used also for VC4) started using NEON
instructions. This leads to assembler failures when VC4 is built for
32-bit ARM without NEON:

FAILED: src/broadcom/libv3d_neon.a.p/common_v3d_tiling.c.o
/home/buildroot/autobuild/instance-2/output-1/host/bin/arm-linux-gcc [...] -c ../src/broadcom/common/v3d_tiling.c
/tmp/ccAvufNv.s: Assembler messages:
/tmp/ccAvufNv.s:602: Error: selected processor does not support `vldm r7,{q0,q1,q2,q3}' in ARM mode
[...]
/tmp/ccAvufNv.s:686: Error: selected processor does not support `vstm r7,{q0,q1,q2,q3}' in ARM mode

Let the VC4 driver depend on NEON for 32-bit ARM. Aarch64 always has
NEON, so no condition is needed there.

Fixes:
http://autobuild.buildroot.net/results/2b5/2b531f7aa4506ee31a7252c87a2e401fffab9dfb/
http://autobuild.buildroot.net/results/6f9/6f9e7c864808dc0fafbca7c8984651fe92edbaf2/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 34b0352056..37c4f8078e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -274,7 +274,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
-	depends on BR2_arm || BR2_aarch64
+	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
