Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF060A6EE3
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FAJqo4in;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tkr4fzwf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74151607CB;
	Mon,  2 Nov 2026 15:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baovlxROcV08; Mon,  2 Nov 2026 15:23:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 47743606D0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793632991;
	b=ejuVHAsqKka6Ahb74h6rdOcZ9fxPzzgD9ZffTb4c8neLMR3prVFvWe7ucNW/ff3lORRm
	 pcbXNS2RXR2wMeify03lqdDYkUNyETrFHFzMDomPhEvEMhPHd2rZ1BdIs0APs4PN9pA8y
	 Pc/jD05rDL8g7b+f4PcdYTZNUnxTCDLuYERjzum6RaD+1LY8Bv8qPvVQtHH7+QgT2O0k+
	 0Y42KRqFlQFDB46JWd+DoFyiX4GlznWeQyd4rBMnqAmaNJogiqDWXxISxOHxmXlm5+RKj
	 qJIWHuNWOgm4OcKGYrZ9lp2VAE5eQb/ly9LbgMUKZBv1wGbOhURdEX16FsTiVfTdxyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nxMDzMkNSW9Bruchi/ARmu35ptHpB8iuE0SHwrWjhfA=;
	b=nK/b8ct0JhFLYKjqAeO4XpvJt1Kg8P1y52+t+Eod+a/uFExdZJMpVpvqTCuKA8/FHb8j
	 I1oHzvglC88Xe2KQjMLFysDlWFZ/am81MSNatnWmVMF3y0XbayvB4QZoro/e9iCh0Ku6B
	 8xXUmhIyCuIGCNiYfSzCKfDr2N4CHa3PnX7uBcIGdwqQ1bQ89OGxHnESU/eFPYftNkJpM
	 H5fkyj4hu+UsPegGLeXcmdLI6Ko/bXfGENjD3ZkAFPLwMkIBkawDws7WbcQfzHReKpcAw
	 gQfZ3I1RQHCHuSuSte7MyddBLgvXsKlAr15dhxBz0V0FcLgEhl0EQnxdLkL+ZvrqLpQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793632991;
	bh=nxMDzMkNSW9Bruchi/ARmu35ptHpB8iuE0SHwrWjhfA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FAJqo4inoBgtUWFgY55EwPiP/1b0us6qxe9Z2zzu92PMZkMiMmMeVLITQt8KccZfx
	 fv8GMDFLfSgXa+oF0pIiZK/I1f2TNPcUMdtaXU1ayfAzTxpxVENzxgtJJF3BI0ke6r
	 Ic6WNi36QO2WICjkBFUHvUdI/jDGbZxphAp0qQ1ynHII0YROH39hlOEkIELEcpsZMD
	 JHXL4r92atkmtx9hg1067gBbDVV3pHydLhZE3bFr4TSQqnn5B/ATYCycyfwwitBCN+
	 61d/EtRLItcAn8Fl/jSVxvF4sInEYNZDvVcfhoM3Ba5oWJfFULL2vV1R4xQR/xXSLp
	 4Bot6NQkc4Y0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47743606D0;
	Mon,  2 Nov 2026 15:23:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B04F4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 889CC80D6F
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkanlUOMKP8i for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 15:23:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A8D358108A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793632988;
 b=F4+oYSCn2eAuej4sfT9EwjXeW0hr02F5LF/NtTvfyM9dXqi2JoCumMqbGe6pRAt7kWH+
 U72CgHwaUfPn03RU2WQYiHYLZkTPSvihPx/AFSKueG5k1LDEIcLDiaA047CnikrBfNJvm
 bjpSHoYKzVM3tQz72lHtEHkN26lo1C/UVvQ2ROCNSH6xweiCEfBCxVowERhSS8gF5Yl/c
 6uChEKdxGEenzt8dP5iWNfS8s9ffFWwS/ku1bN/BrEcL2RYz5aRaF93u+RUbFHVapULNX
 IOeAN0l73MrLheRT9fK+wKMDg5rmjA466+6PvGvRNS3CaRfhkaOTaU1h9ZXY5vGY2DA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793632988;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=VNHwzfL33XR4lMwLOsooSSGf8zzxYPkjroUNHo0TeLI=;
 b=ZlYzH4wgVcWn7tyJBx8pg3T9m9RxjeeEM/7S+JaYPaI7PRnzaLvOXgfMp1knkR0o3jM3
 ewjv8ZisJcN6Hjy0K4Fi0DXqzNNyub9iW7IHNBJoRXFb4/LrijwxEld9MxxG0snc7OPqE
 sssxay6yyE8sv9zf561XNoOnZN2Bwq5IICJtJnunxm+MUCWdT1cOj+6z02SSvLEceYEdg
 0cU4M//la4uF0zL2laa+INHqkq2yF5uUTmSW3bkNHELMTJzdvctj7QukF7EYChxV7eQhv
 MfbQnIBLhLUHoEZGThLqsLk6zK5BnYSmyrdq/sLvxmCT8j79ySz7jIgPwpR3fkBDUIQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Tkr4fzwf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Tkr4fzwf
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8D358108A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:07 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so24084945e9.0
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 07:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793632985; x=1794237785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VNHwzfL33XR4lMwLOsooSSGf8zzxYPkjroUNHo0TeLI=;
 b=Tkr4fzwf0mUHvGjIdbjDbt0kITOGyE6PgIztLGLxq/ffeXOYkYVhN7IWDe1SUO5a21
 SbeRN1J96au5avrDLqgRLKiRlIQrYC4xUzW8q0YfDpXrMAjCb2/KydIAY59Nmy7Pzd5p
 dpFUae9nIKsjs1NNLSutSO+gbTMneVcJVySQvYk4n5NvUIbSSdBXz8zwiWPrfh6NVLXX
 9abHRHVK35caFVUuVEZRACvuxn+dez1MJBf2YB/41r6cGfZjX1Zxupjmaxcy4BjRnS7N
 8nSeaUL4GpbFWfaLfEjiF7xXFKtyxm/vyk7wEr1t22uxucplFo53zTREo4L6+irEOPEc
 zBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793632985; x=1794237785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VNHwzfL33XR4lMwLOsooSSGf8zzxYPkjroUNHo0TeLI=;
 b=0/sxTtmVNZ9QaGUubndDHdhCXLFFnCq+6suM2Gh5gjE8k/6qLvQNBZ8lpKF8RMh02C
 VtCDrJT/cw8ommbhErp+jQR0qMqcjiCR7yqkt9DCH9C/uIu984r/g7XESpWplQO7dsuP
 zd5N3iUGsfYea+gIQh65yJcACwPyd9ICCwO+y4o886vJULq1gDpcVhnG1UDplt90KNG8
 /OfSLcRn3C5z2ag0z0eEh0BcaJmJG0Bq4bZYCebNyKmKDkJxi0V3mqAcJ2YnQnT772PZ
 PO9CTdXOL71DlhNGlFMDeBW5KQV63Onox25A6mx7AdOFkf9X+MSSTAciVrO9s0cymoZi
 IBHw==
X-Gm-Message-State: AFq9FYJ5A99cNrAUBBw6ThcUx0k5itOrCy51r2tbvBjO2CTJMm023u5a
 iswpv8I/CQL99lFrYxMKfpFjvA5xEgQBl76/bpooP4xz2bKjQUh92juchH008A==
X-Gm-Gg: AYBFou1/gZ55wu8Uq9r9dURWgg3VzFGPBnGQhxnKrkU4Arv/92tFrRBl0ua5glS+q4b
 B7bFgR8n6y4gbIXAmx0/E7UKM5llG7Zf5GDpZDtU0OZV25x8Lm/rQlBUMFU0Q2NY4yJY60IEANx
 VRV92+P2NgM8ziZCfcaDzlgj4cor9mlrU89m3Bbc+y+oeKovUkAFSjfTQUjX+ytG5SSG5DsY3sa
 6pnJr89as7ZUNMTtjcs9kSFeIeZziHyMv+NsPnvyfsyLZx1jo3Bv8yI4d1L3rqrH1h+emBpj/94
 P5yN3420QfbxVCnPkKqMDaEB2Y/V8TFVxFx+4Coxck04VfLsc16D1MD9ht4O8QEjilvgZM7bjKH
 It+2vfRnJtcZB98ez2SU3s2JAQBr82+sR6IxUgPwNY5zbUpC6BRFmP9XX1CtWvFI5f4YBuVzbGl
 qBjmolWivE8ggtPg9dYTwcL24+k6OtRDg72bMZwcA05fr7aQadJibH6kWzJjoAiX1gBRLjWDXn0
 z+cnFu6sLKvuTP6AYxRiVL8BshkN2eCoTW6p3V8ukb5FQg9SCpgLHP5+g/0izJzXbEP83s8BbaK
 4xwf+M+8NfPr6ST/FVvvO00c3rT32ubE5zFRpI7iGH3fBqEns2csbg==
X-Received: by 2002:a05:600c:4e08:b0:4a1:ce33:1536 with SMTP id
 5b1f17b1804b1-4ac1719112emr230591985e9.9.1793632985238; 
 Mon, 02 Nov 2026 07:23:05 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09cc3e9asm121940775e9.3.2026.11.02.07.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 07:23:04 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 16:22:55 +0100
Message-Id: <20261102152258.1948796-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/6] configs/sipeed_lichee_rv*: use OpenSBI
 1.8.1
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

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
- none

 configs/sipeed_lichee_rv_defconfig      | 2 +-
 configs/sipeed_lichee_rv_dock_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 6ae03df3c1..0a443b59fc 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.8.1"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 5b20d291bd..aa21afe5a9 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.8.1"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
