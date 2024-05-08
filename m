Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D87C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 10:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D24D360BEF;
	Wed,  8 May 2024 10:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buMVMFOlrk-0; Wed,  8 May 2024 10:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8699607D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8699607D8;
	Wed,  8 May 2024 10:05:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73C4A1BF36E
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 10:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D4BB41A22
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 10:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3POXNe9lYGyT for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 10:05:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1CAB404AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1CAB404AF
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1CAB404AF
 for <buildroot@buildroot.org>; Wed,  8 May 2024 10:05:12 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e3e18c23f9so31249211fa.3
 for <buildroot@buildroot.org>; Wed, 08 May 2024 03:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715162710; x=1715767510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Te6D6Ppepfu9mf1s4EQj5+Wn6taFTS8Q02kb9zVOuQ=;
 b=btOSnj24fZGd4pxXc/p9PO3LqVxcaNJnQ+AFKOzaJh1F9+7iLlQITPyqqlxG8fXoAM
 i8h5qdTXdHkUL+wnpYKjxzTeYdvDPXbMopA6Ly5StdyaGo7f1Fw/RzzvnIbezXry3BPo
 n05Rkz+8RkJN10homjyYoVyNeBRCcpRf5h2yn0xdK32vHQFFoblhEPM/9BKXW8zRLHu5
 flWlsVQzHCrtOv6puITEiUhFImYlvzSBQqrQYv3PNr6MaNw0KYwZRQuquJ+jLVTgEVzA
 t82oEOarqtw69S6vSCVAzR+P8AcfRpsaiIMmMDRWzwxL+rMCAbJmbGx6H0XUNDZ/+UEF
 ploA==
X-Gm-Message-State: AOJu0YxI6+YuM6zsipELRwvb4KCuSXXKv9ryFTArVnoeY4QzIsyyMxnN
 Ld96z8MDpRjk4u0KG1UwUEtPSP1JHwPaKB2rAb0x7VGaUyRlhRshy6zpMw==
X-Google-Smtp-Source: AGHT+IFUFdc5oR69KSdFI3x5Q3R/QoTwHI953mV6XT7u/fZ97Ypdw31yvKvDKIVCItmLL/oKDu+1NA==
X-Received: by 2002:a05:651c:b12:b0:2dc:d7e7:d68f with SMTP id
 38308e7fff4ca-2e4477b4c83mr15396671fa.44.1715162709876; 
 Wed, 08 May 2024 03:05:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 v23-20020a5d5917000000b00346ceb9e060sm14968361wrd.103.2024.05.08.03.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 03:05:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 12:05:06 +0200
Message-ID: <20240508100506.18756-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715162710; x=1715767510; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Te6D6Ppepfu9mf1s4EQj5+Wn6taFTS8Q02kb9zVOuQ=;
 b=P1X2ZM5tY1BzmbDoTmaz/rRV7xUraxdSVdlapArJcVvjwDH4Eu7fhXtGpUkie/VHuV
 /L/+vMHd9hiE/qYCQ8Ci5lZzHbwc9/V2lf0oGe22H0jhi3tW2Oj2ZH5wQgknpQs4gb2O
 Tf8fYm9uZePVpNTyV/oFsQLOFfgsVG1koPfMNnQ04uHv/kMlC2Gq6SLyuD86RHam5oyt
 PZyHwDPUIlebLvXKe0kSXTNl7zRauoUvclhz8dlGnqJJMOa7awKG3Z2R1b5MrB8ayrmo
 9XXW8+YMbmcyMk17t5F2C3lotsvXLCDvrK/fQsTfWHGoc6Ctfb2lHXFEb9Du6z5bbRf4
 eaPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P1X2ZM5t
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: fix legal info
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 9b25246e9b731f167454ba4f8182eed1926f50a6 made a typo in license
filename and forgot to add its hash:

ERROR: No hash found for LICENCE.ivsc

Fixes: 9b25246e9b731f167454ba4f8182eed1926f50a6
 - http://autobuild.buildroot.org/results/144ce581645d78a2d27a59a63130977d0f549db8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 6462112fea..a94f368b1f 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -16,6 +16,7 @@ sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENC
 sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
 sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENSE.ice_enhanced
 sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
+sha256  646957007887aed50d56c1f4fd9c6ef760d5b96d0a03577bda3492206dba1d05  LICENSE.ivsc
 sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  a90d3f66704d85889945fec5525ea77622549da83aced1aac99828383f8f1805  LICENCE.mediatek
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 84c96d2216..e6227c2ab9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -849,7 +849,7 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ATOMISP),y)
 LINUX_FIRMWARE_FILES += intel/ipu/shisp_2400b0_v21.bin
 LINUX_FIRMWARE_FILES += intel/ipu/shisp_2401a0_v21.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ivsc
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ivsc
 endif
 
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
