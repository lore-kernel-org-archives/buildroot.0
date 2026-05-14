Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B61CD4F39
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 21:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F1F60FDC;
	Thu, 14 May 2026 21:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8kFJ53LJC9o; Thu, 14 May 2026 21:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F7960FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778795041;
	bh=HYEAynzUB/Qc13NQven7AedYORVwuBg2KfP87gVCFO4=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mOzKMpZahe8gSgNl+Dm2MGCel1AeFrkEAU0l6RaIjJcHsiYtd4MGN0tFEfVtSv8rR
	 KhaVfoxy3ePbzgcdfL9bQeR9d3M6WWP9Q5pZoYO+DkPxY9AKGWiLBfy3sm6gq72M6o
	 79jvQku4kBFL0Pv5DKKHKPyl0VNAj9Td+QA/0TeVVW6cEGvxZ6cSNSDD0hpHVA4L/B
	 aldCBY0O2G/CMF6craR+utZeDBUVpdIes2ycmCJ0RvGI67JHtujxpmGEiewlBgRvnr
	 hg/D3wkwv9CPW8jtN6rJPUOrbRF43LlJBFAPW8KLJJA5fj0sfMgTc0UN0pMNFFDp7R
	 bMAKfk3GJHZWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F7960FFA;
	Thu, 14 May 2026 21:44:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C441F36F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA71E407D1
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W21dSl3_lORb for <buildroot@buildroot.org>;
 Thu, 14 May 2026 21:43:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1075A403EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1075A403EC
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1075A403EC
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:56 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2ba1e9d3687so56087025ad.3
 for <buildroot@buildroot.org>; Thu, 14 May 2026 14:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778795036; x=1779399836;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IBjbcfi5XRUTNncYO6zHV3qp1GhoCaelCdNBVvYW/2Q=;
 b=cQW9j2xCrKVaVIFTy+imp8CSqKnLgnZUQHVLFRr98QzIisivrrPijoeUFkJXdWt/mc
 mbkjS+IjwwuA7I6e6szNAjOi/VcmnY2k9wHGYJwxqAsJkdOSTvbF2Dyt/oUn9y7Z9a9X
 wU2dQqk0AqrFNIVCDbDU5M0f+0dsi0K/qo2MQ6TWQp9LHd2ZM2IFCRXG0pa8EHvt5JQH
 hPzV9YJXOxCk61lVP7MYJtc0H283ahQ/5+qwzQ3Rz3svsDhyXhSx4pK42uQ5d82FzA2u
 eHm4dAGtMVWXWra6ZKSev06sRwCop+vz5OkvfCZ/GTDr2+Zsi6G+j7x3T7gv+IYgGmlV
 +5Sw==
X-Gm-Message-State: AOJu0YwEbomEAm6Z1z/uwOvAg99LoTGAo77dIxHk8MzDECn45z6WUC5E
 QAMItS2eknj2uJhOHproYc0TBNFChv3otwlIT3vGrFYVxek/gy8J5D3ThVE7Am/OoO0=
X-Gm-Gg: Acq92OHDcQfyR+OtggzA725iY+5TNJc3+GG1NozYDHknL5CZkI5vj71lWXXTaHWpvCq
 vkeuCDDh4uZJ79fpoULkKgzL3q6Uknips4zd64FvLQMAuj1ifi+46azrHwpD0Hb7xZYJ6/HxnmI
 WxQDwmztPbOT+efXVhsjqIRwHiH14GSjW8IZQEnFGfPSTDZ75uHMGy3itrvke9zbqHlTaWe5cZi
 O/I+1sbIh+dnKSFG8Syh9wMTcm+nfsvOYkhC+1z3aIKobjYWkg9tXzT91oiq3Vu71gNk9t9sRn1
 Mat+zhTj2Yv06mYIGJsiH+xoLK9a/Q07jUqU7UGLn1sabX4+7Ot08GghgU6ZGffzW7AKDhw4K8f
 heXptZepzuNEDr3jUw+1Am+fWwWxtLnAGUNrTmVyKIEOZxTYikFWzdnhk74Q7elmJEn4iPJ7ugT
 p7FAucqlC5Sq01sxgWEr8=
X-Received: by 2002:a17:903:11c8:b0:2ae:55eb:f82d with SMTP id
 d9443c01a7336-2bd7e7e3cafmr13852545ad.1.1778795036261; 
 Thu, 14 May 2026 14:43:56 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c05f287sm49907305ad.24.2026.05.14.14.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 14:43:55 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Thu, 14 May 2026 14:43:39 -0700
MIME-Version: 1.0
Message-Id: <20260514-mesa3d-amdgpu-virtio-v3-3-dd75eca7fa50@anodize.com>
References: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
In-Reply-To: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778795031; l=2676;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=Ov2cDHDxveJFjTOHomHopc9NLjuOpnoHFPi9zp89Fls=;
 b=GB53vQflNEsRhbdu+jJv9G1zShUZFKzMT0dK9M8ZmL4cL1KzwhahCMgWJJo62ueMdJtp+ueYk
 Iolna6OyylKCpUMq1uoz+AmohQOQl3radBC5iRdJ2Fz38aVRc5nmCV4
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778795036; x=1779399836; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IBjbcfi5XRUTNncYO6zHV3qp1GhoCaelCdNBVvYW/2Q=;
 b=mjANuL/Kas2qY63PTMlpkGWUXUYUcLPL9dinKtT7/axGXFvS2MllIA0T3WMSmpnmcY
 L4/R6EIvH5Rt4GQnAkUuvECnVNv48qv2Rw1LnQn60NM0U6yCLnxzGHjZcXVq4GAUFWGY
 TQDVsddTfKP+nNV4DvQfUCqdPPHUHlHtF1Kv9XVCzB+Fzm4Mrm8FouPgr/2ieT0AcGSQ
 /1yqHXbWIEWDNGkGAiQLy3z3v6URyq033R4GNTthrjvm0gwXK5/SCdtvb6Wik9OkCGCV
 FKjhLy7FdMUHcD8c6+cnSBw9KR3doYnmKLTaqw1FES7HfrEtdKph+Kk9xhYDR6YCnGH/
 fItA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=mjANuL/K
Subject: [Buildroot] [PATCH v3 3/4] package/mesa3d: add freedreno vulkan
 driver config
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 13 +++++++++++--
 package/mesa3d/mesa3d.mk |  3 ++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 82ef991595..5f21698c5a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -356,6 +356,13 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	help
 	  Vulkan broadcom driver.
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO
+	bool "Vulkan freedreno driver (turnip)"
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan freedreno driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver"
 	depends on BR2_arm || BR2_aarch64
@@ -431,10 +438,12 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
 
 config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
 	bool "freedreno-virtio"
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO
 	help
 	  Enable VirtIO support for freedreno native contexts
-	  used by the freedreno driver.
+	  used by the freedreno (OpenGL) and Turnip (Vulkan)
+	  drivers.
 
 	  Select this when running Mesa inside a virtual machine
 	  with virtio-gpu host native context support.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d9916ca359..a0be555860 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -130,6 +130,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD) += amd
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO) += freedreno
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
@@ -157,7 +158,7 @@ else
 MESA3D_CONF_OPTS += -Damdgpu-virtio=false
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO),)
 MESA3D_FREEDRENO_KMDS = msm
 ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
 MESA3D_FREEDRENO_KMDS += virtio

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
