Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA058C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 13:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87CD34019A;
	Thu, 25 Apr 2024 13:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTNeVK29lirp; Thu, 25 Apr 2024 13:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CF4D403A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CF4D403A7;
	Thu, 25 Apr 2024 13:22:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B970E1BF489
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 13:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3871441767
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 13:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMYbzjpWtUt4 for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 13:22:08 +0000 (UTC)
X-Greylist: delayed 1169 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 25 Apr 2024 13:22:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 882D740526
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882D740526
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.52.203;
 helo=3.mo576.mail-out.ovh.net; envelope-from=julien.boibessot@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net
 [188.165.52.203])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 882D740526
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 13:22:07 +0000 (UTC)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.176.8])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4VQGH21t3Fz1f7y
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 13:02:38 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8v59n (unknown [10.110.178.126])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E8E711FEBE;
 Thu, 25 Apr 2024 13:02:37 +0000 (UTC)
Received: from armadeus.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-8v59n with ESMTPSA
 id 2OmYNm1UKmY1rAAAEWuwAA
 (envelope-from <julien.boibessot@armadeus.com>);
 Thu, 25 Apr 2024 13:02:37 +0000
X-OVh-ClientIp: 86.235.104.210
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 15:02:12 +0200
Message-Id: <20240425130212.3060913-3-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425130212.3060913-1-julien.boibessot@armadeus.com>
References: <20240425130212.3060913-1-julien.boibessot@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6083800150287241681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudeljedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefluhhlihgvnhcuuefqkfeugffuuffqvfcuoehjuhhlihgvnhdrsghoihgsvghsshhothesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeghfeugfefuedvgedugfejtddvgeeffeekjeelgfetueelgeekgfeltdeltdekgeenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppeduvdejrddtrddtrddupdekiedrvdefhedruddtgedrvddutddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0058d5b0797-0633-4e1c-ba31-75dcf6d0461f,
 40DC0920FA9C89C16861B553EE18EC898EA20FED)
 smtp.auth=julien.boibessot@armadeus.com
Subject: [Buildroot] [PATCH 3/3] configs/armadeus_apf28: bump Linux version
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

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119386
Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 configs/armadeus_apf28_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 01e14e6618..1432251468 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf28"
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.289"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.215"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
