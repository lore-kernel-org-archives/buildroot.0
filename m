Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5E0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 09:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9595A60EB4;
	Wed,  6 Apr 2022 09:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yRqzw9JYx_f; Wed,  6 Apr 2022 09:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBF7560E94;
	Wed,  6 Apr 2022 09:57:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1701BF95F
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 09:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08C4581D65
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 09:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4crklhkcf09R for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 09:57:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC86D8144C
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 09:57:47 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id t2so3363242qtw.9
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iZ42u0sR5q414pVX6cIAUBEM3gO6MyKBHuD+L4qytRM=;
 b=N9fhgSi9LvS3KSyQH7+COOqFm2gkWFKDiDpwvkEkGYPZkDmoQMrfEUoT+s9nI7cs6a
 mRb+ORnEndL2clE8IekpB2US0wYke7t4il8K9JdAa0dih1VJOFw9e5JntnnQVPQNvREP
 a1YPOU/cxVceD+ElbkmRg1oxDpnBnrXgoZj2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZ42u0sR5q414pVX6cIAUBEM3gO6MyKBHuD+L4qytRM=;
 b=WVOHtno+F1mnjCgXdTg2swmhhsNBQHxochDfqaW2i12ohU3REvi03lmuAVzJ0p9cbH
 pgOkIuJ9f0MpBi4fKpScNuMsnur+Gqaig+IeKL1uEv7RLSg0noJF27OfxoT2BKDITmQ6
 RnNYKvuW3z5BEJzCjLWZKd4zE9Mpse1O88OhqsDexJlhI8h0c8ectL2A3ynE/XvfCU62
 0J3j/C1Fm3AGcV4foLkQR0pEsguTjWuiTCaZPcM1NrHrgH5LEg6h/KS2z6ygcISWaUuv
 z/6ma0tcJA3kYZ6HOsKCjfXD8jfjX5LbovQIfaj0PbC1AOtii1SGq54K0SpzB6tbfOCM
 kMzg==
X-Gm-Message-State: AOAM5313BRCbNaB4Eheo+MXlfoDZgzkOX3BXG3BWTEpDXAnlBgm5RcRp
 AXQ156083l50WzrCPjNZh+UVxd0k/ECzX0JO46hwYkRq2aw=
X-Google-Smtp-Source: ABdhPJx5Nkg1lSvnfu6FBiCXI3I7lnXJo+AofUPDRUfc0Aux6sLHrkQumDDf2YpI9btJ8U/ifg8dUDSTEhoE2imkomQ=
X-Received: by 2002:ac8:5d8c:0:b0:2e1:e196:326a with SMTP id
 d12-20020ac85d8c000000b002e1e196326amr6629008qtx.475.1649239066695; Wed, 06
 Apr 2022 02:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220405213351.2487658-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220405213351.2487658-1-fontaine.fabrice@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Apr 2022 09:57:35 +0000
Message-ID: <CACPK8XdUYqNuBpwPPMkjSz4rHxOD3JrrgCOH_3Wf=E06GrWnFA@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix build on powerpc
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Tue, 5 Apr 2022 at 21:35, Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Set NSS_DISABLE_CRYPTO_VSX which is available since version 3.64 and
> https://github.com/nss-dev/nss/commit/9dab43371d4d924419523e18ba84f02804880533
> to avoid the following build failure on powerpc:
>
> cc1: warning: '-mvsx' requires hardware floating point
> cc1: error: '-mno-vsx' turns off '-mcrypto'
>
> Fixes:
>  - http://autobuild.buildroot.org/results/6bedb5b658f6c9c16c26c73a524a995e5e84fcc8
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnss/libnss.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 2f7a265136..4582c55ada 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -51,6 +51,7 @@ LIBNSS_BUILD_VARS = \
>         NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
>         NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
>         NS_USE_GCC=1 \
> +       NSS_DISABLE_CRYPTO_VSX=1 \

How about we introduce a BR2_POWERPC_CPU_HAS_VSX, in a similar fashion
to BR2_POWERPC_CPU_HAS_ALITIVEC?

I've prepared a patch to do that, and rebased your change to use it:

 https://github.com/shenki/buildroot/commits/powerpc-vsx

I did a build test of the autobuilder config you linked to and it succeeded.

I'll send them out tomorrow unless you have an alternative proposal.

Cheers,

Joel

>         NSS_DISABLE_GTESTS=1 \
>         NSS_USE_SYSTEM_SQLITE=1 \
>         NATIVE_CC="$(HOSTCC)" \
> --
> 2.35.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
