Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E71AC2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 15:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D653814B1;
	Sat,  6 Jul 2024 15:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slwRQBybB6Jh; Sat,  6 Jul 2024 15:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D3B814BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2D3B814BA;
	Sat,  6 Jul 2024 15:40:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15D361BF2F3
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 15:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CC93403E2
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 15:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqQIEsL4TRUN for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 15:40:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66537402E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66537402E7
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66537402E7
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 15:40:19 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38027so3045795a12.1
 for <buildroot@buildroot.org>; Sat, 06 Jul 2024 08:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720280417; x=1720885217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SkRt+m1cHpjeWME2ppdA6Vt0P3Z3Rvrh7efLR4/gHYs=;
 b=gfNW6hVtWmpTfJAsuLTZb5vIHConvGJ4bZnhJEQ35r1clcQxrYagS4HjTbL1Gy7gO9
 6jum5dR+XXnCChPBRZd5Up1Ns48/C0SOicNMWIXHsJyJ8L2UDfUWaBdWrKB4GatFKLT3
 Hr2JLxTcAoJ1sm32NkpLSJwgdLjD24fqC0WQMym7f9ou374Wfpqe//Y+aioP3zLwTFQa
 njtYv2cLvwpZxu77ek/QiXDM4l1Eu8wBpWX8+drx22qC0pUnDQlhTPw54M5ERmJepvcr
 gPJ9G5fDE9Xr6kGtnF3gs+WLy+F7ZWF5cYskm7oHFrwJgafVJ9H/zQn3frUNZGZdYu5n
 cdoQ==
X-Gm-Message-State: AOJu0Yxq16ph34HHMSyxcukOug3+UOkuBx8BFjUZiBrC4j+OwEBWrBBk
 S8W4EPlYI5Qcr44wIPh2GeXLdWajIRTJAWPU+hYLACQVfWA3JwN73GWbNwL4xPoV1EHccdXsctz
 Sya0=
X-Google-Smtp-Source: AGHT+IH7nDD/wC45fX0mj5FA6ox4vumyKz5IJVfJvmnnlAPwm9sDqVGlR5e0bI5nTeb+YCycTxuKjQ==
X-Received: by 2002:a17:906:b858:b0:a77:d8c9:ae23 with SMTP id
 a640c23a62f3a-a77d8c9ae6amr284045066b.59.1720280417104; 
 Sat, 06 Jul 2024 08:40:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf1846esm772866066b.38.2024.07.06.08.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 08:40:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 17:40:05 +0200
Message-ID: <20240706154005.3823542-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720280417; x=1720885217;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SkRt+m1cHpjeWME2ppdA6Vt0P3Z3Rvrh7efLR4/gHYs=;
 b=eUH99ZU8OIZd/kZ/XxK8pdpsEolPvvuPXkLOe5FSKc2SnzCJshqw0uPlRVzLD40ctO
 kafkqxYWNZePPsCYJTaydbIDYxyMX687gmnI7/IEyunzRnZU9oMzlnxID/2hmgD7Hzzn
 o/ueYWAaL6aNYfDQaH0lXtB6jZXhtRT4h9BpY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eUH99ZU8
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpu-hantro: fix
 patch fuzz
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, imx-vpu-hantro fails to build with output:

    Applying 0001-Fix-ion.h-header-inclusion-to-be-standard.patch using patch:
    patching file Makefile_G1G2
    patching file Makefile_H1
    patching file decoder_sw/software/linux/dwl/dwl_linux.c
    Hunk #1 FAILED at 50.
    1 out of 1 hunk FAILED -- saving rejects to file decoder_sw/software/linux/dwl/dwl_linux.c.rej
    patching file h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
    Hunk #1 FAILED at 52.
    1 out of 1 hunk FAILED -- saving rejects to file h1_encoder/software/linux_reference/ewl/ewl_x280_common.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...001-Fix-ion.h-header-inclusion-to-be-standard.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
index 7a89dd99e024..cdde7d9ff3e3 100644
--- a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
+++ b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
@@ -9,6 +9,8 @@ https://elixir.bootlin.com/linux/v4.17/source/drivers/staging/android/uapi/ion.h
 
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile_G1G2                                             | 4 ++--
  Makefile_H1                                               | 4 ++--
@@ -51,20 +53,20 @@ index 7d5e33b..c0e5727 100755
 --- a/decoder_sw/software/linux/dwl/dwl_linux.c
 +++ b/decoder_sw/software/linux/dwl/dwl_linux.c
 @@ -50,7 +50,7 @@
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0) || defined(ENABLE_DMABUF_HEAP)
  #include <linux/dma-heap.h>
  #else
 -#include <linux/ion.h>
 +#include <ion.h>
  #endif
  #ifdef ANDROID
- #include <linux/mxc_ion.h>
+ #if !defined(ENABLE_DMABUF_HEAP)
 diff --git a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
 index 312e4cc..70630c3 100755
 --- a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
 +++ b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
-@@ -52,7 +52,7 @@
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
+@@ -51,7 +51,7 @@
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0) || defined(ENABLE_DMABUF_HEAP)
  #include <linux/dma-heap.h>
  #else
 -#include <linux/ion.h>
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
