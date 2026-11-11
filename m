Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C79606A335
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tl+HQ35x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fYuwbNaZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D33B616E7;
	Wed, 11 Nov 2026 18:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2k_nZ_JDLsem; Wed, 11 Nov 2026 18:39:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C3EA36F961
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794422346;
	b=ERDlH5Ob0E7LU+/ncBEFRwMxBAQ62bjcQURerxuNIIhFdyffvTxhe742Pd0R7Qr0TNo6
	 0nP3xxt1KUgT5h42oiu5CJvrrx6Lzcws6z92V/6JZw956v3Evdivtyvj40s1ithLZ4IVN
	 aLSvxQOrA1ikzoTxuZoO/XwU7ITEwArTIErgHwhAXjuw8JiU472W5W5QTDTA5hzh6Gh4K
	 j3XbNI8vDH9mwb4tLviLjBV9ZVgJMdUTAEScoMUVqe/y/D1pMV4dnPJuDXCCdINGcXbK8
	 36z8HRbAQgK6lamwxsYIQfNfOuHRW/HCV62QiYtePX5MhMPY4JiKBduEJEDCgiaGTmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794422346;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=7sFvKe16lRDBZSVOOEy0qGRhRKxx5mFPTQpW49tqDu0=;
	b=KpYwtPyedRUBeuPMtlN8HOu9YFyrOVvECCadg/Am1r5gPxWXlMQ+wVEEGRIVH+JpSp9M
	 H/fvRfNUdJstD+4zkQ9uIJu/TCsNDZpBua1R+hzdDbt6JAY2MHVzE2e/qlGPpXvnbC/qs
	 hGZU16paEdhx1VMO11xoOo2bMreaVsBR7znRc9sOapaplS/01UCzme91/q5V3CTXQVo2o
	 OUUZnV7KW35Ri8uwHF+oSS+4aGag9uNNXfCgFlQxXyJIN/41oZCV0J/GqWWA0r3b9jWAm
	 UdNilJaR9TkrYgZ1x1dePe6twaAJuyfuL5s36qo4zgyfi03o4ziH0iGGMPvYAWfDKcg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794422346;
	bh=7sFvKe16lRDBZSVOOEy0qGRhRKxx5mFPTQpW49tqDu0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tl+HQ35xZ3UBd0dKJXKvSnN88KaZh4RDHJbLpSTRvvArcTF/daXlTbLvUM27hpKV/
	 y1bldtHBNiWzldsSxl8D9CYMbYgRFwnV30RSGo2VowkFoVwEgsjE/1NixHv3cvWDw7
	 mOC8y8ZHJDa84xXkgoMRDbgTbsz4WXuz0P7T2RCsp5NIjYHbeijCO6ao9yoquveBYM
	 TnkxM1K4NsFldt3mv+1v55fGi6iV+YGO/Qw8yyrezrEa7yUyobsYdq6n/Id4XD7OuS
	 zqyrS/SZ3NmFol4FevLK5u8PT1yhTVJPN0ztPfkxIjeetJ94RpCsCPQfq3JTYt6WAc
	 MyEws1ZNrT1Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3EA36F961;
	Wed, 11 Nov 2026 18:39:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FC30EC3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DFB34263B
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coT4-MNaK3WR for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 18:39:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EDE3643026
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=fYuwbNaZ
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDE3643026
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so2116904f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794422281; x=1795027081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UhzxtczU0lCKh1AJI73+gtUUrTiblW07wv1iwQyhmT8=;
 b=fYuwbNaZumKLHMM3HfnTL6HRWukZA0glv0HyVoHX3YAXeK3kioLXBE1T6VV3NMVYs4
 eENcOkJwfowWUoUP3Wk5qgx5I59gSmrUHkZyg67MHl8si/z3hLEAAVisoaQCKph5Py6E
 2dYV+PqayjjI+fpy2V9oBiB4/WZ2OJdsqK79pRLSUnS6yEv+7v8dV0K1vgTicM59zIt4
 lRKy6LMwPavR/f5a/dbsCcRAfaYtsqj60ex5FoObODjUmABXih42xdD76Q+lOtopLzvm
 R+Opuvrn5EoS/7UUaeWS/1QbNkOs2wPHXBARYIDte+4Z4Y2Y+g70c8N1ymJD5up3jaZe
 TP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794422281; x=1795027081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UhzxtczU0lCKh1AJI73+gtUUrTiblW07wv1iwQyhmT8=;
 b=Gey8Mcz+8n/T8v8qkfCkxokwMKzfWpoCpOTjF1vTP34K/NjpR0pTIZ8khxptJ18jjz
 HDZs0FeSnVGnF1eBiEg2gAXOPE7snN03jOF9iQE1p9HhFWYwZfIzM4FtV9HgcDTeV5sK
 5tLUVOJfaoFeXH1vTsN5lT/CduSPrnxc+ZPp9U9vZanr0hwzMrEMXrAmjpmEF6wNEI2u
 1bPvqpPhxAI7cFcng8RGnB7waMYJ9d+/JAp/3eE64U0w+w4Pu++iXPci8lfoTNLQ1YHO
 +0XGVbn17KwmOH1xXm/zt4yQh/W9KEekHS5z1j5hAmkGQTG1EKU02XgRsItHgQVVS9UW
 2eEw==
X-Gm-Message-State: APuU4Z+IPMxWzVTc4+okwy3URelRsLuXYROjoD6W0b2XpZ44zUtG76bE
 NJRMD1/Jdc6XqwpBWRxmSm/T4K4dloe1ihjseOEaoRZX94CtkE5eCY9HF+9qlEaN
X-Gm-Gg: AYBFou1K9jq/yZPjwaCnFhaK4s1jZuNX9HqeipkEa0RvA20V1HqGsJx0HGtcKv7g0yl
 cQ4PWBDJK2hYiJ5b/Dk6T3i9xVZB6p8VHJ+lRFHH4cgxRd4QIaiJH21tT4jvdNZ16nMeDeMphf8
 l8iQolYuA1nelq2X94u6nAEDejpHVsYMrmucKvHou01i7BTIpwwSpDf3wydwM36t/7XVIPi2FKz
 /3aLQuS/aNVib6uByS/oxA7I1KHs7gThJwkZGOVtzSCOjWDU02AZLUJKK7dNJMwRJ8pgqul3jtF
 wlJ9n8sDRe/if9n3kJGsM4UeWngwHZZaYBlyL+yxfedMjoCEr/I1M8dLG99utrTXUSCcJEYiPZS
 Jm4SUOtKf4g69fG6iyYO72jwjJqnyzT2w86iIu58tTdeaCVV3emDeBjQJqaJ4+5HgUoWEYeILyo
 2WZOOHnG7hZyOeLs+pYKxo6drGXYWmBJmR1t9GR4Hj2hf6RpJn/MZm+M6qA4iRzbdYC0NxbEQVu
 pqiYx8ThqDrS1Lv5d/IKc3JiV3KicseV9J4Qf7XsPdSbOOzo/ANTvohGHY4Di2xzhaFWScjfWyx
 6ZdquCgm0/L6KFefrm8ZgHeTZLqE/eltaUi/oC4WL1KWUBMRXOya6JRHKEPf6Thz6nPtkyVctw=
 =
X-Received: by 2002:a05:6000:490f:b0:48d:b75d:30f6 with SMTP id
 ffacd0b85a97d-499c69cb859mr4968582f8f.35.1794422281177; 
 Wed, 11 Nov 2026 10:38:01 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988bdef64dsm11007672f8f.20.2026.11.11.10.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 10:38:00 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 19:37:52 +0100
Message-ID: <20261111183756.2235235-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
References: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
 <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/7] configs/at91sam9x5ek*: bump
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the 3.x version of the at91bootstrap3 package, now 3.10.4, instead
of fetching v3.10.3 from git, and drop the board hash file of the git
tarball: the package hash file covers the release tarball.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - none

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
