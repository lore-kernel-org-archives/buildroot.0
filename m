Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E9B106F317
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 10:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FDAC40B2F;
	Thu, 26 Mar 2026 10:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZhHWqudny2m; Thu, 26 Mar 2026 10:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8306340A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774519843;
	bh=jKTlt7ftl9T9cnIYYl3KEZPbh2OemGma9RnCRJuc2ec=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=BCa2HIQMuO3rQsHTooOZ6IIJQPhrQ2DLgy7VwKGmNyje7yLfONMwUmQEl6ECOOAtW
	 GGnHgbDbKv7qls5QnNLo8o8X+VusyiBG37PTdFBfaVfmznnzNqLjNiSGfBMJ4fA3Ay
	 GFg70oa1COkSdK4VSo2odL+CZXjqbDyZYzatqvpGDecc9xS7Y1eHHV+UOgXXWbdkbM
	 sehIZnCuccDzaKRPnHSwftv/QxIyRj2l/Xs00SCKh/BEq1qFEyLKN+l1hnaEyKV1oT
	 4rwsHxvIfrrRM6C2g+dB+k72xzNHQPsJQXfvv2oTrQEYYGDSb3gHxq6UjcnOdfaxF4
	 A2mUGEzK3kUDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8306340A9A;
	Thu, 26 Mar 2026 10:10:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E52A353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 10:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5478140A53
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 10:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STgVunNB3WlV for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 10:10:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.11.138.130;
 helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D15F40A9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D15F40A9A
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D15F40A9A
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 10:10:38 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, heiko@sntech.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Date: Thu, 26 Mar 2026 11:10:33 +0100
Message-ID: <20260326101033.587997-1-heiko@sntech.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
 bh=adWSXLoN/kNEA4hHsdB96FEZAeYOe7bdtaqzvrfKdgo=; b=SyySUmLZVyKM8V8Ho2fDzlnJt7
 FyipFuk2NOn6uhug2lnzuwUOs42a4CRU1USumJDkPIAm0N+vSAcRC5nzYTdy3gyQhbbmXMHOQ907G
 W4AnplhwmHvTyVRR3PyjddbmomGH9kcgXeea1aDwCmyeWT/QQGXYJbmL2zfP3ATJ/V/c/WR60OqbZ
 DosgiXzdhqs2eMMGeaPs4xrmJ1ovSnQDoPoisTzt+DMh8S3BkY0JBc4nehfJoUPHrBHKDEGaHXzFn
 2vXCdutdOGz/410TNOlzZWVTDJR/YQMimskNMCO0rtdHfayOpuazwMY3EzG0LHeBCf62y8N7ofHMo
 /ZQUS6Ow==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sntech.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256
 header.s=gloria202408 header.b=SyySUmLZ
Subject: [Buildroot] [PATCH v2] package/arm-trusted-firmware: add
 ARM_TRUSTED_FIRMWARE_CPE_ID_*
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
From: Heiko Stuebner via buildroot <buildroot@buildroot.org>
Reply-To: Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Trusted-Firmware has been using a number of CPE identifiers in the past
but especially after v2.4, the correct identifier would be similar
to cpe:2.3:o:arm:trusted_firmware-a:2.12:rc0:*:*:-:*:*:*

  https://nvd.nist.gov/products/cpe/detail/65DEC230-1CD5-40DB-903A-22537D1E44FE

Add the relevant CPE fields to the trusted-firmware package.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
changes in v2:
- remove lts- from lts releases
- remove "v" from version, to actually match version used in CPEs

 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index b81ce0d827..c3c4a581da 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -5,6 +5,10 @@
 ################################################################################
 
 ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
+ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
+ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
+ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
+ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(subst v,,$(subst lts-,,$(ARM_TRUSTED_FIRMWARE_VERSION)))
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL),y)
 # Handle custom ATF tarballs as specified by the configuration
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
