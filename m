Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB159C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5576160BDB;
	Sun,  6 Feb 2022 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kjifLk0GtCX; Sun,  6 Feb 2022 20:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BF3360C03;
	Sun,  6 Feb 2022 20:06:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90F221BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 802CE60B04
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8N7iAZZkMc0o for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:05:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25A8160ACE
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:05:36 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnmvnXO6M; Sun, 06 Feb 2022 21:05:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177935; bh=8qfwByatol9h85XlU23DT2XhXVmacuJxHwoTrgSXxZ0=;
 h=From:To:Subject:Date:MIME-Version;
 b=eN+nluOJ7rGrASb0x0J67F3yLUZJlZ5MCIm5o3apLM/DUNs8eZEgGftS9a1EAa8wK
 SDv1a+o7Ls8pCj6/ktz+lqmtGr90cbjrpd5g0naex78qs+xyFoIaiyVe/HDsHuN0qX
 SqsuU6vKvkpXpyYfxCJSRu1xHt4VoNbGW5T3cG7yYRt0LK3pGt+tWrEU3UFmnUpoZA
 lu4KvSQw9ElCYh4W9KTHnWmereAabL8Yoqsp0gE6bTBHbhoew6Ye2HVe9F+Z9WoNin
 VbnEj4SfLp0lt5qvZUg4TRFZ0bwoFdqBJdwAMBkaVKYBmIgfl4XeY4qg5s1hB4gs+Z
 gqNziGWRLBhtw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:16 +0100
Message-Id: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNp+MXm4w6Kaqg7fRKrtNjU/C/vhndri20i347aj3/LOo6O7bOGKPCYzWMHdygI92/MILhmW7buwfCZ7hGrczobVkBeg0LfY8nPeitydCdIhZJOUDlAv
 9Xvd3s8Db8N2V8BHlvm0U93pq7Y437gTcl8Usv0FKMKYC3r8KIwdERm7MPVZzP6RlAOM+/Lv1wSFPwD15KDY2F05WAD/owC9jadgIF9cohyXWJHZzPOanQtV
 B3bWj0T5HJH12vu8uglP6JAJ0E1HoVXeA8KDmriYepqBjZA2lNzhD07BBOwUPtRn32/vCWGpekbLKRSFwkThFxYY2R4rCC/+iivKJNM29GIFz+HVSbnz9cWR
 fa6Kb5u3L35PtNTBOjWXTHX6tHCLS+9JLB23wTDdP1mlEIv+ndGNv+AdxK23tLGT67CbzCfWVBAfxoUFnNAhJEjyM5dpZJn1FBJiIup2gcVw+Bfw25hXXtzd
 KUILvp0UBpk/JS0TMLH0vyL5OIfnhDh+pvi1AJ2bIjAmlxXY1Ba2WZYX42SYILEu2UEwF7wWVaL+YUN/BzF+8ssLM1HY5uGynMWO+iBPU1Hh4YILlpdbGfaN
 iJQ7dkQzBEIhKE36WSEwVQSH
Subject: [Buildroot] [PATCH 00/16] Use single letter notation in
 genimage.cfg files for partition-type-uuid
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset convert partition-type-uuid to single letter notation
*without* "".

Note:
This patchset must be applied after this patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20220204000657.747245-1-giulio.benetti@benettiengineering.com/

Giulio Benetti (16):
  board/aarch64-efi/genimage-efi: convert partition-type-uuid to single
    letter notation
  board/beaglev/genimage-efi: convert partition-type-uuid to single
    letter notation
  board/friendlyarm/nanopc-t4/genimage: convert partition-type-uuid to
    single letter notation
  board/friendlyarm/nanopi-m4/genimage: keep partition-type-uuid without
    "" for consistency
  board/orangepi/orangepi-pc-plus/genimage: keep partition-type-uuid
    without "" for consistency
  board/orangepi/orangepi-r1/genimage: fix partition-type-uuid for boot
    partition and remove "" for consistency
  board/orangepi/orangepi-zero-plus2/genimage: keep partition-type-uuid
    without "" for consistency
  board/pc/genimage-efi: convert partition-type-uuid to single letter
    notation
  board/pine64/rockpro64/genimage: convert partition-type-uuid to single
    letter notation
  board/qemu/aarch64-sbsa/genimage: convert partition-type-uuid to
    single letter notation
  board/radxa/rockpi-n4/genimage: convert partition-type-uuid to single
    letter notation
  board/radxa/rockpi-n10/genimage: convert partition-type-uuid to single
    letter notation
  board/radxa/rockpi-n8/genimage: convert partition-type-uuid to single
    letter notation
  board/sifive/hifive-unleashed/genimage_sdcard: convert
    partition-type-uuid to single letter notation
  board/sifive/hifive-unleashed/genimage_sdcard: add comments to
    particular partition-type-uuid parameters
  board/sifive/hifive-unleashed/genimage_spi-nor: add comments to
    particular partition-type-uuid parameters

 board/aarch64-efi/genimage-efi.cfg                 | 4 ++--
 board/beaglev/genimage.cfg                         | 2 +-
 board/friendlyarm/nanopc-t4/genimage.cfg           | 4 ++--
 board/friendlyarm/nanopi-m4/genimage.cfg           | 4 ++--
 board/orangepi/orangepi-pc-plus/genimage.cfg       | 4 ++--
 board/orangepi/orangepi-r1/genimage.cfg            | 4 ++--
 board/orangepi/orangepi-zero-plus2/genimage.cfg    | 4 ++--
 board/pc/genimage-efi.cfg                          | 4 ++--
 board/pine64/rockpro64/genimage.cfg                | 4 ++--
 board/qemu/aarch64-sbsa/genimage.cfg               | 4 ++--
 board/radxa/rockpi-4/genimage.cfg                  | 4 ++--
 board/radxa/rockpi-n10/genimage.cfg                | 4 ++--
 board/radxa/rockpi-n8/genimage.cfg                 | 4 ++--
 board/sifive/hifive-unleashed/genimage_sdcard.cfg  | 4 +++-
 board/sifive/hifive-unleashed/genimage_spi-nor.cfg | 2 ++
 15 files changed, 30 insertions(+), 26 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
