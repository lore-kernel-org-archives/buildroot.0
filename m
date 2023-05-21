Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4060C77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 17:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BB4C41862;
	Sun, 21 May 2023 17:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BB4C41862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_8vj1DAHlxb; Sun, 21 May 2023 17:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5206417A5;
	Sun, 21 May 2023 17:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5206417A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D2361BF3CA
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72BC382C8F
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72BC382C8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Of0VdNHQBliU for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 17:51:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BA4E82C89
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BA4E82C89
 for <buildroot@buildroot.org>; Sun, 21 May 2023 17:51:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0126DB005AF;
 Sun, 21 May 2023 19:51:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 19:51:52 +0200
Date: Sun, 21 May 2023 19:51:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230521175152.GB621937@scaer>
References: <20230518213053.33760-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230518213053.33760-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684691516;
 bh=WpezAGpfdSPJY9AAjXlEAnCXrUKpIYXOQH4r7ymzF+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MCqySr2KAf99B6RwGAIeAjEkdFytc3UciSvwiJcvG5BBF70qhRJ0WurqXuSAKgTnf
 34JwW+Tw6fn4Wpyds2mmP8omtJM8Pt83HAqqWtU3DyJ9fSZt2IhwJHfVoy6Cwo3/D/
 ggoEdTGsIczjfncG/QgV6GgUSiMuE7gzEdLZSKE6EZkBH/k8lTvaZZQL3S0orlSiAZ
 Co8kHMTVOrlPm7U2OYOy0dFMAx+1U2Mp0igF16ULQDKN4/TiSxoGuv/wVxgeOyCi1a
 OvZzz+F5y9MV/DcEceysfoDvYBrLTA7fA+b/BM6KXcGGrSI0ygDw4wyxLSfSmhjHGN
 ESv0YzgAGHXEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MCqySr2K
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix glxinfo crash when
 gles1 is disabled
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2023-05-18 23:30 +0200, Romain Naour spake thusly:
> mesa3d 23.1 introduced a regression crashing glxinfo (and some piglit tests)
> when gles1 is disabled.
> See: https://gitlab.freedesktop.org/mesa/mesa/-/issues/9038
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983490
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .checkpackageignore                           |  1 +
>  ...arly-when-trying-to-create-an-unsupp.patch | 50 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 947f4606aa..eb572de9f1 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -995,6 +995,7 @@ package/mender-connect/S43mender-connect Shellcheck
>  package/menu-cache/0001-Support-gcc10-compilation.patch Upstream
>  package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch Upstream
>  package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch Upstream
> +package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch Upstream

Do not add a (patch) entry to .checkpackagignore; this ignore list is
only for exsiting files, while new fiels must adhere to codign style
(unless dully explained and justified in the commit log).

In this case, as Baruch noticed, the issue was just about having a
proper "Upstream:" tag, see below..

>  package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch Upstream
>  package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch Upstream
>  package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch Upstream
> diff --git a/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch b/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
> new file mode 100644
> index 0000000000..6080a551cc
> --- /dev/null
> +++ b/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
> @@ -0,0 +1,50 @@
> +From 2a6908ff4c94284b39c3cd4c97e1069876720eb7 Mon Sep 17 00:00:00 2001
> +From: Jordan Justen <jordan.l.justen@intel.com>
> +Date: Tue, 16 May 2023 18:46:50 -0700
> +Subject: [PATCH] mesa/main: Exit early when trying to create an unsupported
> + context API
> +
> +Fixes: adbe8b6c17a ("mesa: optimize out _mesa_is_desktop_gl*() and _mesa_is_gles*() calls when not built")
> +Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/9038
> +Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> +Reviewed-by: Eric Engestrom <eric@engestrom.ch>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23068>
> +(cherry picked from commit 8bb1ecaa02177720758255bdd7ec34a5d15feca4)

The recently added rule is to have the upstream status denoted with an
"Upstream:" tag:

    https://buildroot.org/downloads/manual/manual.html#_additional_patch_documentation

So I fixed that, and applied to master, thanks.

Regards,
Yann E. MORIN.

> +[Romain: backport to 23.1]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + src/mesa/main/context.c | 18 ++++++++++++++++++
> + 1 file changed, 18 insertions(+)
> +
> +diff --git a/src/mesa/main/context.c b/src/mesa/main/context.c
> +index d8eea2ea867..2b810b0d863 100644
> +--- a/src/mesa/main/context.c
> ++++ b/src/mesa/main/context.c
> +@@ -996,6 +996,24 @@ _mesa_initialize_context(struct gl_context *ctx,
> +    struct gl_shared_state *shared;
> +    int i;
> + 
> ++   switch (api) {
> ++   case API_OPENGL_COMPAT:
> ++   case API_OPENGL_CORE:
> ++      if (!HAVE_OPENGL)
> ++         return GL_FALSE;
> ++      break;
> ++   case API_OPENGLES2:
> ++      if (!HAVE_OPENGL_ES_2)
> ++         return GL_FALSE;
> ++      break;
> ++   case API_OPENGLES:
> ++      if (!HAVE_OPENGL_ES_1)
> ++         return GL_FALSE;
> ++      break;
> ++   default:
> ++      return GL_FALSE;
> ++   }
> ++
> +    ctx->API = api;
> +    ctx->DrawBuffer = NULL;
> +    ctx->ReadBuffer = NULL;
> +-- 
> +2.40.1
> +
> -- 
> 2.40.1
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
