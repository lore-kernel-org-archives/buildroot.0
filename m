Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8789AC433FE
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 19:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9D4D4163D;
	Mon,  3 Oct 2022 19:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D4D4163D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jv8hvjJS5-_y; Mon,  3 Oct 2022 19:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F99A41634;
	Mon,  3 Oct 2022 19:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F99A41634
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2227E1BF2C0
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 19:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0930341634
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 19:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0930341634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MULbGNo7BP4s for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 19:15:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28BD54161F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28BD54161F
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 19:15:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:70fa:1b29:1fd9:da2a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F40975FF96;
 Mon,  3 Oct 2022 21:15:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Oct 2022 21:15:36 +0200
Date: Mon, 3 Oct 2022 21:15:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20221003191536.GC30794@scaer>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
 <20220928233856.77bb191c@windsurf>
 <dda7b7d2-4846-6623-5ca7-39799015a138@gmail.com>
 <20221001190702.GQ30794@scaer>
 <ee93a0b3-3743-3fbc-f34e-995178d429d8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee93a0b3-3743-3fbc-f34e-995178d429d8@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664824540;
 bh=NUIuq0XRMiAkZKVqVVLspSvugrDzzMQtrPq6m2tTDKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vb/rdT7K2hRKoHZ6SVH+Z84OU2k96h2wZoIwBUT20EBsW3oalFGGetl82kROubapI
 7CljA27VS/OXGjhnp0lfAOhXxv2dRz4rHbRpl9IUIXXDa7li8Ju5XuufUfohFfe9gW
 z/VRE2gwGGtbNu27cPpZI1D0NSL0oT7YfzK61xSbFHUreAfdjgvpS+YruO0O+Bmi4e
 rhZG81oMqd5NdnKY2HeBagSPsSxItV0BSnNqxW6bX1qQqF0ONj3WAhNf7luMzcjwVV
 +gJempRAIF3/QS6QLZSzD1RNBWyY6tgXUMGZzG4njo4aY9hRpEf25kfcWvEl8p6nrv
 Qgg4KJvzUW9Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vb/rdT7K
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, All,

On 2022-10-03 10:21 -0700, Florian Fainelli spake thusly:
> On 10/1/22 12:07, Yann E. MORIN wrote:
> >On 2022-09-28 15:28 -0700, Florian Fainelli spake thusly:
> >>On 9/28/22 14:38, Thomas Petazzoni wrote:
> >>>On Tue, 27 Sep 2022 15:11:33 -0700
> >>>Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>>>Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
> >>>>("perf tests: Add test for PE binary format support") present in >=
> >>>>v5.10 there is an unconditional installation of PE binaries which will
> >>>>be rejected by the check-bin-arch script.
> >>>>
> >>>>Make sure that these binaries are excluded from being checked to allow
> >>>>the installation of the perf tests.
[--SNIP--]
> >>I should mention that the readelf binary in this case is the LLVM Object
> >>Reader and it does support PE/COFF which is probably why it even remotely
> >>attempts to parse the file.
> >
> >Is that a publicly available toolchain?
> >Can you share the recipe how that toolchain was generated?
> Yes that will be done.

Great!

> >Do you have special, local changes in Buildroot to accomodate that toolchain? Will you submit those changes?
> Yes a few and yes we will, provided there is interest from the buildroot
> community to have support for a GNU-free and musl-libc based toolchain.

I am personally not interested in a "GNU-free" toolchain. However, I am
very much interested in an llvm-based toolchain.

Semantics, semantics! ;-)

> The
> approach we took for now is that we provide a GNU-compatible wrapper and set
> of executable names such that you build with clang/LLVM but you don't really
> need to know about it, except where it matters.

Yes, that sounds like a good approach.

> >That would allow adding more testing to avoid such issue in the future.
> >Otherwise, I am not fan of adding such exclusion for private cases that
> >we can not (easily) reproduce, as those cases are not supported.
> Fair enough, how about we make sure the toolchain is available, can be
> re-created by anyone who desires so and then we submit the changes to
> buildroot that we have so you see the full picture?

Yes, that would be awesome!

As I said above: having support for using an llvm-based toolchain would
be very interesting!

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
