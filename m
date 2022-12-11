Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB74C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCDA840920;
	Sun, 11 Dec 2022 16:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCDA840920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYoPpHCgyp-3; Sun, 11 Dec 2022 16:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E9240910;
	Sun, 11 Dec 2022 16:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E9240910
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 866EB1BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F5638142B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F5638142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5OR7zTxMkzQ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:26:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 860C58141C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 860C58141C
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:26:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c8de:37ee:6661:285c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D248013F8C8;
 Sun, 11 Dec 2022 17:26:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 17:26:31 +0100
Date: Sun, 11 Dec 2022 17:26:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221211162631.GS1044805@scaer>
References: <20221211152153.1833386-1-giulio.benetti@benettiengineering.com>
 <20221211162455.GR1044805@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221211162455.GR1044805@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670775993;
 bh=FUPeCjpcuy/qJNatXoyKYocEfuMMlOywk5WkSXql+AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tsBS4o4DHCmcdx9037D23uGxfLBVuS/SaMNT2y0/yl5ePNVB5SSrD6u7i/32fkDZM
 alonAWf7wWoLSeeVHw+NiSDg/XuPDmXfqKpDL08hQh/ka7aAaUqIipF18Jq3Hb1nYY
 dNBATHCLb++xjaxSnp5N9HJULEXd1QOeqUd9c7waT5Po73VndshLhgfdwNZANJ1yv3
 RkGEYYy/K8mulstkXNmLtIvgzFW957un5ltACKBhSAUzupV6Jv6WnMWH4hSWsnmrjm
 +eKh9DwsPseb6/Ewc2szZAOiBQC8A0q3g3QS88bABsVutpruvEWg+O+TsDv4vCMNs8
 zBJ/IA8qicpng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tsBS4o4D
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to latest version
 to build with Linux version up to 6.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-12-11 17:24 +0100, Yann E. MORIN spake thusly:
> On 2022-12-11 16:21 +0100, Giulio Benetti spake thusly:
> > Add pending patches upstream[0] to fix build failure. Patches fix build
> > failure with Aarch64 and Linux 5.18/5.19/6.0
> > 
> > [0]: https://github.com/bootlin/mali-driver/pull/4
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/6f073fea149533a294dd838ce8373185236fe1d4/
> > 
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Applied to master, thanks.

Nope, nope, nope; not that one... Sorry for the confusion...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
