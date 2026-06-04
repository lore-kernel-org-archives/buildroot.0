Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A48CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCAF660A89;
	Fri,  5 Jun 2026 12:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnPEMlHcSCmm; Fri,  5 Jun 2026 12:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA5E260AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663252;
	bh=iqm5Z5JViaHYpHKp+2mUgphHLx3IuL6dDoC8EzV2Tj0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kXkyWxcG6970KSog3hX8ywJoGFPiWN60nh0DEujRTouNh/ipiZ58+nvKCO5l9t501
	 gkVW8d5vvoRPJK+R0Ax4iUsHtXM08dqNhCHKPF6AOpS7KWbRaKI/cQYBNe40WK3gbz
	 Tl7U/4mSInvlZdgi+O3LUQWKZdK4Ip0rKnf9SNo0YDLyLzymos8V6kuDsi0inb2ONE
	 2/VNKN/JGAW9HU6BXMcoAb1CtVBmWzll9vlLQPu0ICZWPrYuHFH4rn1fId9uYu1N52
	 CQ0Ri0cyNYY98vP1i0ikRJMdT02Fu75FWl1+T5auZeK3TVRG1F6DxjPhtT9QZ1GdK2
	 6bniyfQRutwVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA5E260AC6;
	Fri,  5 Jun 2026 12:40:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04460F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46A694105D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22PQ_TK0eOBL for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3DD41088
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E3DD41088
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86A5587B3D; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:24:00 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1f559e5c469386d9be5ffa71e4c9406dd5f8571b
X-Git-Newrev: 921ba9e35704d7084dd23127b1fb835854c296e5
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.86A5587B3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 boot/arm-trusted-firmware: correct cpe-id version logic
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/921ba9e35704d7084dd23127b1fb835854c296e5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Commit 53bb7eafb2 ("package/arm-trusted-firmware: add
ARM_TRUSTED_FIRMWARE_CPE_ID_*") added logic to set the cpe-id version from
the package version by dropping a v or lts- prefix, but it used subst
instead of patsubst - So it would replace "v" and "lts-" anywhere in the
version and not only in the beginning of it.

Change to patsubst to fix that.

E.G. with the following defconfig:
BR2_aarch64=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="version-with-v-or-lts-in-it"

before:
make printvars VARS=ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION
ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION=ersion-with--or-in-it

after:
make printvars VARS=ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION
ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION=ersion-with-v-or-lts-in-it

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit e60515bbf51998a1ce098d7ea1683a67aff50de8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index c3c4a581da..1b52f36783 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -8,7 +8,7 @@ ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_V
 ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
 ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
 ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
-ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(subst v,,$(subst lts-,,$(ARM_TRUSTED_FIRMWARE_VERSION)))
+ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(patsubst v%,%,$(patsubst lts-%,%,$(ARM_TRUSTED_FIRMWARE_VERSION)))
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL),y)
 # Handle custom ATF tarballs as specified by the configuration
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
