Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAA9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D0B8140B;
	Sun,  9 Jan 2022 15:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kG0AomCjybti; Sun,  9 Jan 2022 15:17:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 512E4813F1;
	Sun,  9 Jan 2022 15:17:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B42A1BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87FA7813F1
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBG7eQ1Ip2hd for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:16:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC784813CB
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 15:16:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9C2E75FFA7;
 Sun,  9 Jan 2022 16:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641741416;
 bh=6eBFbvoequU805711/IiAhDEpXYZWLdZsUsqn8mBa0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=evti4QmL1WCSZiua+xtVEyBDER3sfvMsOv4/PO/2204ZLWgOr/Z3BxciLldUAqC1Z
 S44xW2fDiEBTS/JQfZJAdwqveyUPlyn5kQBZf34lKbTAsnF+mAxr488GXOw7G4Gq6e
 ACd9sXwid3TBEHNu2wX6D8ucSU2rwgsZItD5CD374InvBymrs8m6c3c1JSrlK3UHbO
 u6tFpTuAbr/KIcdeB8vRncL3V3n1l5VZItnDVGlGagQeoXtOP4RwE8esBfjMKkng+Y
 JHWHVTtfrqQ48H7gGs5HFwVx9LbrUz39h0MRoTX2psRgB+nXewbE7k5Ht3NWH1vNsV
 vQ8lHeQ1eQ7RA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 16:16:53 +0100
Date: Sun, 9 Jan 2022 16:16:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220109151653.GC1477939@scaer>
References: <20201017221743.160029-1-nolange79@gmail.com>
 <20201017221743.160029-2-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201017221743.160029-2-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 2/4] package/gcc: use binutils wrappers
 for target libs
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nrobert, All,

On 2020-10-18 00:17 +0200, Norbert Lange spake thusly:
> This will use gcc-ar, gcc-nm and gcc-ranlib instead of the
> normal binutils tools. The difference is that with the
> wrappers, gcc plugins will be automatically picked up,
> which might be necessary with some flags.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v1->v2:
> *   Only set those wrappers if gc 4.7 or newer
> ---
>  package/gcc/gcc.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 114c2887a0..a24ffe3ee2 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -99,6 +99,9 @@ GCC_COMMON_TARGET_CFLAGS += -Wno-error
>  endif
>  
>  # Propagate options used for target software building to GCC target libs
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
> +HOST_GCC_COMMON_CONF_ENV += AR_FOR_TARGET=gcc-ar NM_FOR_TARGET=gcc-nm RANLIB_FOR_TARGET=gcc-ranlib

So we were a bit skeptical about this one.

First, we believe that only the final gcc should be using those. Indeed,
we do not need much of the initial gcc, except libgcc.a, which anyway
gets overwitten by the final gcc, so we do not care that the libgcc.a is
built with LTO (and thus the gcc wrappers).

Second, gcc initial is only used to build glibc, and as your patch 4
states, glibc must not be built with LTO, we we also do not care that
the initial gcc uses its wrappers to build libgcc.

Third, shouldn't we be using the tupple-prefixed wrappers? Or does it
just happens that gcc will internally add its build directory to PATH so
that it can find the un-prefixed just-built ones?

For that last point, I added gcc-ar, gcc-nm, and gcc-ranlib in my PATH,
that are just simple wrapper scripts that trace their being called, and
then call to the actual gcca-r et al.:

    #!/bin/sh
    me="${0}"
    my_name="${0##*/}"
    found=false
    for i in $(which -a "${my_name}"); do
        if [ "${i}" -ef "${me}" ]; then
            found=true
        elif ${found}; then
            me="${i}"
        fi
    done
    if ! ${found}; then
        exit 42
    fi
    printf "YEM: wrapped %s\n" "${me}"
    exec "${me}" "${@}"

Turns out that the 'YEM: wrapped' string occurs nowhere in the build
directory (so it does not end up in config.log or whatever), and it
does not even appear on the stdout/stderr either.

So I am wondering how we can exercise these... Any hint?

Regards,
Yann E. MORIN.

> +endif
>  HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
>  HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
>  
> -- 
> 2.28.0

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
