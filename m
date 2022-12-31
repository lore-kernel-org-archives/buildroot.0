Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE28C3DA7D
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 12:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6C524012E;
	Sat, 31 Dec 2022 12:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6C524012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olZgIf0V_0UB; Sat, 31 Dec 2022 12:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31CC840128;
	Sat, 31 Dec 2022 12:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31CC840128
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBD971BF31F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 12:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96B6C60776
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 12:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96B6C60776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bydhRnlVbfSY for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 12:31:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06133605EA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06133605EA
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 12:31:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:37e6:2c2e:a294:8f1b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 75D8E13F895;
 Sat, 31 Dec 2022 13:31:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Dec 2022 13:31:30 +0100
Date: Sat, 31 Dec 2022 13:31:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Carlos Santos <unixmania@gmail.com>
Message-ID: <20221231123130.GK2498764@scaer>
References: <20221227114842.2620182-1-unixmania@gmail.com>
 <20221229214611.GJ2498764@scaer>
 <CAJ4jsadDkjBaK8_GE_WaeNLVmmmY8e=Q9YanCtLUK17nWO8enA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ4jsadDkjBaK8_GE_WaeNLVmmmY8e=Q9YanCtLUK17nWO8enA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672489893;
 bh=PZO/G31KKCWWqFTDgNIS2IpY6VyUJYl0ZnaGElSp5gI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o7S1jLC/hPurqVB1/LLnofRpdXycQZMakCh9HhirPkMkiCKHMx9LsWugsoVXYJ4k4
 H8x7avFg/gWi4QzAmfSMqIlfqSSzjMdkIXjT9RwDKH5xqAtqJg1ZLOh2nZ+rL/LCZj
 VYagx1bNCahDVBmi7kQ/k+AtC6No/loxobXfTK1kH4bI4X+NJhpaTZ6ia1LGI/exrg
 UZ28QZWOAtySVMqnnFi96MejDBjmAn3smiFrzokUdKv9q+2fgB7Lue0NnTWOJAHesC
 F2/pN8w8VjOw6bBJbK/54c8TkLxbV/nrSXpfc6XIwZxTTlDoA1/Fmxcptjl1YZx+T0
 YWS53d7lEuWTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o7S1jLC/
Subject: Re: [Buildroot] [PATCH v2] package/qemu: refactor target emulator
 selection
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Carlos, All,

On 2022-12-31 08:18 -0300, Carlos Santos spake thusly:
> On Thu, Dec 29, 2022 at 6:46 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> ---8<---
> > Applied to master with a few changes:
> >   - always build at least user or system
> This is not good. It should be possible to build only the tools. I
> will send a patch to fix this problem.

Arg, indeed, I totally missed that. Thanks!

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
