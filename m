Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388D4C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C53614A4;
	Sat, 13 May 2023 20:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C53614A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtIyfybPfGVU; Sat, 13 May 2023 20:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6F261492;
	Sat, 13 May 2023 20:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E6F261492
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA4071BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3D91403AC
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D91403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2Snl5U4gznx for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:13:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8AE94000B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8AE94000B
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:13:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D816AB0053D;
 Sat, 13 May 2023 22:13:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 22:13:09 +0200
Date: Sat, 13 May 2023 22:13:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230513201309.GH2582048@scaer>
References: <20230412222602.1975782-1-aduskett@gmail.com>
 <878rdt2wbh.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878rdt2wbh.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684008794;
 bh=JFdyZ+AkLYWBgvuhBwpSJUW8dJciwNFVdaA3S4i+e4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e+P/ZWGfnPAnNgpVY4gKIshiB3eqYK7jn3jZs+FWm3gOEieGE2ndb8Cqejb0DEeIM
 H++7i/T5a+syGvEgI2Mc0stkrfT14rFgeX5fIUDKlZ+qlZeI7QW8rAo2wWXHFP0mUZ
 EQafUf/EM+LnHJEfwnteNoPYgc1RsVeVmEpvfGBIi+abrqXvg+SAXuf2v2JtYN1qXd
 a93a+otwI0rTyQbZhZKX7a0a54L283j/b+PsV1vSIkyliXuiKgFl9XRyeHvbiJNz66
 9tiDAfMmQF7UbK5yIqWNhle5mCkRCs/o7gcRwZ+PJUpYyDhy9/sFEOdlvkZtLlQCUf
 a2djizVTVBUKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e+P/ZWGf
Subject: Re: [Buildroot] [PATCH 1/3] package/libnftnl: bump to version 1.2.5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam. All,

On 2023-05-12 21:17 +0200, Peter Korsgaard spake thusly:
> >>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:
>  > Also: Switch to tar.xz as the package is not distributed as a .bz2 any longer.
>  > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> Committed, thanks.

To affirm Peter's action: applied to master, thanks. ;-)

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
