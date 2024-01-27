Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6B3C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 17:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9C8B40A02;
	Sat, 27 Jan 2024 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9C8B40A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QKLi5BdahIB; Sat, 27 Jan 2024 17:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3555340877;
	Sat, 27 Jan 2024 17:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3555340877
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BF4E1BF2E3
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 17:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23E59401B2
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23E59401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZ3ACN6qOtPr for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 17:08:15 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D55A8401A1
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 17:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D55A8401A1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1D32A13F8C8;
 Sat, 27 Jan 2024 18:08:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 18:08:09 +0100
Date: Sat, 27 Jan 2024 18:08:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZbU4eUjb8Za2HAdl@landeda>
References: <20240122211451.3591-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240122211451.3591-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706375293;
 bh=2H9yoD9h4djjUHHQ78+HU6F/11yB2FSTd5iswvGDyB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O+KjfBCXV/oeFHyVx1mHxRWOq9DzkVTrEBh6O7a94Owumj6g4esEjrBtOxffmqA2J
 895P+0Z2IF/YHKEtRRGbCOKq8RJiRqKBIuS8cOYGH3xpWtlvXki9ekSIdnivsYF7SC
 azxkjc2ds1dJSdzl8WSekYKVuRjTJlPJn2on+iVn/3k0aGBjYNJe3XjKw+cfD3nhLH
 Xq+oBs/+9hNB0IOHf2/m6G7uerqxrCiRnhyMuG4yrkKg0vp4WtVaWfIkI4PFj5QUjc
 B5ZtFE2kEfrtFqjmv8STqfsBBqkFiNj9adMxB2xJTfvOzomtWakIUHf6QxBr428K9+
 wfmFmHH5Ldccw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O+KjfBCX
Subject: Re: [Buildroot] [PATCH 1/1] package/weston: fix build without gbm
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

Fabrice, All,

On 2024-01-22 22:14 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure without gbm raised since commit
> 534c22dd606e200969fce49b8d23b27902dec94e:
> 
> Message: dmabuf-feedback requires gbm which was not found. If you rather not build this, drop "dmabuf-feedback" from simple-clients option.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ebbba1d73ceeaacee17fde0c6c853415cd316091
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/weston/weston.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 6a5c0e57f5..bf8c7ced85 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -25,9 +25,6 @@ WESTON_CONF_OPTS = \
>  ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
>  WESTON_SIMPLE_CLIENTS = \

I've added a little comment to explain why the list is incomplete.

>  	damage \
> -	dmabuf-egl \
> -	dmabuf-feedback \
> -	egl \
>  	im \
>  	shm \
>  	touch
> @@ -57,6 +54,9 @@ endif
>  ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
>  WESTON_CONF_OPTS += -Drenderer-gl=true
>  WESTON_DEPENDENCIES += libegl libgbm libgles
> +ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
> +WESTON_SIMPLE_CLIENTS += dmabuf-egl dmabuf-feedback egl

Now, with this change, WESTON_SIMPLE_CLIENTS is asigned below the place
it is expanded to set the option. It is technically inconsequential in
this context, but for us mere humans, it is always a bit puzzling to
see a variable expansion before it is (fully) assigned. so I moved ita
bit later.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +endif
>  ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
>  WESTON_CONF_OPTS += -Dpipewire=true -Dbackend-pipewire=true
>  WESTON_DEPENDENCIES += pipewire
> -- 
> 2.43.0
> 

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
