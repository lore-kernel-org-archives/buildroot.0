Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E387606A327
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BN0Rzb1Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+L0AewP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 390DE6065F;
	Mon,  2 Nov 2026 13:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFonOgmg1183; Mon,  2 Nov 2026 13:16:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 51AF2606D0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793625380;
	b=B3Lh3jT+kDfrkZQpZMupq+xF2k4mZa0xcJ65cKpIoBIuWZDrOBbJHWqMO9rnAtFm6lsk
	 jPBpo/TvPdOQdW7E+J8f6R3YTjbxR/1aBS8u6CrV7EE+guiik+f01W5u5ib5ZR2WZXah/
	 xuprZsbostt4d1mSDhmIclk7lAkJOVloCEoz20x3WSbVFaEhYJ4raC0JXhQyl53B7GxbP
	 z+/IU09Cjh+78Da6s2HK3qE+V7Ex/7icKdHwnK6brIXo/+SMsly4KJAh+rsTelLBauFYe
	 DkRJkrB72xnU1hJMh1ezGWSIaJv5+akmAGfr0Av/VUdaKT12ofM85TVV/9GmpsVQyOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793625380;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VZjBVPd6I1+diB+thut9n9Y/SKVV7GAKb68wPNfPayA=;
	b=AXbrvzbTFq0opXKF8GRv4ggGqgvZqg7XCg9apiW4eeFuG2oL6QCFqmh9ezQzxm6THCnq
	 YUgkNyjeXCJa4PpX1HvMybNKUFo/dUKY17Ti2Uo89zQQPf31luwdpg1cnRphXbVr5cn/U
	 wmdx283a4EYqbCcyOms6PyyEegM7N4aYl0XsGAOTkyRuL8+ppr+AJNg+ru33KwYfqGm5r
	 5E1l3NleSe2jsx0+uWTooJCAAnPPQucE6a7LMnL7fi06nq/flSLjNsCzX66Tpj/mVaMUm
	 5HZzrSEfsBOvtj+wNj1BmZQH+K86HDqaj60kybaM73OguAZsbYywne5BOnwXi/0Ol0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793625380;
	bh=VZjBVPd6I1+diB+thut9n9Y/SKVV7GAKb68wPNfPayA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BN0Rzb1ZKl7TvVb2JlimZxCuu8zfmyK8N+q0/aOt7NMp9bzGoBMDoAUVSH4RdDo5r
	 dY5nsv48JeyCEQV/2fKUcCxqRbchriQ9K3j16UBQdbSlfsJCClXQ67+us3C4HTxeNm
	 bZbJSony7lZH3hv+5ehnxqxM8m+LSOzPwRIbJVVhn3HHMPeI6hk4sT3xhQ5msGlGKV
	 pjyjn1iqu8oF2XPQlbkOgUJayza1mLniB46fNyIjPmMGEH10f7CzvlnHDHfz+YsLQE
	 jS2X6Nl0SLkeH1/3wbsB52Ix7uhoLoskBXx1axDbIvdXq+78vyJ5L2S/bHcU0bCsww
	 cUtxTkxbH1n+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51AF2606D0;
	Mon,  2 Nov 2026 13:16:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99AC2411
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B363400A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjC5s3vTd7og for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 99F5840050
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793625378;
 b=D5lqjFNP+N1W3d2Ba8HaL5/Kg0FX772KaC/ncH17Kx0VjqVtO3rEOGFTl9jRgG0rzLX9
 5szkaRRbNT94AaV8HGa2PlnN6GOjDwTMlvirX//lTn7rIjieFYAORocG8maI9cjHF24Ux
 TSkjNF9Aa3YsftGKHic/21/xPxmarZ3KKFWY8euOGGVsc5lPmpB/DOz2yjWUO+a5cXK2h
 FaUucQnxGlQ3XhQT6ZXE6gfWU8Fky5eUcWSsKJcS2TPRfHG3PLfNLNP8jqNjnujMSJa4m
 xNP7Mnc5DjL2js7QBrsr9sV4LHwFaWREXB1tTx0TjDQil3xsEHWZiK4/FdgGeiREMMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793625378;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=RRvmloRN1MNU/bcnbYYw7TRzZme/FZWOFNe7+OPLcuc=;
 b=RWmXArAz1h6d5D4Xsgx5iWrKVVCwOED38LtOIpjjaV9K5Y3osbLUvZ/nNdre4J9sCAJQ
 Vychfsehzf282izPMb7+0PZJWE5KwLJMo4t90WOeADA99BRBXLDMloGohVeW1L+Y9rAvD
 RkdZ5NDWc+YWOW15sb7x87oY2BIN9kBQ6ply+5ped6fpmCGdgUnnGduhV0zTeucIPZFs0
 kqWXXFFCr9hoUAVa/Ycz/bR0AlcrFrddV5Uk6tuUTMme4XINk8GjBti5udijgHpGvw1OT
 1ssLbMFlfnFVT7N/BPPzTVPQOARdVLzLqRgVvzJEbxd/nX6bPrz/NL7R9EGrq6YdOXA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=N+L0AewP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=N+L0AewP
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99F5840050
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so13075685e9.3
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 05:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793625373; x=1794230173; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RRvmloRN1MNU/bcnbYYw7TRzZme/FZWOFNe7+OPLcuc=;
 b=N+L0AewPJLBnSb10qukZmgeV0dbniGRDolJqNomt97L7IpUD3eXH6yboHWypxokpIT
 PxBA2VsEbjF7hJQS74ONJoq+ZCVHScJiDrTTMk0iqIC1nJ1UK8+rEnR6qa5ocK70rInl
 p/AvFTx4yi92Y7x1GxdnxM5Ct88QuxLaOyAIsBEnELJO7UVG18cBF1jpu4KoZSf0Ougi
 nDZsZFaLXLXN/gIFQy4oN62JuzRi9h6pQXv3vWB6Kqn/2GVH85sig6jvhIEv4YjbwRqe
 hC/MMl0dOxkj5LLYL6cvrOE2ZoWzmwyQ19NQx80TnUPjsV9r52+GtdT00ofePhYvxqHN
 pK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793625373; x=1794230173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RRvmloRN1MNU/bcnbYYw7TRzZme/FZWOFNe7+OPLcuc=;
 b=UHTmdbwPnZLPcsfi7zrVCyKIFp+XD2l/dTbzLO73rlRtdpK9ptczPZ75tann7aXw+o
 rErC2b6oOdirIAnE7WkxCzGPHJpn3R+cy6t2wkDV2xF7p94zbz2luH9rouCvilNwUvdq
 OudpRNhFm+kEyIQJgczYk/FIbfs/Y1GCfEqjxYsMhIo0ZM00YJ+0L41gjApdFp8A21al
 ElJjOmhwCuHkpQyfm2HL3NAKFZrc4vnE6m90uZJbOo+ps9YGs87NvyDerzRXVyLBCmTJ
 rnD9dPf8C4ZwlyEXuQbsKCKInswJeBykhiGQkCZD3nJ3XLkA4crSeRH8U2ehA2NbUbo/
 eWlA==
X-Gm-Message-State: AFq9FYLjVoVIewUDsvA5rqOutjpI7nMtuSnzxaoFHnKCRCNICY6K9DSk
 zxnyX56eognnm2MTKk05uyg0LaeA/9JQ6lZeBMgYupB1YRvKFnBJ7HXmUiYhQg==
X-Gm-Gg: AYBFou39hUDzy12PlT78jv9YgmTB8DFg+MthDqBU7DA97rnfvtul33eVoCwZCuQCnfX
 U2R/b7k2XMnJAd5fG7UcoKAlofevTDEDXeWFsLtD8Ec0tqB5ahoToWnBJBo6YAl/iInE1JQSeI+
 n2aK5HGKNMkOSYLI4sgS5HZyflJQclmNInn5fcm0z3v/RHA5sNpvW8qt832CLmvzu+L4UkB3cHd
 B71+H71is6sBoxpINV6Ppogu31tMCGngCp6E/M8jnSmCFeoP2V85iGz4mEk22hSD8uskREiSfZG
 QyNNLOfCMgdb8hZX25rEv1Mo3ptz+Y0xhMzaKMntf3IbhTNGYtt6dmmIFh9kW9+2k5FuDA/XRn8
 uHUDrciXCVRxG1jTaXab3omf56y2H0NYCHOMoR+i3XAQukriN9oETnfgE6mFRUWIwkDaWCr/6IZ
 GGKTDDeywYwoEhk+ydkyNl8W0DWLjLJfNXRlAUcDPIah1XZjm8UlWQsCwJ/SZf9B2LJoNuYZjkO
 Jpl/EVwMpC/cAKtXTr008zi92F1v8cstD2kdUws8UGSXghIouoc2HjeW6hgPrzj3BI+INxi3hOE
 BGDXZnkEtihjU3jryC5Wq+npruyr0UKvLnTBWiEL7adSHedsRkaEvQ==
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id
 5b1f17b1804b1-4ac17b2cdc2mr231495735e9.27.1793625373022; 
 Mon, 02 Nov 2026 05:16:13 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa81a896ecsm361313165e9.9.2026.11.02.05.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 05:16:12 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 14:16:06 +0100
Message-Id: <20261102131610.141568-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] configs/sipeed_lichee_rv*: require
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
