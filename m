Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1167DC369D5
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 20:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07DC60B9F;
	Fri, 25 Apr 2025 20:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpORAEVpSAUt; Fri, 25 Apr 2025 20:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 068496120C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 068496120C;
	Fri, 25 Apr 2025 20:18:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB121127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D844382082
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpIdaogTg7yk for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 20:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE8A481F80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE8A481F80
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE8A481F80
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:18:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 04764443B8;
 Fri, 25 Apr 2025 20:18:30 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 25 Apr 2025 22:18:20 +0200
Message-ID: <20250425201824.141234-7-thomas.petazzoni@bootlin.com>
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
 d=bootlin.com; s=gm1; t=1745612311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZenPe6J/b0FBuTd/LRx1C5JQS/7iCVNInZ/4YOEc4rc=;
 b=H2QU/gIg/Lwd7x9Ar170262YLV3jjM6bF2LuiJWFaedzEI3z5dGi1YKMnPZcorDkTSWVsQ
 h+5tl21UzYJlqkMdWJpl2DGWSNfnm4E9Ty1mAU3BakVggSk/PUN4ZxMQioIDBjXUEs+p7l
 bpd0H3rKViqO2v/y/sJDmQbqpgrKAvrX2bqXiNHPh+x19N0N3nhJ6SIyy0drO+pEQvMyqK
 cz4yLW3KSkwp7zdcdj4nXZht4nMMowEHKN0cUJ30dm1jer3GY9UU+ckMqlggp/rCrgKDNX
 O+qjrmqxsNmi46u0UW1YzQF0esfNHuROhNmVENN2Dh+pHmmW6V+FJW4XwxOEFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H2QU/gIg
Subject: [Buildroot] [PATCH 6/7] package/gcc: drop dead code related to
 BR2_GCC_SUPPORTS_LIBCILKRTS
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

The libcilkrts library was removed from gcc 8.x, and gcc 8.x is the
oldest version we allow building (to still support PowerPC SPE). So it
means the BR2_GCC_SUPPORTS_LIBCILKRTS is basically dead code because:

	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8

Will never evaluate to 'y' in current Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host         |  5 -----
 package/gcc/gcc-final/gcc-final.mk | 19 -------------------
 2 files changed, 24 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4258debbd1..8930c2a42a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -51,11 +51,6 @@ config BR2_GCC_VERSION_15_X
 
 endchoice
 
-# libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
-config BR2_GCC_SUPPORTS_LIBCILKRTS
-	bool
-	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-
 config BR2_GCC_SUPPORTS_DLANG
 	bool
 	default y if BR2_aarch64
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 99d7047b5f..43aea72420 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -85,25 +85,6 @@ else
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
 endif
 
-ifeq ($(BR2_GCC_SUPPORTS_LIBCILKRTS),y)
-
-# libcilkrts does not support v8
-ifeq ($(BR2_sparc),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
-endif
-
-# Pthreads are required to build libcilkrts
-ifeq ($(BR2_PTHREADS_NONE),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-# disable libcilkrts as there is no static version
-HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
-endif
-
-endif # BR2_GCC_SUPPORTS_LIBCILKRTS
-
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 ifeq ($(BR2_STATIC_LIBS),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-shared
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
