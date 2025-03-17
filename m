Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25D4C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 17:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4772E60ABF;
	Mon, 17 Mar 2025 17:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8vDy-dA04ui; Mon, 17 Mar 2025 17:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB53860A59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB53860A59;
	Mon, 17 Mar 2025 17:41:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD38B16E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA5C340953
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZ-0U90dMdu6 for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 17:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 561E64093C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 561E64093C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 561E64093C
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:40:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61229441A2;
 Mon, 17 Mar 2025 17:40:27 +0000 (UTC)
Date: Mon, 17 Mar 2025 18:40:23 +0100
MIME-Version: 1.0
Message-Id: <20250317-bootloaders-menuconfig-v1-1-8f893d3bcf5f@bootlin.com>
References: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
In-Reply-To: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Neal Frager <neal.frager@amd.com>, 
 Alistair Francis <alistair@alistair23.me>, Anand Gadiyar <gadiyar@ti.com>, 
 Bryan Brattlof <bb@ti.com>, Dick Olsson <hi@senzilla.io>, 
 Etienne Carriere <etienne.carriere@foss.st.com>, 
 Lee Jones <lee.jones@linaro.org>, Sergey Matyukevich <geomatsi@gmail.com>, 
 Simon Dawson <spdawson@gmail.com>, Xuanhao Shi <X15000177@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeujefghfeugeevieeuudduhfeugfdvleetffefvdduieekfefhveejgeffheefveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehgvghomhgrthhsihesghhmrghilhdrtghomhdprhgtphhtthhopehhihesshgvnhiiihhllhgrrdhiohdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtr
 dhorhhgpdhrtghpthhtohepghgrughihigrrhesthhirdgtohhmpdhrtghpthhtohepigduhedttddtudejjeesghhmrghilhdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1742233228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfQlb/eanQsPjHNSbKx5QaLrN3LE392BTO8klxipgAA=;
 b=b3zL2YwYk3ZPwINpvNP+Le1YdqpftGueSkcCTk7uZdRa5hKDosALt547pnq1vbHCOXwVWx
 8hYs/r61a4slbHhayEisuaONmuW4EPXDQ3aPZXweg+nG17/Gtxj1FifHH9BWnxGYX8M5IS
 wH9iCNpNHQZOgiLI0EFrbUnBrqx5pvAo/3DeanwbMHJY07Y0/bMlhp1GvlFXNqkyGsu9vU
 VOlhZbXVXid6YdpYoBVJpHqtNx4fYMHv2J/BmhoqEMcu7UmwaC3J7qquDGc03zDkcgqn92
 BrzWb+CY6nerwqF6kBGqyx6Vh2z3qvxqL9suhvtuSuEkDvgQ75UnF//IviEyaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b3zL2YwY
Subject: [Buildroot] [PATCH 1/2] boot/xilinx-embeddedsw: fix menuconfig
 visualization
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Due to how menuconfig works, a 'comment' entry following a 'config' entry
prevents correct indentation of items depending on the 'config'
entry. xilinx-embeddedsw currently shows as:

  [*] xilinx-embeddedsw
      *** xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf ***
  (xilinx_v2024.2) xilinx-embeddedsw version (NEW)
  [ ] versal plm (NEW)
  [ ] versal psmfw (NEW)
  [ ] zynqmp pmufw (NEW)
  [ ] xilinx-prebuilt

So the 'versal *' and 'zynqmp pmufw' items are not indented even though
they should be.

Do like most other Config.in files which have the 'comment' before the
'config' entry, makeing it render as expected:

      *** xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf ***
  [*] xilinx-embeddedsw
  (xilinx_v2024.2) xilinx-embeddedsw version (NEW)
  [ ]   versal plm (NEW)
  [ ]   versal psmfw (NEW)
  [ ]   zynqmp pmufw (NEW)
  [ ] xilinx-prebuilt

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 boot/xilinx-embeddedsw/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index b0691d7e7b753bba24820a9ec762c403213150d5..007b24e6685b63c15aed417e396e3320fe7bfb28 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,3 +1,6 @@
+comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
+
 config BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
 	depends on BR2_aarch64
@@ -14,9 +17,6 @@ config BR2_TARGET_XILINX_EMBEDDEDSW
 	  Applications can be found on the Xilinx embeddedsw repo:
 	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps
 
-comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
-	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
-
 if BR2_TARGET_XILINX_EMBEDDEDSW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
