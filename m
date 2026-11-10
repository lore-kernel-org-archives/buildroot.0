Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1260A3828
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VlC0SJpI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1snZK0j
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B36081345;
	Tue, 10 Nov 2026 21:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0T1AmiQVgx9; Tue, 10 Nov 2026 21:56:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9FC7281298
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794347768;
	b=dVXjMjBnzc74JZvM2LvMXCBuModJGU6qmkON7sSkVPEkxGyx8uMi2ImrIdjtpgslrCiK
	 v3+2caugct3UWe9bwRY3kSui2GVLV0lfgbaZLwKTANDwIvNFIj7moM+71ufK4ofSGba6c
	 7GXxY2xij8n+jjWNMhQ8L8YFCIWWAynZcJyktaE+kTaipVYC1R71jRubw/QxT9t3HXYr5
	 erWYGLzwdpixIkW8cwjmAwgDd1ilv5IKysTDKrKGfkju6LPOtMWwt5agKzOh3ixvycaJI
	 u11r5AuJSEWdF7WyZNbyS03a62OUnb5QyQweEtm9W7KVqmg84wzbZ80cHDboprVb5OQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794347768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=VxjwxiQ63CU/8DvAuXXgfKmpDCgSm2d+Kin4F4jfShY=;
	b=Dg9HCifubtBP0hJyY7yt2Mj5CoBRioB0bBQYkiknpPtB7J+Y0JqPHY5QWe6nHIyMemyj
	 8OHPj+9WWbABuCok9KAOkzBKWBHb4e/fYnqzG1dRoznwQrFzq38DqioKnaBYVA5pWCWnH
	 rprXhKl3uewtP6LiZSklBlaOLeiML1mpSB8WgYuCDQmsgdu6nSa6K38jwAKWYgn0YybhK
	 PJMN5GgADe0zeydSxwAdaswfsPFitRqbRhC9Lvg8bqvhiQfy+M8IR2SJHuabnZr84tW87
	 qdYbWCb0SVZfYolKxFvr1F3QWDlV7tAYFhMBInkDw00vzHYxolDUZU2h9ehhVlEBGiQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794347768;
	bh=VxjwxiQ63CU/8DvAuXXgfKmpDCgSm2d+Kin4F4jfShY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VlC0SJpIDpGZQpj+67V/wA7nqYJOVgY8WiUSsCQT/wRGnuCiCrXIReM2rC7VdpbPb
	 Dnnnh3+jz4NP7MqCM/VU8i5nGbmtsUh2h+l7rVzEYlYVV+oa8NI3Oy4uqGnQl+Oenc
	 yAfzGydhZSezYz4jOqMkWD1x+V9Xk92W/gUuvO7sGc+AUtirRgzHrkAx8Z/acXSHr+
	 iVh3oV5OfhV46DRQhKrFS4o/0sz2TJ8gTgXGDQ5u+FYnMchldYVz/6C3M3RcOLvyFp
	 1uHNIEwx7b0bRCAw4BrBB1G3+hy9/Oki4wzuNrmXX2dsVS2vnDQrT3kcJQQzMxdhy8
	 /xC89HiIffgog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FC7281298;
	Tue, 10 Nov 2026 21:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B8AD731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D8C4402B0
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaswiQmwSWSN for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 21:56:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 481124008B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=s1snZK0j
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 481124008B
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso2013622f8f.0
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794347762; x=1794952562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QPsBKGK2RHvJDq8h5lt9mwRpI4EmOIawavw5M2ydMw8=;
 b=s1snZK0j3Bmw18Acynek+M0VMjyKjU7osKV+N9Hr7voMm5dzlFgGR++KURBuIvPEXk
 tBawL+T5vH+VXpJqrcXw823qA8gJy6Pvio1bSTUgNe1sMkB2jfmMrxrkhFvZchDVQ6J/
 sLfQXLIzpZlLw5/yPi79GK3V0/5spp3PA4YslEbG3YLwMIM6nLWGm214ljWXwclQjW94
 h+LmTILp1EiMRnJF1mW/0FoxAyPRg/HLy0MGlY2TWgEWyDyeFd2gyvtyRmB7Yh2X9eg9
 IDty4pZEv0K7IoQ9VbUywuxugvz3oPQa8cugqpi+zJ0nsVhK6T6UGjOUX2hm+Bz9Y5o5
 VliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794347762; x=1794952562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QPsBKGK2RHvJDq8h5lt9mwRpI4EmOIawavw5M2ydMw8=;
 b=HlWSCyrBwCOnsHjQFWBuVoEDjQK6A78bN/csFFena7KyhsG0IMW02Y6avpiW96yZ5R
 DvJoYYkFDRaKjqTYT+gxqSZJVYoGFZeGMane6L60ZY0ljNVOsRSV2t/oZSXOXXwukO/v
 smJVRIMEDekn+E3On/QXBZVFTACsXPs8IkydXeS/EF8ytLQo+nnxxKi4ZDffoOUqYchP
 wfd0I2g2019w0H2TBEsHEEHvovqAUOi0wWMNMKxN4CkN3ry+3rvizEUbVWV2Q046SMeX
 PGOFQLg1mf/Abw+g3Qw+4dCfdzYO343xIsv688H2V3mSbW95DV8LOv3+E+YhCNJqyPYi
 lr6Q==
X-Gm-Message-State: APuU4Z87lYz1Z4YZn+4DCX01Zfu2+neH3om9aIspLsmw2r/eWgct56l9
 Sq5ApNXIjm9o6FVsr5u3NR1mlazWiyWgswFoI20I5DEy9eLFzQmv89+yrg+INw==
X-Gm-Gg: AYBFou0S8rd3ogdq3eaL60sKTe4xQq3sbTX59RTSc2fyCJvcwP/1M/0AnXEE3tM6+dh
 XDTCuXbSTlu/HBnl2ERAjRAFTwV07tmFj3qhAhJXsEPagtbDv9LxMt64ty4aQ9TodpW5MT6bEKb
 +04CyqBYXlwW+axfEDMo+HJ/jLnm/MllXIftJAJ/Aqi38Nm439cnfDl+oFZh5/g78cAQJTGnCb+
 Tq2u/FssnqLHKr8UaHyT1V8U/itrliasCvznY6zT+X+vgTh/jPmh8jthjQCksGnJEsaInt6KJvx
 I2tAH4QTJgRl+H9l1jbsz5NoLzHvy8E3nca+Am4G96hwoL1DMowElEME5HAo1dEg+ygUVHxvQ7K
 eb1Qgnc+KaGJHVAC4A/6H5qvywcMPARbU9qchEJkkKK3DRm+5ao9XKj7m3haip0o/XFDbQjAR1E
 wDrQLcvwS9Z4hxadZVCKhz+ZIC0oNjKu0cSdyTAQt3J3fho8bU4JqHoXwxjMYKPzaghxmQ/UiZT
 tOWhy/2o5XGLzA5ECvVWpFEtkTTu1XdaaroLk3inSFMca+AcRZqtY6RdvE2x9bMVAWmHfcNrYw/
 VRLCxVo6gc2FZoIlnYLtalSlJNusy+kkkdUv+SEwNuvNLaoefR1u6Onl5ncNwxIJz0zp2ZLzdA=
 =
X-Received: by 2002:a05:6000:603:b0:491:83e7:32bd with SMTP id
 ffacd0b85a97d-499c7ef4dbcmr393620f8f.50.1794347761715; 
 Tue, 10 Nov 2026 13:56:01 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836b8eb11sm7767889f8f.57.2026.11.10.13.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 13:56:01 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 22:55:54 +0100
Message-ID: <20261110215557.2248804-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] configs/acmesystems_acqua_a5_*: bump
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
 .../acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash      | 2 --
 configs/acmesystems_acqua_a5_256mb_defconfig                 | 5 +----
 configs/acmesystems_acqua_a5_512mb_defconfig                 | 5 +----
 3 files changed, 2 insertions(+), 10 deletions(-)
 delete mode 100644 board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash

diff --git a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
deleted file mode 100644
index 6edf3d3345..0000000000
--- a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 5b31f4c692..725b82e86f 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -22,10 +22,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index ed74dd30d6..470ac36de8 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -22,10 +22,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
