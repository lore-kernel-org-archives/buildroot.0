Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AF6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D841940966;
	Mon, 10 Jan 2022 14:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFwR5E8zEBwq; Mon, 10 Jan 2022 14:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B5424092E;
	Mon, 10 Jan 2022 14:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDAAB1BF3C3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9F1E60E0D
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpHj-XT7mAmb for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 050B360C0C
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:08:03 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id h30so1536583ila.12
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 06:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=yCYSmCd5Uu1gTjbD/0DRK+ZEmRV2lZgiQ1S4Tb7W+y0=;
 b=GlvRmG2vOYLeX5JxoFJ7Nrk/omr/ME6nnaYa7iyvDsuOrRy2b0p+J94zutnbymYCsb
 2YuLVZxm+gIuFXciBrYHBgAlYiHIuoL1QkW86eZDrb5wsHzI4KfOXLUiepUbwXuN5+SR
 O8aANaLN/9xPXCakFPCsxVasHM7nIhb9DwHojOi/Pn1qc0w2SARUD59m/YwpfwBZ2o+0
 jbr5NeDqJPtnkyVMhjSNj5Bn5mPctgzH6974Ixevox2EHSsDiwpI2KFx/5agY5LjAUKY
 xFIZJRKLB6KpGjbJjNDHypFXESlxDW5lTjJixaZHuRbv1C+0vDgU5Du3auQDE4XPNdtA
 QntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=yCYSmCd5Uu1gTjbD/0DRK+ZEmRV2lZgiQ1S4Tb7W+y0=;
 b=w+aZ1SPf1h5rcihhC3satJb1ZTnP9fnHdAXgvuMhxsGOrpgQ0pXkJMyUFWqirZp6kX
 ctrYJJXnxZhejkjSq5kwkJq0CLBs/rHTi5dLRBjXPNVj4nqxCR/j5h6k+EjwxrnXCqSp
 vpVb6NsV3OQqFc0tUhe/JaBVdxfWETGfFLMj2OiE7Uccou3PqGRi4lLdHmZtvtda3aKD
 SnOEnrSPqzTiW39nQKaFW7f+1/bn/L/GDUyEKGVkvMv+XH2YocBKKwbq1EjWtzHeU/Rc
 6zKLTnam8uOuE15Strm59g1sfLbOKcMxUhIDN2rwGqNKsnPXhEPwwtnRfWNkEr1sgl1m
 2MGQ==
X-Gm-Message-State: AOAM533//x7LXa9/2r+S6zvs4vW/DQCsk2W3fomZ0nkA8/6+6UiDJFnj
 r57DbdaYGTwkvQE0WTcirXmz/BfaBQHp/fHrVhnkkpcxHD4=
X-Google-Smtp-Source: ABdhPJxksp5mfBwWKM1wcaHC+lcJg33XKHQYbUEXzke440kzzjD0XofBOQZhZoDtGvRmAKQ+GPX5YQ25Xd+GPlebPec=
X-Received: by 2002:a05:6e02:1809:: with SMTP id
 a9mr8979855ilv.102.1641823683012; 
 Mon, 10 Jan 2022 06:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20210623145231.19243-1-cyrilbur@gmail.com>
 <20220110130249.5b897804@camb691.localdomain>
In-Reply-To: <20220110130249.5b897804@camb691.localdomain>
From: Cyril Bur <cyrilbur@gmail.com>
Date: Mon, 10 Jan 2022 14:07:37 +0000
Message-ID: <CAN-ccAQRfNW_pm9QTakgpuS8hcqD7dEYyZ4pBXXm46Y1M+271g@mail.gmail.com>
To: buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH v2] package/python-greenlet: enable as host
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sorry ignore me, sent a version with mistakes. I'll send v3.

On Mon, 10 Jan 2022 at 13:02, Cyril Bur <cyrilbur@gmail.com> wrote:
>
> While currently there is no in-tree Buildroot package which depends on
> host-python-lxml, we (Adder Technology) have some proprietary modules
> that use it as part of their builds.
>
> I've tested python-greenlet as host package and confirmed that it builds
> and works correctly. Someone else might require it, so we are proposing
> its inclusion.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> V2: Added Config.in.host and a better commit message
>
>  package/Config.in.host                     | 1 +
>  package/python-greenlet/Config.in.host     | 7 +++++++
>  package/python-greenlet/python-greenlet.mk | 1 +
>  3 files changed, 9 insertions(+)
>  create mode 100644 package/python-greenlet/Config.in.host
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index b3e00bb482..6e027d96c2 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -69,6 +69,7 @@ menu "Host utilities"
>         source "package/pwgen/Config.in.host"
>         source "package/python/Config.in.host"
>         source "package/python-cython/Config.in.host"
> +       source "package/python-greenlet/Config.in.host"
>         source "package/python-lxml/Config.in.host"
>         source "package/python-six/Config.in.host"
>         source "package/python-xlrd/Config.in.host"
> diff --git a/package/python-greenlet/Config.in.host b/package/python-greenlet/Config.in.host
> new file mode 100644
> index 0000000000..673fee8cc5
> --- /dev/null
> +++ b/package/python-greenlet/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_PYTHON_GREENLET
> +       bool "host python-greenlet"
> +       help
> +         Greenlets are lightweight coroutines for in-process concurrent
> +         programming.
> +
> +         https://greenlet.readthedocs.io/
> diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
> index 7b983ff0ef..3b1ef7e314 100644
> --- a/package/python-greenlet/python-greenlet.mk
> +++ b/package/python-greenlet/python-greenlet.mk
> @@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
>  PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
>
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 2.34.1
>


-- 
Cyril
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
