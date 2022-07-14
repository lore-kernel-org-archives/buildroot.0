Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF91C43334
	for <buildroot@archiver.kernel.org>; Thu, 14 Jul 2022 22:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D432240580;
	Thu, 14 Jul 2022 22:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D432240580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fy8j9dsvN88C; Thu, 14 Jul 2022 22:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1D9E40527;
	Thu, 14 Jul 2022 22:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1D9E40527
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75E841BF94D
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 22:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 576A760B49
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 22:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 576A760B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1VDheoOoPLJ for <buildroot@lists.busybox.net>;
 Thu, 14 Jul 2022 22:08:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8437360ACB
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.179])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8437360ACB
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 22:08:37 +0000 (UTC)
Received: from 1oC70a-0004zC-Um by out3c.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1oC70b-0004zu-U3; Thu, 14 Jul 2022 15:08:33 -0700
Received: by emcmailer; Thu, 14 Jul 2022 15:08:33 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3c.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1oC70a-0004zC-Um; Thu, 14 Jul 2022 15:08:32 -0700
Received: from tsdebian.Massive (97-120-89-198.ptld.qwest.net [97.120.89.198])
 by mail.embeddedts.com (Postfix) with ESMTPSA id CEFBF702;
 Thu, 14 Jul 2022 15:08:31 -0700 (MST)
To: buildroot@buildroot.org
Date: Thu, 14 Jul 2022 15:08:05 -0700
Message-Id: <20220714220805.29298-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.11.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;
 h=Message-Id:Date:To:From; bh=hH9wuTHWi5wEmbQxWcS4+HTISHgTlM2GKtEqJSz9Lv0=;
 b=aR4Y52K/Ec6F4jJh8WSR3tntr8TY1fot6f/644N+oD7zKr7o8Ry8jYSBuEpuR0vojHdQBIXRHhsvTh9k2Lms9Gu+6A60dGsTbg711x7HVilHF0gEPikA/A7i9oSMhZ8RRIV/r2V0G5muxT8ymj/9OY/gwEbD/EZkIMUpi7M+B4zlTJRYvMSuaJLE5jCy8pvftTf7mdvDRnCNbd2FAElrV4LMMRylox//0OANn86NXjAZlhXY+4lGOjPQsU+nqDfid6QXStBuXgoi+R5m8ygdot+5vq0MeddyNkjZYy25T/hTStoua2RxmUBd7fitBpJTIcn/2j+lNxOJoFcU8xRxAA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=embeddedTS.com header.i=@embeddedTS.com
 header.a=rsa-sha256 header.s=mailanyone20220121 header.b=aR4Y52K/
Subject: [Buildroot] [PATCH 1/1] configs/ts7680: bump Linux version to
 4.9.311
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Kris Bahnsen <kris@embeddedTS.com>, Mark Featherston <mark@embeddedTS.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---

I'm also happy to add myself or be added to DEVELOPERS for this and other
embeddedTS devices. I'm just unsure of procedure for doing so.

 configs/ts7680_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
index e4f5c1aabd..9e058b1d78 100644
--- a/configs/ts7680_defconfig
+++ b/configs/ts7680_defconfig
@@ -4,7 +4,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/technologic/ts7680/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedTS,linux-4.9.y,d03d426e6abd95a973bc669315206295713c17e8)/linux-d03d426e6abd95a973bc669315206295713c17e8.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedTS,linux-4.9.y,v4.9.311-ts)/linux-v4.9.311-ts.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="ts_imx28"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
