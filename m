Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DAC606A326
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FnrCYb8k;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IubpQ4ul
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2363B812EA;
	Wed, 11 Nov 2026 15:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jua9u3CuFT8P; Wed, 11 Nov 2026 15:46:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DFAFE812AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794411965;
	b=nmiYrFqvh9vK9PfiKljlVZHdqmZ7t7+baH61iu9FPUIoYZXt+PvIYacckTeVXibd4Yvn
	 xdVhcVvLKtecYGD2adptxbRRo2XXB2ERt39JLFqi/qHqgUdPhJZTlDPK8wfaJ7uXbEKD1
	 r7ST21CKtjJ5sDiumfrcJt9KGvc4yA9Ld8CXliAn7SmpxtrsPw/VIsqzGnL7kuYe15tD2
	 1KC7LnhPxEDa8nLbsuWkqgpWA8xit5VmzlWD6J3jrZqu99SMWM5g1gXCbNojyHyQSbLA5
	 BZrFTO07zjlEwFV6dgH00vUxoZGZ6Oxk2un0XrhP4upKnzBXASHSyWPto2ePzfuEscw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794411965;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Yp12jr3DdH3+uLBDiICTlbGmzcZ+nRTukyPR1TUuowo=;
	b=TtAyFQrdcbBEuLcPizxVYHbbfKneZa2VNEKBAij8Vo2mTaa1KvvxmDrFapT7OOAGBXex
	 t9syiojDQ6odFECgcWR1xhbgYxlCDxZBPVIw/lmzI1R1JFBAhXZ/4z1HtQA4Z1z6JSWQm
	 PeZ8BE+V30w2i/1ufgFOXCEuTuAfaBfwuRHtj4OIS7uaKX/2s5kqStXRDxrBsNzLgw+zN
	 Nnl+rMHSxlvmrbJvkh9+9qUGIb9/hdw08lGygR91wByQycmxlJ3HNFcRQCC8kihitjUhJ
	 HTNrUFr2QMO/ipLbZjenKMijhjiLXv6KvGhdQEenKT+Yktu0mV7W/RmdbymUChXNBqA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794411965;
	bh=Yp12jr3DdH3+uLBDiICTlbGmzcZ+nRTukyPR1TUuowo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FnrCYb8k8qsVj12goySuCp8lKdvvIdkhzIKzb4qsGWE6f7TNevLa0CUHyE3DH+eVn
	 LX+IyU/8au6ltbhdIS/YkFrXQQi1LYROgiD5jW0lRcmGPgzq8y5LHnZpCNF0vPCBDs
	 39/zgosGlHVVmYan1nvGUeEGscIr5c7jAHyoarskZO56G2Muf1/DpyAwOVbb5xFzsJ
	 S2fTm38XVBtW4NYiesngYbmIkljc4pbXJh6L1sjgvTH9MQk5pm+HlMkZoLQ6O/JYxt
	 igEEUYhhH7+Klie/yh0ils7Tp951BtADsSbZQjat5tPOL+NsAJM1havP6v65x1CoTT
	 P7j6pxP/qt4mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFAFE812AA;
	Wed, 11 Nov 2026 15:46:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE58C2FE
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D391E40892
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFJre4IoFJTi for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 15:46:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A07BF40891
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=IubpQ4ul
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A07BF40891
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so40278935e9.0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 07:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794411958; x=1795016758; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V/z7l/YqhhWV8Ypupep1ymDF175i1VY2bjqju9i1ZaQ=;
 b=IubpQ4ulKfZkix0GH7wY8ZHgT40SPsqK8WuTpG+gf8cDoDeURf+0PrN+ScIVwTAbTi
 hOVjk7Zn8MRlUJgWhpBA0Psl1mPnjoKTudsGDQSZhYaLMa60OqYUm+ZoXZJ5lVr6b8+p
 CgE5f4UoNm58vWaN1bo2bJ0SK9qE2eAlaJNQRv/dXjdwt0B0GTcb3yT3lJmX6lgHOrYG
 e+Q5Cb05MQL6RH1uKURCR9EheKL4b5MzHnaHE/uscoRalwdgz6yrjcDsrW2xzAMmD0D0
 027amCwM2CUO5E7DbalUiPJY2FZqELZ8jV1XkZ1qTB8dyCnu5q0l2Uu35hx5XkGPmlN4
 +rHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794411958; x=1795016758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=V/z7l/YqhhWV8Ypupep1ymDF175i1VY2bjqju9i1ZaQ=;
 b=WTzm1EhFSX5uEP7aGmmC6/JcanqaKhjpXUw5G+om9+PFyHxTCrmTZM9G5fp9RsRe1q
 PPxvk6+Zo3hp3ZIuPS4tcHv39ogRpiMKLsRLyK/Ls9P2wSKPobfKdaRWQHaT8H9Gojz6
 M3bGxIKHxQDhIVORVxchFRtBlMCX0QJy5wWDxS7AfMgIQ/RYpc2zH3DpE2YitlMEHX0a
 aFvjjmf3a+IH02aOrS8flogTwgDNcEGa0BDv0EKcE79rzzJZPsj8xVgzG//pOyXcD8yI
 n50PTJIwEX+jC8bYGbmNR0e0D4mv6Tjl5K2Mz8gy6SByYvmzVhGZjTh2KLhBu9MWySZ5
 +P5Q==
X-Gm-Message-State: APuU4Z86z9sEGD19w9Wd4Ibk/Tnbp31JX16G8EnomVKNOwTPl9zV6wAy
 N05SLRsVVvTQcvxqDASO/ud+uuvZWIZir3eZ5sUqVLtA06Inybv23h4Lgw+UlkGv
X-Gm-Gg: AYBFou3oTXYdlfHr+/55PZoqdExdjpIQvNDOUPclxpnAjterzc6IBp8btmXSoKhxzAI
 NpaprHA0L9S4F1zk64MVMNzYqeJi2Z/6lk7T/ktba3xpEc6NMtWQueBAxruKOXhHj/7MH4MZZD+
 mwSFQoL+MoLf9dMwt9ZrUl2V21A5JnIHFIBy0co/eZegFHwauKb3ItWb0PTqniL4GLq+oWz8bhB
 A0n8K9nH9KFjerAlOTxaerF+LWV8K19/rk3OC4HX23Cot2nSpI+2qb1DwL9VXMM1uc7B0LPn4j1
 H2X3uzAP1R3ZBR/XOe0JQfwEIgnuPk4x4ToAyiOMdQtW674tes5y8NhkVByTUqhC9JD5DTtVkHL
 BDHVjz/acE+6aqThhU+ZyB8PYkl0Dom36EN2mBXUf9zAbdjjzyLfLVg3MbnUvnunmgC/osP7U9W
 seKMZZJm5/FocAWTHNoJDTyxjoDpm0nvkpfNw1p7A1TEM2Oiq6cCYZtwGqNM9SA8lCC8536Ijc8
 0+d6O7fKDezCBcp1Dr3YIfcfGiElqq0xHyNQyFtX3aycUN9UeRd8U/DP0NthgMvUOKx+78ZWrth
 28fXIPY69+jD2U6HPRMf++Bf5AXj/KuDHXFTT4Rn7sWFDj3ZmeZB3A==
X-Received: by 2002:a05:600c:5251:b0:4a7:4697:dae3 with SMTP id
 5b1f17b1804b1-4ba0938d96dmr50155225e9.24.1794411957817; 
 Wed, 11 Nov 2026 07:45:57 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c53bb94sm4574095e9.8.2026.11.11.07.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 07:45:57 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 16:45:49 +0100
Message-ID: <20261111154553.673632-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
 <20261111154553.673632-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/6] configs/at91sam9x5ek*: bump
 AT91Bootstrap to 3.10.4
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
Changes v1 -> v2:
  - none
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
