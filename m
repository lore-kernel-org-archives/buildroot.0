Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8FA606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 23:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a1x3VFwZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wxqg3J8n
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE47260670;
	Tue, 27 Oct 2026 23:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwU51hKlwLjU; Tue, 27 Oct 2026 23:53:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E65986060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793145214;
	b=URMGNcw8Wuj7xiFEf9yqGSOJFIsKfbh4V77zEU9Ulylaw7dALUnRHbquMyr4ZsIA3PVU
	 lCU3oOAqNvSsv6Sf7BV5BrxIUkdt/rfLrFTy5fL3mumyPQnTZv6CDPN/3r+CBN0is8SPe
	 1jUDMvIVWV1hUbr3qf33WV/R8V/yYn0hfE9X3v8xM5Sh3R3n7opD1Feo0Cr7UBEX8c5ou
	 /mAOOEFkX5KSth3z/6HoiEaV4yqSSKJctx5AjdAgKJWvPJAKBhbGWXzukPYTYssdW/VD2
	 Wwarza9cQJT40h6xZ12+R9ZP4wZd1nYWu0zyg3/nlsiCuZr/Nc40fiI4EJttit56WXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793145214;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZpJ2jOX2B8NiZc5omR69HNYPg4bHIg0bNmoxYXQF470=;
	b=ZdL1YH/2x7FwvVUzL2xy2nS50DoecXTbWDI/13S5ZttMK9gVmd5GZT1nxEnv5mIQ/bkn
	 Mp+AywtZM5yWj51oM/PNVFRKeQ7uXYhkXmNovBi0bKJckZMkFL4h4G7vEI0assGohsRst
	 aBLsRSUa9IOFrh48BZkgQoAp+3dnyEJN0NfVQfNlvfcUKHM4zMkQiNEr5UxDtUElBs24w
	 WECIfxnSUO4aOwdut06/rriZU88cSB+vS3KyFOSt1+/sLdaEXPg64OHTT3n7W1XZfUvby
	 SG0x9SzyYXjNhqnMoBZ6sVrbGqY5izbfk7/tcMOxXgxtJg95JpjED7slVruO0CRbmAw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793145214;
	bh=ZpJ2jOX2B8NiZc5omR69HNYPg4bHIg0bNmoxYXQF470=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a1x3VFwZJ9fsOPfWHGyY1wqJkMFyZg+iIWr+wzcd7aqmti1GL3R2OVmePN4m91c62
	 dQC8F3Qd9s3luTrB5yff2+qnBzIx2UpV5SJrysKUjxabnLH+1smq4n/B4auZscOIAN
	 jibaunBjd2Iyh17BGYNqandM9KMZnJbIXLAw+INehQum2enFpyL5a1OwGWzeFr5c7d
	 7bv1K8EYHmwrTVIn/BHHKqjgqESYETtuJauZsCgp7KtWqoLBXzUm+s3bYQSnjrcWIw
	 TEnkYIWcxarcC8JlNkCFz2No0+TPKqfNpR+MUthIe+i+SnnONJZOfWJpTO3k0Gkun3
	 77tXoEiWDkU3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E65986060B;
	Tue, 27 Oct 2026 23:53:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE2D14D1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 23:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D429E80AE7
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 23:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3E7ZJ3iW3wJx for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 23:53:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 19BF080ADC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::112c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793145211;
 b=mYv4lHTiwPnAluOtwGoWXBIuhYl8xXUHKtRoXd4lM6A9wmnBWSdVK35O7D1mUWHOVTgQ
 jC9wf3bz+oNO3lidGEcorbSmnFVtp5yVLd9OemZb0qrpJhTUoTx/azyI4Iky8Tjb4ou6z
 XlFRrYlNgAUhf9c40DhHabiIYRQswptaELaHPTnpDVArwZFtY3P/rjbRxpedGxxt8ZZSk
 Ygs9U/NiRSirZzXA4Gb/8pCivwepqHb7IBbk4yWNv8mnEr5MQuwQDCVQP/a5VSyejSuB2
 10Skg6yJmJpfxPlYKwALAHj4wcALPp7wV3fqSVQomn9suo0MCoI5nLzPFlg9u9imLJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793145211;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DGJREExNfrkbBGv+SpXdKFa/14AEFLlqFA5DM1L8csg=;
 b=aDNLlFPFfUHX79GLl8lFry7hjmxmbpEU5Kw+hFsDkknbL8t4xtJZe1qqs3+9JEqCDHsu
 7R6I++UNBTOWcpq2YMzN7WioGGCYZQSPnSt58G9EU+jvxW98R79vcYQduKOXQCuJxvSeE
 xfmOS8wZ7FGtuApBx6hpgV+qOS7Sv54ciwCd8QSuh3KJAlLEYo0TclFJXqeasSOo4ER2Z
 7NAgkG2yf+raiklQeqKc5WerugvFN9GXT0/yJbwRfDEjaclTfreP70J9PspioId2pE11e
 JlSU3h/KioZjK1KlysusVlWwcIBMQsmz7hUN3dtbjGL1OjCrYcOaYBDU7Oi40MmIfmA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Wxqg3J8n; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::112c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=ckhardin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Wxqg3J8n
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19BF080ADC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 23:53:30 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8b06c0794cfso3645407b3.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793145209; x=1793750009; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DGJREExNfrkbBGv+SpXdKFa/14AEFLlqFA5DM1L8csg=;
 b=Wxqg3J8n9hapfEsyyi23I2lY3yFiVm+/uJRPMT7sQ59+POaDJJmodFEauWs8ollJmx
 N5phn5ZXNrUamto6nWXVTMnb4daVYhA76s2LkYGvyhk5OktfjATiDhnpAap8k988qcjo
 o5N4HAZfZiFECH5NlG3sFGLIqj2IW4EmKv1M6gcCdm3xoFcB9TER9AeVBzMi2+OHs2+E
 sNW49Lp76PHBjIRPgij0NbNrYbuZDRKxgW+0LR1d7FBs3aLkm5C8vepsmIvE04noUCWK
 9TRNBBTQqrKK9Nu3BWMtLofaJqbH8PVDJ9jmup3RuqD3BypVGkLm13tXRPvZnpO1k+Yg
 oISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793145209; x=1793750009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DGJREExNfrkbBGv+SpXdKFa/14AEFLlqFA5DM1L8csg=;
 b=kfxPab5WdCAhFtWo0aCzNzzyvpvQej815ufABStVffmpL8ySkPD596mvlGJv8SZD/X
 nhiP1zCrOOGukrOHEuMn9N5KaHzG1RlLZ+6EQe7tHmA/AbfOSHuccYDNhc5wfVGNsNZT
 zvdw31Buwht6zude8tjwN73NWqtoBTc9gHm5nUvFQpu42m6V0kSMD9gR1fmAsCP5piql
 GvRDb2jHybmKXvRQQfrBOC4/awqUhGTdFB0/c218BccAVz45c3a3l6oIgRhCwm3obEFf
 0ZlAZHv0ZtRH1159eqAD5F4MjfSQw93eszdRM6mQSyCI4yhrn3fHx/ehAfBgbqk+Gxmb
 SRxg==
X-Gm-Message-State: AFq9FYIdOy1uK9HjD+Mo4agp48QNDzZwrtHMJ+YRf18tXbcyLcu0eo/Z
 8GRbm5ydM6RAWsDEgI27+2Zpz1O7ZrRM5ZQOAzTI7uaAfXHX4xAkyCmixSZR4A==
X-Gm-Gg: AYBFou3XCdYeiP3CC4gojuDHphhVA+v3r3fB5F7hr82wiXUxrGPAuVvxc6G2Cd73Y0D
 OKPGe+Y7iws3ITVmCu5c5NJ3qsk6RA/fgtaLr6uuaHLSBwJfPwfr4I1ITZsmDs65OjI7nEG5/Wd
 YAE5XrE9MM+oyEy3c6gzqaHrnSUC4p5iF94bnjgOmPEsl2XT2Y78eijw0jj//SQxLCW9W4rNVGV
 1WmVcd8m5KrHnKw4nE5Z/6Dl6h3PLjBze0s9YGaLI8AUSL6sRg5lhUgTk6BwjOlcWRSIzeOtCaZ
 Aj9VbQpqRyn19WW23LLSa/Z3Bo+67+/MwBJOemk0Ci0nLQ/RVGvUnxI1QvTQWv9xvSzLFXUMwMw
 2tKVM1mH2KMYG6+biFH9OCS2zUpkhOBfV+PTTDCZ9JoaKsLF2hKIILL1R5/hYmQTjz10jmA8WdP
 ZRQkMzgwXaaMWY7hpkIVbVPQSC54rg84Zavvht5DMornTX5EsQaIwc0vu58CYQijueDL6ipYImZ
 9sj68FYXIwFPGyTIBV0XvehKl0kqlqiLzfs5xNuCub4jIU966KioFQ3KiW5hNYseZTBejVtNMl2
 YDYBl14bGwTvShUKV3sJXbQ7exE2M6BZdyo=
X-Received: by 2002:a05:690c:6e81:b0:873:5bb2:6c06 with SMTP id
 00721157ae682-8b1b5d3a466mr4540457b3.48.1793145209462; 
 Tue, 27 Oct 2026 16:53:29 -0700 (PDT)
Received: from abyss.attlocal.net ([2600:1700:65a0:14f0:352b:6d58:6839:1227])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b19e59400csm20529717b3.22.2026.10.27.16.53.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Oct 2026 16:53:28 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, Charles Hardin <ckhardin@gmail.com>
Date: Tue, 27 Oct 2026 16:53:23 -0700
Message-ID: <20261027235323.1375-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs: add linux needs openssl for the ti
 sitara configurations
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

In some sense, this should be the default for all the linux configurations
and only unset it for the configs that no longer need openssl. This
becomes obvious when doing per package parallel builds that fail on
the linux side when a "bio.h" or other openssl library can not be found
in a docker container from the support/docker directory is used.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 configs/ti_am62ax_sk_defconfig | 1 +
 configs/ti_am62px_sk_defconfig | 1 +
 configs/ti_am62x_sk_defconfig  | 1 +
 configs/ti_am64x_sk_defconfig  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index a4c35a106e..d98d35f503 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/ti/am62ax-sk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am62a7-sk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
diff --git a/configs/ti_am62px_sk_defconfig b/configs/ti_am62px_sk_defconfig
index c91f3094a2..228c85dcf5 100644
--- a/configs/ti_am62px_sk_defconfig
+++ b/configs/ti_am62px_sk_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.2.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am62p5-sk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 72df755117..9bdd17acef 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index f914436d2d..7ccf94d030 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.2.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.50.1 (Apple Git-155)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
