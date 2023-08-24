Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECEAC27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 19:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 646DC4095F;
	Thu, 24 Aug 2023 19:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 646DC4095F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2BFnNaFWVED; Thu, 24 Aug 2023 19:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7576405E9;
	Thu, 24 Aug 2023 19:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7576405E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCF4C1BF852
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 19:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 967A160F7A
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 19:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967A160F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iin7cwzk1NjO for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 19:44:14 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC89960F7D
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 19:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC89960F7D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ced9:48d:9640:c8a7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id ABDED19F5A8;
 Thu, 24 Aug 2023 21:44:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 24 Aug 2023 21:44:07 +0200
Date: Thu, 24 Aug 2023 21:44:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230824194407.GB3722679@scaer>
References: <ZNEOketbv2Ba6O5N@waldemar-brodkorb.de>
 <20230807220645.546836bc@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807220645.546836bc@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692906251;
 bh=sTZQWVgHJZPtGcrs2z7mbttyt9laAyXoWZ6l/+gVR0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N4779yYyP+OO9suufSArZ6UKgoAAeIO0oL4J0yl/PAO4CkU/IuRMfU950d7Y5kA31
 6x/MhSbIJJgnxB7Y8wg+0XyJuAJp48JhLL/BYBxcKzDUBPrNGA2lXpQofU+YeC/Ro/
 XjMA+1hkz4L77txxLwaXRXMNYQimbtojLMH/uVvEeLVltb4Z+NFvMp8wCseZZR5hJB
 T1MzSOPZWXKOaFWQtiQWrr8N2be/ZVaL+GoBexdWfUBEBhcRkZNFe7hQqgN4z1ekCT
 BnnuXzk7JQiBc/XnxTIcTd2ifSmYQCBEax0zm317tJSnGhtiEAIU2FscRU7WOdOBkm
 qYTYDxpzS0rmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N4779yYy
Subject: Re: [Buildroot] [PATCH] package/check: fix compile issue
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
Cc: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Waldemar, All,

On 2023-08-07 22:06 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Mon, 7 Aug 2023 17:32:33 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> > Switch to the tagged version of check.
> > See here for details:
> > https://github.com/libcheck/check/issues/303
[--SNIP--]
>     Until upstream publishes a new release with a complete tarball, switch
>     to fetching the Github-generated tarball, which does contain the
>     missing file.
[--SNIP--]
> >  CHECK_VERSION = 0.15.2
> > -CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
> > +CHECK_SOURCE = $(CHECK_VERSION).tar.gz
> > +CHECK_SITE = https://github.com/libcheck/check/archive/refs/tags
> Switched to using the github helper, exactly like Daniel Lang suggested.

This is incorrect, because the archive content changes, but the archive
filename does not; hence the copy we host on s.b.o. is invalid, and
since we've had check-0.15.2 since 2021-04-06, we've had a few releases
already that uses that version.

So we can't replace the one on s.b.o with the new one.

Instead, the only solution is to switch to using a git hash instead of
the tag.

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
