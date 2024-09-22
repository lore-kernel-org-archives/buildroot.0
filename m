Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FAACF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B1BE40251;
	Sun, 22 Sep 2024 09:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Lh9ohQa2XB6; Sun, 22 Sep 2024 09:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE0640252
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE0640252;
	Sun, 22 Sep 2024 09:23:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7A81BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0016813F3
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxJlPM9nuTTd for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8079D813F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8079D813F2
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8079D813F2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:23:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d13b83511so404273266b.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726997012; x=1727601812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ty/EYWktv0WorJfTSpPoKL0GFCpkdqCYBCI8fOM1hKM=;
 b=Wkb2xughSYswPIfCdUImcuDHZCIym+9/UZvdjCzqDb/M/q7m3jm3I+G5UkcI204rHL
 kH10iE9QD8BKi22gMfav20qasI/+Gqxq2omXzQ0t5YYEObSwQKHjA48rNUkxCTqQ8obg
 MWS2dIji1qebodf7MVnohycp9PxlsySoeMqmil4OrJ3MibLEm70tzT7pRL/3/VpZbGSy
 28GvyTBMaJYCuG7xUJWLi2RiBcj8kwlDFFoEZ7XUTnLLgnDyCow1z8wGy92BbaD0EF0F
 f/vUOEs8+raD3lYN88p6O+jqs++xiwdX1OJFNWLUo5/ZVi58BXMrMjw8iXt5z0CmOoVn
 OpRA==
X-Gm-Message-State: AOJu0YxckWw2FW0zn/1x62RUCP4XLfjJQl+zaRtv7M8mF4qMY3o5Xgm9
 EiC7jsgB+HjdlWQJwI1GKmEVJhlQHkUgWBBULvKd9KBW32v+GsHMjR8SgMlXHWkZ3z+bZC/iyxA
 yras=
X-Google-Smtp-Source: AGHT+IEFRW/GKm1kC4/xR9T6tOh7LA6C+G/LBUbUcUgXPTSz5ZLegxIxv+joZeZSbP54MHN1tkuVRw==
X-Received: by 2002:a17:907:26c8:b0:a8a:18f9:269f with SMTP id
 a640c23a62f3a-a90d599aa46mr840119466b.60.1726997012097; 
 Sun, 22 Sep 2024 02:23:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b33fasm1065235866b.139.2024.09.22.02.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:23:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:23:03 +0200
Message-ID: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726997012; x=1727601812;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ty/EYWktv0WorJfTSpPoKL0GFCpkdqCYBCI8fOM1hKM=;
 b=IiadS1DnhFCrPnxzrLjW0q5kqOVNou1zpzinzTiy7kY7f1VsDZ2AvcaGG3cqYfXA/j
 Am/moxJKV7S1M+oIAG+lP+VYYKtjjfdRUgZ56EpwTN5D0IBlflDJqa3AfWxadzIcEmJ8
 Tozmb3YwyOPNtzj41sntNRLlqk5+h8kNL10H4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=IiadS1Dn
Subject: [Buildroot] [PATCH v2 0/9] add ARM FDPIC support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I resumed the series [1] submitted by Waldemar Brodkorb, where I made
some changes to the patch [9/9] "configs/stm32f746_disco_sd: new defconfig"
based on the suggestions provided by Thomas Petazzoni during the review
of a previous series [2].

Like Waldemar, I also did not encounter any issues during testing on the
board.

[1] https://patchwork.ozlabs.org/project/buildroot/cover/20240919035308.2622723-1-wbx@openadk.org/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20240822183742.3550055-3-dario.binacchi@amarulasolutions.com/

Ben Wolsieffer (7):
  Revert: "arch: drop now useless support for FDPIC"
  arch: don't enable FDPIC binaries by default
  arch: make FDPIC dependent on toolchain support
  arch/arm: add support for FDPIC
  boot/uboot: pass -mno-fdpic if FDPIC is enabled
  linux: pass -mno-fdpic if FDPIC is enabled
  package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC

Dario Binacchi (1):
  configs/stm32f746_disco_sd: new defconfig

Waldemar Brodkorb (1):
  package/busybox: remove STATIC from busybox-minimal.config

 DEVELOPERS                                    |  4 +++
 arch/Config.in                                | 15 +++++++++
 .../stm32f746-disco/extlinux.conf             |  4 +++
 .../stm32f746-disco/flash_sd.sh               | 22 +++++++++++++
 .../stm32f746-disco/genimage.cfg              | 10 ++++++
 .../stm32f746-disco/linux.fragment            | 13 ++++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../stm32f746-disco/patches/linux/linux.hash  |  2 ++
 .../stm32f746-disco/patches/uboot/uboot.hash  |  2 ++
 .../stm32f746-disco/post-build.sh             |  4 +++
 .../stm32f746-disco/readme.txt                | 31 +++++++++++++++++++
 boot/uboot/uboot.mk                           |  5 +++
 configs/stm32f746_disco_sd_defconfig          | 31 +++++++++++++++++++
 linux/linux.mk                                |  8 ++++-
 package/Makefile.in                           |  6 ++++
 package/busybox/busybox-minimal.config        |  2 +-
 package/uclibc/Config.in                      |  2 +-
 package/uclibc/uclibc.mk                      |  7 +++++
 toolchain/Config.in                           |  4 +++
 19 files changed, 170 insertions(+), 3 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32f746-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32f746-disco/flash_sd.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32f746-disco/linux.fragment
 create mode 120000 board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32f746-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/readme.txt
 create mode 100644 configs/stm32f746_disco_sd_defconfig

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
