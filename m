Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8157EC32771
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 15:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C605E4159B;
	Fri, 19 Aug 2022 15:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C605E4159B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id er2R0wB0ilN5; Fri, 19 Aug 2022 15:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E299D40571;
	Fri, 19 Aug 2022 15:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E299D40571
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C15D1BF5DB
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2710F842C8
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2710F842C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5jrNdHJaTgX for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 15:18:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC65842A5
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CC65842A5
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 15:18:16 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id f4so3448050qkl.7
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 08:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=AIsGH76jxWDYbK1gb7DWKc+E7TgBXftFzj+9OUFav+s=;
 b=1PuVY8irnS9WmyWl03jqVFYT0c8iKZaEq2T0g7Od58fsa9y2y0GRwFosK/ASlopzVD
 CxGMEZ57w5flM7KelMtmAhlPn2g3SzsbOidJekb1aXvmL6qQR63Nh2OEmVZUmMCMiVFF
 9+62e1fB7ikdo2A/QKfehSNAnQZMelRe/5ucF1Y/v9WalcvtLREtEKzGIwyZ0ZWXyvrH
 TxYqacO86IWtaO3k3DuZdEFJDlfQVXfGfSzWG6S3NFQ2RASlRPQRlcSTlOvL4REQ2q4v
 GhKIonvgNppgIrOrbep1/JlkJGOqkeVksEpSu98UCfdTkfNKagdB7vVpNnRnhMpngaxm
 AYFQ==
X-Gm-Message-State: ACgBeo3lSBD4vTD+6tLOUUfQuVdBWAf0qnBiBdLG9ucuvnNTg5/XTZPH
 az1sVBIo1gMcglElEMmq+01eRfWTL5oPDQ==
X-Google-Smtp-Source: AA6agR4NVhigi7zQTd9TbP+AsZ4sc2ljNArwa3+m4lbcbj4D8NZrrs0eMXP4JsQpeOJFqY548zb+YA==
X-Received: by 2002:a05:620a:1a04:b0:6bb:963d:44ce with SMTP id
 bk4-20020a05620a1a0400b006bb963d44cemr5451682qkb.145.1660922294720; 
 Fri, 19 Aug 2022 08:18:14 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bbc09af9f5sm3368907qkb.101.2022.08.19.08.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:18:13 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 11:17:25 -0400
Message-Id: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=AIsGH76jxWDYbK1gb7DWKc+E7TgBXftFzj+9OUFav+s=;
 b=IAXlnckxGcXBRxbjyrvQFAsp30SFkwlQIdf/wQXboo2uqv51bORD86fPtCo7xk1aAj
 IxJHjoCAlGh00JvPv8AZyLtfXEAI/qMysMaSyMwO7JlDLfc1ijQnWeceqcSZxGT2NlYx
 OY3OCiOzRR6B1foqx+3n4oRx2dVfEJdT1vYdUh/I58z8o32yXOJiNR9WjIg+ZA95Q19+
 OQjh/hGWRroK9pnqz4Q4otdiCktxBIfy30IZ0GVcduVT/S7tNReSmK3asIy4HUvJZyUM
 931yxSUgRaM7EWcMsVWxxnx0tKiYChAn5sCHNyKuk3B1j9fWsDIMIXedhVlgUeOtNyMa
 U9CQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=IAXlnckx
Subject: [Buildroot] [PATCH v3 0/8] Add support for FDPIC binaries on ARM
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce support for the FDPIC binary format on ARM. FDPIC binaries
enable memory sharing between processes on no-MMU systems.

Changes in v3:
  * Don't change default binary format
  * Disable FDPIC support with external toolchains
  * Enable NPTL if FDPIC is used
  * Patch libtool to support ARM FDPIC shared libraries

Changes in v2:
  * Simplify special casing of FDPIC toolchain target
  * Add additional patches to fix building Linux and U-Boot with an
    FDPIC toolchain by passing -mno-fdpic. I have submitted fixes
    upstream to do this automatically, but they have not yet been
    accepted and will take a while to end up in Buildroot.

Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Ben Wolsieffer (8):
  Revert "arch: drop now useless support for FDPIC"
  arch: don't enable FDPIC binaries by default
  arch: make FDPIC dependent on toolchain support
  arch/arm: add support for FDPIC
  boot/uboot: pass -mno-fdpic if FDPIC is enabled
  linux: pass -mno-fdpic if FDPIC is enabled
  package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC
  package/pkg-autotools: patch libtool to support ARM FDPIC

 arch/Config.in           | 15 +++++++++++++++
 boot/uboot/uboot.mk      |  5 +++++
 linux/linux.mk           |  8 +++++++-
 package/Makefile.in      |  6 ++++++
 package/pkg-autotools.mk | 17 +++++++++++++++++
 package/uclibc/Config.in |  2 +-
 package/uclibc/uclibc.mk |  8 ++++++++
 toolchain/Config.in      |  4 ++++
 8 files changed, 63 insertions(+), 2 deletions(-)

-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
