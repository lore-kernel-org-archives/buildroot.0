Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F416C47DB3
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 18:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32813400A4;
	Wed, 31 Jan 2024 18:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32813400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDWlJA1mA2ku; Wed, 31 Jan 2024 18:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3063F42DC9;
	Wed, 31 Jan 2024 18:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3063F42DC9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF3D31BF59E
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 18:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 977AF41FA8
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 18:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 977AF41FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9zjA_hBdi8D for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 18:22:13 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17CFB41F6E
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 18:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17CFB41F6E
X-CSE-ConnectionGUID: q0thVGTHShqtQ8jOXV+AHg==
X-CSE-MsgGUID: MO4Qot1xQY65TCaX0BCnKQ==
X-IronPort-AV: E=Sophos;i="6.05,231,1701154800"; d="scan'208";a="16084676"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Jan 2024 11:22:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 11:21:00 -0700
Received: from [10.40.56.22] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 31 Jan 2024 11:20:59 -0700
Date: Wed, 31 Jan 2024 23:48:28 +0530
MIME-Version: 1.0
Message-ID: <20240131-kernel_dir-v2-1-555eeeee1722@microchip.com>
X-B4-Tracking: v=1; b=H4sIAPSOumUC/22NQQ6CMBBFr0JmbQ1tiqAr7mGIKe1gJ0pLpoRoC
 He3sHb5kvffXyEhEya4FSswLpQohgzqVID1JjxRkMsMqlS6lEqLF3LA98MRCy2NbgZ3rfu6gjy
 YGAf6HLF7l7k3CUXPJli/J0aTZuRd9JTmyN/jdJG7/re/SCHziap02djhUrl2JMvReprONo7Qb
 dv2AzDARY3BAAAA
To: <buildroot@buildroot.org>
X-Mailer: b4 0.12.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706725333; x=1738261333;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=lbCptqnwmmN0FhKnAK2i2pdqxk+YmEd2fCG35ehOhtA=;
 b=uNfi4qgDxNwCeQ7mc1SXMFtaxt7QKvK/VkDcxBpFOTUn57F16Lpla+sa
 JGtS3fT35lfbt75ZQez8VVWx/raV9sd1E5K4zwxCcR7DUWFa6mCTJOjyK
 1vb5lmvmto4E/6fv7JcBUnKZYtlmvLxbLPy7rZkeUiWaXKtADgOqVqwfn
 +Hs/8CGvisxjw64seeq+yrttj2BcQVfMHWfLeMjqXR6hY+yZoiZaToQt/
 ycXZueX+9KqCfRqEnxNV9eLgdC+1AoevTUMs9opOwMTtuq6bLGQ1sQHiW
 LF1G+jcWv1CoTAQEDGxBE+nvAZGGIsM4AdqvInNhyI8qV55AH6/7J5rLl
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=uNfi4qgD
Subject: [Buildroot] [PATCH v2] package/environment-setup: add variable
 KERNEL_DIR alongside KERNELDIR
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update host environment setup helper script to incorporate the variable
KENREL_DIR alongside the existing KERNELDIR. This adjustment ensures
consistency, as some projects utilize KERNELDIR while others use KERNEL_DIR.

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
Changes in v2:
- Keep both KERNEL_DIR and KERNELDIR.
- Update commit message
- Link to v1: https://lore.kernel.org/r/20240124-kernel_dir-v1-1-4125408cf65d@microchip.com
---
 package/environment-setup/environment-setup    | 3 ++-
 package/environment-setup/environment-setup.mk | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index 84a9843c24..0bae813e1a 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -10,7 +10,8 @@ cat <<'EOF'
 Some tips:
 * PATH now contains the SDK utilities
 * Standard autotools variables (CC, LD, CFLAGS) are exported
-* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR) are exported
+* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR or KERNEL_DIR)
+  are exported
 * To configure do "./configure $CONFIGURE_FLAGS" or use
   the "configure" alias
 * To build CMake-based projects, use the "cmake" alias
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 29ec5a9a95..4a71f18f3a 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -35,6 +35,8 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 
 	$(if $(BR2_LINUX_KERNEL),\
 		printf "export \"KERNELDIR=$(LINUX_BUILDDIR)\"\n" \
+			>> $(ENVIRONMENT_SETUP_FILE)
+		printf "export \"KERNEL_DIR=$(LINUX_BUILDDIR)\"\n" \
 			>> $(ENVIRONMENT_SETUP_FILE),)
 endef
 

---
base-commit: 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2
change-id: 20240124-kernel_dir-41a48fd97b75

Best regards,
-- 
Nayab Sayed <nayabbasha.sayed@microchip.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
