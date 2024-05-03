Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A147C10F16
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 15:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE3EB410BC;
	Fri,  3 May 2024 15:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOJfMGWCh8K4; Fri,  3 May 2024 15:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD3F741498
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD3F741498;
	Fri,  3 May 2024 15:49:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD6C61BF30D
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 15:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB2374031E
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 15:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsRgBR_hEKhg for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 15:49:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.80;
 helo=2.mo576.mail-out.ovh.net; envelope-from=julien.boibessot@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09BF8401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09BF8401DD
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net
 [178.33.251.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09BF8401DD
 for <buildroot@buildroot.org>; Fri,  3 May 2024 15:49:16 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.9.127])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4VWFbY5qq8z1lhr
 for <buildroot@buildroot.org>; Fri,  3 May 2024 15:49:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-gjlmg (unknown [10.110.96.9])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6AC7A1FE70;
 Fri,  3 May 2024 15:49:13 +0000 (UTC)
Received: from armadeus.com ([37.59.142.96])
 by ghost-submission-6684bf9d7b-gjlmg with ESMTPSA
 id OIv9FnkHNWawnAoAnujSmA
 (envelope-from <julien.boibessot@armadeus.com>);
 Fri, 03 May 2024 15:49:13 +0000
X-OVh-ClientIp: 91.172.110.41
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Date: Fri,  3 May 2024 17:48:56 +0200
Message-Id: <20240503154856.763551-3-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240503154856.763551-1-julien.boibessot@armadeus.com>
References: <20240503154856.763551-1-julien.boibessot@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 538461630995878353
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvddvtddgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhulhhivghnuceuqffkuefguffuqffvuceojhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnheptdeghfelheefteeigeffudelgfekkedutdfhudevffetgeevgefhtdfglefhheegnecukfhppeduvdejrddtrddtrddupdeluddrudejvddruddutddrgedupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001d9d4e1f7-6b4b-41f8-bde8-24ebd5eede36,
 1A4BF995D284D865C4A10E9D97B95B1B76853C6E)
 smtp.auth=julien.boibessot@armadeus.com
Subject: [Buildroot] [PATCH 3/3] configs/armadeus_apf51: activates
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Julien BOIBESSOT <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As asked by Romain. Armadeus boards share Linux hashes.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 configs/armadeus_apf51_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index af4562ce0f..8317dd7b8b 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -5,6 +5,10 @@ BR2_cortex_a8=y
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/armadeus/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf51"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
