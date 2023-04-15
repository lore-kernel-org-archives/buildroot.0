Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12C4C7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 08:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 383134055E;
	Sat, 15 Apr 2023 08:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 383134055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7oXjts6_4uEW; Sat, 15 Apr 2023 08:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4408A40320;
	Sat, 15 Apr 2023 08:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4408A40320
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0E21BF589
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 08:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D5CF429B7
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 08:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D5CF429B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvyhs4xf43fb for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 08:05:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1C06429B5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1C06429B5
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 08:05:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7B7055FF93;
 Sat, 15 Apr 2023 10:05:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 10:05:47 +0200
Date: Sat, 15 Apr 2023 10:05:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20230415080547.GC2819@scaer>
References: <20230405201403.1410075-1-pevik@seznam.cz>
 <20230410172429.GE2819@scaer>
 <CAB1t1Cyz6=SM2MWOeqMtj9U8KKsarvFEcJaPeJ_nDXtaQ_bK1w@mail.gmail.com>
 <20230414190117.GY2819@scaer>
 <CAB1t1CwsMzTgYyAY_AFftyUh+OdXADpKBXTw0Ot1reibt=fWgg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB1t1CwsMzTgYyAY_AFftyUh+OdXADpKBXTw0Ot1reibt=fWgg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681545952;
 bh=jqrf9/h2ot31kJmUj9MBlB99HkmsFcP8bOKeaUdTa6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oIBeEb8z7BhrYNHK8JncSAVZezBKLEBwuEwG2AiRryV8RCcjtOE/+oW9TJ6eTXzes
 OZ0g4FaLruVbtMpc8G7GfztaH30blfo5p+Jy8FIGOWVrPXSdwdc26s/If49mZL5qjV
 6yoKRSyo/kHCUf7FS5rWm2rYWyAyVCd+q6vmxUtQc3u7eI6fsbIVNjzj+HBwL9kk3u
 gHi4HSn73Ry/WCk4yMslTTH2yI8VubOTeQ2+Mc6lAcWVGRerw3vW2idkMtEcI4o6Yn
 2y5VKX/2eDIBIiT5Phs+y+3RS37pPpmdYlCzYha++EX7rP4wK6y6WxGHp8Q8/6wpTj
 HD44eg3JBo7+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oIBeEb8z
Subject: Re: [Buildroot] [PATCH 1/2] package/ltp-testsuite: bump version to
 20230127
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Petr Vorel <pevik@seznam.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr, All,

On 2023-04-14 22:54 +0200, Petr Vorel spake thusly:
> On Fri, 14 Apr 2023 at 21:01, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Unless the upstream ltp has provision for supporting both kind of
> > headers, with or without the fix, then yes, I think this should be
> > rebased and kept. And re-submit upstream to explain it will support
> > older, existing toolchains.
> 
> I'll verify again support/config-fragments/autobuild/toolchain-configs.csv, if
> there are tests which will fail.  Or are these toolchains elsewhere? I'm asking
> to give some proof to upstream that there are toolchains with older kernel
> headers. Because upstream expects that old distros are being tested with old
> version and if people want new software they are able to update their
> toolchain. They will see a real example than just claiming "it's needed".
> Also have a way to check in the future that workaround can be removed.

I looked at toolchain/toolchain-external/toolchain-external-arm-aarch64/
which is the first external toolchain in the list of toolchain Buildroot
knows of.

That one is using kernel headers 4.20.13:

    https://developer.arm.com/downloads/-/gnu-a
    https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-a/10.3-2021.07/srcrel/gcc-arm-src-snapshot-10.3-2021.07-manifest.txt

    Excerpt:
        [linux]
        type=git
        url=git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        version=v4.20.13

It's the last toolchain from ARM that is not impacted by:
    https://bugs.linaro.org/show_bug.cgi?id=5825#c34

Even the release from 2020-12 still has kernel headers 4.20.13:
    https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
    https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/srcrel/arm-gnu-toolchain-src-snapshot-12.2.rel1-manifest.txt

    Excerpt:
        [linux]
        type=git
        url=git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        version=v4.20.13

So, whether impacted or not by the abovementioned bug, people using
official tolchains from ARM use kernel headers 4.20.13, which I
understand do not have that fix.

And that's only by looking at one of the few toolchains Buildroot knows
of. There are countless such toolchains that have been built over the
years, and that they can't update (e.g. because they are using the
official toolchain provided by their chipco vendor, or because the
kernel they are using for their board is a fork by some vendor and does
not have that fix, and so on...).

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
