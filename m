Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9B1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8034681C11;
	Fri, 18 Mar 2022 21:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fN-C6c_gw3Ib; Fri, 18 Mar 2022 21:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993F284864;
	Fri, 18 Mar 2022 21:50:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81BB61BF2CC
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E5E740235
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kET0fS2IECpl for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:50:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0896400D7
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:50:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 365E613F854;
 Fri, 18 Mar 2022 22:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647640228;
 bh=2F5kiTrD3tRioMNdmadk3vHDqHcn8Kz5tZi4lF9wTEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jBOPop7K66n+V6PHxayZNTyF8O9NsES8C4EtOx2C9bYTW8PQK3MNkH4bYlSTO/D43
 1tFCjFpea/XkAjOK91tYprCDKIu0TGRNORkeHOqc2poA0VUWiV9pS1qF3hNTcDe4Lb
 jRdAiKYTkbBsq4NFvuD2S6ugENIspKUN5eIvDSZeOQlysf/EgalQESCTbGi7MRnHcG
 oF8KlBfn86wFryYsVXb4XGpIsuZxJtUIgT8B7QdM+heslJ7oqF3QiVYQeKe6l7W9Az
 tqUbIoZ5byhRdyrpTqnjvNh5PyhadJN0rMAaoAeoxOJn+7Y4Ez9atCgqkk0qxrByAF
 ky7OJVJ8pvrkg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 22:50:25 +0100
Date: Fri, 18 Mar 2022 22:50:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220318215025.GN283544@scaer>
References: <20220318193310.752282-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318193310.752282-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/wireplumber: fix introspection
 build
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

Fabrice, All,

On 2022-03-18 20:33 +0100, Fabrice Fontaine spake thusly:
> introspection needs host-doxygen and host-python-lxml since the addition
> of the package in commit c9a3c10417aadce9ee4922e30235776409ce8eb3 and
> https://gitlab.freedesktop.org/pipewire/wireplumber/-/commit/2e5b13f970fe3dd28a4ce75868d46403034c6822

As per that diff, it seems doxygen is only needed when actually building
the documentation:

    https://gitlab.freedesktop.org/pipewire/wireplumber/-/commit/2e5b13f970fe3dd28a4ce75868d46403034c6822#0cc1139e3347f573ae1feee5b73dbc8a8a21fcfa

    doxygen_p = find_program('doxygen', required: get_option('doc'))

But we are alredy passing -Ddoc=disabled, so why is it still trying to
build the documentation?

That's because the option is only a hint to not care when doxygen is
missing, but if doxygen is present, then the documentation is still
built.

-Ddoc=disabled should really disable building the documentation, e.g.
in ./meson.build:

    if get_option('doc')
      subdir('doc')
    endif

or, at the top of ./doc/meson.build:

    if not get_option('doc')
      subdir_done()
    fi

I think the former is better, as they already have conditional subdir()
in the top-level meson.build.

Regards,
Yann E. MORIN.

> ../output-1/build/wireplumber-0.4.8/docs/meson.build:14:0: ERROR: python3 is missing modules: lxml
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/24c524d86a3e2e67305f698644be9b15d4562488
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wireplumber/wireplumber.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
> index 3bf7cece45..327138391d 100644
> --- a/package/wireplumber/wireplumber.mk
> +++ b/package/wireplumber/wireplumber.mk
> @@ -17,7 +17,7 @@ WIREPLUMBER_CONF_OPTS = \
>  	-Dsystem-lua-version=
>  
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -WIREPLUMBER_DEPENDENCIES += gobject-introspection
> +WIREPLUMBER_DEPENDENCIES += host-doxygen host-python-lxml gobject-introspection
>  WIREPLUMBER_CONF_OPTS += -Dintrospection=enabled
>  else
>  WIREPLUMBER_CONF_OPTS += -Dintrospection=disabled
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
