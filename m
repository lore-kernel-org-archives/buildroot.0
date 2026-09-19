Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BECC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 21:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4222781094;
	Sat, 19 Sep 2026 21:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mJNBiHwvDvB; Sat, 19 Sep 2026 21:36:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 979B381089
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789853764;
	b=UeH25ONUr0kKndWW2NL42KV4C91Y7Bk3Zd1wax+XBUkKhD7gUz00k39G26eOcFMC63YK
	 smPoChP/bGdh3bQab8OhKMCgHD/FlPgVTROxLivkysmpSu5DulEgEnZi0G2qCT15X7k3w
	 VO5zCIrnrSRaX+3DGxnJEjObeusb9cpRupCg6HBJG+aFUSCdlxXMawPai34gAb3CXiVIm
	 iIgbCjCPOEVbVgBsDIrdu4FFN9lA3tW+88K25JU9kVK+D6EVmb9+xqe7liz1sFAubSIDq
	 zZ9rmFx7YR49Q2Xnkq1cWR7XP5iu1yakqVn0Q7F0HTczAQ0vUMr4O8h1F5FRVKHeiWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789853764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kQZRpaOYxdfnAIijOxzsphLwUQBiHrYbGMn+xDY8vRc=;
	b=sXjugKu8Z9CiM+62oYm1W7m4mF7AO2BemLTm53HAP7lHBYMhOgetHgRQW9G2QgStdOCU
	 Osk2BHp/h69SYnHGLVnQjtNkqeFUWUIkzI5R+1gbyT+wuK9b9GtwD+7963xZJP2CnOK5k
	 wxpTQTxTv86IBFy0MkcKl6ScgbIVp+3CzaprpIbB5YjNxNlVHqpU/wuVDABtDQQTvFGcb
	 vgqcnLQCEPb8T5ZIN1Od49TitNsIuv5Uhq45m+u5aZpS636bXCh/3FgbxFXU3XOLUSd1N
	 gLnSobQaZVZdvFSScp698pturjz2QNfWcOZZhxsaNv/xq9iRXVMY6KtQaVQEnAtJYAw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789853764;
	bh=kQZRpaOYxdfnAIijOxzsphLwUQBiHrYbGMn+xDY8vRc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cu0SApE6oO6RdVqgd6znIyqgWLPJLMhoKk58mRJTkPF5Wt/PdZ3wvYMysfrlBv8Oz
	 k+et6tI5/uj2v7eFlQ97/FtnE6S4H1MWxVB+OnyN+0E5mrLi/pNPGoTzwK1GArWFQN
	 MDC9wOUb4HI6QBldqZ+WmGEN0dFgJCddvks/9rhv/5TIbNonRqHCPS62APQIDf7qvH
	 +uA60hwwZRLLIHhhQrgBUFBvG4OhaCXV31y2orb5FCov/pCkAo505AXvs5M1aTZtzr
	 SZznhomkR05w/304QyhllFptplWxTlH/UEikt4YJsASxQSqjQ/jqf47dCIev1Kkflu
	 Sj1QibdKOotmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 979B381089;
	Sat, 19 Sep 2026 21:36:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32CD9422
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2515281089
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQlwTliwtVoE for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 21:36:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DBBB681082
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789853762;
 b=Uy2dTwvmkm46P6Q7AQF+d7WRQCg0zciW9lNcdQ26bZglLRbMujLxy2dW/ss86PZEOUuR
 dw8dX12DQeWWw1b6xu7sb9NN2lVzTbE6LpLgiAN8IZYx0GTvKu1zZ7OE9IysHGU+siam2
 x+yO2KuanuNIpr/xl1HXsBfYZmTHXac1ZJHP67wz1ABJX5J7ys0OL/jFRB1ErepYL5lI6
 ItgRocISDkjfAjy1l+NXg/HN3DyRYYje7tpxGpxbrXqsnHBkgd/YOkA2/PpHqBxZ+9U0H
 rnMMeqGt/StvZzcWKDHKoxpvgiQlXbrfMIGfrC5yEMZ/4CHkLk80k6OkCRabc586VYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789853762;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=ad/Dut30NlxuJ2JZk9e/IDhkfFv/w96ZOWznaSEc7JI=;
 b=YObWbx7mFU/ecoR6vCb0f9hczYRo6YhWM6tC3ilFrImW2dprdA3rd3N2o7m6O6rkxR+U
 3xSmV/bKeagdmTKIOdnLZs6SunamIsBD9wNcbfbYKGjfct1YTyOjIOaHHgeUiGj0xAew6
 w16FTRBZQesfuN9Q5trbb1LlS1+2rV/0gcMqz+DLtyEDW3QYC+8Jnx6eJhtvEypcUOFE+
 EGvIXr8pAfS4DhthZ8Knxz322I/kI6ryx4gdeQQk+cSGlujObaptEz8i9fCazZN1b0Uya
 c1OEWcy/HcszvBXBvO0gf4E1pbZF1WxTPRTUS8AGL/hNStFBcKifeZZj0ggsV3clQqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CCDBvDRe; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBBB681082
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:36:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1wfy703Ail-010PXZ; Sat, 19
 Sep 2026 23:35:57 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Sat, 19 Sep 2026 23:35:41 +0200
Message-ID: <20260919213542.1294729-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919213542.1294729-1-fiona.klute@gmx.de>
References: <20260919213542.1294729-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:PvGJE/euz9xfHUGUDMtLRBhgFBmAXU7Bn8Si0I8v5i9EvQWudPL
 A0OcCx9NampIA6FMVjnKTCV9ZaAqpz9DHdnn9LzmZsNEX48it3d+tNQjsUyatn45BQo1gWe
 vy4/zM05aZPivltoB6z98RrNLgYgQvNNIhCgqWDSQp0fNLAHa1RT9xxWdkFaSROY1uPgD2B
 0KlgXYRJVnPTPAOluzURA==
UI-OutboundReport: notjunk:1;M01:P0:znolP8YdET4=;Yz5JW29+HtejQ3DMQeFAyuQvCOb
 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
 cx0x7uy/i8Ud7JN6w1/TIWJhsin0jDTJPMw==
Subject: [Buildroot] [PATCH v3 2/3] fs/squashfs: add options to build verity
 tree
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* set ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS from
  BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS in squashfs.mk

Changes v1 -> v2:
* add BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS

 fs/squashfs/Config.in   | 23 +++++++++++++++++++++++
 fs/squashfs/squashfs.mk |  4 ++++
 2 files changed, 27 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index cb2f5ec969..9773f5af20 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -121,4 +121,27 @@ config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
 	default "-Xcompression-level 22" if BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 	depends on BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
 
+config BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+	bool "create verity hash data for root filesystem"
+	select BR2_PACKAGE_HOST_CRYPTSETUP
+	help
+	  Create verity hash tree for the root filesystem. This allows
+	  setting up a dm-verity device for the root filesystem, to
+	  ensure data integrity. The root hash must be provided from a
+	  trusted source, or with a kernel-verifiable signature.
+
+	  The verity hash image will be called rootfs.squashfs.verity,
+	  with the root hash in rootfs.squashfs.verity.root-hash.
+
+if BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+
+config BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS
+	string "Additional arguments for veritysetup"
+	help
+	  Additional arguments for the "veritysetup format" call. Use
+	  this if you want to set options, e.g. the hash algorithm,
+	  instead of using defaults.
+
+endif # BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 3b9d0efbbe..bd283a6be5 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -32,6 +32,10 @@ else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_VERITY),y)
+ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS = $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS))
+endif
+
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
 endef
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
