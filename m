Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866A9CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C19560F08;
	Sat, 30 May 2026 14:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhWNLMPaeWgA; Sat, 30 May 2026 14:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7728360F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780152194;
	bh=pTszwUoHF/Ge8sFiOyCtREn/ABQA8to1xSsR+4RDML8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hSRqnEmyvwnkT+ZDAzU/f118tJb8q7L8LsAT0M9NQa3YyY9uXy1ql7ByRLCbwa9MR
	 lhZme/pOSNcD4lo4845c1TC1XJGoWge9LfUkIT+Z7UdTBDkIiNKJ01VBcSZORNZ3iW
	 b4DCxsmL46Zsj3lu4UJQfzsc5i0wrV3yqJ649Gw25En9LlMjN5MDbdzJg4/jSgKCg/
	 Y6SQxVB4J/jWMTR+ATy4hVAMqjbrE4BbaKDz/EVnyJ6+eLNV3ZZ1guzRXuX1VLKECD
	 bu3A1nVhwVCteHdAz1yUjUf6KV5gwvoOJ+wdD2/jYzjCEAna7IwD3mMppe4ZVSb5vK
	 66hY6WNm/aqBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7728360F1B;
	Sat, 30 May 2026 14:43:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2DC12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0838E60F74
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orNDpsxIYQZn for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4549A60F08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4549A60F08
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:43:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DC8D8751D; Sat, 30 May 2026 14:42:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:42:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58b9eb270e47db8ba25ebc703ead84367b36d707
X-Git-Newrev: 53bb7eafb2b3cd142b1ebba755ba06ba6084a8ae
X-Patchwork-Hint: ignore
Message-Id: <20260530144259.1DC8D8751D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/arm-trusted-firmware: add
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/53bb7eafb2b3cd142b1ebba755ba06ba6084a8ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Trusted-Firmware has been using a number of CPE identifiers in the past
but especially after v2.4, the correct identifier would be similar
to cpe:2.3:o:arm:trusted_firmware-a:2.12:rc0:*:*:-:*:*:*

  https://nvd.nist.gov/products/cpe/detail/65DEC230-1CD5-40DB-903A-22537D1E44FE

Add the relevant CPE fields to the trusted-firmware package.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
