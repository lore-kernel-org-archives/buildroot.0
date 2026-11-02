Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD554606A326
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TimZNBj6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9BudWun
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08DE40693;
	Mon,  2 Nov 2026 13:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzKfns9Vllnj; Mon,  2 Nov 2026 13:16:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B4D17405ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793625383;
	b=aDVBE/R9SAQdW8WRikayVNV2icnVc2S/aAghFsUOE0F9MRRCMUJ8Akyi/qWRYRQauGJ/
	 89vCDRl+HQ6ad3QVTi5Z1NdZd9IgYB7J7O+lkCz+I3sISXV128i4iD+sE6l++mOY0qvcB
	 K6ki0+OR3U9ujuhqtFWlTygH7eob69OeJlHEUOcTMMDMoi7ELiiRgIlsMNM7n/58hzCgK
	 WEqJ5TxSgfQceTuJRMsZiAxA/G0w690ohOUPVy6FTf+re0xiEqHnChu9zEzFPFVTdnKb7
	 MCynFzZZ/bHljPRkQ3aRhbWVLRBsayYe2oEOwDj4Ff98l1u6P6mWJCGheiiDCdXnCMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793625383;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9BNWkB1RuFjy9a2AeVxdp9citO8kP/UCNek0O1qXlI0=;
	b=TquOp0ad2pu4xSTN/EJvevFOJWziK1Uvl/TgkP+iqvyFnn+4gMKmeWbIqnQ248R4WjKW
	 +sSvAMgV0beFdOB/datPPuoRCLVZgf8U6c5LGOcGATUPP7yqXAW5kK5J2pUIGT77LNHQy
	 HWykVw1vxacTc0BPU1rndqpi1BpO6qccoTw4rx8YAcEVJsjx0NWUI5IYGAACmGtezwe+i
	 Urj5ZDubP2MtUfjF53HBNBBC0Rh3kV7E5dH8q3rxvYLAD9SL80YUxkC33S+Srha3Yz6We
	 lCBXDdGRbwoToJ2LIk0DMsGOIZead9BfeJdxdGDxhiam93t3bAfQchhgADag9nxYpEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793625383;
	bh=9BNWkB1RuFjy9a2AeVxdp9citO8kP/UCNek0O1qXlI0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TimZNBj6dR/YIhZKCx2xkqWpB6fOTMhe9agjfI0lizo15VODpstkV8rEcCrjL4NNS
	 ty8pnPuf0ejtcR857r7jiVP0aMim174VrTF3SZJXRIwb31JMs+IkemHdjaure3PoJe
	 sjbIvzksqyaGGNfDrVN/8dnO/WYlNSVA+gv90aH7IqTt3NBx708lDcBhwSB2Z8KSXH
	 e6bL7GFF6No77zmpQEE6YBwmz+MUoaOi77fj+hOQgkNQxU6qc+X0nigHEwL4it4gDo
	 ABoejS/dUrGQisFIt/P77NGKslKBiA2k37jx4OWqh/iQ3n2OIsn5Uj4mIwCSo/6UbW
	 FaF887eE/6FuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D17405ED;
	Mon,  2 Nov 2026 13:16:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF142EF6
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94EE7606D4
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlxNO-ZTKNun for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 99E656065F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793625378;
 b=o2mqK/Qy44obKM69K5k1vAcO9X8ljbyHJFIxvVyqLyELP8rLT8Hlmiuw8D17GteqGpKz
 i9Tg1RFlH2w+7ZM4/b5WGuzBVfpAXas5HvIEdXgZYwompXCTCGNn3P+jn+PXktedjwTZb
 IDruKNL8S290sHTKvWWsxwe9sHIJAFTZ1EO1psRlixsV5GB40ccTvWDO8o/G1n93vexHZ
 qIiqMEaK2hjetcnWmKHsFIOPPI/eASKyIfT6mV6pqN1ttKBT7atfsgUBtEwcYWnicvT85
 yxQwD42LESo81OC+QmJPhNj+SCmZUwpmAI8xlmzecII9AcNcpBvIYHujmbQAc9xunqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793625378;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=uzaKWqE2Vzhswuj2ikVV84mQMSLFmVfdRPgWKl47eUA=;
 b=kk/yuuaVuZb/h36SMxsxKq0eACPJClUoN+zYKt3PeRQsof61alX8fzhqlNCXg0wRyYFs
 XiTCm8pw4xfLQ7BHAMmkfhLPM6cARoKQCjzaGPy08f2fCUB/o21GiQ5Obb+Eb+65QeKNm
 hvq3HZqNa/xWVg59W/+rBB5/DFf9krFM8eF1XQGAs2ujS1lX/H4Snd5kbT/K6oEAV7Cux
 8RKbgsOfk8FvGdzuJPt0LpZ4FUL+TMF6o1uKUB7OGrj0t9xbmYE++cwkxMm78pkEfWTyY
 JsYMDhDB8yYNCp9SD5ze07txQTeNz9zSytXcqBhfOHkkY046Jn+MLkJENm4TnxQjZAQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=M9BudWun; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=M9BudWun
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99E656065F
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a2069b9710so25409685e9.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 05:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793625375; x=1794230175; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uzaKWqE2Vzhswuj2ikVV84mQMSLFmVfdRPgWKl47eUA=;
 b=M9BudWunz80s/K80iBZR6qifzKsk3UWzDSU98qEMMQujHHMDGlUstquq8PRD361SsB
 6P4cdVHnrBLCbjEUSYpxT8zxR/hiYh6Oi83Is0QNISV4/rONBFY8rTfQE0aP3YpBLJ9S
 DQcByKOFs3ckfkVade5+OWo0V/QJn3YoxpkHu3Ik5FX5ZCbvtYE9L+0m1OVPDtbsxO5q
 bMs8vPwU32Ls1vr+Zwzl959kahROnutKmLNUYOIdy16xUbXNYcl466VHRZ8XSLDLt9zS
 MYoJKZIWrPJ1zkqdP/ye7zbAnlqwM+oTRlI1ip3dPs+PwNP3AeTlSjOE5HwyIEcEsQrE
 c5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793625375; x=1794230175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uzaKWqE2Vzhswuj2ikVV84mQMSLFmVfdRPgWKl47eUA=;
 b=yzj1BUIF8fCt8z3ailc77CQ9FvsDVW8Jp/uTgIxU52gHg7I4Ix/yN6iAEOiZZJdg6I
 RBTysCGmO/HxGXEPUmMh6gEr39ushy07P5HcgR+ZdydKCHn2mWOM2qYI3lGKMw26oEb5
 ZlBJT3tT8opiP+m6xSM/8lp9pWLcKDW08AW1qrcvuD5MUbVeOrRn3m6b3rCEY5MQ0rOO
 gzsWaa36aU6XoW1207ZatLCQQqssBQPIkKAYd7SKrflWpVB8cgugQ/8lcTVPAQzTMs9w
 gDdDfQ/0dl8S3Ry5y86I3U4HvZy9++3zCVsQZ7NnjNIHmrtao6TmbtJS1gSI91VLqjQk
 BDkw==
X-Gm-Message-State: AFq9FYJrV84ifgEQn9+Jok+tnSV9jYN3anMI//UryeO2x2UZblaNH7js
 smu2tQIL/Qo9QxUgMrtrEffSSuSa+iwnyFKNJg8DDG2iq8AwMswPkc7i7p6Y6w==
X-Gm-Gg: AYBFou30sofpqhqvLA+p3ti5VRn4JpzsqHvuRJbz+7sy7b8ZDNAHM1Rz+XkPqb6QJjR
 nm5F6jMLO5jllEwd7gY4DT8u+gzH3FAwWlAq7FxQHNmxJRNGkdaJTvNd+DkGI0cI37mIRd73eGK
 dHrTkxOnsQnZOLa7HCjy3IclHUPdWqUY6nghea0mj+NmugHoORMg2NM5tFp8SAlhJN+FN41iZW/
 1aDJwO+ktEfTjEI5MPRLMMYOcWtiLE3jreHX3U6SoY2AXwrEfDJ+e7SsTOWrU9Lga6oVcav8f2T
 IQmodVVpsKe/qZjk69VvVMqIih1GNFMCdzS54LZhc0SqGAPTg50VO/bUYX5bjeiu0pdOzo50zvT
 NXxACZNeoe0y8JwEtB9/DBTiHQKT7d/Z5kDomhBnf+qAXfTwCbH+5irWQg7K2g6p5t8LITeW+MK
 Ga0ObJTSEF0Z7UcPJqCHYScJ7yk1r/DJvjEagrVnpwR/Zo1f2oOhauZQ8bKuQzt2XeX3AQBlodI
 Dgl2WlLkkge7UzcoIrCMNd0fWGv2L5+RpVReN1Vf4kImYphUpmg1JRBzIqM73pWYhPvzSqU+dx/
 KVV8oRfFzs0n4B7pAKWNBE7T4ZRGSi3wLaJD0w7LfCMULoQOq1K0mQ==
X-Received: by 2002:a05:600c:638f:b0:4a2:1050:aff with SMTP id
 5b1f17b1804b1-4ac17d16a26mr233260345e9.6.1793625375157; 
 Mon, 02 Nov 2026 05:16:15 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa81a896ecsm361313165e9.9.2026.11.02.05.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 05:16:14 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 14:16:08 +0100
Message-Id: <20261102131610.141568-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102131610.141568-1-angelo.compagnucci@gmail.com>
References: <20261102131610.141568-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] configs/sipeed_lichee_rv*: bump u-boot to
 current top of d1-wip
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is now based on U-Boot 2024.01-rc1, as in the nezha defconfig.
The D1 boards are still not supported by mainline U-Boot.

This U-Boot runs "usb start" as preboot command, to support a USB
keyboard, scanning the four USB buses for about 5 seconds, and its
distro boot command scans all the boot devices: both must be disabled
to have a simple and fast boot. Add a config fragment emptying the
preboot command (USB can still be started by hand) and booting
extlinux.conf directly from the first partition of the SD card.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 board/sipeed/lichee_rv/u-boot.fragment  | 2 ++
 configs/sipeed_lichee_rv_defconfig      | 3 ++-
 configs/sipeed_lichee_rv_dock_defconfig | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 board/sipeed/lichee_rv/u-boot.fragment

diff --git a/board/sipeed/lichee_rv/u-boot.fragment b/board/sipeed/lichee_rv/u-boot.fragment
new file mode 100644
index 0000000000..8f80c0a264
--- /dev/null
+++ b/board/sipeed/lichee_rv/u-boot.fragment
@@ -0,0 +1,2 @@
+CONFIG_PREBOOT=""
+CONFIG_BOOTCOMMAND="sysboot mmc 0:1 any ${scriptaddr} /boot/extlinux/extlinux.conf"
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 27cc2e7dc3..e2590983a9 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -21,8 +21,9 @@ BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,2e89b706f5c956a70c989cd31665f1429e9a0b48)/uboot-2e89b706f5c956a70c989cd31665f1429e9a0b48.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lichee_rv_dock"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/sipeed/lichee_rv/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 12072d790d..91383d7980 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -29,8 +29,9 @@ BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,2e89b706f5c956a70c989cd31665f1429e9a0b48)/uboot-2e89b706f5c956a70c989cd31665f1429e9a0b48.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lichee_rv_dock"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/sipeed/lichee_rv/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
