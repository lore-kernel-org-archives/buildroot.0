Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567E9C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 17:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66C3812F7;
	Sat,  1 Oct 2022 17:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66C3812F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrFa0dOL3hCA; Sat,  1 Oct 2022 17:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DBF2812C9;
	Sat,  1 Oct 2022 17:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DBF2812C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6191BF57F
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 17:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15EE9812C6
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 17:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15EE9812C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjxrfch9cnrA for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 17:53:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D640881255
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D640881255
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 17:53:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8EE51780313;
 Sat,  1 Oct 2022 19:53:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 19:53:32 +0200
Date: Sat, 1 Oct 2022 19:53:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20221001175332.GN30794@scaer>
References: <20220929145740.4846-1-shorne@gmail.com>
 <YzgmG9Ihqt6xC7CA@oscomms1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YzgmG9Ihqt6xC7CA@oscomms1>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664646818;
 bh=XVqQEszfsaqpORn/XyfgPty0a3ejN+XQ6ormQgbYw08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XZwpmaYwSmsEUKI+YcW22Sg7KolY8rdVHBaxwjQE73/MNi3/zkVqGM17GVlnZmyeY
 TCsIo9iNgkdaxdO2lgUXeZybtpPMVvDcah/y5Gqc4+3jHZz3jADw/SMqc5j9++2TVF
 e/SZCPrO00hQ9gp1jgw1QPgceh0XcZWgs0URJKtSwiX0pdTaq//qiMqVdIaVsmdV4o
 dO5TTi8QO2VqA736potj6JNiPjlda+rud5OEtOOVkjtFe04AhCU2FbL63anCfxb4j2
 RiHdQMqBv4HjNpn9BuQ+TfhXkjN8+ltuCR7nnClq+/YIHkmSQ4EU8TNkTEgmkbtT5B
 5MOJg3Xcnhjnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XZwpmaYw
Subject: Re: [Buildroot] [PATCH] or1k: Only define TARGET_HAVE_TLS when
 HAVE_AS_TLS
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
Cc: openrisc@lists.librecores.org, gcc-patches@gcc.gnu.org,
 Yann Morin <yann.morin@orange.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stafford, All,

On 2022-10-01 11:35 +0000, Stafford Horne spake thusly:
> On Thu, Sep 29, 2022 at 03:57:40PM +0100, Stafford Horne wrote:
> > This was found when testing buildroot with linuxthreads enabled.  In
> > this case, the build passes --disable-tls to the toolchain during
> > configuration.  After building the OpenRISC toolchain it was still
> > generating TLS code sequences and causing linker failures such as:
> > 
> >  ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
> >  ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
> > 
> > This patch fixes this by disabling tls for the OpenRISC target when requested
> > via --disable-tls.
> > 
> > Tested-by: Yann E. MORIN <yann.morin@orange.com>
> > 
> > gcc/ChangeLog:
> > 
> > 	* config/or1k/or1k.cc (TARGET_HAVE_TLS): Only define if
> > 	HAVE_AS_TLS is defined.
> 
> I have pushed this upstream now.  Adding buildroot patches should be easy to do
> now.

That's great, thanks for fixing this! :-)

I'll poke my work alter-ego on Monday to look at providing the backports
for Buildroot.

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
