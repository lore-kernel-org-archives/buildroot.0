Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCC7C369D7
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 20:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C02560C0D;
	Fri, 25 Apr 2025 20:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IyY95HjJDBY; Fri, 25 Apr 2025 20:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D01360717
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D01360717;
	Fri, 25 Apr 2025 20:18:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 342EE28C
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AADD81EA4
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7vuOcIh6qZb for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 20:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4581580FF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4581580FF8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4581580FF8
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:18:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D59A844365;
 Fri, 25 Apr 2025 20:18:26 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 25 Apr 2025 22:18:15 +0200
Message-ID: <20250425201824.141234-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425201824.141234-1-thomas.petazzoni@bootlin.com>
References: <20250425201824.141234-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheefvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtgedutdfghfetfeelhfdtteevvdeludekkeeiudegjeehgfevudeuudeutefhnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhti
 hessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745612307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8gFLGMDTqp39PgLw4z7geFTf0CQRD+2riLobwk2RbA=;
 b=eDLA6KgZ0EKkC1e8AY5f/GewMqEhlCUaesslpT+z0SxodYFeO/rbfAaUSsB3TazoADh5fm
 fMOnjhYeI6BDIdHrY5dJiBo2f78vDwEhkm/J18TEQzM3ZIWrERqtIbEy4+9h/xorG4Jp/d
 uZUoRChGguw+iO3aMwY4xjsVEX79i6yg6I9wiSfc6XV2z2I9Iz2EiaHlHAkVF0/BTpHfXq
 ZHqhD5SsciCr5+pXbIiULy5BwiodyOBAlEQHKTED3tDIOUdk6wATw0EiyH2NZk0rTK5+An
 V0GT+KzSqSgSy9Z3gto3wWJ2zHmpCukNblF2K4T6iPECQvesQt0XJCJkK6631A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eDLA6KgZ
Subject: [Buildroot] [PATCH 1/7] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_15 blind option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to add gcc 15 support in follow-up commits, introduce
BR2_TOOLCHAIN_GCC_AT_LEAST_15 symbol.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 2290d13ad0..54765fc100 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -806,10 +806,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "15"	if BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	default "14"	if BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	default "13"	if BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	default "12"	if BR2_TOOLCHAIN_GCC_AT_LEAST_12
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
