Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F58B606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L5rKCSok;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=JY7VL8iY
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E39780D66;
	Tue, 20 Oct 2026 10:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAD4RbFrZUdj; Tue, 20 Oct 2026 10:29:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7BB1B80C5C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792492155;
	b=Vo0ni8IJp9pehQQpNFLbInPagJ4uAO+/ZeAagTIETthO3gPIid4AneZtp9tlRasFH9Er
	 13XkF6xTxG3r3GIV0HC4+dvKsmDho6AaMr+ouTPYWnO1juFW+JHkU5tWKd5q+RMtlb6R5
	 dRJ100deFCYIx1EP+arFSpx101rCzU4tpqwlyv/e2ySclDQXFhZkmhcaGI/uUxoWuqDeY
	 8m6fsoae7eyeQdy7VmmuJ0+yRB1ugCMmwnZjIcq1axBUw8JTSY0kGqtpvxYtZk90c1Z6b
	 f3QaTjl3ff8knhX8lOAfrxsFpzIFFyl5j94E7way5XSxj/Dst/sEwg5xdgGt4cDobog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792492155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=vJBguaJw2K1ROIRPaHOliP7/hsLR+Phj5lno3GF7/AY=;
	b=njZSnn09ai5hsKS/C//GhR1W79dqlAodQU0f7GHi40N3/Nls6r9WSiKfHC0d+mTyZgHO
	 84VOFuuBqJ/12LCtQuf5nXAE1d26hDWTZiSVYULUFlzyGQ80GxMBr7tizcOkjmiGuaHpQ
	 yR+HYrRyZcWktz8TZgb5BnmplplLy7tyXwV6+jwu36n0FYNG7/VXtngtZwc5lw2kbCDtQ
	 A/Ft7zHYoPmtQOQcGTsj0k7Je6o2QW5Vh3supr1FUseBoFcFWP+cp6YkH37Gky48moP1X
	 cGlnKACa/kEqwvNwvjqcZRP2LcilN+8uKwK266qZQozPPCeD/7UK7/7e7uAk9eBChPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792492155;
	bh=vJBguaJw2K1ROIRPaHOliP7/hsLR+Phj5lno3GF7/AY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L5rKCSokxOfbI7QbaD23FI9Z9sgguTYQqMVYABkyjRQslMDS6WOwRpsHJDnYDKf+7
	 +tnOvmeTfMQmnxXz9CYhX+M3TSXfny0HArM95jHfx//7ppGBDF65BZ40Nm3uB1U+B/
	 xVKcEU9DMu/t+t6UOY6zmLEKjhcYnvU52uc3uTMiVCFBPZ7rFUoOc9uDice8fVBUel
	 NwwxbqMFWHwUOkzVkf/ZrijRvvAKfsw6N5nO1Cjb7fzr8uVWqOmydnX/9zzcWb/DJ2
	 eyhXf9Lwa+wRAkZkcWrgyo61l5awBgCwoufJ1pAYsV4yRxLEagKjc11jvQmtGRkjHG
	 UKwUTm2ixwhcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB1B80C5C;
	Tue, 20 Oct 2026 10:29:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02EB11E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD19440119
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPuqEHUjMSpU for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:29:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D99C5400FC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792492153;
 b=o6/4L5MTgTVUmKJkb+sGj9Qy9tvU6bUSg047SD8HZN9d6cT2uGmfE7XKKMArsIkZ3Ahv
 wA7j5sjGgCNCBMx/PosEPtewP8uFzPR/uvnikxcRQZY1pWQ1oejN7Nn5VziH0l4tHENq1
 3j/jBAYorbw6LE67viCkU8xkqLLnVWzsSTjbMI7Vaq/QbWTLYvr+uA+EoVoYNi6K/ntMv
 bfi/2yvrLOa1lT68ydgFe4kgCo8QDmtdRRA6KiqGtJcHmLxBwlyjKiShJEPTPeJxH3wZB
 3Iqx5YHeGFvMI96Eg6pNzokNkfT/zv0FJs/q8pvEtTIHtCc8Bayqfq+3dIQ5ej54slw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792492153;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=KruyeNk2Zt0oLoO1IqYnFgQG7HjGTXLbuma2mXdIF3g=;
 b=FG1Q7Siy1donY6/vw7BbxAi7cTl2m7KD4iIk+OM/EKFDgS0JFPvrCDzJL8Ff4pk6BD9n
 /wyv6BiuNLCMzoHbJ4h14lAS5dfzzIiCzhyvfm0PLXFpurlMiihvnjFYGDboUTzrxHqAB
 bt0b4SImltoezEJNG4Cn4T1D9miDGW+Z/n3HIDM7ZVAaGfqIIhUaNp/lWOW5k/JgtTXb5
 gzsxMn24m6pqry8J4x7UQv5xQrpMJ+c81nr7J/89jJtkd8k5FCe+cPWrc5ijs1ue4Whol
 zZ3RCg4X4QLIdygDxM+VFGhC68ENUoA2VShOr+MyPOEniXERDvWnG8ylfR5F1rnRZ4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=JY7VL8iY; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=JY7VL8iY
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D99C5400FC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=JY7VL8iYQ68YuI2hxRP4rBCnwR47eLWhVDjMN2YTi6XfDgfIBzxczjFbMQ3uDsBC9ono1nFr0eTAxD0S+5QxTeeYFZ0d8BTQ9wSPbflr6ijrsCADzhX5Ec7de9u+UVG8QoKmApjX+MBI0e0GIN+B9jGRTPR6f3Auyn7+crMLwrRjxHvfq8+ruXrPxyLHHBtACMeon/J8qxeTTxlEHzqVDO3iDHQ4EuQi7h6VxxmDEkXMOlhdzMi7q4mRFpXat4HAtuZorPKaL+l+I60R9jpHoy+RlkNvacii1KJHfpupblovdkIxCKjMFNhtojFszgcFZQx4v8IQs/A/LAWpoV0FIA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=a5I6BbA2VJ1zDRA1D+Rq3p84bC0RoQcOqKNT+SwVlMQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -616613616; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:29:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xJ75h-00000008336-11rO;
 Tue, 20 Oct 2026 12:29:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:28:56 +0200
Message-ID: <20261020102906.1918308-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020102906.1918308-1-peter@korsgaard.com>
References: <20261020102906.1918308-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 2/7] boot/uboot: add support for firmware-ele-imx
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Similar to the existing firmware-imx support, some platforms need the
EdgeLock Secure Enclave firmware when building U-Boot:

https://docs.u-boot-project.org/en/v2026.10/board/nxp/imx93_frdm.html

So add an option for this and extend the existing UBOOT_COPY_IMX_FW_FILES
logic to also handle it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in |  9 +++++++++
 boot/uboot/uboot.mk  | 10 +++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d4e77fd0f8..381a12197d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -351,6 +351,15 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
 	  This option makes sure that the i.MX firmwares are copied into
 	  the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE
+	bool "U-Boot needs firmware-ele-imx"
+	depends on BR2_PACKAGE_FIRMWARE_ELE_IMX
+	help
+	  Some i.MX8/i.MX9 platforms encapsulate NXP specific firmware
+	  for the EdgeLock Secure Enclave inside U-Boot.
+	  This option makes sure that the i.MX EdgeLock Secure Enclave
+	  firmware is copied into the U-Boot source directory.
+
 config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
 	bool "U-Boot needs rockchip-rkbin"
 	depends on BR2_PACKAGE_ROCKCHIP_RKBIN
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 96b8cd0d2e..99330a2f15 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -224,13 +224,21 @@ endif
 
 # Mainline U-Boot versions can create the i.MX specific boot images
 # and need some NXP firmware blobs.
+ifneq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE)$(BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE),)
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE),y)
 UBOOT_DEPENDENCIES += firmware-imx
-UBOOT_IMX_FW_FILES = \
+UBOOT_IMX_FW_FILES += \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),signed_hdmi_imx8m.bin) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),lpddr4*.bin) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR3),ddr3*.bin)
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE),y)
+UBOOT_DEPENDENCIES += firmware-ele-imx
+UBOOT_IMX_FW_FILES += $(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE)
+endif
 
 define UBOOT_COPY_IMX_FW_FILES
 	$(foreach fw,$(UBOOT_IMX_FW_FILES),\
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
