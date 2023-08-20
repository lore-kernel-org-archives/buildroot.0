Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900B8EE49A6
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 19:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20A4081F27;
	Sun, 20 Aug 2023 19:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A4081F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpqKWbldB-cA; Sun, 20 Aug 2023 19:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59ED381F26;
	Sun, 20 Aug 2023 19:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59ED381F26
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1A31BF403
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4125960AFE
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4125960AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSFtJ8egMoUg for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 19:04:50 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D15AE60AF6
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 19:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D15AE60AF6
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id EB463A03CB
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:04:47 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id D1C5080069;
 Sun, 20 Aug 2023 21:04:47 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 9E5F0241267;
 Sun, 20 Aug 2023 21:04:46 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 21:04:37 +0200
Message-Id: <20230820190438.101920-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1561
X-purgate-ID: 154282::1692558287-93FFE668-AEDC4438/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692558287;
 bh=ljI76Zw8lczSAAwKdl3GLwuTJ2UvZfwQF4pJMGcmRmA=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=GxQyimQJ5t01gbf45mRYOX3E3O1WzQ8FleaLXz+IyyRAbEJvB0Aix5RzFvv69pEui
 tL8KUEZDROozfumI5N4kKxp6eC4aaPPHFpn3di++QC1o7cSAmcQOZQnoSohmLsmNDo
 3+FU/aTjlfPwPaFzTGIzL5tFPYx7KXKeiT3/KxmXTBN9zgaLEHGEqw5X9FTamR1GS1
 hMLpWzj+Ynw6qDbAl0i6qMSMqfqvuATxixL1hFng9ki6AIKvFwHb33in7qktQv5p63
 7cMj7pysLAEA+hzYF27RTjOwzzhAwHs6vCer5KPv+mQHH5ts+Q7r/YxypbY3clT5mr
 0QoMkPn25uQNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=GxQyimQJ
Subject: [Buildroot] [PATCH v3 0/1] Fix Rock 5B build,
 broken by gcc 12 warnings
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building the image for the Radxa Rock 5B currently breaks: The gcc
version was recently changed to version 12 and gcc 12 seems to stop
compiling, if certain warnings occur. See the broken build here:

https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673759

This patch series adds two patches from the mainline Linux kernel,
which fix two of the warnings. However, also custom code parts of the
used custom kernel break due to warnings from gcc 12. The best
solution would be that the vendor fixes those issues. However, until
the vendor provides fixes (if ever), the affected code parts (i.e.,
custom board support for WiFi) are disabled.

v2 -> v3:

  - Properly disabled a kernel config item in the linux.fragment
  - Added both, signed-of-by for myself and link to upstream commit
    to the added patch files
  - Documented disabling of WiFi to the board's readme

Kilian Zinnecker (1):
  configs/rock5b: Add patches to fix gcc12 warnings

 board/radxa/rock5b/linux.fragment             |  3 +
 ...st-ether_addr-prototypes-to-silence-.patch | 64 +++++++++++++++++++
 ...x-building-error-on-Werror-array-com.patch | 43 +++++++++++++
 board/radxa/rock5b/readme.txt                 | 20 ++++++
 configs/rock5b_defconfig                      |  1 +
 5 files changed, 131 insertions(+)
 create mode 100644 board/radxa/rock5b/patches/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
 create mode 100644 board/radxa/rock5b/patches/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
