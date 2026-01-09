Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB37D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 144A483F16;
	Tue, 13 Jan 2026 19:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kW3P6wH9mZqa; Tue, 13 Jan 2026 19:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A500883ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333288;
	bh=eHD8mCCz3GOqt/gO6k2trhMoO8GmXHhDQaDyjCKKWr0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ODVlUq7dIUFvoLJSeM8DwhIhQQGWpi9aRMyoTW+yogPZEP3k78/DtuXAYyrPOFRG7
	 ezCT5DRXPzG78IrqblAwbyTTYr7+aIdRR4DTI1aOWi/GYjTR0iABfOKdq/Yf5hQJpm
	 U//NkJTluLLzYvfd2xmoCFi5+Z1FnLYv3Sg2n/UDfG8EihyOE2dX+eqj6Lj9boUZuD
	 MvYcJ2g0k+4wRBYRYkdiDQ3qKIDSdoERGJQxp0KqpxIDYAahIrrLlaun7OmRu7fH3u
	 QuqYxCAQl9pgtPOp7b4cH9poDj+cE+7NL0mN9/GJZ5KGfotywSD9Xmlq9GJeeEN9uX
	 NuAFV9PVJ8iVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A500883ECF;
	Tue, 13 Jan 2026 19:41:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A1A1231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C4BC82FAE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIo1c_M2vFVL for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 612518305A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 612518305A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F71281385; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 17:02:05 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 1416b2a9dfc061fa73fc7a4fb76a5b05ad83fb8c
X-Git-Newrev: 279b5fd4c05d906402fe8f603992cf7487e42e97
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.5F71281385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 boot/arm-trusted-firmware: override BL31 environment variable error
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

commit: https://git.buildroot.net/buildroot/commit/?id=279b5fd4c05d906402fe8f603992cf7487e42e97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

When building the arm-trusted-firmware, if the host environment has a value
configured in the BL31 variable such as the following:

export BL31=/tmp/bl31.elf

This will cause the build of the bl31.elf to be skipped leading to the
following build error:

make[1]: Nothing to be done for 'bl31'.
And then:
readelf: Error: './output/build/arm-trusted-firmware-custom/build/versal/release/bl31/bl31.elf': No such file

To fix this, clear the BL31 variable in the MAKE_OPTS, so that building the
arm-trusted-firmware will build regardless of the host environment.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6019df8f99cb30efd6263b93753bd8bc46874b48)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d3960..f5b1e5030e 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -162,6 +162,8 @@ endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
+# Avoid BL31 environment variable from polluting the build
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL31=
 endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
