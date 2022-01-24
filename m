Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC2CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 254EA60FA4;
	Mon, 24 Jan 2022 21:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbSqSwNxrNmI; Mon, 24 Jan 2022 21:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 261D960FA5;
	Mon, 24 Jan 2022 21:24:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 690DB1BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 561B440294
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKikip62aYyb for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:24:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B5FB4022D
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:24:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f930:a371:1de8:7a1a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9893D19F4F8;
 Mon, 24 Jan 2022 22:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643059444;
 bh=gS5aSQbHH34rDaUlmcCpmsiX0y8ZqbONVu/siFZAM50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UcQ18NylUDYVoc++rl5ds1lNOyiy+sz1k2R/xlOtS/ykRlTgObcRvYIJXXVZfmZEO
 VMUjDGXm0M0fS2iudRJYbci/Lna43tr7bWhEwu/H6cm0DUtHjcmWO2fPCScitauvTB
 lTrY1clnpF68f74YRjvirro3Fi+Fxt9x8yfE47u8jU1b41QBcKMlyIHqZkI72MgIIH
 V4CbQnO2/Q1HU5bXIf8fi72Frxf/3LBrKgqfVBjymEpi/5GUjb/QnlSIe+xyY/mf+C
 aYAEyex0WTKmuqlvVBZJTdwhz19GBq1lcxX3CQ6R5jEt9qoxqKbfebTPfEOwTKmiMk
 XUKXVdwMkaHYw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 24 Jan 2022 22:23:58 +0100
Date: Mon, 24 Jan 2022 22:23:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220124212358.GK2502@scaer>
References: <20220115160449.2292472-1-fontaine.fabrice@gmail.com>
 <20220119202351.GA3095239@scaer>
 <c4c033a6c8012a54043d4f1e28678834@free.fr>
 <20220123205148.GH2502@scaer>
 <51028e4dcbbad93168992ae30a6f8330@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51028e4dcbbad93168992ae30a6f8330@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: set --with-boost
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2022-01-24 19:47 +0100, Julien Olivain spake thusly:
> On 23/01/2022 21:51, Yann E. MORIN wrote:
[--SNIP--]
> >So, either we have a patch that fixes the Boost detection (and we push
> >that patch upstream), or we can only depend on host-boost and keep the
> >current status.
> 
> I proposed a small upstream improvement of the boost detection here:
> https://github.com/riscv-software-src/riscv-isa-sim/pull/909
> 
> This should allow a clean host-riscv-isa-sim build in Buildroot using
> --without-boost is all situations (i.e. host has/hasn't boost, br host
> has/hasn't boost).

Thanks for the heads up. It looks like upstream has been positive about
that patch of yours, great! :-)

When they actually merge it, do not hesitate to send an update to
buildroot to backport that patch.

Thanks!

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
