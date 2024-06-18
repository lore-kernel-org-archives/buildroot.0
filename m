Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8889AC2BA1A
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 19:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACE6D40391;
	Tue, 18 Jun 2024 19:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0B-L9_4PC35W; Tue, 18 Jun 2024 19:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90B1E41489
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90B1E41489;
	Tue, 18 Jun 2024 19:40:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC771BF295
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 19:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0511D40554
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 19:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ldWeceO-hZp for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 19:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 544C6412F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 544C6412F9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 544C6412F9
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 19:40:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGhuK-1s6zF82rUg-00EWqv; Tue, 18
 Jun 2024 21:40:12 +0200
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 21:40:01 +0200
Message-ID: <20240618194001.1907396-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618194001.1907396-1-fiona.klute@gmx.de>
References: <20240618194001.1907396-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lDmI2s/qxTlpRe0r319FjRXvbeuRD5QJbIxzTKY7kp5UD1+kI+1
 psUCIz9XclkN/K91xv28vfVwfa6sOMlxoVWx9IR86AHPFMskgBbmHqPH4nDZaRNa7dQFGWz
 DdpXYnTePXtigCt8xaYZUsevvjJyCxIUYGRzw6/q9tnHGOjGAEVSbkXHeiUldhxIRS4XLld
 yIZP7M8aKdcA+jKTttTjw==
UI-OutboundReport: notjunk:1;M01:P0:8RqT1aJMvhE=;ldrkxPK3FIC8iPoje4aCWIBL1c8
 RcDI6WxJWMUItoQOHfzWk7ajljkJa3WZnzhWlBjYKYUqDa4a63UXTgKJvitp2vRhF/TTZx/BC
 AhJ6BLC58A/Ve7NcYVtQdnBt+mwxEfqSxvuS+DCiB+B64NbZCZCldHH3LvQkUlyIh2ELqmq9c
 33cbSCbJZUT+lzg6l1cqQw1s0o+qS4maWT2Erc3raoSMLgfM2CCchss0f8fJ48ffXfGSJAhf0
 /4dmuZEjun+/2QB5gDLX1/ZPIZeBKDhZ+mp7bz366gEkREGeJLXh5aXcxwZ/qaOpQb9lBDY1m
 CCHvNxMm88WSnVVu1FzepDCKWvSiKDPhT7HhpuuWZq6FwUCSL0Z3poEGJfAQD+Q1JRt9dlCpG
 X54eIP1e58H8jKyhZ9fHMq8oiN/AzME8A3qRT6SB7xujnPSihZmgaJ99Chg+/mbttxnzCuYmI
 QlvcreO7z2Z1zKg3wioBmqNbhnJ32LYidDJkp1LhwHDnkm7BSKalXHvnHaprzbeAW0CFwJkWw
 sPHO2H78QemCnQjOLcHV+bNPiFSXuWmAVWlj00TPw0y//OcpfEzbPFKhzJOdTnlbtjw8INjg5
 aQZii6BCXz0NmtxwadlcvOyCSLBEsxf2m0YBwaZVEVqHkMCkbJZH/L77QMupzANDtyhZjh+WZ
 A03dgLMxfS5iatFheSRDevcjRaumUu1e3qduycK8iqWdnRZ6Jv9Pn9t2apfBWOux94RH7LQV9
 Lnh/tO4wrSUo75Fpap5OM/hu20V65jflv83LPqNWU58Ww0mIuFAa59hZ66cMtTom/NlW1vm1t
 zwtqx5bLsw7+ikb1LYqtIf+fzKF1t7iksckvY3+fINgvo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718739612; x=1719344412; i=fiona.klute@gmx.de;
 bh=svoTybGqkaqsiytsl8jvOZxc0w5wOEGdVrsO6GN4oS8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GEcj6WkKZQCAAMB/VhACCl7LttwYtidNY/dIJZSbl5uYzV5cJPs0/YALoKqD8sU+
 Kcxe7XIAenu1cSfLC0AXWsQy9W69LR8BrLxpQMwnvjU1upG7GWWfHvb6hZYDqVPZ7
 5nY5egyymZxovhG1NoK1x6DpVfr0DeyFOEhmagQhxqkA9X96nQzMq8jJNDXliQfNX
 k2wVdKI87DL5Z/FVDHigIw+4S5yPp/i9i0BhGPf6Jmoie/qa4jQChEcW+WbPc8ibV
 W8SqKpNuIWs99BuhILXUNZ8HDQRwMwCjQhmB0782IgZZNfxsrZXFqoPKdPKXH1cvK
 PQEmuAC/lug+QOTJSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=GEcj6WkK
Subject: [Buildroot] [PATCH 2/2] board/raspberrypi: Enable nullglob for DTBs
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With "nullglob" the post image script does not fail if there's no DTB
directly in BINARIES_DIR. This is required when using DTBs from the
rpi-firmware package (BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y),
because in that case the kernel build doesn't provide one.

Using pre-compiled DTBs is discouraged, but useful for using mainline
kernels until suitable DTS can be merged.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 board/raspberrypi/post-image.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index e4611d05dd..b7ccf5d0b3 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -1,6 +1,7 @@
 #!/bin/bash

 set -e
+shopt -s nullglob

 BOARD_DIR="$(dirname $0)"
 BOARD_NAME="$(basename ${BOARD_DIR})"
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
