Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E71C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 15:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22117406E9;
	Fri,  3 May 2024 15:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndZNtuc96ZzH; Fri,  3 May 2024 15:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E5D34097B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E5D34097B;
	Fri,  3 May 2024 15:49:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CFA71BF30D
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 15:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5771C60672
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 15:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgXEqTAiV4vm for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 15:49:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.33.112;
 helo=8.mo584.mail-out.ovh.net; envelope-from=julien.boibessot@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFE266065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFE266065F
Received: from 8.mo584.mail-out.ovh.net (8.mo584.mail-out.ovh.net
 [188.165.33.112])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFE266065F
 for <buildroot@buildroot.org>; Fri,  3 May 2024 15:49:14 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.2.206])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4VWFbW5kt2z14H9
 for <buildroot@buildroot.org>; Fri,  3 May 2024 15:49:11 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-gjlmg (unknown [10.110.96.9])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4A99E1FE4F;
 Fri,  3 May 2024 15:49:11 +0000 (UTC)
Received: from armadeus.com ([37.59.142.96])
 by ghost-submission-6684bf9d7b-gjlmg with ESMTPSA
 id YCPWD3cHNWawnAoAnujSmA
 (envelope-from <julien.boibessot@armadeus.com>);
 Fri, 03 May 2024 15:49:11 +0000
X-OVh-ClientIp: 91.172.110.41
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Date: Fri,  3 May 2024 17:48:55 +0200
Message-Id: <20240503154856.763551-2-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240503154856.763551-1-julien.boibessot@armadeus.com>
References: <20240503154856.763551-1-julien.boibessot@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 537898683876364753
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvddvtddgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhulhhivghnuceuqffkuefguffuqffvuceojhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnheptdeghfelheefteeigeffudelgfekkedutdfhudevffetgeevgefhtdfglefhheegnecukfhppeduvdejrddtrddtrddupdeluddrudejvddruddutddrgedupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001be824c01-a577-4a7c-86d7-4e85122b8a91,
 1A4BF995D284D865C4A10E9D97B95B1B76853C6E)
 smtp.auth=julien.boibessot@armadeus.com
Subject: [Buildroot] [PATCH 2/3] configs/armadeus_apf28: activates
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

As asked by Romain. Armadeus boards share same Linux hashes.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 configs/armadeus_apf28_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 5207cf674c..4ff79dd012 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -5,6 +5,10 @@ BR2_arm926t=y
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/armadeus/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf28"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
