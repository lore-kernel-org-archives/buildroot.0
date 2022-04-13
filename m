Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C93EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 21:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BBE241769;
	Wed, 13 Apr 2022 21:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJuHakgZ6keZ; Wed, 13 Apr 2022 21:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA3D4179F;
	Wed, 13 Apr 2022 21:39:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBC921BF3B9
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4FFA60ACA
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1f4NqEYCltDJ for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 21:39:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51A9160AC0
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 21:39:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d478:5a3f:1594:7f11])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D141919F55C;
 Wed, 13 Apr 2022 23:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649885970;
 bh=TtrEYlsNMk03CgRz9AAIjt8bUvRwz/noklSkpf7Ir5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WhmfxQpEemQ++qpI1u0WckP2IhtUVqovKu0YEOZMMHa/PkPB31M4Y2GjMzJhQvAJ8
 jlZB03SWCQiyso74C+jfu6mpxE0a1ZNqxNAtSKR28fPnJFiV8nRT0N8XF1oPWJOBTA
 cBrXBc7bwPptM5GBD+5oIDc9wOAnRQ0KlelI0qxwuOopAuG8+hrSKUX0ByKO0mUrET
 Ky7vgZzSA+agsRxAbGdVZMhb0A0dNC5qDSQ6MfJgq6VXMRz+zibrMGfQW5e8uEY5ro
 W8pSOedQKSwA+EKgnvsO2TDjW8SA06MLIrIunLHYyGCxlLU1YHDuv6rbjFxljhmISI
 ZYE4Y6QPVEhLA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 13 Apr 2022 23:39:26 +0200
Date: Wed, 13 Apr 2022 23:39:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220413213926.GA2730@scaer>
References: <20220410200209.865391-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220410200209.865391-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: fix
 BR2_OPTIMIZE_FAST build
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-04-10 22:02 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with BR2_OPTIMIZE_FAST:
> 
> In file included from crypto/async/arch/../async_local.h:30,
>                  from crypto/async/arch/async_null.c:11:
> crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name 'ucontext_t'
>    32 |     ucontext_t fibre;
>       |     ^~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3ce202f11a821940ff55eafa1dc7cea54b8c0da2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libopenssl/libopenssl.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index a22f2714f2..824b10bbb6 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -63,7 +63,7 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
>  		shared \
>  		zlib-dynamic \
>  	)
> -	$(SED) "s#-O[0-9sg]#$(HOST_CFLAGS)#" $(@D)/Makefile
> +	$(SED) "s#-O[0-9sg]\|-Ofast#$(HOST_CFLAGS)#" $(@D)/Makefile

This is legacy code, and this is no longer needed.

It was added in 93951c8f24f, 8 years ago, but Thomas reported a
successful build without this sed hack, and the proper host CFLAGS were
present in the Makefile.

>  endef
>  
>  define LIBOPENSSL_CONFIGURE_CMDS
> @@ -111,7 +111,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
>  			$(if $(BR2_STATIC_LIBS),no-dso) \
>  	)
>  	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
> -	$(SED) "s#-O[0-9sg]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
> +	$(SED) "s#-O[0-9sg]\|-Ofast#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile

Those two are also legacy, but they were needed because we did not
explcitly pass the LIBOPENSSL_CFLAGS. We only passed
TARGET_CONFIGURE_ARGS and TARGET_CONFIGURE_OPTS, which only defined our
standard CFLAGS.

So, here what's Thomas tested:

    diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
    index ae6658ed40..5b99c47c05 100644
    --- a/package/libopenssl/libopenssl.mk
    +++ b/package/libopenssl/libopenssl.mk
    @@ -63,13 +63,13 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
     		shared \
     		zlib-dynamic \
     	)
    -	$(SED) "s#-O[0-9sg]#$(HOST_CFLAGS)#" $(@D)/Makefile
     endef
     
     define LIBOPENSSL_CONFIGURE_CMDS
     	(cd $(@D); \
     		$(TARGET_CONFIGURE_ARGS) \
     		$(TARGET_CONFIGURE_OPTS) \
    +		CFLAGS="$(LIBOPENSSL_CFLAGS)" \
     		./Configure \
     			$(LIBOPENSSL_TARGET_ARCH) \
     			--prefix=/usr \
    @@ -109,10 +109,8 @@ define LIBOPENSSL_CONFIGURE_CMDS
     			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
     			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
     			$(if $(BR2_STATIC_LIBS),no-dso) \
    +		$(SED) "s# build_tests##" $(@D)/Makefile
     	)
    -	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
    -	$(SED) "s#-O[0-9sg]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
    -	$(SED) "s# build_tests##" $(@D)/Makefile
     endef
     
     # libdl is not available in a static build, and this is not implied by no-dso

And similar to the host variant, he reported our target CFLAGS were
already properly accounted for in the generated Makefile.

(Note: I am not sure why the 'build_tests##' sed has to be moved,
though...)

Can you have a further look, please?

Oh, and while we are at it, there is a legacy construct that is totally
useless in a Makefile and irks me whenever I see it (but it's been here
since its inception, almost 20 years ago now):

    (cd $(@D); some-command)

there is absolutely no reason to use parentheses in that case; all it
does is spawn a useless sub-shell...

Regards,
Yann E. MORIN.

>  	$(SED) "s# build_tests##" $(@D)/Makefile
>  endef
>  
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
