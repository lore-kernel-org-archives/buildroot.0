Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF12C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4E0A60E34;
	Thu, 22 Aug 2024 18:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OELxSxAh1FGs; Thu, 22 Aug 2024 18:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B712E60E4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B712E60E4B;
	Thu, 22 Aug 2024 18:37:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE50E1BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9E0860E4B
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUVQt8tNE4BO for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 862D260E34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 862D260E34
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 862D260E34
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:37:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37193ef72a4so649728f8f.1
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 11:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724351865; x=1724956665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UJEQIQLo+rlGP192bQCWyrnmgs94wKAV7pHc9eiTLz0=;
 b=N0JxsGIb3WhDkjYMa4ntLStc+WD/REc3+A0FXusIpJ7QKhWwli4MCOVkXzJxhKkcGY
 WV7wONcYeb1FzZTNtn1QRMARW97FacWdckWBxhBNYDzVL8qDT3wSNadxwL5/SRbiKUvo
 WnADZtfEtZCWqOGI38R4+cSe8NWXRDERD3E6Nntq0EhG5TiaTduedfr64XdrM3v81nxP
 tIYNyVwGqU6i66JXlaE9HteEi2d/qfkC7n6OK4vDiz9AiP5w47oUligUesVVvqaRdDL+
 LqK/RkoVMLXVkpiUCmEMvi668aBkgQxnAqwWJD+7Iq43DXQpkISvYg6JaV0dmUZ1JwZA
 1jgg==
X-Gm-Message-State: AOJu0YzmEPi80PJnTzcarKJBOqDd2KcGpOcqWS8QPPC3FmWe3Zd20VMN
 BOkgAaaPfEUgdgxyPnLBQhKFO3HfJ8Jl2VEza3rOAdkviGa/G2ytMCw5gIpbuwexTN1gaxGcMPg
 y1fI=
X-Google-Smtp-Source: AGHT+IEx8N3rm8ZlJ71o5X6NV9XyB9n3gUlmQxhIw1qGKwC3nzL27O2VVr5TiWAPkXRIlLs6TzSgQQ==
X-Received: by 2002:a5d:68c9:0:b0:367:96d2:5756 with SMTP id
 ffacd0b85a97d-372fd82b8f5mr4068127f8f.62.1724351865190; 
 Thu, 22 Aug 2024 11:37:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730811001fsm2276397f8f.20.2024.08.22.11.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 11:37:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:37:39 +0200
Message-ID: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724351865; x=1724956665;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UJEQIQLo+rlGP192bQCWyrnmgs94wKAV7pHc9eiTLz0=;
 b=UZSeNCTjZRmg9hdJYxclwvjxGm+tig99KJ/3vm9IysyIfV+WOSx2pn4wXeTM4u8dnC
 GoEXvCFd1unfyWJOrfR7fLTxvSYY2E6+gQnPPLpqVIpG/4L23lj91KBu1YANRFbRMiQ+
 uH1NW/nwVgjTydop66tYCr3sYLVwpslZH5+pM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UZSeNCTj
Subject: [Buildroot] [PATCH v3 0/3] tinyinit and stm32f746_disco_sd_defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is inspired by reading the following topic:

https://lore.kernel.org/buildroot/20230206230203.70e2dbd8@windsurf/T

Starting from that patch, and following Thomas Petazzoni's suggestions
regarding the possibility of using a single minimal script without
duplicating it within Buildroot, I developed these three patches.
Meanwhile, the configuration for the stm32f746_disco board was useful
for developing the display support for the board, which was later
merged into Linux.

Dario Binacchi (3):
  package/tinyinit: new package
  configs/stm32f746_disco_sd: new defconfig
  board/canaan/k210-soc: use tinyinit as Linux init process

 .checkpackageignore                           |  1 -
 DEVELOPERS                                    |  3 ++
 board/canaan/k210-soc/rootfs_overlay/init     |  1 -
 .../stm32f746-disco/extlinux.conf             |  4 +++
 .../stm32f746-disco/flash_sd.sh               | 22 +++++++++++++
 .../stm32f746-disco/genimage.cfg              | 27 ++++++++++++++++
 .../stm32f746-disco/linux.fragment            | 13 ++++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../stm32f746-disco/patches/linux/linux.hash  |  2 ++
 .../stm32f746-disco/patches/uboot/uboot.hash  |  2 ++
 .../stm32f746-disco/post-build.sh             |  9 ++++++
 .../stm32f746-disco/readme.txt                | 31 ++++++++++++++++++
 configs/canaan_kd233_defconfig                |  2 +-
 configs/sipeed_maix_bit_defconfig             |  2 +-
 configs/sipeed_maix_bit_sdcard_defconfig      |  2 +-
 configs/sipeed_maix_dock_defconfig            |  2 +-
 configs/sipeed_maix_dock_sdcard_defconfig     |  2 +-
 configs/sipeed_maix_go_defconfig              |  2 +-
 configs/sipeed_maix_go_sdcard_defconfig       |  2 +-
 configs/sipeed_maixduino_defconfig            |  2 +-
 configs/sipeed_maixduino_sdcard_defconfig     |  2 +-
 configs/stm32f746_disco_sd_defconfig          | 32 +++++++++++++++++++
 package/Config.in                             |  1 +
 package/tinyinit/Config.in                    | 10 ++++++
 .../sbin => package/tinyinit}/init            | 11 +------
 package/tinyinit/tinyinit.mk                  | 12 +++++++
 26 files changed, 179 insertions(+), 21 deletions(-)
 delete mode 120000 board/canaan/k210-soc/rootfs_overlay/init
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
 create mode 100644 package/tinyinit/Config.in
 rename {board/canaan/k210-soc/rootfs_overlay/sbin => package/tinyinit}/init (75%)
 mode change 100755 => 100644
 create mode 100644 package/tinyinit/tinyinit.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
