Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE860A6EE6
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MtlhJzCu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBxUUjHK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192B480D6F;
	Mon,  2 Nov 2026 15:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bg-7ZeGZePZL; Mon,  2 Nov 2026 15:23:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 12029810A8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793632994;
	b=RVn/bB6z21cn/3bKCgFSDM9mlOpdTw/gEwPxbDkxGxXNIvdicup2V/DXfB4g/2dkBYxy
	 jhqbfOEJfXR8XJKWr2EnmAIWoioYK5WocK6VXC66+IlxA4mQIj2+dBPfzLEUCOn5aPDW1
	 PZJKq2AEgwiDn19g0m78di3Lg/zXdO6JhmWq8wvMx2yM3DUM4VJ5qoGjCullVML4tgL0h
	 eHOB1XhRDsewwPp7HgKaDum2ePwYH1lar+mYfPrPu9fENh1izxIuSNYYwIYS9ZhZf+lwm
	 dDCcJz3Z0g0/E2hvNmhTc5/t397G6bZLBjsxWooda8IV9E+kYVtUv7bXAl9oWVx2liQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=bQ4Chu23QAx85/fGzFUH8lG3BbyilNZeA9i0q4OY2+M=;
	b=XWKrLxAj4t7SDlc0tQGjhvSoPyEBWwK/Msxt+3+qLzIQln55zw9BEgAX5A0yHPZXVEjk
	 98/dDWgtrUalPUP96mGOCL/fANKqdIsIpEXa+2L9B94YD59stuBOsewFVhQJzIqxut5e6
	 +n9lhhfkcWqRa0vwpmKVMQkOsJZfNHPLtgzedtJB7KKrYimdDtBcVUD+VJZgUoTCIhpmK
	 dFyib36FaeUWtMNvPn+nefqEdpV0ItttlOAFK2BU6IzMmiC1c50r2w4FkptrHT6RevksL
	 kmTfWaPUv3erk6SmvwlSlV8wzC4xIAMgn41XfJGwiq9I6LGfzJ794rMwCTWEJw08bqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793632994;
	bh=bQ4Chu23QAx85/fGzFUH8lG3BbyilNZeA9i0q4OY2+M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MtlhJzCuJaH1efiqqICIIKtiktEPHIJiJgIhEQ8H0epIjAqibYHofKN0hpFj/Du7H
	 VinHfXbSv1BPacsSLqkGg0f733QcWz76kBnSmKQe9UfjnhBhROL7Z3OpPhMkX9fsV3
	 G5p3fLo4GgXGbUXagIGC3N9FLDeFtxbDS5t7FlAnkxaaXnR8RU4RVQAPLT974MJLWr
	 ZTbyJHhv3pldX9Ns/CMpaulqUMYqI0K+rNP1UhfaGLkZkbIBJ+5rvdGyGlblXCaqmL
	 JMzRgkw/wxWk8nBTVJRdZSa+1mTzgT6PlzAemtdO+W0M9zqE1TmWpZhitKQMw48EoC
	 Sa8rq3+tR3Eug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12029810A8;
	Mon,  2 Nov 2026 15:23:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA4902A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C74B040685
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECebDpIoGVnr for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 15:23:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C55E640695
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793632989;
 b=M9Pch661E6HlXCwuDF85LbnXwrcAyxNOB9TeQaeTIdi7zGK4N34a4Y9kyGi87xhRW/Bd
 1WjmCkM9SB0CtioOKPTWWrR5gU6M7QDOCIWu45MZd/ZO8oSZ4DKdTg0rMiAbZAFbPjFJO
 BnhmL1RanYnfRh5PXiE08OUaE4oLtykYwudF81j2jSqyoWs21BMyKpQyREQKOWuIEwWK/
 vx6rofVYXecDlLiAeCd29pUfW/ZCOevhP4NmTBojB/4cgj8JR6Pk9ysrmb4j2OGG8fVcA
 R8pL1PHqxCj7+NFEUy/xSilMkFwuKKEfuD0kZ003hf7hNuvjB9p5Bljk6ZOQ+lXcLHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793632989;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ILFjUJ2CGYvFQqc0y2NPosCpCAk99DlZWjFqcZ8tZ0U=;
 b=K5cMLbIyrrK9LeYDoq3WO4dKHRdaNddbEORQFOWZlPua6yCNXhWu1fJNXRBzMnYtVDSS
 EzGhDpyma+VsEsLmY2B2xgTqFN9yvBJK8WIq9ZBuQz9jSB2piBMkkdC+2Vhrd7oWShSXS
 EFcqoUW0xK5rO1hzJfsE/HXBvyDCmhmx/Q11XYXQjrevko7cXb9y42fomAAXMH4Hq9ngd
 JD6YCvkibBmpnkt63y2UfA0wAzWmBZeYe7HedjRMIitM6ws5jT5XNzFphDRHXSClWfuCX
 vKa/ROgh0chm4+yt6zyf7AOKlkwJzVARgrEkK3lZfoJEB1VBQrb8O+NuQyjqxslB5rg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=oBxUUjHK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=oBxUUjHK
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C55E640695
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so41356235e9.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 07:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793632986; x=1794237786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ILFjUJ2CGYvFQqc0y2NPosCpCAk99DlZWjFqcZ8tZ0U=;
 b=oBxUUjHKNFMaZi8775NnhLGcXjSt4wpDWlttQ1d2pk7fTd/znKevqjX5bF9XEjfPkm
 Xa38IJekLVMadFsRwry1CQGt1/lAVSdrSbQgwYwaiu06SFZQnk7HJMPrjMcvpQjpAWEv
 6ETGUDEyxd3L2GFqomO+zfBbYQkGVrV3je8ACQ8HSvH0/EZTU4HvSStFra+O//g0NCIt
 C/4aABodyXneebO+S0bt3sWcBCAUisAvnLtnUghggaw4cpcq9EKjIVuGeyQz9rJ+qj93
 plOL86WOId40KqO85Z9bOpDTgLZqb9WW5+yVuwTLcT2BUsTdIyCIK81aVEYIuWfxFxkO
 TE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793632986; x=1794237786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ILFjUJ2CGYvFQqc0y2NPosCpCAk99DlZWjFqcZ8tZ0U=;
 b=l+sGWCzX33Icy2fz2q9igNDJG2V5fa3Ll5vXnCH1KVBiFHQU95ll2+zal1d8AmyCYN
 ImB4rykh12H1ZSpUAef9FDLfGcO6ixDUu/eBfXEMW9JsWctbeZaa49Q0vCffpyn+Xawl
 0hIqCsozspWRdvAkPDaSm/OHqDSZjpi/5t+FiugTDSGM8UUiXv6LJoz9ejvfMGfvKuI9
 IsDcwH0al0AbCn7lhqeYgoDPR8evfNMUA8usrT1IVPvzhrAEnfdRg/ynrd7ErHCKyAXS
 xr9P6+JjbPNmH5o19oWmeNRBx/FzHQ6wv64Sa02EgZd+qmM0sD3XU14v/dmW7NSrd0ZZ
 vkvQ==
X-Gm-Message-State: AFq9FYKvHB42efnqjs98zy8LxHwEH/N4SQuwzsd3VoCKf99FgKYWZxcN
 9VnEicEZCG8cKZVAruluEzF5U9g5hnvH8EGMU1C7TB0Dv0ySt1SsHX5x7zEOUA==
X-Gm-Gg: AYBFou3icohT+lq7smvGaLDRxjogxssPEHdHkNO8zY8GkvopxEnVHecQC1sM6HoTut2
 sDNQ445s0nH3/s709uWIil+tIaxkvR5qNOZn/xKHmZ1sZ6+1+JMttXLn/uJ3NGweZORy4MdFcIE
 HaFwuT/lIFsiaxZTJS4jclC1+ktDQ2jHZFQlSLcsWg5/fm1FqhJZCyafKEX/4x8tKahP1OeeoiX
 vzGLfmLXKbrEeqI945vwm/z8AwZFWAZBK3fEDr9bgZKSBc4EX0xeOEkzNatrHlED7zoEfkBIvS4
 XrRU8/EKrcLmWNro3zF8nLO8lpybp3EknopJPpHIQMzT71l1dbxfkg4WzV8XM3RJWvqftqqBpoq
 5f378ohHjd2UTG4i5S8makOjlqpqySEmORZuNakeAyPBAo6Ocycgr0H41ycIxPBHfinC4YbJugZ
 KXzHdvAj4EmLVCFJUsMfeAFGHbRJJ+UGkV2cuDWZXosRObA2oMB2u+Y6dmntC4PK5gyFTenWGxq
 LwkzKc7EsCUN9M1gWANdY3r6YU4cl13bB1YzT3jp2XwwQARct0T+uk/MWPP3loerK4bQoD9RodI
 d7ZWMlpUv0JryeaQ+W1sz2NlBAHeCXQw0e33e2ny3jd73GtJNH2Ykh4IrVxrh0GtqM7U0v6SwRQ
 =
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id
 5b1f17b1804b1-4ac1793e81cmr254441875e9.13.1793632986309; 
 Mon, 02 Nov 2026 07:23:06 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09cc3e9asm121940775e9.3.2026.11.02.07.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 07:23:05 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 16:22:56 +0100
Message-Id: <20261102152258.1948796-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/6] configs/sipeed_lichee_rv*: bump u-boot
 to current top of d1-wip
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
Changes v1 -> v2:
- none

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
index 0a443b59fc..15d1d40d14 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -23,8 +23,9 @@ BR2_TARGET_OPENSBI_PLAT="generic"
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
index aa21afe5a9..ed36a4d115 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -31,8 +31,9 @@ BR2_TARGET_OPENSBI_PLAT="generic"
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
