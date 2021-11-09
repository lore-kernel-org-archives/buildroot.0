Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D23C433FE
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:26:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F4E61038
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91F4E61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 646EB6083F;
	Tue,  9 Nov 2021 22:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AblO66I1DVrh; Tue,  9 Nov 2021 22:26:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8491A60899;
	Tue,  9 Nov 2021 22:26:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3BD41BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D231B60899
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2xEc32xt1_O for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:26:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54D596083F
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:26:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:710f:610b:602a:e07])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 58131200055;
 Tue,  9 Nov 2021 23:25:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636496760;
 bh=Bs46A7qYv4m1W0V3/Osu2Tb/PB0b/kckxrokEt8+3Hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=anoBVmax6/mdOhMCYzfsVm7+B8ZpbW/NzhQnbf1wHLIXnxLUL7goLYdDitV3NfDNP
 McekQvuTkH2Cj+EaYnjfDvZw5UCXd7f4ULozU11FnVo1YYDnQRu5tFPmnnqNTEYEOe
 MOdlmOg0DxZvZ/Ek3GmF2ITfeNawEtik3+DVyttCh0BaQMdzJyXEvFEFRexqZGokpa
 yTmCfmNTgwb9vojWU7y5GrUz5PvLn55S8ZTvAJvQqx8QTrMh7RF0wW3uwwHyqEJYNI
 OnhEuCEXqVh5cD/TR9xuKhjzgp+85AzI9s4R/8xpt6JsIt6z8JFn7iA/KRSihybEXp
 UTyxbcV+WlgAQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 Nov 2021 23:25:51 +0100
Date: Tue, 9 Nov 2021 23:25:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211109222551.GB2084998@scaer>
References: <20211030214734.2154583-1-fontaine.fabrice@gmail.com>
 <20211101094752.4f0e6943@windsurf>
 <8aa1132c-43c5-93bc-718b-5199c9936c0d@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8aa1132c-43c5-93bc-718b-5199c9936c0d@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/oprofile: needs zlib
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Thomas, Fabrice, All,

On 2021-11-09 22:40 +0100, Arnout Vandecappelle spake thusly:
> On 01/11/2021 09:47, Thomas Petazzoni wrote:
> >On Sat, 30 Oct 2021 23:47:34 +0200
> >Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> >>oprofile needs zlib to avoid the following build failure which is, for
> >>an unknown reason, only raised since August 2021:
> >
> >I don't really like changes that are made "for an unknown reason".
> >Indeed, if you look at
> >http://autobuild.buildroot.net/?reason=oprofile-1.4.0, this issue only
> >appeared 3 times, and only on static-linking configurations.
> >
> >So, I would really like to see a better investigation than just "adding
> >this fixes the problem". We are clearly building OProfile many many
> >times in the autobuilder, and it doesn't need zlib, except in this
> >particular statically linked configuration.
> >
> >So I'm afraid we need a more in-depth exploration of this issue.
> 
>  I did a slightly more in-depth exploration.
> 
>  In config.log, we see this:
> 
> configure:13535: checking for bfd_openr in -lbfd
> configure:13560:
> /tmp/instance-0/output-1/per-package/oprofile/host/bin/arm-linux-gcc -o
> conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -Os -g0 -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -static conftest.c -lbfd  -liberty -lpopt  -lintl >&5
> /tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /tmp/instance-0/output-1/per-package/oprofile/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbfd.a(compress.o):
> in function `decompress_contents':
> compress.c:(.text+0x3c): undefined reference to `inflateInit_'
> /tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> compress.c:(.text+0x70): undefined reference to `inflateEnd'
> /tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> compress.c:(.text+0xa4): undefined reference to `inflate'
> /tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> compress.c:(.text+0xb8): undefined reference to `inflateReset'
> /tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /tmp/instance-0/output-1/per-package/oprofile/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbfd.a(compress.o):
> in function `bfd_compress_section_contents':
> compress.c:(.text+0x640): undefined reference to `compressBound'
> /tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> compress.c:(.text+0x6d8): undefined reference to `compress'
> collect2: error: ld returned 1 exit status
> 
>  Note that in this configuration, zlib is not selected (*), but apparently
> libbfd is still built with zlib support...

That's because binutils (at least 2.36.1) ships with a bundled copy
that it builds:

    >>> binutils 2.36.1 Building
    [...] /usr/bin/make -j9 LIBS= MAKEINFO=true -C /home/ymorin/dev/buildroot/O/build/binutils-2.36.1/
    make[3]: Nothing to be done for 'all-target'.
    Configuring in ./etc
    configure: creating cache ./config.cache
    checking for a BSD-compatible install... /usr/bin/install -c
    configure: updating cache ./config.cache
    configure: creating ./config.status
    config.status: creating Makefile
    make[4]: Nothing to be done for 'all'.
    Configuring in ./zlib
    [...]

And hence libbfd is built against the bundled libz, which being what
autotools call a convenience library, is not isntalled.

And this bundled copy is always built, even if one is already present in
the system (i.e. with zlib enabled in the configuration).

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
