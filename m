Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC2C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 22:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25DDE40B93;
	Wed,  1 Feb 2023 22:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25DDE40B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mA5b_9gu9198; Wed,  1 Feb 2023 22:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AEB040B99;
	Wed,  1 Feb 2023 22:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AEB040B99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4E251BF47F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA7741817
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA7741817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t4rMCLEJi1eW for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 22:32:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FC7C41825
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FC7C41825
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 22:32:47 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NLekpeh5dvodANLekpwuvf; Wed, 01 Feb 2023 23:32:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 23:32:34 +0100
Message-Id: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEJ0J9xZUaLGPDnIovPeTsk0HLGmCMDpguqb6+whaO/RfbqotOuOzRZAQOYI6SujK9GsOXTdA2XwkRMtDOVsYQZNKjhYFi01cATBZMSjTZl/8ES/OIsl
 tn+43YN2Ysqinl05PIgjL4+XwoQ8ozjkXYrKkvF2oC30c/dn4/BC0sdExX58LckW61IbYANixEN58FjoFtpSRZsQP8V+y0GgiNCD/gEfxTH7yf6ZIeXw/UkB
 TfOMDsdx3UHV0/T/Vldwv0pWiexnjOQVHU374o88vZT4KyGVBrOe0ASsXUa7GDOxaYVERTzeQPCCKGWrugAkFz6WECGth9UK88cNirgxnZvFW0AvMUmGO1pk
 +7qMvxOUcuf9Qwn+IEoC1KnnEOZqi7YNvea052ymuQTcmvOWkBZduwIeakLJJiszj/bhqeYLuTYm2U6OIvN0whUY/+36wQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675290763; bh=gAdrt1tm58/AtLlulQouOJGti6DWryHyzirBO9FOWW4=;
 h=From:To:Subject:Date:MIME-Version;
 b=KfHfMl6DwQHo4z48w/s1tgdnpWfjBN+aU0tzdoOXFH5J/wSUd73euuxvO/j5bahzW
 V58NOvZGADk44v+wglVItXzeVwsWLPr+qzyU+Bq9swzKGLdopcKbPZtPPdVRW9S4na
 OGWqrZp5q7HYjAeZXtN7ys0wGOQS9gqvFL455f1oYHaqU/y0GmVZ4fVc0uMx54TzM3
 FTJ5bPTUWSIIvcMiggyrBdaGlCmxQlMH8m+zp2soznZVk9JM3iqcL1j9avp0ogTgrN
 DZ7aqi3Ewyev4jNbHE19h35darb+puYUWaZ70ORuTmS2bM55GiZsRAEObOfOgvlIB+
 OCAvZu9/Czu9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=KfHfMl6D
Subject: [Buildroot] [PATCH 0/7] Bump Linux,
 U-boot and ATF versions for olimex_a* boards
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I could not test the changes on Olinuxino A10 and Olinuxino A20 Lime2
because I don't have those boards. But A13 works correctly and it's very
similar to A10, while A20 Lime2 has only a different topology of DDR3
and it's been upstreamed for long time so I think it's reasonable to
commit the entire patchset.

Giulio

Giulio Benetti (7):
  configs/olimex_a10_olinuxino_lime_defconfig: bump Linux to 6.1.9 and
    U-Boot to 2023.01
  configs/olimex_a13_olinuxino_defconfig: bump Linux to 6.1.9 and U-Boot
    to 2023.01
  configs/olimex_a20_olinuxino_lime2_defconfig: bump Linux to 6.1.9
  configs/olimex_a20_olinuxino_lime_defconfig: bump Linux to 6.1.9
  configs/olimex_a20_olinuxino_micro_defconfig: bump Linux to 6.1.9 and
    U-Boot to 2023.01
  configs/olimex_a33_olinuxino_defconfig: bump Linux to 6.1.9 and U-Boot
    to 2023.01
  configs/olimex_a64_olinuxino_defconfig: bump Linux to 6.1.9, U-Boot to
    2023.01 and ATF to v2.8

 configs/olimex_a10_olinuxino_lime_defconfig  |  8 ++++----
 configs/olimex_a13_olinuxino_defconfig       |  8 ++++----
 configs/olimex_a20_olinuxino_lime2_defconfig |  6 +++---
 configs/olimex_a20_olinuxino_lime_defconfig  |  6 +++---
 configs/olimex_a20_olinuxino_micro_defconfig |  8 ++++----
 configs/olimex_a33_olinuxino_defconfig       |  8 ++++----
 configs/olimex_a64_olinuxino_defconfig       | 11 ++++++-----
 7 files changed, 28 insertions(+), 27 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
