Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD2BC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAEEA61130;
	Fri, 22 Jul 2022 20:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAEEA61130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZwX3-9RR-3vE; Fri, 22 Jul 2022 20:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8200360F46;
	Fri, 22 Jul 2022 20:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8200360F46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84E8E1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FECD421D2
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FECD421D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-9IYE7xqXyT for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:21:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3376C421CB
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3376C421CB
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:21:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 02F2A240002;
 Fri, 22 Jul 2022 20:21:53 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 22 Jul 2022 22:21:42 +0200
Message-Id: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658521314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cs0QmAk7dbNkx29qdF/w+4SXOElQurd0tMeOYgDFuaw=;
 b=cvnM4zfiM9sIiWWCwA75BIMdfTiqzUPT8aO3G+3DkTTznZhgYN1g4E3Tu/3TQGIS62AjJ7
 fjiHNdvM6vNf8imOSoao6wtuVgny0JmwipzN3Mnm1+ZDlWJjnpjfmnm4J7hovmyD6hCWLA
 Omm1Lj/x95X3ILulcUUUzgTVWMZ7/iEAgjQROdTuJjqD3/ysUBq3li24/ecFf9xQG871Ar
 GUYGiS3QjQnx9pLLhPcxyPjJUfQ6ZNsu6XGT7uMIzmqPQEVSP5VMRlL4L2JghGwGJkLtcb
 YMSOL3bRRKThWwrqWbVp5TmdbW2wSDBT5C0YZeND+gbczCz9pOr6YI6qmzfsTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cvnM4zfi
Subject: [Buildroot] [PATCH 0/8] genimage.cfg file clean-up
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This small series is a revamp of Giulio's series cleaning up
genimage.cfg. This new version is the result of some discussion
between Arnout and me to find a middle-ground situation.

So what we propose is to:

 - Use the U and F specifiers provided by genimage for the EFI System
   Partition and FAT32 partitions respectively.

 - Use the L specifier (explicitly specified in genimage.cfg, even
   though it is the default), for the root filesystem or other Linux
   filesystems. This means we would not comply with the
   systemd-specific Discoverable Partitions Specification
   (https://systemd.io/DISCOVERABLE_PARTITIONS/), but we don't see the
   point of this specification (which requires identifying root
   filesystems for different architecture by different GUID) in the
   context of Buildroot. However, while we recommend using L for all
   new genimage.cfg, we do not change existing genimage.cfg, to not
   break them.

In this series, none of the patches except the last make any
functional change. The last patch does introduce some functional
change: some partitions were identified as EFI System Partition even
though they are not: the last commit converts them to use the "F"
type, used for FAT filesystems.

Best regards,

Thomas Petazzoni

Thomas Petazzoni (8):
  board/orangepi/common/genimage.cfg: use quotes around "gpt"
  board/*/genimage.cfg: use partition-table-type = "gpt"
  docs/manual: update documentation about partition-type-uuid convention
    in genimage.cfg
  board/orangepi/orangepi-r1/genimage.cfg: remove double quotes around
    partition-type-uuid values
  board/orangepi/orangepi-r1/genimage.cfg: use correct partition type
  board/*/genimage.cfg: use partition-type-uuid U where relevant
  board/sifive/hifive-unleashed/genimage*: convert partition-type-uuid
    values to lower-case
  board/*/genimage.cfg: use partition-type-uuid = F for some FAT
    partitions

 board/aarch64-efi/genimage-efi.cfg                   |  2 +-
 board/friendlyarm/nanopc-t4/genimage.cfg             |  2 +-
 board/friendlyarm/nanopi-m4/genimage.cfg             |  2 +-
 board/octavo/osd32mp1-brk/genimage.cfg               |  2 +-
 board/octavo/osd32mp1-red/genimage.cfg               |  2 +-
 board/olimex/stmp1_olinuxino/genimage.cfg            |  2 +-
 board/orangepi/common/genimage.cfg                   |  2 +-
 board/orangepi/orangepi-r1/genimage.cfg              |  4 ++--
 board/pc/genimage-efi.cfg                            |  2 +-
 board/pine64/rockpro64/genimage.cfg                  |  2 +-
 board/qemu/aarch64-sbsa/genimage.cfg                 |  2 +-
 board/radxa/rockpi-4/genimage.cfg                    |  2 +-
 board/radxa/rockpi-n10/genimage.cfg                  |  2 +-
 board/radxa/rockpi-n8/genimage.cfg                   |  2 +-
 board/seeed/stm32mp157c-odyssey/genimage.cfg         |  2 +-
 board/sifive/hifive-unleashed/genimage_sdcard.cfg    |  6 +++---
 board/sifive/hifive-unleashed/genimage_spi-nor.cfg   |  4 ++--
 .../common/stm32mp157/genimage.cfg.template          |  2 +-
 docs/manual/writing-rules.txt                        | 12 ++++++++++++
 19 files changed, 34 insertions(+), 22 deletions(-)

-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
