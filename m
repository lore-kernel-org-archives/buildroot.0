Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7959EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 18:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0988F41477;
	Mon, 14 Mar 2022 18:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ID5c7YUKklD; Mon, 14 Mar 2022 18:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FBBF408C0;
	Mon, 14 Mar 2022 18:15:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2AFA1BF31B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D34A81926
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1AKDhE3efZs for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 18:15:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9E80818B5
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 18:15:31 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id j83so18252490oih.6
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 11:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UO2h5mc3SX2ae8/UYI36yUfEksh3c0G/L6wLnHSJxXw=;
 b=GW5oQuf8t9xrirAwmqahg6BRO4KL9UNx9cUblcRPy38Z3hLstqqW/xB47JWOUF1i5i
 mMeMNJsoOhgttHh9n9D0PdwRROyH0fw0wu4TisxtNOfD8LZwnwn/10anBBlsECJGhWE+
 VO5vM3plXOaF6CDiT0NwwEc0MpHOOfmSpmTBdTyA5SqBQq8C6hlrW6OhLasOW/RXeV39
 yhS3ewl56/We0dhy85Ou8OAvsBTnC5jsTanvOlphm+eEPWZ5heDxk5GW409DhotjagYk
 RC0iSEj3bFERo97/7sDDF1Eyohg1QLRH6rLLW6ip/n1AoVjNb6E9tQrb31Ma58gF9CSe
 QaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UO2h5mc3SX2ae8/UYI36yUfEksh3c0G/L6wLnHSJxXw=;
 b=tIneYazrPhGrnPiWRBKDyb5ZgVfkR4ltNIcOngcWqURs6yZSux3sYt/MH1c9pIzFjZ
 QcdLD12RmF3edN/yH9qyT0OG/JOgrnACa5+ZJWT48/RsVV62iNKcUK07ZOiKph/5SbUA
 RQEqRDNeL9hp1kMo3foArN/veUA7bwlp7OfnK3MSc71SEyir/xFddqsG35k7Gksw8sSW
 lvephaAd4mnrhYLYl6oRld//mhBzuEfj+7hRA4fzIC726seURgSVYs9+xzbkT5xrAw83
 eLOHAdtPmTsmcJVDkPt0k+Ogh0b9eo7UcZW4aivYsI5yRs9SioBCF54d9suPzrFmfqqa
 cEfg==
X-Gm-Message-State: AOAM532X8W3RujvSlyorggAs19K+Ot1czqhCRXRG576Muubl93y0DB4l
 BtY4eqxBS435W1StJCVmf/Gtlghlc2OuzSB+JrruRUOV1jk=
X-Google-Smtp-Source: ABdhPJx+UEJ30dortA9g9bddrVrdd4QLgTxsc1rKwWKeK68IkwZAADaooOaZKrbhHx4jTZGKMtzAAsYSQN/J/xUcrnY=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr228923oic.200.1647281730691; Mon, 14
 Mar 2022 11:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220313092148.353432-1-fontaine.fabrice@gmail.com>
 <20220313092148.353432-2-fontaine.fabrice@gmail.com>
In-Reply-To: <20220313092148.353432-2-fontaine.fabrice@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Mar 2022 12:15:19 -0600
Message-ID: <CADvTj4pewf7fUd545Nb=z79bpUtN8KynDma2i+_jkEowU5Egig@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/bind: fix libxml2 build
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 13, 2022 at 3:23 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fix the following build failure with libxml2 raised since bump to
> version 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92:
>
> configure: error: Specifying libxml2 installation path is not supported, adjust PKG_CONFIG_PATH instead
>
> Fixes:
>  - http://autobuild.buildroot.org/results/648d29e4cfa6a40bb6e54793c044e9c834f03a1b
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/bind/bind.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index e0c81152e1..63cc948c73 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -74,7 +74,7 @@ BIND_CONF_OPTS += --with-gssapi=no
>  endif
>
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
> -BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
> +BIND_CONF_OPTS += --with-libxml2
>  BIND_DEPENDENCIES += libxml2
>  else
>  BIND_CONF_OPTS += --with-libxml2=no
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
