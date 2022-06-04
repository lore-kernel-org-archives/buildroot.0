Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1356C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 08:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E304408BB;
	Sat,  4 Jun 2022 08:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HulLcXMAC6c; Sat,  4 Jun 2022 08:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 894D540734;
	Sat,  4 Jun 2022 08:19:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 838131BF41F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71F0A40734
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZZ5yBsV-GFq for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 08:19:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E1DA4018F
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 08:19:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4072F5FFAE;
 Sat,  4 Jun 2022 10:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654330777;
 bh=jrv4+Og+jVd/LhXbisn4gj+UjCPq0Tr2JrSX97TVGDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=autlodS4Y8M/hjW7nfL3NPmWwoMT5nwYrG4rCrmj8+yoLj4q8lrn5Jni8qyMPqCGq
 Y/8LPFMZwOkdIqolYVXMGEqbdxRq27MMXIX1WbxII5lTze0YWN7uDXUQSmJqM5j2ud
 EnaAQkoBNntcPRFPsbOBDfgzwHF7CeyseGQtAP7XyvgedJe02kD6w+Cy92U7RK51MP
 blJslyfWZVvEzYxQ5A9Z4adEFBKOe464o/mNF5twIsEcdyc0sJHyaJJypZPbnpEqKf
 sPrlinfOtDLA8X44/TZ6wCPAqqymEsH2Ch97cbY0Q0D0d6PjpGBsmAR41sQjfpi/gY
 wg25H0BHP3SQw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 10:19:33 +0200
Date: Sat, 4 Jun 2022 10:19:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220604081933.GD427639@scaer>
References: <e123582d-c613-f81a-ac0d-b23bc4d3e74a@cartal.fr>
 <6478648f-ffb3-cda2-66ad-3758ead25319@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6478648f-ffb3-cda2-66ad-3758ead25319@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Make 4.3 and printvars
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
Cc: Jean-Pierre Cartal <jean-pierre@cartal.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-06-03 16:05 +0200, Arnout Vandecappelle spake thusly:
>  Sending this in name of Jean-Pierre, who is not on the list.
> >A quick mail to let you know that I also faced the make 4.3 printvars issue you mentioned in Buildroot mailing list.
> >On my side increasing the stack size limit as follow:
> >ulimit -s 16000
> >solved this issue.
>  I tested it myself and indeed, it works!

Unfortunately, it does not:

    $ make defconfig
    $ make allyespackageconfig

    $ ulimit -s
    8192
    $ make show-vars >/dev/null
    Segmentation fault (core dumped)

    $ ulimit -s 16000
    $ ulimit -s
    16000
    $ make show-vars >/dev/null
    [...]
    Segmentation fault (core dumped)

I guess it works by chance on "small-enough" configurations, but this is
still not guaranteed that it works all the times.

I'd rather have no workaround, than one that is half-functional.

Yes, the above *is* extreme, and a completely degenerate case, yet it
means the issue it still present for "big-enough" configurations (I
haven't tried to find how many packages must be enabled before we reach
the tripping point, but that's not the point).

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
