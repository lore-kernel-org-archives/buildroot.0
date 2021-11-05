Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D083FC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:18:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E88656112D
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E88656112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B704039C;
	Fri,  5 Nov 2021 22:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2FP6o7y2M8C; Fri,  5 Nov 2021 22:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 087C8402D2;
	Fri,  5 Nov 2021 22:18:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 728541BF386
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B7FF6F93A
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFp3ORtfqRvh for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 22:18:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTP id D64146F933
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 22:18:04 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id j7X7mGJ7s5cjnj7X8m4SPA; Fri, 05 Nov 2021 23:18:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636150683; bh=hAL+YjlHKkF8TIinqI0LkYrOYALnVKoaZkR4pqTGHCE=;
 h=From:To:Subject:Date:MIME-Version;
 b=MfucSFK0lx6lRVgQZxooEz+bq28ZAnhumxGr5aMsiVEe2fH/lfvdlIcA+6dASCxiL
 6WLElOXajxJ5AzthXH7TjoQP6Jeqyf1q5CDXYZF7mGY0JHoAyf8LtPk0aqw7e9PksZ
 ywvp0CHo4VkbMzdz9Xtzd0m9380gZBz004N2TbMOG8C1SvE7iq98s1/mb1S3LJVe0J
 3EnXDFQkH67MoAaX75TxLx2+rV8BMltU1FvPWsLIgSwbBxHXyqq2jYhkSXbT1eprfb
 Tn0UqvTrX46hn4mY7UZQG1qH/33NvA/Sk8hD3duKQg/5joVIxhYOjd9jcC/BQGx8m3
 ulCW0XBtpXh8w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 23:17:55 +0100
Message-Id: <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
References: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPhBM14PQSPVxppgvUBdukMA1xyGm/HGno3E0+W+V+UwhhBYrQGaVwN50r1ncrqUds76tu2r2L70uPW0F2AHwG0vxpliAVA5PIhZ2dSqjsYKaxr2K3cW
 GSQZCqVmXFhCv2IQGSbgq2ECtZck6tVcxFkkg9ojvom8Clno/2FiOpDZT7LMMMglD8UVFXtT4RuXQgWfMuR1I6mdhiDRCu59nFa/UI6mxwMj/hksiYJsHuVg
 t5yIRS2iDxzQb/p+nhrPGyxZpSCzeiOZl0VWpuibfTJNC/xVgyfM86kmYnOmQdPWAajYcVHqwB6+ApxGh6OlkEI3C4RvEl7TGl5yvnNuyLnLbHYHUC4w2MF0
 ZGNIi8jhCKTjLprM4xyERHc3ocs9ULnG0dNNRkTuj9KnGNv8Ucno/VpxLUv2mZ9N05PXgfXa0VcgxoL+Vah2ebjymQ4P+jKr1h0Hyn55RigGiHztFPM5I+Vr
 Dpc2FznWviZtxOMhS8aXCkDSxSumbuZjWHJ1wIJZl2tweDBZfiWkkD64K2M=
Subject: [Buildroot] [PATCH v2 0/5] Rename sunxi-mali-mainline* to
 sunxi-mali-utgard* and fix Mali loading
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this patchset I respin the first 2 patches. While testing on hardware
the patches they work, but I've left back an error while bumping linux
version to 5.14. The error is that Linux's sunxi_defconfig(used by both
a20_olinuxino_lime/2) enables Lima driver, but in this 2 boards we want
to use Mali driver, so when Mali driver tries to load(being it a module),
it finds that Lima already has taken gpu resources and fail. So here I add
3 patches, 1 to add a Linux fragment to disable Lima in Linux and other 2
to use that fragment in a20_olinuxino_lime/2.

Giulio Benetti (3):
  board/olimex/a20_olinuxino: add linux-disable-lima.fragment
  configs/olimex_a20_olinuxino_lime2_defconfig: use
    linux-disable-lima.fragment
  configs/olimex_a20_olinuxino_lime_defconfig: use
    linux-disable-lima.fragment

Miquel Raynal (2):
  package/sunxi-mali-utgard: rename from sunxi-mali-mainline
  package/sunxi-mali-utgard-driver: rename from
    sunxi-mali-mainline-driver

 Config.in.legacy                              | 42 ++++++++++++++++
 DEVELOPERS                                    |  4 +-
 .../a20_olinuxino/linux-disable-lima.fragment |  2 +
 configs/olimex_a20_olinuxino_lime2_defconfig  |  7 +--
 configs/olimex_a20_olinuxino_lime_defconfig   |  7 +--
 docs/manual/adding-packages-virtual.txt       |  2 +-
 package/Config.in                             |  4 +-
 package/glslsandbox-player/Config.in          |  4 +-
 .../glslsandbox-player/glslsandbox-player.mk  |  2 +-
 package/qt5/qt5base/qt5base.mk                |  2 +-
 .../sunxi-mali-mainline-driver.mk             | 41 ----------------
 package/sunxi-mali-mainline/Config.in         | 42 ----------------
 .../sunxi-mali-mainline.mk                    | 49 -------------------
 .../Config.in                                 | 20 ++++----
 .../sunxi-mali-utgard-driver.hash}            |  2 +-
 .../sunxi-mali-utgard-driver.mk               | 41 ++++++++++++++++
 package/sunxi-mali-utgard/Config.in           | 43 ++++++++++++++++
 .../egl.pc                                    |  0
 .../glesv2.pc                                 |  0
 .../sunxi-mali-utgard.hash}                   |  2 +-
 .../sunxi-mali-utgard/sunxi-mali-utgard.mk    | 49 +++++++++++++++++++
 21 files changed, 206 insertions(+), 159 deletions(-)
 create mode 100644 board/olimex/a20_olinuxino/linux-disable-lima.fragment
 delete mode 100644 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
 delete mode 100644 package/sunxi-mali-mainline/Config.in
 delete mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk
 rename package/{sunxi-mali-mainline-driver => sunxi-mali-utgard-driver}/Config.in (60%)
 rename package/{sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash => sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash} (66%)
 create mode 100644 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
 create mode 100644 package/sunxi-mali-utgard/Config.in
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/egl.pc (100%)
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/glesv2.pc (100%)
 rename package/{sunxi-mali-mainline/sunxi-mali-mainline.hash => sunxi-mali-utgard/sunxi-mali-utgard.hash} (70%)
 create mode 100644 package/sunxi-mali-utgard/sunxi-mali-utgard.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
