Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6BCC4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 15:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B36E406E8;
	Fri,  3 May 2024 15:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJizHnNh7GNd; Fri,  3 May 2024 15:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AD0D406E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AD0D406E9;
	Fri,  3 May 2024 15:49:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 651AD1BF30D
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 15:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B61360672
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 15:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5jQ0pSCFHZT for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 15:49:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.52.147;
 helo=8.mo560.mail-out.ovh.net; envelope-from=julien.boibessot@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 193176065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193176065F
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net
 [188.165.52.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 193176065F
 for <buildroot@buildroot.org>; Fri,  3 May 2024 15:49:09 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.17.245])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4VWFbQ57HFz1VTq
 for <buildroot@buildroot.org>; Fri,  3 May 2024 15:49:06 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-gjlmg (unknown [10.110.96.9])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 439451FDDD;
 Fri,  3 May 2024 15:49:06 +0000 (UTC)
Received: from armadeus.com ([37.59.142.96])
 by ghost-submission-6684bf9d7b-gjlmg with ESMTPSA
 id FUW6DHIHNWawnAoAnujSmA
 (envelope-from <julien.boibessot@armadeus.com>);
 Fri, 03 May 2024 15:49:06 +0000
X-OVh-ClientIp: 91.172.110.41
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Date: Fri,  3 May 2024 17:48:54 +0200
Message-Id: <20240503154856.763551-1-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 536491307541975505
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvddvtddgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheplfhulhhivghnuceuqffkuefguffuqffvuceojhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepgeekhfeugfffkefhgfdtkedvudefiefhveejgeevfeevueegieefveeikeekfeetnecukfhppeduvdejrddtrddtrddupdeluddrudejvddruddutddrgedupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00166b328e2-8959-4211-9fb7-ef8a348a48a6,
 1A4BF995D284D865C4A10E9D97B95B1B76853C6E)
 smtp.auth=julien.boibessot@armadeus.com
Subject: [Buildroot] [PATCH 1/3] configs/armadeus_apf27: add hashes for
 Linux/U-Boot
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

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. As asked By Romain.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 board/armadeus/patches/linux-headers/linux-headers.hash | 1 +
 board/armadeus/patches/linux/linux.hash                 | 2 ++
 board/armadeus/patches/uboot/uboot.hash                 | 2 ++
 configs/armadeus_apf27_defconfig                        | 4 ++++
 4 files changed, 9 insertions(+)
 create mode 120000 board/armadeus/patches/linux-headers/linux-headers.hash
 create mode 100644 board/armadeus/patches/linux/linux.hash
 create mode 100644 board/armadeus/patches/uboot/uboot.hash

diff --git a/board/armadeus/patches/linux-headers/linux-headers.hash b/board/armadeus/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/armadeus/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/armadeus/patches/linux/linux.hash b/board/armadeus/patches/linux/linux.hash
new file mode 100644
index 0000000000..804920c10d
--- /dev/null
+++ b/board/armadeus/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  879ca159c34ea9d3a6775f292cc59c2d3931d57dca00f0bebe2675ea0c82c6a9  linux-5.10.215.tar.xz
diff --git a/board/armadeus/patches/uboot/uboot.hash b/board/armadeus/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..777e0adab2
--- /dev/null
+++ b/board/armadeus/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  839bf23cfe8ce613a77e583a60375179d0ad324e92c82fbdd07bebf0fd142268  u-boot-2018.09.tar.bz2
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index a87d319729..782587e410 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -5,6 +5,10 @@ BR2_arm926t=y
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/armadeus/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
