Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86370606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pkd/MEQ7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAK4kUtW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5599D40A46;
	Thu, 12 Nov 2026 09:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LJ_B1WdORi0; Thu, 12 Nov 2026 09:39:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 83E7840A32
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794476341;
	b=Q7wLEWBL5qxh4Iv85ULQd9y8jGkqSq5YfALxoUwmdKojTnZc0NTKW0kt1pHJZtr9nUrW
	 EIb3XLOWeRc4sJ8i4dmYFOv0/6ZrO5YNeYVz/eJz4JqhXve8dm/5VSeMApzdIkFwJL0Wm
	 n64rMxuuPiK+h4hqqHG5wXgMRsKN5FCeON3X+VbXgdo/o+c80EpdOkWxKAm0T5FzTa4Ir
	 7+XanIl25j+1vjecI6BHAJwqzmydx0Pf4Uw3dirRowuxEzMDeNVqR5P9ryixzsdyBJN/9
	 wFrgFUW0waolPrHSHqncheFNwDTqbtBuccqHft4t9X3wJyA74lX0HuugEtyI32jqHfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794476341;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Prmb4KPKIJnOhnfI88yeIdCh3sDD7vkjHy450eK/TKI=;
	b=iyxv87PwFogr3eU7OkaYYzNdLD6KcwRNejDpzzunuxZX6g8t8leJ/5A+BpHHJWNc11Dz
	 2gEuatZQHQ622hyjbWUo+irMXv4aJzr0MAyAnHA0n8jiaoxBuZXDVXEehCbghIv/SYEjz
	 oWGYKjQVZTFdKhbMRoZIAnUgt5kqFvdbQoP1TiukBRo2722jMsa+mCp0kQjwJO0nyQMj5
	 4i1L30DLu49ReOgED6Z4wyGbAQKeMAMJtziQQNQAYvtkGVS8sI2ZzxnVGJcna2Tzd9KvA
	 V8YUd/0DqmZcrUJzFxHwSuRGswTYkrD4VL9auwTeZwFlQy+G3Igbny465wpNCmMxJYg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794476341;
	bh=Prmb4KPKIJnOhnfI88yeIdCh3sDD7vkjHy450eK/TKI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pkd/MEQ7B4bEala4drYb5HU9BfvzfT4gw7zBAcvsbipJiKZjebQgpKWSjcjm/qfz8
	 lchSB0c3cuxGQHfwC3TZC1TksHfPeFayBvWxtw7cgZ8kWOYgfQoVAA09YMz/g0o/Cq
	 twJF5MnCfGxaMaZcbhXj4PYhzdHSw/bWj6EKw61zFNjzoYv3DVbJZXN8MO1Swepdtn
	 P1nbdX5vvVVx8Mxh3vZD99Iw7m6/lBB6akHYlvNqurgx22a63aJZ5e6fNikrg+lySW
	 U3nS7AHk7wOG1kKOug79S/AwHAkNCsGMyJ6EoFU2cqrbMoz88xWizvkagqPzE+5QSV
	 9LowrwJLmPodQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83E7840A32;
	Thu, 12 Nov 2026 09:39:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDC05E09
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3191816E0
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfPBTfPrpMo0 for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 09:38:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BABA1815B6
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=lAK4kUtW
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BABA1815B6
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 09:38:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so2430604f8f.3
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 01:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794476336; x=1795081136; darn=buildroot.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jhN9gH5WL86MiDLtMReZwKQ66Hmhhko8mBWBtku1tuk=;
 b=lAK4kUtWXaHZgA58GVJQaWC0UA3wnFtkB5GSPwipL9SdfLxkJCdqaoKgDF1+S6WdAP
 zfwW0rA1NcXQiRgJjvtKSWljH1118XGHyrkL7IMpvt5aUi7xDdvjkLSlVP0YpfkvGfwr
 D9C6qfOm6vzcosoUD6g3Ku3/i634Bs8XRR6k/XyHWWDvVcnJNnI26QpTyPpWZwp4dat0
 TDsgUvqGU7cpUOT7o9Rt8b6f5g79aNYwTmMAnHi8Hz8CakSsUe1bafYCONiH/1LTxAN1
 4PCrCUgjv0wXZ1R30lCF7k4mR/iRfFx1n+2mzyFEHDVJBZSN+JdIsBkQqoC8cQY7jiZG
 Lj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794476336; x=1795081136;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jhN9gH5WL86MiDLtMReZwKQ66Hmhhko8mBWBtku1tuk=;
 b=z8xjDzaKq0kbMCpXZzKXu6ypVJfIis1ddXT4HcqxVRgjf5WEnnHKf7f2AVV9HvIGtS
 n+NWkF3hcWPDEGXswxzrJfkn5MrZNU3GCboTyT7M/CDbpGV7xeNsc7pLrL8K1/OOnIwh
 VwDx0vlyYY7O5QLVI16gXelvqcLBMu8WCLjPceQ267HRWddHqw4b5IoZqzrnAFf80PW1
 JFhrUanxqcP2kx3cQuU/IO0F5DKtuVJJx7KfMhsL3mUej8B6h2tY/yCWlRL+nqZWuCIx
 aPynVgdNZIhNredZWouDpnoEC/dT0ReVbAzv2G6x16bOtKZFNcGHgv+r1V/Y+pQU4IPt
 f9Hg==
X-Gm-Message-State: APuU4Z/Wtt3zHeozhA7fWEdlC6Io0XDCV7pysPUOXwUGoBkfA2kjm8/S
 935ugfSIUBDd0cQ8wbTIk3dBZRKKAdvIA9/6apLVSEJIJndh8LBgAPnTDlnDeQ==
X-Gm-Gg: AYBFou02gmZlIn/0gIJyWTEMop1cytRpSflaPAv4lGzLrq87c3qK5kwFqi7FDHlcdkJ
 UgRvAp+fBkol6epBrkFZ8GyLti7LXbJQznLkhEEUAiEW9kuRHcYWbqa/hOzkOGEcZ9z+ex+YNMd
 yhryhWVTMiLsH66lA59hii3yD10Z09dY4mVOZWZB3R3uONsOqVf5dI8U0nDGJgDwdqtgXRsilJZ
 TmDGlMFU50LclLDb3wH0MIBZC2qxEvhJT8KBHl5xotKXLlnsLiA/d0z5I2uamLBbjD5R2WRzZbB
 98To/RV2+dUiATpMQETe6+c4uPVP+sUvnNM819L/x/p/AyAidoiysV2BEW7VpWBph16zDdmBt2i
 X8728a0oS8KysjuLnGfi3TAJYB06xLx9GIq6r4F1L7OnBu2+0LHrxWioMVHlLmd6IMHxsz2W9xG
 yTynpQvo+ilfqJnEx3lhHDT3BsO/6QtFuy1JjcSbPqjut9HJ5Oig+Iltn8qQJj92VjnCUUxJ9Bw
 4W/ilpUlr2X7BJliZEhfwcM9mO6kudYd//7zdqXSYxFQZttx5C4PBYbuOsafUvxIXIyK+DR2vnQ
 sWohqZOQbd3iTJbfhM055J05pDM9St8DjsAJJKudoFO4nNrZeb4KtQbde62AzpnLm01fhTmZpXM
 Zcs0wGaz+KJIDBQIm5wv9/2A/UrRqkBHomtFRnupl+ik=
X-Received: by 2002:a05:6000:4a07:b0:492:7f3b:8cc3 with SMTP id
 ffacd0b85a97d-499c7b1c5acmr8412405f8f.29.1794476336058; 
 Thu, 12 Nov 2026 01:38:56 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c2793sm15292390f8f.45.2026.11.12.01.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 01:38:55 -0800 (PST)
Date: Thu, 12 Nov 2026 10:38:54 +0100
From: Leo Denieul <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <cover.1794475724.git.leo.denieul.yoshino@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH 0/2] NXP Layerscape secure boot support for TF-A
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Subject: [PATCH 0/2] NXP Layerscape secure boot support for TF-A
This series adds the support to build signed boot images for NXP
Layerscape SoCs with the NXP Code Signing Tool, and enables it for the
LX2160ARDB (lx2160a-rdb_defconfig).

Tested on a LX2160ARDB with SRKH fused (ITS not blown): with the right
keys the BootROM authenticates the PBI and BL2 (SNVS Secure, no error
in SCRATCHRW3), with wrong SRK keys, BL31/BL33 certificates are
rejected by BL2.

This series depends on:
  - configs/lx2160a-rdb: new defconfig (v8)
  - package/qoriq-cst: new package (v6)

A TF-A bump with SRK key generation at build time will follow

Leo Denieul (2):
  boot/arm-trusted-firmware: add NXP Layerscape secure boot support
  board/freescale/lx2160a-rdb: add secure boot support

 .../arm-trusted-firmware.hash                 |  2 +
 board/freescale/lx2160a-rdb/post-build.sh     |  6 ++
 board/freescale/lx2160a-rdb/readme.txt        | 34 +++++++++
 boot/arm-trusted-firmware/Config.in           | 75 +++++++++++++++++++
 .../arm-trusted-firmware.mk                   | 63 ++++++++++++++++
 5 files changed, 180 insertions(+)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
