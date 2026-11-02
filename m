Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42D66070D9B
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ph4YUTm7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPTNVz9F
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD9E98108A;
	Mon,  2 Nov 2026 15:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUNa-_pkOA8W; Mon,  2 Nov 2026 15:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B315A81090
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793632987;
	b=GK3RTW25ToHcdrYt1NR7gqBXD5cKwKCSxhRA6pLvjYWkEfpmo//VrkAvYS0t0cU04pKf
	 WYGQKDgog6hC4PA3mGWuf9WQNnjVGukhOplGmRZgvYo3cenZXCG2eKNbX2XIwZM2yuJk7
	 XcMni92ks9K3T8VCc43JDfe8VIWgFNKj9u56lkR4xN+Ho+ZMibQMVKcEgva3IiLJFGVTB
	 qpNdVc7JUtfwBdONApcUxbPJAvnvgGvwsZJNekswrf4ggoyoFSiUpiUQWgG2s+bviqRqG
	 H9J5Ht9v1qKXKdetybhI1QQsxTYyG/a0gOH2C8fPCv37+oTL/qlxcQKuUf7FE80LjUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8ryoMeLrOLp0LsWH9RpC9tG9xWFZJidAq29LhKVHuMU=;
	b=edI8u66ekNNqj7UbunsngPicVp08AgQny2zWBDYTfZTZqq4qlpisJtC/rQ+HdkD/izeL
	 U+l4eDqU+kPJLx6qesgK7iKYoAchrXKFGBlaG+2dm4/4wpwKvmE3JJ2YgUMMpu+dUdfqc
	 vMxxQGY3SGCwAhtsVlKeHEAkHZ/W8WXQcFUR9XQkQeyyEWXukfJFYeKUlN2isDYfeQ56Y
	 10DCVDTEQ/4pflbeXyRrDSH4urg9hs2pT/6dNyVNqytuVbzX/O5RQa0YNiNdhINF+IpId
	 mFy3RdVnkczs256nO0hRg9f+U7ZtdjLSR053v4m3CSjVzKAiCUSLnZZdlCubPxxfCIA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793632987;
	bh=8ryoMeLrOLp0LsWH9RpC9tG9xWFZJidAq29LhKVHuMU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ph4YUTm7k0fp0TNbR+8MBtd/+vks8E7xuYQSLpyYal22andoU4m2cHKvI5Msu3xiQ
	 lZX/uqLKaiGMkkSMdnBGE41BPFitXz8ZjYrgiOH65fGgS+OUgn4uAfluv26Ziw+nQo
	 i7HM9hgLLY4ZvcaSSW/cjrj2pccrJ9dEMMW0Rgj6ijRETzm+92Ywcr61xIIGKm+g9j
	 4hxUvvaJfUr4MzZZAyq+hK08RK8Yxi0gbrkggtVFNBQrn3+LDeWd7cM0Uws0fxdgFX
	 vNRnUlJ3TO/qKek7z36X/+bom5tBS9pjgZ597fsJsAlh7VDhEmTQjZDMSdLRlue8Il
	 7xaPREGm6Z/Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B315A81090;
	Mon,  2 Nov 2026 15:23:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D9EC2A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62F954007E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JD6DyxGjKvLy for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 15:23:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 641AA400D6
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793632984;
 b=Yn1tTRiYrXRGLMOorjJYuN2rLOrjLDL1JSB7YZNAqP2feVH5eVvC8BMuh4/Yf07sE+tW
 mJRgakYtkU/Ww3uSmHVHxz3TluCKNLSMjdY23qT/7+5YQfzVW6j0BA4GjrVMqOA9w7i/Z
 d9Xy8POkoD/6ro1JjCaKko4g4ugLrSs3Jve+7fr0Y/pHEwtbR7S8DJbUYG/AF/QkocU6t
 zmLk7ktxHZ+les2I4yejuFo8hAjMlCWa5Y9EKbNpg0yO2oChl4YbcfHdCbepi9iYW8vDF
 FIX7WpqxhQe7bLGFsz9Bh5rtSzTS5td3mR258GcE9z1ux8X5tQCc7OIrWw8XGPBWf9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793632984;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=N4XUflZDF/wLaC5r6Llu0gKP8l/Qnlq1Frzpr10WyL0=;
 b=Ini2kPRmz8ORl499chwHwV4I67BVyDMlhx3UlhZjX3iyNKIaUpkilapmerc8kUkeOPlx
 5V/GlwpsZHVW2rHqJytMRH3GfanhtgIdX/2XH9A4H50Ty3+mWpI/7XUHvV7Cj46n4Vc44
 qoY+wxcJSJ/R0zpIEYmgn4chowilhEQB2h6sFfTu+ojXCgTp/6FQWtzh1KL7+CP8TgATp
 G/1kSZsDJtK5cs636bwipGDkBnE4hIyohvKnXXfCxfhsveVdl9S6LmF3loT0D/VImPIUo
 +rrqDNWThg6ylu+LHU8fCD0WUxwcvjWsZU/bfNffUblSKZmjiaurUEon1BK5ItnEI8Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=TPTNVz9F; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=TPTNVz9F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 641AA400D6
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so14555055e9.3
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 07:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793632982; x=1794237782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=N4XUflZDF/wLaC5r6Llu0gKP8l/Qnlq1Frzpr10WyL0=;
 b=TPTNVz9FXGcZDf0s+nJO67HanttBY6LT7PTOBwccR/eGHv/zNyXknxo3+avW8nvFJA
 xaJSjmjnw18PSVsSHbwcN1JvHBWjCnmoVlHeA61AYnhq9nLuRzsXLMCGBWq6ZwDO0mir
 ONme3OFpax8V9+VpUYfQgedULYVxrqyegAbe9URUx1xQ/JKwkD5JZXdTNDxjPvTX+4A0
 bO6J0vJ5YqHMcf+3b8CRjBB1YMK/hmCT4F+DsUaxFWiTo0EsSWwSqCruoR2Oi9Xx+HVh
 gP36JxU7YMJ11Q2jTR5gIIPTlrTtfZ8p2bY3M7vSaPNo6xLS2OII8O5S3y17X0wjT532
 i/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793632982; x=1794237782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N4XUflZDF/wLaC5r6Llu0gKP8l/Qnlq1Frzpr10WyL0=;
 b=pmXT+VgFisZN+OSfhuu+Cy6Cfo5vU8l2Df8elAiUCoCMstKRrOkHpMMTcT95KZEAFr
 Yc+sg+3OxUkDN5V/JsKOoGYDKld6yEEf3YKzQBPbxWzIWI1D/B1sjHg2ykOk/N9+TmvR
 GN1SxPIrnO/hZDI1Cx4PaAvJRIox2FCKJQttk+sT9g0iW7wf8oY8+snwVqrh5K0lhIQf
 RDfDbbqOTkQ0IXnF2P3pDDeBwJOMeUBjWdRChzDTx375yatvV8zIiSEffKpKR0NNGc7s
 f3cu++C1jfFCrh+x++N1EpAe5HOsJUhyKQAzSdeSlNE/qJ/WcK2hGWcK66marPtyr3Jt
 e/yg==
X-Gm-Message-State: AFq9FYJv5LMKNoP9qckt2eu/c7/2V4s6F2xzIMbxMoMP3GQFVIUafmh9
 tkL7nMRJMX8MhjyH+KTqaN5VIhE/GVAib+a8JTnvDOZMHFd/ddVXr6iDTVk1Dg==
X-Gm-Gg: AYBFou2jjEwMcn9tcblm8qDoiFNagRi4/S/lnIP/Kj6+juvPiKOEK16TvvTy1BToJ6K
 6S4zFj/pm/FkULDemxL1TQHyxpQ7GqJEWf60GdPHtrjnWchNAc7oD2wRybExGz89r4SKJ/VCi/i
 hQAM6ilFRNa2HI1HL7BYQ0ef67ruLA7OOxaeho5DZgAARiBVYikuzCHZJuHU97yW4Wv9bglA4Dl
 5zY7s5ahTzMMVjyHqBdeSwYXSwDZSWCwmfVoGgHIpLt9E6lC2lI35UebIhutOnVDWGDgoQE1h7M
 8o8JpZd3vGr2E51SeiZ2gxA+pordRNqARnLcKxArpQWBMSWof6gJeBtZRsmMyzVrJbYZhUO5qHv
 iNj4mmHMz78f8ZKBR4ZZ1ghdPmLVo81Cag3M3R9Nxp7rqEvv3p2IPuyuHlVmf5evqTxSnzDH/GG
 L7Gd+s/g1txtBxO7FEvcLG35E7Z+0SBQo4FcNmM19DQgw04jwoJI7Iq0K/tlIU3uzu/UPpu1W0d
 792VB7edAsKgTqYVk5AaGChWExfGv+Cuz9ZLuJaHppWkQ/vjdm90PNp+8uI2ioC4Xj9SqF/WZoa
 w7HOlvv0I2Fbka/coS7RT8EPQrDRm61A3d4LqYsUR8XOWXuoXEUxQNxpmec9IhMtz1CiPbSGoQs
 =
X-Received: by 2002:a05:600c:1c0f:b0:4a2:150f:1601 with SMTP id
 5b1f17b1804b1-4ac1709a7bdmr243116045e9.12.1793632981775; 
 Mon, 02 Nov 2026 07:23:01 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09cc3e9asm121940775e9.3.2026.11.02.07.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 07:23:00 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 16:22:53 +0100
Message-Id: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/6] configs/sipeed_lichee_rv*: require
 pkg_resources for binman
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

The sunxi U-Boot build packs u-boot-sunxi-with-spl.bin with binman, and
the defconfigs use a U-Boot fork based on 2024.01-rc1, so binman fails
without pkg_resources, no longer provided by python-setuptools:

  ModuleNotFoundError: No module named 'pkg_resources'

Enable binman with host-python-pkg-resources. binman already selects
pylibfdt, so the explicit option is dropped.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
- none

 configs/sipeed_lichee_rv_defconfig      | 3 ++-
 configs/sipeed_lichee_rv_dock_defconfig | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 750d2d6e3b..5bddd0360e 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -24,9 +24,10 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lichee_rv_dock"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 8c8dd2771b..4d1ec159d1 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -32,9 +32,10 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lichee_rv_dock"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
