Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EEBC54EBC
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 21:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 011CF40120;
	Sun,  8 Jan 2023 21:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011CF40120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuoftlA10tbi; Sun,  8 Jan 2023 21:15:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26DD440159;
	Sun,  8 Jan 2023 21:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26DD440159
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D37E1BF352
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0558460B1E
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0558460B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7eGJMl0pGg9 for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 21:15:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 766EE60888
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 766EE60888
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 21:15:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7D1AD5FF9D;
 Sun,  8 Jan 2023 22:15:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jan 2023 22:15:13 +0100
Date: Sun, 8 Jan 2023 22:15:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230108211513.GG151997@scaer>
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230107010437.2471513-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673212521;
 bh=Ay/HqXgiWIbcbO9b8axBfxgOh/ASL62ibCdDHAgvcLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n96UTwjgjJ991HG2h2Rq2hWYZeJTTCNvJAFueD2ZpfJdqmZFwq95H/wesZsh+UGak
 owWI5OBsjrMKtCPBdX83ykIEm91QEG+1UhaOAYJAwgSxExpyahIdOe/bv5TDsGcFca
 gXtjTv8w0q/+8LwIRsyPRVzNnfgFnGDc21K4wPz++n+lyyaClUHsD+GCJ6qyX3EJB9
 MyuSu38AcnwlnLnU1/SvCmV1LIR7S2/YT8kWLdexJdYnLNx9cP1xkuWwonO6vC1bj/
 phXwJ1cbKZnQXBlgP3L8T4e6u763+w/EIAWK7u4h2/BZFvYPiLelQ7wHr0/dZTpRmD
 tXhXCe0vN1sKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n96UTwjg
Subject: Re: [Buildroot] [PATCH 1/4] package/hiredis: enable host package
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
Cc: Anders F =?utf-8?Q?Bj=C3=B6rklund?= <anders.f.bjorklund@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Dominik Michael Rauh <dmrauh@posteo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

There's this already pending, old-ish patch from Dominik and
Anders:
    https://patchwork.ozlabs.org/project/buildroot/patch/20220807093853.15579-1-dmrauh@posteo.de/

that tries to bump ccache.

I prefer your series, because everything is split as much as possible,
but I am looking at both patches to see if we can pick the best of the
two. And indeed, see below...

On 2023-01-06 18:04 -0700, James Hilliard spake thusly:
> The host-hiredis package is needed for the upcoming ccache update.
> 
> Note that we must disable ccache when building host-hiredis itself
> as host-ccache depends on host-hiredis.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/hiredis/hiredis.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
> index f79b6c757a..f2a4836310 100644
> --- a/package/hiredis/hiredis.mk
> +++ b/package/hiredis/hiredis.mk
> @@ -22,4 +22,13 @@ else
>  HIREDIS_CONF_OPTS += -DENABLE_SSL=OFF
>  endif
>  
> +# We are a ccache dependency, so we can't use ccache
> +HOST_HIREDIS_CONF_OPTS += \

This is the first assignment, so no need to use append-assignment, jsut
use a simple assignemnt.

> +	-DCMAKE_C_COMPILER_LAUNCHER="" \
> +	-DCMAKE_CXX_COMPILER_LAUNCHER="" \

The patch from Dominik and Anders uses -U to "unset" the variables,
while you set them to empty. I think unsetting is semantically more
correct, and I checked: it works.

Also, the following options are not related to being build before
ccache, but the comment makes it confusing, so I prefer we split the
assignment when only parts of it is covered by a coment:

    HOST_HIREDIS_CONF_OPTS = \
        -DDISABLE_TESTS=ON \
        -DENABLE_SSL=OFF

    # Set CMAKE_BUILD_TYPE to Release or the libraries will be suffixed with "d"
    HOST_HIREDIS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

    # We are a ccache dependency, so we can't use ccache; reset the
    # options set by the cmake infra
    HOST_HIREDIS_CONF_OPTS += \
        -UCMAKE_C_COMPILER_LAUNCHER \
        -UCMAKE_CXX_COMPILER_LAUNCHER

However, I wonder whether the -DCMAKE_BUILD_TYPE=Release makes sense.
Ideed, we need to set it for the target variant, because we can do a
debug build or not, and we set CMAKE_BUILD_TYPE in toolchainfile.cmake.
But for the host variant, we do not use toolchainfile.cmake, and we
never explicitly pass the build type on the command line either, so we
especially never set it to "Debug", and so the 'd' suffix should not be
added.

Ah, but CMAKE_BUILD_TYPE can come from the environment... Damn.

OK, so I did a few changes, and applied to master, thanks:

  - add Dominik and Anders in Cc to ack they provided inspiration
  - use -Ufoo instead of -Dfoo=""  (as per Dominik & Anders)
  - reorder CONF_OPTS assignments

Regards,
Yann E. MORIN.

> +	-DCMAKE_BUILD_TYPE=Release \
> +	-DDISABLE_TESTS=ON \
> +	-DENABLE_SSL=OFF
> +
>  $(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> -- 
> 2.34.1
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
