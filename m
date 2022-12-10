Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6411C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41FDC81B52;
	Sat, 10 Dec 2022 16:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41FDC81B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4OEIgJAYZ4E; Sat, 10 Dec 2022 16:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F74381B35;
	Sat, 10 Dec 2022 16:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F74381B35
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1538F1BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4FCD400AF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4FCD400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqSVwFUq5xZ2 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:18:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00A340376
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D00A340376
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:18:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C1D405FFAB;
 Sat, 10 Dec 2022 17:18:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Dec 2022 17:18:51 +0100
Date: Sat, 10 Dec 2022 17:18:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20221210161851.GC1044805@scaer>
References: <20221210131713.274886-1-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210131713.274886-1-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670689135;
 bh=4KDOJPudzc+laBnuW83U6f6BvL+itD90qWp1rDHOi+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m0+W3CbuuFVXBZPzHGCGaZYjxpR0aE6b8b3wBI74qDrqo+KOasoDnOgbPJMdQpyp1
 whl5vmPR1Ls9AQWZDmEAy0rY3U46iyKTDRkN8TmZF68+4OgLa3FjX+EWk92VyXre3D
 pLCohjeujcoCmK5bBiNpOaupOg7OSp6XjIIQOz1KAubpKQ/XDq/3GgiqSl6U4W6oZ6
 JIC8DBKxjB8Kf2wmKRM4saymap7Ra+zeYlhrY0U5xgzGOdH3nntoajVIcsJSMwIOp8
 cMXf5K1uktvoEcFWDK1jzvtTPTmZ66rxC77fgeDF0PNUCV6GirEjDoLP0ApvWwqniN
 63w96AuMlVG9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m0+W3Cbu
Subject: Re: [Buildroot] [PATCH] package/libxml-parser-perl: fix build when
 host matches target gcc
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

Norbert, All,

On 2022-12-10 14:17 +0100, Norbert Lange spake thusly:
> The host configure and build step looks for same compiler name
> (eg. x86_64-linux-gnu-gcc), and the build potentially breaks
> if the target compiler is named identically.
> 
> revert PATH env variable to not include the target binaries.

We pass $(HOST_CONFIGURE_OPTS) in the environment, which contains a
definition for: CC=$(HOSTCC)

And HOSTCC is defined as:

    ifndef HOSTCC
    HOSTCC := gcc
    HOSTCC := $(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
    endif

In my case, however, I can indeed see that it uses it (single line
wrapped for readability):

    /usr/bin/gcc -c  -I/home/ymorin/dev/buildroot/O/master/host/include
    -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fwrapv -fno-strict-aliasing -pipe
    -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g
    -DVERSION=\"2.46\" -DXS_VERSION=\"2.46\" -fPIC
    "-I/usr/lib/x86_64-linux-gnu/perl/5.30/CORE"   Expat.c

So, I looked at the generated Makefile, and I can see;

    # These definitions are from config.sh (via /usr/lib/x86_64-linux-gnu/perl/5.30/Config.pm).
    # They may have been overridden via Makefile.PL or on the command line.

So, we are passing CC et all in the environment, so they do not override
the ones my system perl was built with.

We are also even forcing LD, but it is not accounted for either... I
guess that _may_ work when we are building our own host-perl, but not
when we are using the system perl...

So, I think the best fix would be to change how we pass CC et al,
either by passing HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS as options
instead of in the environment, or by carefully cherry-picking CC, LD and
maybe a few others, and force them to be passed as options.

Regards,
Yann E. MORIN.

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/libxml-parser-perl/libxml-parser-perl.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
> index 37cef2e418..4af4485429 100644
> --- a/package/libxml-parser-perl/libxml-parser-perl.mk
> +++ b/package/libxml-parser-perl/libxml-parser-perl.mk
> @@ -14,6 +14,7 @@ LIBXML_PARSER_PERL_RUN_PERL = `which perl`
>  
>  HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS = \
>  	$(HOST_CONFIGURE_OPTS) \
> +	PATH="$(PATH)" \
>  	LD="$(HOSTCC)"
>  
>  define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
