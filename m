Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5E5C32793
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 02:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B8A2409F3;
	Wed, 24 Aug 2022 02:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B8A2409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbhiaSWc9we2; Wed, 24 Aug 2022 02:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DF21405C6;
	Wed, 24 Aug 2022 02:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DF21405C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41D211BF3FF
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D8EB40112
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D8EB40112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7uVTAfF6fkN for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 02:49:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7926A40480
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7926A40480
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 02:49:34 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 1so8024508pfu.0
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OeFjHsIMyA5ZlqaEXc8VD4136Tgyg3lEa4v0idG2WQA=;
 b=TnTgl6LM60Yc+KKgUtqOvPRvBsK0lpbdOh/KI9zkZ5fzXnGoeUAkR6JzS3HDtNMrr5
 rB36GKogRh+G+g8NfOSAiHCF5z0DYjl6+okvenv/LvL1muFVk1GIE4M7qPsyMWDlfrL5
 NOaOI25ZVCn/SMBbjWEiRWVpOKO6X1ua7Wvj0Q+FaA/mf8q5QMbbA4/7tFmR+kJ+SY5O
 xRk0dPEAPz1H99KbxVcpRWsPbHCVU2q0OY/88cCQLuemC4nnCO5rlp8N1PQx395zMelJ
 RqvD47wJXuF8CjU6rPR6iNulxPUeY4OWJZ/mVaNatA411/ACyIoV7Sc7mlqh1yGFejV+
 EN0w==
X-Gm-Message-State: ACgBeo26WIO9FOhzlK7yX36LQ3mDm6eNM7vu9EBIFO4basN9LVxB2w7q
 HzpvQOHUoaQ8BxJ37sZyjTlv4HIDtr0JDcx7UZY=
X-Google-Smtp-Source: AA6agR5ls8DzN1n4Ks2YZXHvhDCcRcSqMSGJWZ1AoNP7FpYQefeHND/RxbB310o2K3eEqehD7LliRw==
X-Received: by 2002:a62:e50a:0:b0:537:1eae:1268 with SMTP id
 n10-20020a62e50a000000b005371eae1268mr3046774pff.16.1661309373815; 
 Tue, 23 Aug 2022 19:49:33 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 p13-20020a635b0d000000b004296719538esm9845273pgb.40.2022.08.23.19.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 19:49:33 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 19:48:56 -0700
Message-Id: <20220824024904.2529728-6-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OeFjHsIMyA5ZlqaEXc8VD4136Tgyg3lEa4v0idG2WQA=;
 b=OO2JTvJ30xPz2iA8kR32znZDr9YVJn975+cx68bJxVWfJ1UwDZWvzC3K0g28TLCeE1
 x+9i3Kj5WJOi8t1Jj6llf/4whyW69R2siTpDj+UnJK/nnxsN46S4zCjmXaGqHI4rRTU1
 cttWk/YxGT98yijWiOSEhuaFt7XqIg0daWQ6o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=OO2JTvJ3
Subject: [Buildroot] [PATCH 6/7] package/freescale-imx/imx-vpu-hantro-vc:
 bump version to 1.7.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

-To match NXP 5.15.32-2.0.0 release.
-EULA/COPYING: update to LA_OPT_NXP_Software_License v35.
-Add an INSTALL_STAGING_CMDS define as libraries needed by imx-vpu-hantro-daemon.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash             | 6 +++---
 .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk | 9 ++++++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
index aadf5b121f..df2cae6ca8 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d5efae484c4271c098286d007590d6bf40c272d4f35702ff65625f2362715ab3  imx-vpu-hantro-vc-1.4.0.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  8af665f8e06e0e467f563e372f43583d94128f0d37f75321965bc26bd4404b2b  imx-vpu-hantro-vc-1.7.0.bin
+sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
+sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index b07e116674..91f1db656e 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VC_VERSION = 1.4.0
+IMX_VPU_HANTRO_VC_VERSION = 1.7.0
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
+IMX_VPU_HANTRO_VC_INSTALL_STAGING = YES
 
 IMX_VPU_HANTRO_VC_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING
@@ -17,6 +18,12 @@ define IMX_VPU_HANTRO_VC_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
 endef
 
+define IMX_VPU_HANTRO_VC_INSTALL_STAGING_CMDS
+	cp -r $(@D)/usr/include/hantro_VC8000E_enc $(STAGING_DIR)/usr/include/
+	cp $(@D)/usr/lib/libhantro_vc8000e.so $(STAGING_DIR)/usr/lib/
+	cp $(@D)/usr/lib/libhantro_vc8000e.so.1 $(STAGING_DIR)/usr/lib/
+endef
+
 define IMX_VPU_HANTRO_VC_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so
 	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so.1 $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
