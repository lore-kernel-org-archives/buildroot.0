Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE95C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 17:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B01401EA;
	Wed, 26 Oct 2022 17:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B01401EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwPgG2puixu7; Wed, 26 Oct 2022 17:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E247F408A6;
	Wed, 26 Oct 2022 17:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E247F408A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91C6C1BF36F
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 17:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64CB060D76
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 17:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64CB060D76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWKhkWkzex05 for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 17:57:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31F5A60D5E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31F5A60D5E
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 17:57:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id F1C58C0007;
 Wed, 26 Oct 2022 17:57:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 19:57:05 +0200
Message-Id: <20221026175705.3928406-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666807030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vfLQSahYOtXcE0F5pkrxO8D2qWLF7cWCDX8BQg4xzds=;
 b=UNnIR/BlOp+GloXa9AIn64Uyg6d45NRxJbn7CkI02P1sdcZ1z0AXb/pTzVesxAtQItsF9G
 ysQzRNXqDjjN+Blmj0cakQ1wmLnjU8PJXGTeSdVpRno96SPpD9sSqrzUQj2O0VkjkmlVFS
 AZb12QJrjmq/+TsnbthtMyQzU5kTlMtpG3MIIfKXN3H9HzRnPBgqHwt8lBPg/TXhmT/Skx
 GHgHpayVyaqQN8NRLgp5IkXAcv1zQC+6xp9tup2oOgjp7hIed7fr/wKqdp2sfs7qh3rtME
 GbyBwziYNiIV8GoESJZZl6GpT7ZsgAxvwoCdwtcuFB/OLjAiSswJsh3MZ0KBBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UNnIR/Bl
Subject: [Buildroot] [PATCH] package/nodejs: drop support for the MIPS
 architecture
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The build of NodeJS fails on mipsel due to an issue in the V8 code:

../../deps/v8/src/compiler/backend/mips/code-generator-mips.cc:4106:48: error: call of overloaded 'Operand(int64_t)' is ambiguous
 4106 |                 Operand(static_cast<int64_t>(0)));

There is apparently a lack of maintenance of the MIPS port of V8, as
is discussed in the Github issue at
https://github.com/nodejs/node/issues/26179.

Until this get improved/fixed, our best option is to drop support for
MIPS in our NodeJS package.

Fixes:

  http://autobuild.buildroot.net/results/0e6ee80c77bcb77afe18410e8d9da93b738cb0a4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5375dfeacd..1489306be0 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	bool
 	# On ARM, at least ARMv6+ with VFPv2+ is needed
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
-	default y if BR2_mipsel && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
 	# libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
