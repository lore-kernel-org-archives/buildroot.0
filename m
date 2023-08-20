Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1DCEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 15:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C938146A;
	Sun, 20 Aug 2023 15:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C938146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXtxCnk65nb4; Sun, 20 Aug 2023 15:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D04281462;
	Sun, 20 Aug 2023 15:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D04281462
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36FC31BF277
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 15:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 109944038D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 15:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 109944038D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FfdJPzociiCS for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 15:20:22 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29F2F40146
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 15:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F2F40146
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 54E07A0381
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 17:20:20 +0200 (CEST)
Received: from smtp01.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix03.mail.de (Postfix) with ESMTP id 39296801A9;
 Sun, 20 Aug 2023 17:20:20 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 08C112412F3;
 Sun, 20 Aug 2023 17:20:19 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 17:20:10 +0200
Message-Id: <20230820152011.81543-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1278
X-purgate-ID: 154282::1692544820-33FFE602-0C17BD80/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692544820;
 bh=dJqJ3Gik2ZjjLKJXvLiS1xjhitK/QHUNJgYPdmuNywU=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=BkcK5HDW0BlNceFKHKhQb0rpDmnT0dcXNO2vD4DaX7b2TRXC/iB7FYVXGhijyz6v7
 +WP89CTMsNoqbDhDw2Cl1Hc80xdU6iqmurjdx8nDJRTutHmd66bluasxPgqeXwZGIl
 4nUJKavXveJC9Sn+MTB0vhgMi/6zPhdzp+Ww97S/WmXBqe94jy2B74KfuiBg82ElBR
 lUsj02g4WMBpV+F3kNYCtAAZWT2RpUdVgXVt5FdTHxCoEpsGZJAhtgWseDHvnmsF+b
 QhchE5OwzPgTbMQVE4/oXTUcfm1M86fk3+xU8/tC8AsUSpHcK8G13GUl6V6zcOvwjo
 8qvR/lzFvSmVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=BkcK5HDW
Subject: [Buildroot] [PATCH v2 0/1] Fix Rock 5B build,
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

Kilian Zinnecker (1):
  configs/rock5b: Add patches to fix gcc12 warnings

 board/radxa/rock5b/linux.fragment             |  1 +
 ...st-ether_addr-prototypes-to-silence-.patch | 62 +++++++++++++++++++
 ...x-building-error-on-Werror-array-com.patch | 45 ++++++++++++++
 configs/rock5b_defconfig                      |  1 +
 4 files changed, 109 insertions(+)
 create mode 100644 board/radxa/rock5b/patches/linux/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
 create mode 100644 board/radxa/rock5b/patches/linux/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
