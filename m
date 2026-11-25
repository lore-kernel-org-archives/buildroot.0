Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584B606A327
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dQfGX3x+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lXGIZmku
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABED240816;
	Wed, 25 Nov 2026 16:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyQm6hEOSXXm; Wed, 25 Nov 2026 16:41:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A485B4081A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795624899;
	b=dmbyqqXncZ8rWV65dSczNJmxdvO1Bauv8h95uhqUQnih8i9TENOesXg3Z8PrMF9uhD36
	 Hqxd07UEEqrW3lB8z7w/xONzczEJN5a7b2A4itJCYO0yNBZ4dxlGtsbHUlwjWJ+ZyfcK7
	 vNZNBj2W3ylIoDjDzaVINlrDvysNvuxg9WblT4NoEKPaY62Gu0FUXZJolmFKAxbfUTz2Q
	 lccje6cxudBSLoD3b+jRVsWMTYRblD/X10EfGLzVj0ASCsejfsznDLL5C/5QBNVc0CReJ
	 Ylni3iFwyBM4/Ye8S3W682vwo8UafLcTFcjjnO6kkSRPLqYnSRtELQLYP0rUxtKf9Vg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795624899;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=adpYt3+PrxnFr4UFWoqVX2p7+wHDT4VG3afDn1Gx8lA=;
	b=nTUesqx82H/H1ZH4qb+wPYmLRU+r929nesNtVgQty137VY/V1r2AfIs+sXl1yRzIce7c
	 CJCcysGNTL2cF3V6y33KodWszfCkZp/fO7kUc7SE+pH0+sQ2KCiVNvyP2I7raAKepHOsa
	 zDoQiZ+3/4+s9tFmo2ScczWUMk/kJlXl1dI6yhN5uruISr8EyQMuxi6+7GBQhjlrFAUJj
	 BhdKKrWkXkPk0Tjvrk9opuDbE0CCTQQNuqzCaGG/IRn9eOYTm2PAMpFXuZJAte0uRwS/a
	 zKQDsGCzIgeLVvu9e1IW+rSFi8JJj+l2rrtKSIEO+vRLguJka+DLywsiCpkRESLtH+w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795624899;
	bh=adpYt3+PrxnFr4UFWoqVX2p7+wHDT4VG3afDn1Gx8lA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dQfGX3x+Z4l5W6vBNoBy0fsGJtqPrNYJ5VxDVkjVCfXH74DmDnoy65wcBFRJXn7fO
	 RL2YoZqNKnBptqN6ZJu7CjIljWiWI2zSvnSexr+XYbQkWsKG8W+GcnNQrGxRhe+Clv
	 skbiv39EnOincAChcUdK988AURN84k1hm+202pY8aFjiT72x8yyYk01eBn5zJvdolg
	 3r75TanfcLmP8IGvqDSSPRz2GmU4bFn77h3gttxSK1JsZ/gSY1ZfBt4vcNmJ3wuMd7
	 t5kdpHg/viOSYh/Do/OWqkVy74PUfSjGWjlR3MgoAXPPiIJ44wbAvDvrKg+GVmqPzj
	 YxcbOySghBxiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A485B4081A;
	Wed, 25 Nov 2026 16:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09AF232D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3F9340111
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OGBp4egOWbr for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:41:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A1EE8400CB
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lXGIZmku
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1EE8400CB
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so64843505e9.0
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795624894; x=1796229694;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=P1FtzywzG5/iyb9km2nEJSIddCA9ETD1D2vSh9gktdg=;
 b=lXGIZmku98dT8j0wVMxqjnyCPMHRoKVse/Q9iJyUIWz8Pzq2qwa9G23w3cHIEffXIX
 rjkcZCvCb+gI8tZMJgc4fphnGMe49cweVjgFtLF1HK5SMCewQnLe9HMaHNLNRqLplllM
 w3fVN0RbjqOx7j5xTTbhSw/eAdwPCpccGJmUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795624894; x=1796229694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P1FtzywzG5/iyb9km2nEJSIddCA9ETD1D2vSh9gktdg=;
 b=LSGFh0805/tpq4q9oaZPd1Nk+HhEZQtARARtjU/I53yW99Nij3Mexe87xsZpQPT3k3
 +MbIEfP4DRWe/rMiU9JefQrsGHEK52zHMEi9rOIHmUR/6bDC2eRqjkD1ZNZtAjFzQ7Xi
 vcoC7VREozWIZi9PlOoAafMH8mQnljpmhPz4QL6HX6zE1R0GiJ42vMo9Gutay+ssFY9e
 s6TGuYepNgTU6s3Xm1D3ZCkPtJ4WrzJfaKOW3qEfYezMoyooqcSxT8QjUVkLdkxLyDf6
 RBR9vXe04mxtp60k4QSlI8qyKZOO8V1YdgH8MEpD/z34sPZD+jykHtJrQdtc2JXdO+PD
 i6fw==
X-Gm-Message-State: APuU4Z81W5a6cSFG2LByWXjdMzPrpBFAiuq9raQEPsbSblht4NSheuOz
 hCZcq0fuXktfFwZgoeiTZE9S/AQHiqdYyyUua4WhDy7yrmVzuyQG0G3EkpxNHUm5BHEDfsudzBk
 o65qt
X-Gm-Gg: AZFdTZfIhv49iZtQzhRwi8D2CRcL60zoqidLJTY8h7ymW1lU6BYjQOpEZSK3VUyKMGB
 bkeEuFKjpR1mgLBOXYuaMwAit4kxMv6UeHZ/kFPi6K65obkgpzOdCFBiybufyBZEfd7v97E6Q4W
 Y3s+VgcP341D2s4GW1NoRAf0Yalbv6EIXMduFCplnt699SzTuXB8lcxgFgSLe8nzAFdT7LSa6Le
 kfDmV8YypunNZWN/+PHGIm42ArptTOUg5LtkO+svQ4NsidV/6D0hL2ew3qO8DgS+VxnJFoAPfFf
 DkwFb5grHAXy9t6B/EW/26VtMX5FwbaOdEeoCuUjKYVJfTWWgKaUlHxbs9oo1nnEA2z8ixwlMR+
 HdYlTlrKk8wR3NJAsS3X+n3/YyBjL+357L8NpjfKltBYRxSxp+wBQdrs32k7PVG0fLeYN/tRuXQ
 UYV0d4IdlG8MhnMWXl1YzOmVGbtWQDacFQUjmeGgi8UGyhYYu+JqXbULG4Lzr+PizMzjBsWBopw
 Ah+71qARgW3UH4VSkccds9aIrNhKJvUmSEaTgPtSXaAfqMeIAYHIEkuIoX+5ksBA7BZj21+HJb+
 M9whA1dSjMtI7nkxvAGp3oDIwfOTkJ3oZjInl4O9VHqy0dgK7ui4Tn6t/Z2N1zeeU2Dmd4CLK1+
 VAeQKrzNJVGY0pZYUYrGtoSoEeFZJYAVFjvtLdxSDmY3NABQftMbK1xvgS/dK8OrfaLk0WewJNP
 gm3EOc5vh/1XuroOgAyeqQ
X-Received: by 2002:a05:600c:674b:b0:4bb:6847:791f with SMTP id
 5b1f17b1804b1-4bb8880f267mr360295035e9.7.1795624894385; 
 Wed, 25 Nov 2026 08:41:34 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067a0e6sm247988765e9.4.2026.11.25.08.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:41:33 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:41:22 +0100
Message-ID: <20261125164127.863713-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/5] Add support for the STM32MP257F-EV1 board
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

Patches 1-4 add what the defconfig needs:

- the mkfwumdata host tool, to generate the FWU metadata, and the
  fwumdata target tool, to inspect and modify it from Linux (1-2);
- the STM32MP2 DDR PHY firmware, required by upstream TF-A (3-4).

During the review of v1, Kory asked whether a defconfig with the FWU
multi bank layout is suitable for Buildroot, since the FWU metadata is
not required to boot the board [2]. The layout follows what OpenSTLinux
generates by default and gives an example of the FWU multi bank boot
and of the tools added by patches 1-2. Feedback from the maintainers
on this point would be appreciated.

The series was tested on the board, booting from the microSD card.

Changes in v2:
- Rebase on current master.
- Drop "boot/arm-trusted-firmware: pass HOSTLD", superseded by commit
  84bfd2ff64f9 ("boot/arm-trusted-firmware: pass HOSTLD and
  HOSTLDFLAGS").
- Collect Reviewed-by tags.

[1] https://github.com/OP-TEE/optee_os/issues/8027
[2] https://lore.kernel.org/buildroot/20261022151358.2260712-7-dario.binacchi@amarulasolutions.com

v1: https://lore.kernel.org/buildroot/20261022151358.2260712-1-dario.binacchi@amarulasolutions.com

Dario Binacchi (5):
  package/uboot-tools: add host mkfwumdata support
  package/uboot-tools: add fwumdata target tool
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
 .../arm-trusted-firmware.mk                   |  5 ++
 boot/stm32-ddr-phy-binary/Config.in           |  9 +++
 .../stm32-ddr-phy-binary.hash                 |  3 +
 .../stm32-ddr-phy-binary.mk                   | 13 ++++
 configs/stm32mp257f_ev1_defconfig             | 66 +++++++++++++++++
 package/uboot-tools/Config.in                 | 14 ++++
 package/uboot-tools/Config.in.host            | 10 +++
 package/uboot-tools/uboot-tools.mk            | 20 ++++++
 21 files changed, 399 insertions(+)
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
