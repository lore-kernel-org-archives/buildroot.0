Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2251606ACC6
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K4Spbasz;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=W9RhI50t
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CE3406CF;
	Thu, 22 Oct 2026 15:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHqKrRylGak8; Thu, 22 Oct 2026 15:14:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ACB844072B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682049;
	b=SJHjcBE7uXY737CtTMGnX/Wx+l2k2o9Dz2EOsa8f6Iih99mYJAgFhMiSGn/mY4aGBkN1
	 3+3WwnzHrtCowxYb7IePyB3NcrF8kRmZ/i+a+D/FTPhss48Ygaf8yyUygcJby7VTpfyUS
	 9LxJya/BF4q5Eyj0UGTb0aN2L8zExIDYSb3CsbcZdxgUaGTf2lop49l8P5r6KK76NSJ58
	 USLfdH02WwABTNKCLWvRU5L6RXTBP4Nm5I31cDVlGvDI/XORCFqnobLITJfg1aRP47AFN
	 KS169LZawgZB5/Xz46edMPOtIDHIEg1jVQFGcXY9wqxNpv5YrgsjEkvmkC/ZC/P8SfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682049;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jLy+iP/cUPoCFf1lTgapqxQZ5UCP68AAysowQOgAQOw=;
	b=rQs7SqDMfs/YftHD/gyn21YxT0yW2n236OgEnZyNg4aKZNWY7VTf+s3wkxTeTJCjH5WZ
	 AxzmkmN11homEKGBW3VESMl4wuyI/UcugqpLhpvU/XKwlHt4SEd4betWEQPBQiAIu4fu6
	 nkcQCg4ru62DaBNWUshZGmR0sIg+IYFQZM9i2h8A8U7akjzpB+t1spVA67v6IvnKPQsle
	 zMeX1UK5La2n3mEp3qBpCgq3QaTjFdp7S4132RIr/z7Cblg8idhgl5YwiTexGU1jm3OQo
	 NQD1hrmB4N5Uw0mzZQiq9ZkWdCUgCp5O7jWWX76NlJitknNrD6UsO+MA6801EtvXhyQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=W9RhI50t;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682049;
	bh=jLy+iP/cUPoCFf1lTgapqxQZ5UCP68AAysowQOgAQOw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K4Spbasza1wMLCgU1IG2epd0n2rT7XbgYxE63DDqBjNVX7wyKu0d7kMnA4Y2kbq0T
	 5wS2KUlRvLBKCPhlpmcywn/lRdwHvVT/ydg9IIcPuUhsfUXC5LeWcVI3fxFdPwgdwf
	 aPwAUVcAWkyNqFngLHAo+lOCeiB59U8CkKdDZN6je2aViIecgfK1bM/U6GQTaNTjYo
	 349EN/82AYXwQYjIXTslUlpts2F1jW41BIiFRbAupnHsBTx9vxZ3s34OAT7Su4LC12
	 Sn3MoXVJS8AntRp2CVdgANVShfFnq4fwwqKkSYmqzAXAFBLmjru75BivSIJO74INdm
	 9GMMTJuZbpzqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB844072B;
	Thu, 22 Oct 2026 15:14:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB4B23A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D2FF4072B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FL3hweKb4LFw for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:14:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 47005406CF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682047;
 b=Fp/C9cyfj6qVO4BooqKXSTGSJle/Bk180TTl58zBFteSLtzV6k6qpTCGeN9hxYDGrJcg
 cp890b/ZZdw01GxtodNA4cr05vv6TbnnZN6ct0mq/4OFwQZjcUUZAPaBhsV/AApZWyTxl
 h9VdFJI2qHBbEHQg7TykEqnP8fRCOXDQN9Vxx5auFWAWSYxQNyT/PxiQie9WFzmfNGEft
 PSpED0fFJlP5JK4EY0k2lySH6T5jXfbKoNTI70K2LjaW/GBaPQRmsdWQl5qU2mscVrztv
 Cay0ZYBlOnwa3mk3b2w/zn2sPRyC/IvwWDmK8k7cuZl2AIydmVNcKhpT3qVgnPv37vw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682047;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=qid1SvMKhj/vkm+DRxwWah7jnWUiQhhn0oURLL5zWgE=;
 b=ElCmgrdgCBy+VU7rZVwXkyP74le+6SPHEF6my3oKjYppUWqV6A9/srcY1uC9RqzZ+Dyy
 MIXr3U4RBoDlGyXcNvqxf1iaNLOZVUpwqV5c2cS1ODyUcbe3tn1/asXjPA4DWHGum+NKl
 As830dPVwddjKeizRVo3JILjXbtXIijBw1sNK7GMrDaQUeNitBGzTBRR8WCWnquIizW2A
 VrVTS6Suov/WXhpK+rcf2d7WcwbTtDr5r4VznZT1OkhHfTYPY94hwLP2HHNyaJcWttSGb
 Ucqnnv/5qVGSAFmqppTjFiA1o8p51ZFXA1bRONBw1/fNtc+onmxGZ4Kl24u1x4WTgAQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=W9RhI50t; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=W9RhI50t
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47005406CF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48dfaa3fa12so777149f8f.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792682045; x=1793286845;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qid1SvMKhj/vkm+DRxwWah7jnWUiQhhn0oURLL5zWgE=;
 b=W9RhI50tkGhJ3BopqPMRqN0cRN3OvxwQk+UZLh7CThhyhyBHZZO6+REzBgwqpu1cQe
 c8cKfOls+2cC5peRrAhujNsZyN02BdczUKb4wtbtx6tEywwoi8QZD5HooFMjLFq09P3z
 hAvmz33AZY6CtHf9LypJkvYquaZSUp4Jp2lFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792682045; x=1793286845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qid1SvMKhj/vkm+DRxwWah7jnWUiQhhn0oURLL5zWgE=;
 b=qtmsIW0i/saASOvfpnISaWYGfijn2Fu+lVROgzGVk06W33BZfDin0lzHerRURzkoQz
 KqCzIds5ShiaP/Vm8I4VktsBSQAbmobeEff/VlvBn/yixanZnRhPs1Zk1IzHzgn9rwLS
 OcNmhAYBEMZjtym+91W7q+aGLchGbCfWsQFF54iuqlPFfegXPKxG4CZKrLWkBJs/5TjH
 ohPDDcS8LYkYrh61Hv77CzsmjFsLK/T0hDXK7gCMTMw9OkMgb8ifQj5xxj53zjmz4D+h
 fVLFsBHU9Z3NewDR2tJfreZKciZXOu8jihhiZugPVONtXR95S7h1cy3k7HPgFyPJoM7l
 oLsQ==
X-Gm-Message-State: AFq9FYLRWVb7bE3BvcBWTtB0b7VileyOCDpqEqKUizzbIO8R1CPzTFdd
 NFSUbuXPRyrDol1m8DS5cRJCdw153b3wQFLOSRjH+rDKkK91riQ0sd2LqbgFAlFI+Odlhp1X2sv
 h2n2c
X-Gm-Gg: AYBFou2LNlCy431UPHb3/mB4+WbCCWV1CedhoF/vlOsXaSbVJTXlFAtYDY78UrsNW6R
 uVeijmCSVrcj271SbKn9ApMVeNqQ6pbWD92WX8zUm3O2tY8TzzKHWscZeYFW7/yR5PGQcjDQe9o
 nVAlP347gF1oYJppNIyVebWcYyv/yNP542rgnuc/txLsnojtdmzFLk5nJglSueXcG0EVbMkYjcB
 ARn8J2LIkYi78xSt4ZTbA4vq52IsT4tIoug3ySaOtWI8668USqRFo4ffpjNNdoIIIaPeZwP8BAc
 P2tJ3N9jhNO9GUIGuCQD71fDgvWoQh43xVtFKbZYhSRs0efIH5/7313lVLtoT+Zf1TrzfdRNpQQ
 5uyM9cuOEMHhYosercAvyawY3suYeF8jyOAbrxqp2atNPSL9inYNNRoQiVv63JlBHrkx7OSklYB
 R1+FZ8wJE3jAk9aVFxXXOGI4scrky7jO0k9YAKxZHBMCAni984XIHws9Fj98CYf5hu2Gp2fCtST
 FySSvPK/7OxrvDeXgbQ2ISFnIGdtNKuAWwRTsRFkD2KQo4f+TkZDzjV+s8a0ojhbq1RCSy4EG/s
 ioG/TkDI3bgEzAJnYWRTnqckW26qoloa9/SfCDcGvdDsGaVcatOhQ7HEnkii9LkZBkDrFfs0JD2
 ofqoeylWT8Wzx6XxYQsKCOIXSRNrPMhhI8zy4bYlnAopS+sr8ItB8
X-Received: by 2002:a05:6000:1789:b0:48d:deb0:f1a7 with SMTP id
 ffacd0b85a97d-48e2d142777mr6836331f8f.10.1792682044791; 
 Thu, 22 Oct 2026 08:14:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25827087sm12732367f8f.21.2026.10.22.08.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 08:14:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 22 Oct 2026 17:13:52 +0200
Message-ID: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/6] Add support for the STM32MP257F-EV1 board
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds a defconfig for the STMicroelectronics STM32MP257F
Evaluation board (EV1), built from upstream TF-A, U-Boot and Linux, with
TF-A configured for the FWU (Firmware Update) multi bank support, as in
the official STMicroelectronics Yocto layers.

Unfortunately, it was not possible to use upstream OP-TEE OS as well,
because it does not support yet, on STM32MP25, the STPMIC2 PMIC and the
SCMI voltage domains, which the mainline Linux device tree requires for
the microSD card supplies [1]. Until this is resolved, the
STMicroelectronics downstream version has to be used.

Patches 1-5 add what the defconfig needs:

- the mkfwumdata host tool, to generate the FWU metadata, and the
  fwumdata target tool, to inspect and modify it from Linux (1-2);
- the STM32MP2 DDR PHY firmware, required by upstream TF-A, and a fix
  for the TF-A build of host tools (3-5).

[1] https://github.com/OP-TEE/optee_os/issues/8027

Dario Binacchi (6):
  package/uboot-tools: add host mkfwumdata support
  package/uboot-tools: add fwumdata target tool
  boot/arm-trusted-firmware: pass HOSTLD
  boot/stm32-ddr-phy-binary: new package
  boot/arm-trusted-firmware: add stm32-ddr-phy-binary support
  configs/stm32mp257f_ev1_defconfig: new defconfig

 DEVELOPERS                                    |  3 +
 .../stm32mp257f-ev1/genimage.cfg              | 52 ++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |  4 ++
 .../overlay/etc/fwumdata.config               |  4 ++
 .../arm-trusted-firmware.hash                 |  2 +
 ...-arm-smc-id-of-the-SMC-watchdog-on-s.patch | 53 ++++++++++++++
 .../stm32mp257f-ev1/patches/linux/linux.hash  |  2 +
 ...2mp25-rename-the-PCIe-bus-SCMI-clock.patch | 44 ++++++++++++
 .../patches/optee-os/optee-os.hash            |  2 +
 .../stm32mp257f-ev1/patches/uboot/uboot.hash  |  2 +
 .../stm32mp257f-ev1/post-image.sh             | 18 +++++
 .../stm32mp257f-ev1/readme.txt                | 72 +++++++++++++++++++
 boot/Config.in                                |  1 +
 .../arm-trusted-firmware.mk                   |  8 ++-
 boot/stm32-ddr-phy-binary/Config.in           |  9 +++
 .../stm32-ddr-phy-binary.hash                 |  3 +
 .../stm32-ddr-phy-binary.mk                   | 13 ++++
 configs/stm32mp257f_ev1_defconfig             | 66 +++++++++++++++++
 package/uboot-tools/Config.in                 | 14 ++++
 package/uboot-tools/Config.in.host            | 10 +++
 package/uboot-tools/uboot-tools.mk            | 20 ++++++
 21 files changed, 401 insertions(+), 1 deletion(-)
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/overlay/etc/fwumdata.config
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/linux/0001-arm64-dts-st-fix-arm-smc-id-of-the-SMC-watchdog-on-s.patch
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/0001-dts-stm32mp25-rename-the-PCIe-bus-SCMI-clock.patch
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/optee-os.hash
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32mp257f-ev1/post-image.sh
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/readme.txt
 create mode 100644 boot/stm32-ddr-phy-binary/Config.in
 create mode 100644 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash
 create mode 100644 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk
 create mode 100644 configs/stm32mp257f_ev1_defconfig

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
