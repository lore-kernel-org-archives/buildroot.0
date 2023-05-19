Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C155C77B7A
	for <buildroot@archiver.kernel.org>; Fri, 19 May 2023 03:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A9841872;
	Fri, 19 May 2023 03:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A9841872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0TUzstvTeni; Fri, 19 May 2023 03:38:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41DF2417DA;
	Fri, 19 May 2023 03:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41DF2417DA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4F151BF4DA
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 03:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9B7E417DA
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 03:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B7E417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3uyigLjIqry for <buildroot@lists.busybox.net>;
 Fri, 19 May 2023 03:38:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BDB3417BC
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BDB3417BC
 for <buildroot@buildroot.org>; Fri, 19 May 2023 03:38:31 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id F24FA440F61;
 Fri, 19 May 2023 06:38:13 +0300 (IDT)
References: <20230518213053.33760-1-romain.naour@gmail.com>
User-agent: mu4e 1.9.21; emacs 28.2
To: Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 May 2023 06:35:38 +0300
In-reply-to: <20230518213053.33760-1-romain.naour@gmail.com>
Message-ID: <87lehlvvm3.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1684467494;
 bh=KaQfG/xBuQYBu6CGxnGduDJ1DYMinjSWNcCDiJeQd8k=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=PHtKKb+BID1i2OgWf/0HnnXyxPd+HMQP4XC1BCJQaqybsOUVQ+cBuqizzyywtY0FB
 ucdMFyqAErhcM86o3ha4ohVs4a9A8WuSiLaTQYbKE93JLek7LVe+79AFM0QMZGUVnn
 U5BUrbBEXo/46xIyj5wxSVAlPBilzfqy0a8Za/SAbWNKG6lrNI7QiRiQQRQSIgbMTg
 ZpvxGfkxp0vKXrkd6CBbxEAi/X0MfTWKuLUntBbrueTopHNgCnwXX7maHrHH8WqhCv
 06cfFmrq7Hw4G5ISnF/44y2z3nIYKwzSvmBvbM4RgXCK7fVlcrmEfIJQVIk6dH/Dhc
 SHmWw6Ks37uFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=PHtKKb+B
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,

On Thu, May 18 2023, Romain Naour wrote:
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

I think the patch should have proper Upstream tag as described in the
manual (docs/manual/patch-policy.txt). .checkpackageignore is only for
existing non conforming patches.

baruch

>  package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch Upstream
>  package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch Upstream
>  package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch Upstream
> diff --git
> a/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
> b/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
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


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
