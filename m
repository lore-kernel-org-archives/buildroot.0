Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18C2EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 18:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F3EE40ACD;
	Fri, 14 Jul 2023 18:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F3EE40ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKMsxeJWYfVm; Fri, 14 Jul 2023 18:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C9AB41889;
	Fri, 14 Jul 2023 18:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C9AB41889
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80AC71BF836
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 18:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65275402E1
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 18:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65275402E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Oxm-tksJK4h for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 18:08:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C0E402C5
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77C0E402C5
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 18:08:16 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id B2B16A043E;
 Fri, 14 Jul 2023 20:08:14 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 9784C800C3;
 Fri, 14 Jul 2023 20:08:14 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 510EF10013C;
 Fri, 14 Jul 2023 20:08:14 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 20:08:13 +0200
Message-ID: <45660995.fMDQidcC6G@kilian-aisec>
In-Reply-To: <20230710212151.574040-2-robertoxmed@gmail.com>
References: <20230710212151.574040-1-robertoxmed@gmail.com>
 <20230710212151.574040-2-robertoxmed@gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 409
X-purgate-ID: 154282::1689358094-FEFFB7B6-3479CB9F/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689358094;
 bh=K5ls23M+syoQXdz9esM1HAAHt7SHo1i0UgH62f/zsXY=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=OUO3ppOZF9FJgMngGe5vPUne8M8bFCvmMBYwe8G8PQG9QYNOY4rTelzVPD/+6F2MJ
 fcOR3z4TvrsTaqYL749v+1zUSbojUtGxQyJ1I+LmSxJS6XWMVvZuevitKuvktKbTn+
 lbpYLAKQ3SVltQU394sCeZoTqW3G1eyHRBp4indK64OOxy/C7+/suG3M0MvqupYwgz
 aVrdoysvq+phAGMxCJBiRoV19Va1Sg0vOWph/5D3dSD3Cvyv1LQvLbCfueFi9Hr/bg
 9CBZfenCiRN0Q4lNhJpK2HFADjDu3ITMad8e9bqlLSIlhk75cCmKxXUyIQKsS78gaB
 bjbQnJLjvpo3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=OUO3ppOZ
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
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
Cc: Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roberto, all,

...
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
> Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
...
Reviewed-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Tested v2, but again build test only (I don't have that board). I also had a 
look at it and it looks good to me.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
