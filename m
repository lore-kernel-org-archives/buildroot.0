Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC48C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F48940022;
	Sat,  8 Jan 2022 13:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eudgI2qwqFAm; Sat,  8 Jan 2022 13:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E77DC400CF;
	Sat,  8 Jan 2022 13:12:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5AE51BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF63B400CF
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yw5b6pmEXLuw for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:12:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5AFE40022
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:12:55 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id i30so8241637pgl.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 05:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HvRqbVN+s+nOtXZK8gSSwI6zV/TKNmBZfhuUQ5N7Ias=;
 b=AiM6w+Ia6yVnEXcLJAfrCx9h3OokzFvHaJhrt2ETgQ1Eu4yUfy1Ep5la+idMw0Ihop
 biVuDPcKK8sSvj/7OZwDyjXjVnCmbCMURXLKsmsBTh/jFTqdNfL8VfYUawbkSu7HEUUb
 Pbv+v9pYrwm8WUv5CqsJrKve6ry3ZlFMaDzWAFfgqTysWP6yvAyZGYcNE0QoXLT2Iv8L
 9g7qmgER4UPhbCmL8b6qPrH1SDGReGVqkTCkcqZ5cAC9B543PvGvgr6T/D9Rev2mWw0z
 5sEdAPVBDBWI2hJ9FTazE7PRHZkFeQT96NstfaJ2GmL5KthdRyYYPFpIaeqIt5Gvvrzh
 fCzg==
X-Gm-Message-State: AOAM532YiP/MYJ0+FswvFHqbifd/TKFwfQkr72aSn9J6g5sSRzBGrJHV
 CpQmPtsN9AxfsdW7JAY/jWrf/pfzJtpBXA746JI=
X-Google-Smtp-Source: ABdhPJyLJacf9KH8M16Oo1/2UlUYEOy5Y43T/uE1Ivdy13f2rQVMcAIZIGhqn+92hc4oj7Fh3Yh8y/Sl35ty/1oNvrA=
X-Received: by 2002:a63:2645:: with SMTP id m66mr61857968pgm.143.1641647575128; 
 Sat, 08 Jan 2022 05:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20200515140209.1355747-1-erwan.gautron@bertin.fr>
In-Reply-To: <20200515140209.1355747-1-erwan.gautron@bertin.fr>
From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Jan 2022 14:12:43 +0100
Message-ID: <CACXmViYNabnLxA_eZojkjsbvSAgShWou-y0O017Xg+Lqo636_Q@mail.gmail.com>
To: Erwan GAUTRON <erwan.gautron@bertin.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: add options to enable
 features
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, May 15, 2020 at 4:02 PM Erwan GAUTRON <erwan.gautron@bertin.fr> wrote:

Hi,

Sorry for the slow response!

> GnuTls implements old, unsafe or unused protocols and cyphers
> Secure embedded systems shall disable them in order to be certified.
> This patch allows to select/unselect SSLv2 protocol and gost cypher
> To ensure backward compatibility, all items are selected by default
>
> Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>
> ---
>  package/gnutls/Config.in | 12 ++++++++++++
>  package/gnutls/gnutls.mk |  4 +++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> index 15b930b6bd..56ea558969 100644
> --- a/package/gnutls/Config.in
> +++ b/package/gnutls/Config.in
> @@ -29,6 +29,18 @@ config BR2_PACKAGE_GNUTLS_TOOLS
>           Install GnuTLS command line tools for various cryptographic
>           tasks.
>
> +config BR2_PACKAGE_GNUTLS_ENABLE_SSL2
> +       bool "enable SSLv2"
> +       default y

These features should only be needed in very special situations, so
I've dropped the default y.

> +       help
> +         Enable SSLv2 protocol.
> +
> +config BR2_PACKAGE_GNUTLS_ENABLE_GOST
> +       bool "enable GOST"
> +       default y
> +       help
> +         Enable GOST cypher.

Elsewhere we use the cipher spelling, so I've changed that.

> +++ b/package/gnutls/gnutls.mk
> @@ -36,7 +36,9 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
>  GNUTLS_INSTALL_STAGING = YES
>
>  # libpthread autodetection poison the linkpath
> -GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
> +GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr) \
> +                    $(if $(BR2_PACKAGE_GNUTLS_ENABLE_SSL2),,--disable-ssl2-support) \
> +                    $(if $(BR2_PACKAGE_GNUTLS_ENABLE_GOST),,--disable-gost)

It makes more sense to have this in the "main" _CONF_OPTS handling
just after the _GNUTLS_TOOLS logic, so I've moved it there. I have
also added explicit --enable logic like we have for the other options.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
