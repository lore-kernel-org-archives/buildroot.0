Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4784C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 13:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 572AF40151;
	Thu, 25 Apr 2024 13:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGpfn6Ao_0Zo; Thu, 25 Apr 2024 13:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F22940283
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F22940283;
	Thu, 25 Apr 2024 13:21:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0B001BF489
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 13:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CE99826E7
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 13:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kNQGwKKD3lh for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 13:21:50 +0000 (UTC)
X-Greylist: delayed 597 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 25 Apr 2024 13:21:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32D4382640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32D4382640
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.50.107;
 helo=6.mo576.mail-out.ovh.net; envelope-from=julien.boibessot@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 6.mo576.mail-out.ovh.net (6.mo576.mail-out.ovh.net
 [46.105.50.107])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32D4382640
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 13:21:49 +0000 (UTC)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.176.203])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4VQGGz6FTyz1dPx
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 13:02:35 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8v59n (unknown [10.110.178.126])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 820421FD88;
 Thu, 25 Apr 2024 13:02:35 +0000 (UTC)
Received: from armadeus.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-8v59n with ESMTPSA
 id +KxgHWtUKmY1rAAAEWuwAA
 (envelope-from <julien.boibessot@armadeus.com>);
 Thu, 25 Apr 2024 13:02:35 +0000
X-OVh-ClientIp: 86.235.104.210
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 15:02:11 +0200
Message-Id: <20240425130212.3060913-2-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425130212.3060913-1-julien.boibessot@armadeus.com>
References: <20240425130212.3060913-1-julien.boibessot@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6082955723505390033
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudeljedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefluhhlihgvnhcuuefqkfeugffuuffqvfcuoehjuhhlihgvnhdrsghoihgsvghsshhothesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeghfeugfefuedvgedugfejtddvgeeffeekjeelgfetueelgeekgfeltdeltdekgeenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppeduvdejrddtrddtrddupdekiedrvdefhedruddtgedrvddutddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005fa8528ee-d6e4-4349-8272-b5a6bf6efcf9,
 40DC0920FA9C89C16861B553EE18EC898EA20FED)
 smtp.auth=julien.boibessot@armadeus.com
Subject: [Buildroot] [PATCH 2/3] configs/armadeus_apf51: bump Linux version
 to 5.10.215
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
Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119389
Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 .../apf51/{linux-4.4.config => linux-5.10.config}         | 0
 configs/armadeus_apf51_defconfig                          | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/armadeus/apf51/{linux-4.4.config => linux-5.10.config} (100%)

diff --git a/board/armadeus/apf51/linux-4.4.config b/board/armadeus/apf51/linux-5.10.config
similarity index 100%
rename from board/armadeus/apf51/linux-4.4.config
rename to board/armadeus/apf51/linux-5.10.config
diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index aa7c2f84ae..1d15e95e7c 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf51"
@@ -13,9 +13,9 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.291"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.215"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-5.10.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x90008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
