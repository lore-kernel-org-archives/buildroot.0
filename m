Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03A2CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E12560B97;
	Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Hbv_NdQObro; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80C7460B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663131;
	bh=jSvxDtmg3vFd9uanzz+FOZsYFNektsI3tWtRe/V8Uh4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QYYdpIZRoTz+4Fx+YSaSPLdP0CHAVvsOtg3kzgnPT4rT+QVEOT2Kpc9lFlPY7Pg+i
	 9gi7OHmhUXbwv+//e7tBiCO7aE/P/LEKBUOrQMQfLHF21mMI4VJllrCXIO0HAbZ78z
	 GEAX/lwtb3/ErLXRfc2S1zX35WSLj9/gdsMiR9sS1uAFBt+cUQNeBqEMEsr7UZ0jY0
	 ud/fPaq4r3xW3qvgwA246ZVAZgUceRAVXcfue4W8Cd/kd9zFdbE7gm2B1LnJeDLIuX
	 /fJHya3F/jVtKnKjfMUgLi7CVyImtZs6uL3HzuiKaq5aUlw8Cf5x+BWgU7dkhtp5Ly
	 1FXnIJm2dSE9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C7460B93;
	Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 133FDF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A653B81EAC
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMv01Hr1cYjU for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED68581EB5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED68581EB5
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2302587B3A; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:34:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ae4fbfb35c7db0e560658f6e1f94d3cea88076d8
X-Git-Newrev: 0ccaae26621e963e92ed1ad0d599caa357308d90
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.2302587B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0ccaae26621e963e92ed1ad0d599caa357308d90
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 65a189dbf7..87c16b6073 100644
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
