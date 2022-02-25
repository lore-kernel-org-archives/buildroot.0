Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65694C433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 09:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B1260B5C;
	Fri, 25 Feb 2022 09:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9ZKeDFj0w2V; Fri, 25 Feb 2022 09:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2303560B47;
	Fri, 25 Feb 2022 09:25:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3B4D1BF395
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 09:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A04DA40151
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 09:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DENYROuY1Rkq for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 09:25:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from Atcsqr.andestech.com (exmail.andestech.com [60.248.187.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4980640004
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 09:25:39 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 21P9PMLU056744;
 Fri, 25 Feb 2022 17:25:22 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Fri, 25 Feb 2022 17:25:19 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Fri, 25 Feb 2022 17:25:06 +0800
Message-ID: <20220225092509.16478-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 21P9PMLU056744
Subject: [Buildroot] [PATCH v5 0/3] Add andes ae350 support
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, alankao@andestech.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset
- renames andes/ae3xx and its defconfig to ae300 for nds32 architecture.
- adds ae350 platform support and andes_ae350_45_defconfig.

Yu Chien Peter Lin (3):
  board/andes: rearrange andes folder structure
  board/andes/ae350: add support for Andes AE350
  DEVELOPERS: add Yu-Chien Lin to board/andes

 DEVELOPERS                                    |   5 +-
 .../ae3xx.fragment => ae300/ae300.fragment}   |   0
 ...0001-nds32-Fix-boot-messages-garbled.patch |   0
 ...ve-redundant-YYLOC-global-declaratio.patch |   0
 board/andes/{ => ae300}/readme.txt            |  10 +-
 board/andes/ae350/ae350.dts                   | 274 ++++++++++++++++++
 board/andes/ae350/genimage_sdcard.cfg         |  26 ++
 ...isable-PIC-explicitly-for-assembling.patch |  29 ++
 ...2-Enable-cache-for-opensbi-jump-mode.patch |  25 ++
 ...001-Fix-mmc-no-partition-table-error.patch |  27 ++
 ...2-Prevent-fw_dynamic-from-relocation.patch |  27 ++
 ...0003-Fix-u-boot-proper-booting-issue.patch |  26 ++
 ...04-Enable-printing-OpenSBI-boot-logo.patch |  25 ++
 board/andes/ae350/post-build.sh               |   3 +
 board/andes/ae350/readme.txt                  |  65 +++++
 .../boot/extlinux/extlinux.conf               |   4 +
 board/andes/ae350/uboot.config.fragment       |   5 +
 ..._ae3xx_defconfig => andes_ae300_defconfig} |   4 +-
 configs/andes_ae350_45_defconfig              |  43 +++
 .../toolchain-external-andes-nds32/Config.in  |   2 +-
 20 files changed, 590 insertions(+), 10 deletions(-)
 rename board/andes/{ae3xx/ae3xx.fragment => ae300/ae300.fragment} (100%)
 rename board/andes/{ => ae300}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
 rename board/andes/{ => ae300}/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch (100%)
 rename board/andes/{ => ae300}/readme.txt (71%)
 create mode 100755 board/andes/ae350/ae350.dts
 create mode 100644 board/andes/ae350/genimage_sdcard.cfg
 create mode 100644 board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
 create mode 100644 board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
 create mode 100644 board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
 create mode 100644 board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
 create mode 100644 board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
 create mode 100644 board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
 create mode 100755 board/andes/ae350/post-build.sh
 create mode 100644 board/andes/ae350/readme.txt
 create mode 100644 board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/andes/ae350/uboot.config.fragment
 rename configs/{andes_ae3xx_defconfig => andes_ae300_defconfig} (69%)
 create mode 100644 configs/andes_ae350_45_defconfig

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
