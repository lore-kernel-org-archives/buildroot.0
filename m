Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E56EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 19:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C54BF60AD0;
	Sun,  9 Jul 2023 19:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C54BF60AD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLprHLxcoJHM; Sun,  9 Jul 2023 19:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E8766076C;
	Sun,  9 Jul 2023 19:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E8766076C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBB481BF356
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 19:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9503640125
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 19:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9503640125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Op7xV6Aj53e for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 19:57:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E3940017
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0E3940017
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 19:57:40 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 03F98A07D9;
 Sun,  9 Jul 2023 21:57:38 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id D968AA03C3;
 Sun,  9 Jul 2023 21:57:38 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 84A78A03AD;
 Sun,  9 Jul 2023 21:57:37 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 09 Jul 2023 21:57:37 +0200
Message-ID: <2230681.iZASKD2KPV@kilian-aisec>
In-Reply-To: <20230628095825.905451-1-ludwig.kormann@ict42.de>
References: <20230628095825.905451-1-ludwig.kormann@ict42.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 201
X-purgate-ID: 154282::1688932658-3CFF9199-CBF35F9A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688932658;
 bh=JtpCQkZdh2ueW28+OO9rDmPXxhx0sxiaXvdMUeTPToA=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=5PvkDjZJmt1UecGPdiCd+i9mnQoT3uTmopsbh5f8ewg2EgdLwXAnR2CM3DHNb9jwZ
 0DHNpu6NniEjkpDKCDM5a3Uv0MxnBkpuPpHf2uiGYHjDKouuacO0zq49TlO5O92Dbd
 DN83NhAPWfDytgX0bhsc6swGN890oRmlFt6g9QfusWW9GSewo4bpTKooupg9YkYgG9
 4bKLaxoXCafVblK6TYnsXddcQ34EwzKAkXNdfWJewSzKUL+ARKbCqxV8X5+818pS8Q
 MoEeSq/mSkkIMHnIfvvsu09vvAUpTqHgBPC9brd8KWMhcVNsZcYiunpwhYZvmtDKet
 Sq8l7bidwGfGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=5PvkDjZJ
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/icnova-a20-adb4006: new
 defconfig
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
Cc: Ludwig Kormann <ludwig.kormann@ict42.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ludwig, all,

...
> Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
...
Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
        build test only

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
