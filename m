Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22236C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 19:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45C6417BE;
	Wed, 24 Aug 2022 19:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45C6417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWLUjScYbwgL; Wed, 24 Aug 2022 19:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73137417B1;
	Wed, 24 Aug 2022 19:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73137417B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92C181BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E46E60FDC
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E46E60FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqYolhzUdgzQ for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 19:26:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA64E60FDA
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA64E60FDA
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 19:26:20 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r69so15873928pgr.2
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 12:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OeFjHsIMyA5ZlqaEXc8VD4136Tgyg3lEa4v0idG2WQA=;
 b=SDLzXo7IwjnG63b0fLCNqLlcXDR7hfBDjjMZQl9neSpgdqnbNC1D93jx/AqaLXzjir
 C3ly4JW3vmB3zEY4FuIFrueJ5z/TJUsQiJwMeJc9rzElykGdUSIf2ZjCe2iPfDvK3/3i
 vEW0hvOlHxQZUkW+Ogtp79NMEd43DW+QJn1AihNAJYKdxNUiZRTIFVTCOi4dQutGw+GD
 qVs0ir9LFspJz6/ECPefItzXyWd6zR9dIAA60PetWS372TROtphWx6wR3dWTszjzag7L
 60nxE/+rAVkbfh/BkJfD3WnYBHJLqaQugCf8IF0NVAzm7DeVwTq00MstRCtm9X4fEga4
 da/A==
X-Gm-Message-State: ACgBeo0GrNcsgSq+pd2bR/jOqHynJyLHCKNUOCZtowl9OtFedEr/MNdZ
 Z4JdCDkpaomGs3J2SfUazIo9Bksb3QZEFSTP+yA=
X-Google-Smtp-Source: AA6agR4XmaKVMRjGGUTIfg/ud7dXwII6sHOabWuNFdm4rs7oDJ9cX/5vKLZkapd1HAFB6NDLVYcBbw==
X-Received: by 2002:a63:9149:0:b0:41d:10ae:4203 with SMTP id
 l70-20020a639149000000b0041d10ae4203mr358520pge.450.1661369180074; 
 Wed, 24 Aug 2022 12:26:20 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a17090a1b0100b001fb4a8d82a7sm1741338pjq.56.2022.08.24.12.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 12:26:19 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:25:56 -0700
Message-Id: <20220824192604.2549356-6-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OeFjHsIMyA5ZlqaEXc8VD4136Tgyg3lEa4v0idG2WQA=;
 b=cMS2muWK+P98SivtGpKl5fJniV/eA4KYEHSCQAATXL89v8ohICIiuZv73lA7J9mJfi
 tWuDAHYw/iihMsQPmEqLwUI0hEdIn/ZqpkgEq8euhha9o2il4uDUyqzBTUW9Rzs75NGQ
 8ES8wkOADsxOv70v/hWMYJkMcQBoijhZc15OU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=cMS2muWK
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
