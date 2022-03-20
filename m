Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0FDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 08:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DC18198A;
	Sun, 20 Mar 2022 08:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECDLB_EXnDtP; Sun, 20 Mar 2022 08:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC5FA8198D;
	Sun, 20 Mar 2022 08:46:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60B931BF5DA
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 08:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CAFF60B1F
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 08:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eW1OOmxPrNla for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 08:46:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C800E60A73
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 08:46:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8cd1:986d:e198:ceab])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C1CC313F87C;
 Sun, 20 Mar 2022 09:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647766004;
 bh=+towNTUKbbwgBWSWw0IhNFoikXivbe9y6BiprES/SGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OsMcpwH02kHhPSdYAUQ0B8plw8OWAOivDxH2BzngmlQPlq/xEy5eRkwB2/o+JQrT9
 p41gyxW6VF0X/xOJFisWfj6w/lWvvKJa+8DAIjmZBKt7BGbwc8T6s1t1c4m13uH/0W
 2ADsOH54OJiqZrapQRxkkWw3ytat2rL0g4N60tBpO3xvuvANtziqYU5PiBac0DClte
 Yo4HwFBQcscKcf5astr1pRkU8QdSSvCO+fjGQVtkdcIuydL9U6keZ7qwcL7UKBikKv
 oKHH8yZC9C4pZ28RiDRrr4mYlZvLbO1g0VOCsshLVaTri/DkD4c8dOEWaIcEBBZEej
 FtVp+ojVi0a2Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Mar 2022 09:46:42 +0100
Date: Sun, 20 Mar 2022 09:46:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Juan Garcia Blanco <juanrgar@gmail.com>
Message-ID: <20220320084642.GC1566358@scaer>
References: <20220319214536.2417-1-juanrgar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319214536.2417-1-juanrgar@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] support/dependencies/dependencies.sh: fix
 check for CWD in env vars
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Juan, All,

Thanks for following up on our earlier discussion on IRC.

On 2022-03-19 22:45 +0100, Juan Garcia Blanco spake thusly:
> The previous pattern incorrectly matches against path lists that don't
> contain CWD, but end with ':', e.g., exported like VAR=<...>:$VAR where
> $VAR is empty.
> 
> Now the pattern explicitly checks for $PWD in the path list.
> 
> Signed-off-by: Juan Garcia Blanco <juanrgar@gmail.com>
> ---
>  support/dependencies/dependencies.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index c604a9efcc..d1fe94c9b9 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -16,7 +16,7 @@ fi
>  
>  # Sanity check for CWD in LD_LIBRARY_PATH
>  case ":${LD_LIBRARY_PATH:-unset}:" in
> -(*::*|*:.:*)
> +(*:$PWD:*|*:.:*)

Nope, that is not correct. This checks that indeed PWD *at time of
check* is not in LD_LIBRARY_PATH (the following applies equally to PATH
and LD_LIBRARY_PATH)

However, what we want to check for, is that PWD *at time of use* is not
in LD_LIBRARY_PATH.

Consider a package build system that would do something like (cross-gcc
is linked to libgmp.so):

    cd src
    cross-gcc -shared -o libgmp.so my-gmp.c
    cross-gcc -o foo foo.c

When gcc is called, PWD is no longer the same as it was when Buildroot
checked for it, so when running cross-gcc, the dynamic linker will try
to load libgmp.so from the current direc tory, and as it exists, it will
load the incorrect libgmp.so. And this is exactly what we want to avoid
and what we want to check for.

For PATH, an empty entry is explicitly documented [0] as the same as
'.', but for LD_LIBRARY_PATH, it is not explicitly documented what an
empty entry would do, so when I wrote the code above, I erred on the
safe side and also considered an empty entry to be equivalent to '.'
for LD_LIBRARY_PATH too.

So we really, really need to keep a check for an empty entry.

However, as we discussed on IRC, the checks really have an issue, in
that they do not test for a '.' or an empty entrey at the beginnning or
the end of PATH or LD_LIBRARY_PATH.

So both test patterns must be changed to:

    *::*|:*|*:|*:.:*|.:*|*:.

Could you send an updated patch, please?

[0] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03

    A zero-length prefix is a legacy feature that indicates the current
    working directory. It appears as two adjacent <colon> characters
    ( "::" ), as an initial <colon> preceding the rest of the list, or
    as a trailing <colon> following the rest of the list.

Regards,
Yann E. MORIN.

>  	echo
>  	echo "You seem to have the current working directory in your"
>  	echo "LD_LIBRARY_PATH environment variable. This doesn't work."
> @@ -32,7 +32,7 @@ esac
>  # An empty PATH is technically possible, but in practice we would not
>  # even arrive here if that was the case.
>  case ":${PATH:-unset}:" in
> -(*::*|*:.:*)
> +(*:$PWD:*|*:.:*)
>  	echo
>  	echo "You seem to have the current working directory in your"
>  	echo "PATH environment variable. This doesn't work."
> -- 
> 2.25.1
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
