Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E75EC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD6AA842EC;
	Fri,  9 Aug 2024 22:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xNMtEuWaIwQ; Fri,  9 Aug 2024 22:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73712840E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73712840E3;
	Fri,  9 Aug 2024 22:06:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE49C1BF865
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9659403B7
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGDZJ1uV434q for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C29CC4038B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C29CC4038B
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:06:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E21485015; Fri,  9 Aug 2024 22:06:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 00:06:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ade2db3ad2e2693ba5e4bfdad0aa75eabe9e5e4c
X-Git-Newrev: 74b46d08da7adc49b01f7af7ebb9e1421b8a9362
X-Patchwork-Hint: ignore
Message-Id: <20240809220655.1E21485015@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi5: use correct CPU
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5620661088019240062=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5620661088019240062==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=74b46d08da7adc49b01f7af7ebb9e1421b8a9362
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Raspberry Pi 5 uses a quad-core ARM Cortex-A76 CPU cluster[1].

This fixes incorrect CPU as it is no big.LITTLE CPU.

[1]: https://www.raspberrypi.com/documentation/computers/processors.html#bcm2712

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypi5_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 268bf2892a..18fdfa1382 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -1,6 +1,5 @@
 BR2_aarch64=y
-BR2_cortex_a76_a55=y
-BR2_ARM_FPU_VFPV4=y
+BR2_cortex_a76=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"

--===============5620661088019240062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5620661088019240062==--
