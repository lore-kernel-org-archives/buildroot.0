Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB5C60A380F
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NdkKZ8d1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BY2Ve1+l
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3252960AC1;
	Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUuzxs9YixA1; Tue, 10 Nov 2026 21:56:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 58A02605E3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794347764;
	b=Qc0EiNvE1Polb8IKz8WwtEVJwpdUIHrMP+46Pr0LMMmIAfgLDBUtJWqRXkSbqXziVOJU
	 PwG6/rMDFO3sPz9/8WIznODXZMQKG9a3vUpEaWNDMTzsMXJZ1lHqtCia9JHFG5V6WPFdO
	 tWIoNA7TtSaz7hgcJ6YtG9RXm6Y92W/ZQ0nmCR/TEDUgsWGh4i5iSCObKbc6ROplTrJPx
	 KZ1f2YNmEmaCCvE2vjrnund+j3u/DCqxXYpS+o3kkA2CV9N/G25rRrGYT+NIuEocnwi+a
	 WjuQgDppNFBhrClABizuFl6vl23lAoqN/EhuRI6/WBvKR7cIW2xJnf2XCFadERmw7mA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794347764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jPkzz5PAB6tT3qzjT2lrdxIq4Xt3+O5GMjkgfiqBxSg=;
	b=OZt2hZj/GiRL7/moEOkFnbsEEg529XBPSrDQya3nB3dXrHQ+vVeO+6Hx60EFJcCRr9qA
	 ww2FekRVbBKbVRNjKu+MBaGdnEW9qBvco8KGydK+E0m+k+2MjeFZ30akoSoTV6AQ/4MaE
	 oU0i2Ejt4xCUHUqxGvnRBKvHze4ln0x2FIB59uix8MzL0ogzRu/JdsgXz668xz2pTj5jp
	 PI71AVcUAPQmIJwzXbKT+6f344cb1MjF+mfqpzVqJhNioRjyZ/0L+6y8jiexK4rZiSfSf
	 NDqhV1h1F9OMa4pY3omODK07uAPSvjKZEj8AQQHUPn1TIgU9cbjrduIzBQDWVw2i0YA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794347764;
	bh=jPkzz5PAB6tT3qzjT2lrdxIq4Xt3+O5GMjkgfiqBxSg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NdkKZ8d1/PPpnjtECBZsvl8cZTftx0hHtriTbd3Y9CP1/DvKpOMbBNrCIbAEBn52m
	 LBk85S2frZglTJtXLFT956pljuApI54zNCJDYuEzhmYGaM1Wbs590jCu2hZIgWeRz/
	 Q1lxt+dJKQczGtxOMXKV2yJgOV3Llaz8oafu5Ek0bGCk9997ZCjLXvyONN9lwxnCuk
	 0Orwmo4gT0A70fODtJ1Qf16fpqw+q5pvfA+JDzYn217vugXanHsHtB1IJmtMJYqI3e
	 /3uVEfPhE3R9b7WMTltYRPmxOAJ2Xc7aRKK335Rec4YG4jFcp3LkOfxoJ7E9Aq9wGr
	 4gTn4opStjKRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58A02605E3;
	Tue, 10 Nov 2026 21:56:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE9851FC
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E015681298
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dYflOe7Tuug for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 21:56:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 039B481291
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=BY2Ve1+l
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 039B481291
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48fd2e38825so1597046f8f.2
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794347759; x=1794952559; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RVcg1OhJjOmbxHJPRw907zw28elcp/ITJc0cURBUoes=;
 b=BY2Ve1+l6EISAkpWmxFhl9UmOPWT/jICVpXYYNB66JdIMlb3AEamQnk0U5D7WEqjGK
 8I9FiXNgqjYeXayB3ceNU16KoSFLigl0AmgfWskbT3qSbu7a5uOiSK4jLT1WKvQcGao6
 TaVFRC0PYXvooVd29kluqOXjWNL4XA8O3SkOTlooWy63sGiH4xMXYxgXQiEZ5qMW9oHH
 DcwG9MLmOSi2SNgjI51M8N9Q6qAxTP+DkOqi/MTmfsB4GN38vUQG2wrM/bdqBhgsko1u
 kkvdoKWgLvpS/ZWUk0mFhFU4PFfnI4PAkCI87r1UnCFKGENX+sddb9qzPUdBCyj7pFsL
 M97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794347759; x=1794952559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RVcg1OhJjOmbxHJPRw907zw28elcp/ITJc0cURBUoes=;
 b=h3/MOb0feJumqpWZ5iw58vFn+4+VZBr9fz7ZeSYO416lNrnl+0aduJxqG8Glqs6xsv
 O/7CEjFszDG0x3Nj4C23+qk/rpxX19j2kbkAOfWZohuxvAM7uFaUs7SpYmmvBRU5nx5o
 tPqEjeYqh0dwlOO8+tI50PpxrD2gRRQ7VRzOVZA6sTdLe5soStegF1J8LRM0Un2NB3Do
 tRJObGUZG7KOhjNK4l2a8CR3nZFjNVyDvQXL72YWEixccuz6dP8xCySL/xTQ6h8BjKPA
 aW9knFKGVHLU1+U+19OTfdIb9gtxqugSdyKwtA009uQk4yrJa7QeXwE/byBNFcMe1Qnh
 s5/Q==
X-Gm-Message-State: APuU4Z/N93mVFi5HUxRYJaIw41MhTvlkLheGVq3MPucE05xvyGYFqXE6
 cjuWDGcv/E/q6C2bu7HjOsPDfOa759g37YfXue1aAFIKmkS8uhqqbiLDHtEHRQ==
X-Gm-Gg: AYBFou2VqB17aMxlgCsplezcCQK2L+t9Picgs6M24GLtk9iNxAQD/ZegkHKlih1DHr1
 ibc4idLeVQNeXWxPn/AF/GaKzzxIUmq/k5AW1JRA/CxI2O8tKCoHOYO0p1sqlJWcS4eZ4gtx5dW
 dY/UtLiMtN8mzcBZCbP9FGbTQ8/ux02RkmBR94ShxY+7tuEMHKNontAsP4P9LyRWX6si8YveJZS
 N4tHNbUFESwEaXIVgPcHf7+ALm9jF69IliLU6a7FDwk/KS/dtToyOxAdldLr32fuqCZm2wFv1uK
 8azxhQ9DXcBKkJd8FRh0Mz2TpHjs4+M02uZyQVvUg20D9PeiMVfh20MkNn1/lGwTXOnxbkKq9Y9
 aewnWODMt3wGaHqHz6pt+63Zb0CKdx9PFB8BNz3D3avu1sGsB5Yv8/nI1G5vsHg7fjZHiKXQCjw
 c+ArVJz3xX1ETrlRPhpqj3KC0pRL73F04YeX3kMNWw6YG7LWf5tyOq+/sPeQ3jg4/2Ks33vzJGE
 j1MHmqqjIvX4Hf0Pitm6fTooAejnZ7qUJ4Z5SxVYs5mzBwNbd1D2LIWiUA9gJTZ2GbT0GRfG/Qq
 JaBAMq9Gr7w5z7b9fG5yfuRaQa2yM3163Afg6IuyT1yPXbC/8nD8PlKghZ3wfk1tbZAzrKW4TA=
 =
X-Received: by 2002:a05:6000:2404:b0:487:27f9:834 with SMTP id
 ffacd0b85a97d-499c7087dd2mr418638f8f.41.1794347759286; 
 Tue, 10 Nov 2026 13:55:59 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836b8eb11sm7767889f8f.57.2026.11.10.13.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 13:55:58 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 22:55:52 +0100
Message-ID: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/5] at91bootstrap3: bump to 3.10.4,
 re-add the Arietta G25 defconfigs
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series bumps the 3.x version of the at91bootstrap3 package to
3.10.4, the last 3.x release, moves the boards still on 3.10.3 (Acqua A5,
at91sam9x5ek) to it, and re-adds the Acme Systems Arietta G25 defconfigs
removed by commit c8bf258e5b ("configs/acmesystems_arietta_g25_{128mb,
256mb}_defconfig: remove defconfig").

AT91Bootstrap 4 no longer supports the SAM9X5 devices, so the Arietta
stays on the 3.x series. Between 3.10.3 and 3.10.4 no C source changed
and the defconfigs of these boards are identical; the GCC 15 build fix
is carried over to 3.10.4.

The Arietta defconfigs use Linux 6.18.63, the Bootlin armv5-eabi glibc
stable toolchain and the same boot flow as before: AT91Bootstrap loads
the kernel and its device tree from the FAT partition of the microSD
card, without U-Boot.

Angelo Compagnucci (5):
  boot/at91bootstrap3: bump 3.x series to 3.10.4
  configs/acmesystems_acqua_a5_*: bump AT91Bootstrap to 3.10.4
  configs/at91sam9x5ek*: bump AT91Bootstrap to 3.10.4
  boot/at91bootstrap3: drop the patch for 3.10.3
  configs/acmesystems_arietta_g25_{128mb, 256mb}_defconfig: re-add
    defconfigs

 DEVELOPERS                                    |  2 +
 .../at91bootstrap3/at91bootstrap3.hash        |  2 -
 board/acmesystems/arietta-g25/genimage.cfg    | 36 +++++++++++++
 .../arietta-g25/patches/linux/linux.hash      |  7 +++
 board/acmesystems/arietta-g25/readme.txt      | 54 +++++++++++++++++++
 .../at91bootstrap3/at91bootstrap3.hash        |  2 -
 boot/at91bootstrap3/Config.in                 |  4 +-
 boot/at91bootstrap3/at91bootstrap3.hash       |  2 +-
 ...conditionally-define-bool-false-and-.patch |  0
 configs/acmesystems_acqua_a5_256mb_defconfig  |  5 +-
 configs/acmesystems_acqua_a5_512mb_defconfig  |  5 +-
 .../acmesystems_arietta_g25_128mb_defconfig   | 26 +++++++++
 .../acmesystems_arietta_g25_256mb_defconfig   | 26 +++++++++
 configs/at91sam9x5ek_defconfig                |  5 +-
 configs/at91sam9x5ek_dev_defconfig            |  5 +-
 configs/at91sam9x5ek_mmc_defconfig            |  5 +-
 configs/at91sam9x5ek_mmc_dev_defconfig        |  5 +-
 17 files changed, 160 insertions(+), 31 deletions(-)
 delete mode 100644 board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
 create mode 100644 board/acmesystems/arietta-g25/genimage.cfg
 create mode 100644 board/acmesystems/arietta-g25/patches/linux/linux.hash
 create mode 100644 board/acmesystems/arietta-g25/readme.txt
 delete mode 100644 board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash
 rename boot/at91bootstrap3/{v3.10.3 => v3.10.4}/0001-include-types.h-conditionally-define-bool-false-and-.patch (100%)
 create mode 100644 configs/acmesystems_arietta_g25_128mb_defconfig
 create mode 100644 configs/acmesystems_arietta_g25_256mb_defconfig

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
