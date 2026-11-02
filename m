Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B42606A327
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y/JdQ1pS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=st8bVr9q
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28639607DD;
	Mon,  2 Nov 2026 13:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyZa4iv3LoWK; Mon,  2 Nov 2026 13:16:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 984E9607EB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793625388;
	b=TAp8bAA9c1x58GT1VmcErcmXb01EFIJGdxrxN3FJo0xb8KmgeqH3d0uon7A/xgzu1SLb
	 WSaH7yddWbk6fdWXjpfJlkcLDb6noVNUffwhN4Y+d4X5U3YJ0aHP8dPB5Vt7q5z1KN4qP
	 Ds3VXnhbIkJSVzdFzZpbDKMSOfB50WtUCJyNTyiySVU9QmNZi5WcyUUXzqkrPgo/m8vvB
	 x/rH2VqFVRs3iBE5bIcnps+DAWAZAf9OT0jq+DPj2kbo0QcG4QQ/mLGR2mnzeDmPjPkdt
	 UguPsZKkQ2F8TujzHcTmLXu/QFafk5LPPa6PsEIAmMXL1sgZXPbU0gtE5T0qz2jrF1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793625388;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=wvpuTE3taBv2jvmU41tE60liOu131Ipa5vbP8Lkz6Kg=;
	b=YpaPtBD/raZpQX/oJKZhrLBZ2IzLX5x9IK7g5Jzri629HZTSkh3xbl3bGeqglmrE+Qg7
	 P46dghChVMLoUozGvVjXgjKV91o59R7Pi4yAvi3+BHhPo/eX9jiM7waBw6RK9xzPsqO2I
	 JvPj0qjoOsMtvSZ/5IEZsZIq8TwtxQpJgDCUfnj0uZtwqN8OfVNeBJsRijOWEI31bV5O8
	 HwmjV0xhpOMrr9CrTvChb+YJyO92Aynrwa1CcHDIWaC+VGMi4rp+lchIE764dqiSU8npc
	 dvVN2f4kJm9CxDW84hlyCtVsjTup4i4OJVKElO/nrEzblkC9W7GZMDWQZDAtO2YIuMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=st8bVr9q;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793625388;
	bh=wvpuTE3taBv2jvmU41tE60liOu131Ipa5vbP8Lkz6Kg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/JdQ1pSuJzzzz/7GwHo8XsvnLvGHccJrgUxfZHz3WTKPZHLpTr7bV+4h5ViUUZZn
	 ySDNqQ8h3/Kxf6X51IRFfTsPlAiQLcp+1VRT3r3sCbTLTKo7A4RhmYGFLQsMebDsDp
	 85B9APM4lC3JZDcZxp2ZlZcvzOCEkXSDIOHKeUykjn2SItu42RNLd9vU3wiwMyLPP4
	 uL1Nh7vdrWppu55buYkXmaRmIGLkKVUn/tqwAr601fBBFLguDMgRNqLhCehSfpG1jM
	 2gvGppnayC634E/lJbft54ZqrQgw+Kja4ym5gTTdHipaywwT1E20oWYjx5FkXDOd6z
	 SvdU90gsx7nSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 984E9607EB;
	Mon,  2 Nov 2026 13:16:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BDF1411
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5C91606FF
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjfvqIPd2AXB for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 13:16:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B9E1960661
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793625380;
 b=SWjZaoZmqwppCbYHiFvV4W2zaVYM71vAwr4LdLWGx40kZBm0xNbmkvm3DE4YaexsrKS9
 i/KCyETywfE3+sH69c1DEM65yFB0kmduda99hVTWH2fbOq6vI2gDRlTdV/S+EqNxx05ni
 gHt0TnEeXCwF8VK6AusqkIa1JroTXDKeZ9vlQErrVQ4ykDd8nJBD6ud53+XnnQNfm9G4P
 sL1icFrcMm+aAHCy8E2PJH0msRCgpIZ0lVTo4/vQgRxcj8T2LsoDpYErA4DTH4qUVyUTd
 OTM02pl12WtpuTOZdr3T/jJ+G4PbrjjMNUHO5xRgTwSLQF//AyFvcK4esXVLZXZZcWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793625380;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=iArOnBtJAilncqk9WeIU1twpu9dtve+CyHvIng0XQoQ=;
 b=oks+nm5C4l1SasXs62dlqF6QVNEimr5K46TPLW4tlWE8KqkaRy2Eo/ZHSjTvMEtijnMS
 agiqJU/EUkqplRKi9FsvrYQEOmUwUs0EUk9T3NmbtW9sgnnwHOIamDo1UK7IoqQifpm/D
 BgNEKGG5hfd2/Pw8LHa4Ta7ua4LleAfX5nOduLQIHdIkuxGM4NIqeKM2PDPJ27JXrrgh6
 lqcF66uPfFKQ3ScgxxeO+yWVVOrlx9aEywuAPFpn0jgwCqHvZ2bxD3jMi2cwo6zYcqaW8
 Hu+XNiTPXu5woSME/fmPH/BETMN2U+U2b3uF7tW61obj4/7kbfKbKak6rWuLouFIRzA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=st8bVr9q; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=st8bVr9q
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9E1960661
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:19 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so18930315e9.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 05:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793625377; x=1794230177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iArOnBtJAilncqk9WeIU1twpu9dtve+CyHvIng0XQoQ=;
 b=st8bVr9q4U9wt1Bxp6Z7yx+ympIJSecHBgCsacmvXIUhfNbFYd4NpcyhTdo6dg9kjI
 /1A25YGiQmUB7uklNsF6CMvZpgFiNLalbvS6vgMgwsnpCvxMPyKTyS7C4S0io8LtogD5
 ydCDMnrkSDn8tyEZEm5HJrRBJzcFNWSVwo3OOVqudCk2nV/UrQHuHz46TezXHDET8oWT
 QAiWM37ryoRI8cy3SGxzVZTU9x6sXnsMuN6fWcq5XDoLBY8w4WsY05YAxF9IiQpqa/vz
 2UdLzavzAzqA5PqF9QgZg3JlX+HPC1McMgWqW4DjKYHLwK5rw32vEOF+SXCovGLM02Z8
 PSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793625377; x=1794230177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iArOnBtJAilncqk9WeIU1twpu9dtve+CyHvIng0XQoQ=;
 b=lHLP1GjhjuTcJMzZdU/I5l1edcMQm4bGSY2MKEgbpFFsGEZ9iabG2CyOzdpr0F6Fwj
 gG+8QV8vJf6ViDUfJV/mjQPL53vtFLiUgKMk6HPza4gChpEYNd5Va3NrY7LGqKzjDCPa
 0+sCZVZj2jPw2b4s76Qi+iMYtAVhc7y2D5mHlctS0/8Zx9rvfU6mUKjeiJLxvlMCikb4
 NK9Xks/5b9TRVuCYS1Fj2aiiysJeODvgP2SQWeVYpXERO5gNtYRsPK9Bj6XY/kyEdILP
 1hRrJLIvck0ott5BIyjnC8vV2cPMfuxaY7c89PBsuNWu+f6q/IcEVgSmOky9hyGQjrYx
 aZSQ==
X-Gm-Message-State: AFq9FYJBUhjMQkhdNxGUMYajpSszKy6qb3XIr0EdGbnG1iUfbDMNZtYs
 +jbfdya1LgoU2WlfWkU9j69GY2Iv+xEeHOh2ozp4zTOMQ8qE/KWYwlc0GFKGeA==
X-Gm-Gg: AYBFou1dxefgwg64C3F0FUaY7rWPiZ8OYjfk9AV6UECzagDtjs0weIMS6mXN/eth/QO
 eHtEr/2cnlXScqoo+L+Vr9Mv+We7XmppWHdSAzSLuiHFocYsN35fX7jH+y21HIxqp2xogiCwEbD
 eM6rg5m7K9Ph9DV9WyqITOPY+Euy2Y5jOnwUnyDBA6KDBLGHTsZ6BuRHHTVXZLfggFfUINBusWj
 mFpSZIsjsJgDP32WV+iZUIkAbnX425hjQjsA+irqTXqVHrK6uIJgGY+HL7oxX0X/CghZd51xc1E
 r4eyIwXt0B3//IVWfUtaVF5G+hP0me8SlRo34Jxlbnhg1vYitpLVLcY5GLEAOd21hP4+252yHxw
 nGkYsp/DrXqoqm56uNT5FgOgAWGIEWloyfT+2PnaNVYMHoT3+0ah8c3USoXsHMaKOjLVcZHbVJB
 47JfsunqjxmepoQ2hNs0Ek3OpZ+DqyRZQwtHrZHR95y6fDCeSxA8ESolAreORrcW+Uwvi5Hx+e+
 s3CCZSZBLnit/WwFuj4dF8GgbofbTzB0jjizk2peLC5EzhHcqRQf1uw45922f/+z6Gq/7YdvFco
 9g8HOxSnZe10j7i0k//s9Ce91ymEv5fRdONfmXCZMI0oVEx0gJA18A==
X-Received: by 2002:a05:600c:1f93:b0:4a3:2f35:38b6 with SMTP id
 5b1f17b1804b1-4ac180f1e69mr222399875e9.24.1793625377144; 
 Mon, 02 Nov 2026 05:16:17 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa81a896ecsm361313165e9.9.2026.11.02.05.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 05:16:16 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 14:16:10 +0100
Message-Id: <20261102131610.141568-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102131610.141568-1-angelo.compagnucci@gmail.com>
References: <20261102131610.141568-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] configs/sipeed_lichee_rv*: add hashes for
 Linux/opensbi/u-boot
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

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

The hashes are shared by both defconfigs, as the overlay.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .checkpackageignore                                             | 2 --
 board/sipeed/lichee_rv/patches/linux-headers/linux-headers.hash | 1 +
 board/sipeed/lichee_rv/patches/linux/linux.hash                 | 2 ++
 board/sipeed/lichee_rv/patches/opensbi/opensbi.hash             | 2 ++
 board/sipeed/lichee_rv/patches/uboot/uboot.hash                 | 2 ++
 configs/sipeed_lichee_rv_defconfig                              | 2 ++
 configs/sipeed_lichee_rv_dock_defconfig                         | 2 ++
 7 files changed, 11 insertions(+), 2 deletions(-)
 create mode 120000 board/sipeed/lichee_rv/patches/linux-headers/linux-headers.hash
 create mode 100644 board/sipeed/lichee_rv/patches/linux/linux.hash
 create mode 100644 board/sipeed/lichee_rv/patches/opensbi/opensbi.hash
 create mode 100644 board/sipeed/lichee_rv/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index a8c1baacbd..40716caa1d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -128,8 +128,6 @@ configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
-configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
-configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_licheepi_nano_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_bit_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_bit_sdcard_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/sipeed/lichee_rv/patches/linux-headers/linux-headers.hash b/board/sipeed/lichee_rv/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/sipeed/lichee_rv/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/sipeed/lichee_rv/patches/linux/linux.hash b/board/sipeed/lichee_rv/patches/linux/linux.hash
new file mode 100644
index 0000000000..a5e2b5fc40
--- /dev/null
+++ b/board/sipeed/lichee_rv/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
diff --git a/board/sipeed/lichee_rv/patches/opensbi/opensbi.hash b/board/sipeed/lichee_rv/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..5e2e695bc1
--- /dev/null
+++ b/board/sipeed/lichee_rv/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  fb1ae61a85e966322101acb1c982f84d9eaafc4de7dd474a7d7546d9bb321c6f  opensbi-1.8.1.tar.gz
diff --git a/board/sipeed/lichee_rv/patches/uboot/uboot.hash b/board/sipeed/lichee_rv/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..7d05185938
--- /dev/null
+++ b/board/sipeed/lichee_rv/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  36db7c20b179f03aa29009565c6b34380d5629fd5c57ed110244594d9930dfed  uboot-2e89b706f5c956a70c989cd31665f1429e9a0b48.tar.gz
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 2591609bce..41e7307478 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -1,5 +1,7 @@
 BR2_riscv=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/lichee_rv/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv/genimage.cfg"
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 4467fcb916..cd529b7e11 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -1,5 +1,7 @@
 BR2_riscv=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/lichee_rv/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay board/sipeed/lichee_rv_dock/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
