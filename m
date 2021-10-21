Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2874C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:01:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A2B760F93
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A2B760F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A82C40298;
	Thu, 21 Oct 2021 22:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zIbevd5JWJY; Thu, 21 Oct 2021 22:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DD31402C5;
	Thu, 21 Oct 2021 22:01:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C90AC1C1127
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B805D404A0
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gdO2imIzgst for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 22:00:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7469040494
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 22:00:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dg6pm7gvAXRKtdg6qmSRxG; Fri, 22 Oct 2021 00:00:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634853624; bh=BqVUnPp4cmjsoYws27Xnnqr9itu6p72ojLtQdoVzVL4=;
 h=From:To:Subject:Date:MIME-Version;
 b=cd0uatEHtG023hxnVSPnBypMVXeB/4r3icWgwTCPpvCkF1deiFaTXxQtEbTQlcEKP
 eAHsm/kvPBqpyVoSMi0IZ4V1iZx8T6ErK3Kv+ZRKOXJZGUQ4txy1ieBn25TQ3yasUD
 2EJ51yHJcUCQM6tI8ha8DF2+sRrtx0kI3Xn67VTeSD1YqRfrDSxS62syuwkICRhaxq
 jJmzxDGenZT+jHYsnEmSQowbmOgo27FKWT3+ESAfbkFjbF+AqxVOaAU4DDBgmImFS3
 YnXD1iuShzenfTVycNUP/EYH7vpN3Ejs9ezDfvkUjoZgU3CbDWAwlfMXTgL4717gpB
 by6DSAGXXFzKw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 00:00:15 +0200
Message-Id: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDSY2ORZzVS3pBq+KCw/zZyBC3ggbfVpy68c5zV35qlY4mDaGWDELgTJoxTve1wZFbg0T4ysJEtW0WEDyMpuzg3QZUKHR8t57kJlfD59on6Cb01j1Vlp
 JPAIfH9Oir3W9sJg/aEgGVCQ+Wa+luSIKCIwS6B+/LV8g36WgHTx7YO4bNmqdS/dEBOwCc3qFhXaNHr4riDGDFxi990zElqazCbOZjI+u081g2gSc19pfSh7
 TvCBENxwKKtFNpxEAeBMaNhgkuI8OJ3o9oWQ6O6lf6iiq0HBKjEH+aTfmVqDoeTh0EJN9aHzYrjZc/mgAkys9JxvCnCtuTgoxjtiyENsILTXY1OsJmc5m2rv
 WKeza15dJFWqsiUj1GT6nm/vXctm77YodV5is8pxrpw9c2sasDnwe0N64CGige6+BgcEejgJ
Subject: [Buildroot] [PATCH 0/8] Olimex boards u-boot/linux update
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset enable on olinuxino_a10/a13 the NEON support while the rest
of patches bump uboot and linux versions. I've been able to test all
boards except a10. A64 bump will follow.

Giulio Benetti (8):
  configs/olimex_a10_olinuxino: bump to Linux kernel 5.14.13 and u-boot
    2021.10
  configs/olimex_a10_olinuxino: use FPU NEON strategy
  configs/olimex_a13_olinuxino: bump to Linux kernel 5.14.13 and u-boot
    2021.10
  configs/olimex_a13_olinuxino: use FPU NEON strategy
  configs/olimex_a20_olinuxino_lime2: bump to Linux kernel 5.14.13 and
    u-boot 2021.10
  configs/olimex_a20_olinuxino_lime: bump to Linux kernel 5.14.13 and
    u-boot 2021.10
  configs/olimex_a20_olinuxino_micro: bump to Linux kernel 5.14.13 and
    u-boot 2021.10
  configs/olimex_a33_olinuxino: bump to Linux kernel 5.14.13 and u-boot
    2021.10

 configs/olimex_a10_olinuxino_lime_defconfig  | 9 +++++----
 configs/olimex_a13_olinuxino_defconfig       | 9 +++++----
 configs/olimex_a20_olinuxino_lime2_defconfig | 8 ++++----
 configs/olimex_a20_olinuxino_lime_defconfig  | 8 ++++----
 configs/olimex_a20_olinuxino_micro_defconfig | 8 ++++----
 configs/olimex_a33_olinuxino_defconfig       | 8 ++++----
 6 files changed, 26 insertions(+), 24 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
