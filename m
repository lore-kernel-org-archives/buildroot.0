Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BE560A382D
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SMUN6PsZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJfoC7/N
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EB560ACC;
	Tue, 10 Nov 2026 21:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxtFj_ucl4gJ; Tue, 10 Nov 2026 21:56:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F85960AAC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794347770;
	b=Hk8kXjAs82O0PDIbdE9IwCKdLVw4t6q1QF0nchCFHaX/oremkXtyT0PAx8nuBM1oJJGb
	 mIAZ1fT91FZ5NWSqOVaQfG+2m0X+0H9EQPo0YQzbZFa+Mloxl11rmqdA/ZArG9QKadnqJ
	 DvA2QzhBaakpPI8LZgszdzxO/4prnxOG+I9n/0qHgVB7QP4vv26qHb4imcLCkccMBmIgd
	 r5ZWmU5CDBaYj1ZLvq6Q0q3PyJjflMU2oylfkir+zilPE8U6slv75vXqETO9eTmFmlCUx
	 ySVhh/SD/dP+Lp0sbovnTs4P6P4idN96c4kl4Fehce0Mg6+VeqS4gJ9LuxR2DKpX05Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794347770;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2iAP9VuYuyOZxUP059hKnyQ+csCFXR0wdxFA8aOo3no=;
	b=WRJgHqBhR6P7EKBSwI348lmCmFuccHLaE7hcxkY0bWhG050Xi6oq7nVtnFjOZCsKIOzv
	 KV4IgAgwhyVw1GGarYvpTr5+AL2cbxqXzbOiy3I3pvx1gtdPWy6cViCExl3EG+3A89YyZ
	 nn6PlRphFQy0Vip3AOXdNPe6hYLduolpU7oorOfgZznjD96KjhYBMpdm/iObRoPnK0qvB
	 I9LJPRCCMighRnHDoll+Zxc7ikOgCDIpz63BuE2vWsTl61rWbhuvmZmMtl6GWrhUMQNkY
	 KO+llR+nXIaUd0z+xGMUzJQCFaoM/VqavK6Laoc89DOOlVwApVJDC6G4jfg6FZ3jWSw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NJfoC7/N";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794347770;
	bh=2iAP9VuYuyOZxUP059hKnyQ+csCFXR0wdxFA8aOo3no=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMUN6PsZNWev63ynpdlQAKhIyaXI/ZrWAPNArwl6K9InOHP4b417D8lyIO+1L+4WU
	 6K5xeElKWOvexioBRJY/Xtv90eGRUX64s/O8NUegQB0RZYG7HMxdExCq5ddEgRAb8w
	 blGC20f+tGJ/Y8HOCWrBbjo7RiJXC5rHtJ0Et/6aqm4KR3K/i1tixPc+6e/eO5C5Mw
	 eHiqIgKyF7LU9ZnMkMdt/+zMDHcNewdkC21Euo7GnUAgAP27fjOUdpgrBDgOgn2IVb
	 utRR7TeNp54oJKFW2K84oL0mVOznzckc4N3Hdj+uCYSo0d1oUMfiaxqEJZFFy9gNJj
	 UHVIPlijtDRDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F85960AAC;
	Tue, 10 Nov 2026 21:56:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF6F1FC
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2BEF60AAC
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpWQSXdM-khs for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 21:56:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8172F605E3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=NJfoC7/N
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8172F605E3
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so1699927f8f.2
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794347763; x=1794952563; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5cl858lDbxWvq/ZhRawLvp9omxUVg23VeWyg1/t9iwc=;
 b=NJfoC7/Npbl89d0VPXMs1U9An/K5NblO0xczdTnMzWbl/2BkU3Vt2rG22sPjYEEUnB
 lJINo9whXs/7X2W2yIQDYIvXrTb/CdE6ve8oQAi3onYWqw7yMAdW5+IpHNPd8kjhHsAt
 WvraIQkg8YRHITtSYZ1+662fQr4cI3OgcKymttrWLvgbUWLk45CUvrMnLNtyONByWgot
 Q8Mb8k0oGEYI1YaLqMmRcQep5R3SSFODvpJWfyT/I/tKWHacmcft/7YLObwqROKSJ7Nr
 ukaZ2CeP2rdGktZysFv5eLLqZIW8Lapfi/JA2Xvan8BTsouX0itjzlEVV2gZkRnQMCPB
 iDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794347763; x=1794952563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5cl858lDbxWvq/ZhRawLvp9omxUVg23VeWyg1/t9iwc=;
 b=rszwsB400pZe1ajEtGxvPHmy/NTO838fFzj80omm4CiBZvkTLznG5+AvnysjvRxPBj
 YE1Ml42fkeChWrKFfQftHY4829HxbtoChYCJYQHC3VPXE2iw8wBRqj+483wgafOBwH5t
 hmUen17bCzOE5Z/LwBJwthC5iWrDxp55TUHZR9+Qiy9/dr8DUQLNTPLZt3aH0QPlBrTJ
 37YR8rqalqSCFpGMw4MsVyVcsV9N5zGqhTGSwhbB2dgAMpYHAfzA5e0rC4GY9JqeCQYr
 JAc7O3NBELRMQih5J4YDZmVcdmwbrklGU8XcvY+z59R5t1P15uv8/QcBLyY/GCMrleyC
 3GhQ==
X-Gm-Message-State: APuU4Z82BtKlmQbHtqKfiA1F26z5BBi5tv943P4YODvpNTQFBorjwJJZ
 AY16Oo+YHZ6mmlBoaw2OiHqbc13A83zAKvUTIna72vuwlTxuzlhhu/1fHPri0g==
X-Gm-Gg: AYBFou0QmYazdExVQCa++nwTf+7vRRJ7DLDCt8GZh/06g4jDaBgxBYJVU3eeohSoWab
 w5Mk5BWxr3fKkSTM8Q1oSYCqijWCZ841fYQ26arJATlW7pJH7wHbX+0LO1SLNE51nQbWLlVXxbo
 jVWEbEkfKmBiuI/Hxltf8x0mzhooZIvYfHMsXJsQkgtGUhZykrnzrboozyng4P0jM022tZIdjfv
 MVX444088sU/dTnL+ToPMmv20a6W7dStg1jFMbxDgPcWzl94IS7WupL0JUYCkHZ/62KmyK63oaX
 hcHxQbF5iAZ8glFXzbo9vq2HlrGRtl0bz/roMSZgQfad66abl49oKu4TMFBojeM6DHm72K82BmX
 090O/fhTZy0nSnuZv4GLGoaiixVY87DvU1GI3+zB9nz6gTnfxMMbINEkk/c9r93qcGitiXvO2hA
 cQ0p8utQVt0/be6yIcZ4mfL9mW2zhGDxw6hAtIjYg4gUusY7kjeOMnY1ARq3ZG8TsDBfykDyA5y
 LkSniaJWfgozlcuGxPwM7SVI6oOX6F74MPkgfaX+++bLBIqTAEzSWajyyRzn2zB7qk5Awa154kl
 swBHd/dDfMNjza0T/llp78C1MIqp99fRueplu6pfjxgvm6BNnh0C
X-Received: by 2002:a05:6000:2087:b0:48d:b650:69aa with SMTP id
 ffacd0b85a97d-499c7367d1cmr405149f8f.50.1794347762853; 
 Tue, 10 Nov 2026 13:56:02 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836b8eb11sm7767889f8f.57.2026.11.10.13.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 13:56:02 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 22:55:55 +0100
Message-ID: <20261110215557.2248804-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] configs/at91sam9x5ek*: bump AT91Bootstrap
 to 3.10.4
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the 3.x version of the at91bootstrap3 package, now 3.10.4, instead
of fetching v3.10.3 from git, and drop the board hash file of the git
tarball: the package hash file covers the release tarball.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .../at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash  | 2 --
 configs/at91sam9x5ek_defconfig                               | 5 +----
 configs/at91sam9x5ek_dev_defconfig                           | 5 +----
 configs/at91sam9x5ek_mmc_defconfig                           | 5 +----
 configs/at91sam9x5ek_mmc_dev_defconfig                       | 5 +----
 5 files changed, 4 insertions(+), 18 deletions(-)
 delete mode 100644 board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash

diff --git a/board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash b/board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash
deleted file mode 100644
index 6edf3d3345..0000000000
--- a/board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
index 246d34edef..df5f2b85ac 100644
--- a/configs/at91sam9x5ek_defconfig
+++ b/configs/at91sam9x5ek_defconfig
@@ -13,10 +13,7 @@ BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index 36441f38e7..c9296281e3 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -64,10 +64,7 @@ BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
index 4c2a6255bc..747bb1aad4 100644
--- a/configs/at91sam9x5ek_mmc_defconfig
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -14,10 +14,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 908907acda..dad7e11992 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -66,10 +66,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
