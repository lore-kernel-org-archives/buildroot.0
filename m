Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C630C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 05:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A525A6FB0D;
	Wed, 24 Jan 2024 05:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A525A6FB0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7iN3ncMKX-l; Wed, 24 Jan 2024 05:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF8986FB45;
	Wed, 24 Jan 2024 05:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF8986FB45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBF7F1BF25B
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 05:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EB3285261
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 05:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB3285261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqLDUZ8hK8gm for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 05:42:00 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 24 Jan 2024 05:42:00 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 520408525D
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 520408525D
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 05:42:00 +0000 (UTC)
X-CSE-ConnectionGUID: FsrB8Cv3TKeVmCKgisFU0g==
X-CSE-MsgGUID: ww6CKbdPTq+PzbNfnm2CmQ==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; d="scan'208";a="182444614"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2024 22:34:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 22:34:33 -0700
Received: from che-dk-mpulab01.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 22:34:32 -0700
Date: Wed, 24 Jan 2024 11:02:21 +0530
MIME-Version: 1.0
Message-ID: <20240124-kernel_dir-v1-1-4125408cf65d@microchip.com>
X-B4-Tracking: v=1; b=H4sIAOSgsGUC/x3MQQrCMBBG4auUWRtoQqTqVUTKpPlrBzUtM0WE0
 rsbXX6L9zYyqMDo0mykeIvJXCr8oaFh4nKHk1xNoQ2x9SG6B7Tg2WdRFz3H05jPXeqOVINFMcr
 nP7veqhMbXFIuw/RbvNhWKO37FzN+dUt1AAAA
To: <buildroot@buildroot.org>
X-Mailer: b4 0.12.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706074920; x=1737610920;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=cDY+EwRWVkBJIzgtHjf29PaLdoklhfHGTncNiqp65pw=;
 b=bu6U38yXTERNlWJyFigsXThVJA3SwfyGiebmn9T5S7HWXwUZUOvQ5mmg
 6aIc2plZchtRp6DBlbiiN487qidSP0xeG2gVfT4tOwmZhCqEOJ67yEcvw
 WRCRl2EVEoCDVQyJsrp8JB0X7guhThuhge4of3/9vPWGLqAi4wvRdCPGr
 vfrSAUntFHY9rjodgAVAioethdz2npGB3qzRlylPqzy4m3JyXVhmk1PqL
 CxXjCQlAhGStd5gM7BqE9OzspcnZivw0oMMRIbmQqYsqZNfhbaAK8M7WW
 anuU4cXNj4NSfArjIhNBIubxgt+bJv1CX8fSss6BiqJr9eAz9I2QOHN1p
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=bu6U38yX
Subject: [Buildroot] [PATCH] package/environment-setup: replace variable
 KERNELDIR with KERNEL_DIR
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

This commit updates the host environment setup helper script to use the more
conventional variable name KERNEL_DIR instead of KERNELDIR.  The change is made
for consistency and to align with established conventions in the project (like
KERNEL_HOST, HOST_DIR etc.). No functional changes are introduced by this
commit.

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 package/environment-setup/environment-setup    | 2 +-
 package/environment-setup/environment-setup.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index 84a9843c24..8504a89743 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -10,7 +10,7 @@ cat <<'EOF'
 Some tips:
 * PATH now contains the SDK utilities
 * Standard autotools variables (CC, LD, CFLAGS) are exported
-* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR) are exported
+* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNEL_DIR) are exported
 * To configure do "./configure $CONFIGURE_FLAGS" or use
   the "configure" alias
 * To build CMake-based projects, use the "cmake" alias
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 29ec5a9a95..cc058a5799 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -34,7 +34,7 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 		>> $(ENVIRONMENT_SETUP_FILE)
 
 	$(if $(BR2_LINUX_KERNEL),\
-		printf "export \"KERNELDIR=$(LINUX_BUILDDIR)\"\n" \
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
