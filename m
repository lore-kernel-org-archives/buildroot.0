Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AB7C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 10:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C998883F78;
	Wed, 12 Jan 2022 10:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQiLj2_S1v3a; Wed, 12 Jan 2022 10:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 101D183F38;
	Wed, 12 Jan 2022 10:19:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 098631BF831
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA9D940971
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66NYyg60LCAQ for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 10:19:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D18044014E
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 10:19:29 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 h20-20020a9d6f94000000b0059100e01744so2002281otq.4
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kk+70MOUT1bDOe5jfqZNNrevHPI/FRfE+1yO+QUjHvM=;
 b=adeFk4f9ozU2hxy0LMfwygUb+uAQH1f3vXf76IuNQ/BfrfUMaUeg4xJY8+l7bK+7MX
 rTYYdeQgdrse4cZgB99gn71Gq5+pZEYHqlqsQt6hTPMonsBw5IHvbvwe0pYmubyHv6Lo
 WtTRLd1H0MChIljkr4jh41SPic1b7nyhInofPJPCSsFIs44VjkJHUCcGRqH3ysPI33Sl
 MAiwT2zmWacCV4qtAZ93tMGyemwrZkmYM9gp148MLa9+l+JOqzQ/iQXaEJeuvz7X6SCf
 nzMRpjp79wfvpSOXIAqIO1rC4HOEwN1hRBcp4A08IWbUGgip/YJ4bhx2j1K2cAcPOZD3
 QH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kk+70MOUT1bDOe5jfqZNNrevHPI/FRfE+1yO+QUjHvM=;
 b=BnLLcoR617h2ffB2JI+82MIV1uQNZ+hzNNP7epZrm0/Wz2yn0Q3kl4QL+uG+CJY+eX
 51ciFGV9lQ+9rfMNi9yc8uQYThgVbZp9RWhDA4QlDcu+JCG3eLnT50bY6OItw2BcPo7f
 QbjAD1oiHAXY3yCf4lnQrSjVe4Htw0k0AtBnAwn+xEsP+qkv/4w42BlQrnHDPF+jZfJy
 N7J218OzBy9+P7qNdYmFv72oYDMkMEOl7/apyPw8cYP5JDhv8TamjR8agcX+AcqkTXc1
 3T9SLE/F3KZXH2pjzFX5vMUMBiQJ5D+eC1r2PinN6bEYD5C3fwrfmvOXs5UYzwZAlCLA
 VHAg==
X-Gm-Message-State: AOAM530H1aQJovMUSgsqPbVABYRTlgT7IuwkoaJFl7jqfJKcNmPiEy7+
 HDucirDCS8phftmnyeyweeDq2NXYwDeOJZzog7jScbLzVCgmZQ==
X-Google-Smtp-Source: ABdhPJycDCYn6f4ZqGVBDTF2/R4yyMVz38IBIag1mfYya39VaRPzudIJd/74M3b5HmsJC41AsfcPC1DqRJ9GIYfwP+s=
X-Received: by 2002:a05:6830:1f3a:: with SMTP id
 e26mr6112696oth.233.1641982768922; 
 Wed, 12 Jan 2022 02:19:28 -0800 (PST)
MIME-Version: 1.0
References: <20220112101021.456463-1-nolange79@gmail.com>
In-Reply-To: <20220112101021.456463-1-nolange79@gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 12 Jan 2022 11:19:18 +0100
Message-ID: <CADYdroPR-+z0fNJa8pD0ZFB3z6-fdGLpes7cUem5xSnyBCHv7g@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] system/skeleton: provide run/lock directory
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mi., 12. Jan. 2022 um 11:10 Uhr schrieb Norbert Lange <nolange79@gmail.com>:
>
> We changed the skeletons in bf01e51f3c, so that var/lock
> points to run/lock. This resulted in build failures as
> some packages want to work with these paths.
>
> -   Create run/lock, the run directory will be purged
>     later anyway (since 5e78e7e97d).
> -   for init == systemd, create the var/lock symlink early
>     to prevent packages creating this path as directory.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
>  system/skeleton/run/{ => lock}/.empty                  | 0
>  2 files changed, 2 insertions(+)
>  rename system/skeleton/run/{ => lock}/.empty (100%)
>
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index 1e212cc2f7..795a171809 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -62,6 +62,8 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
>         mkdir -p $(TARGET_DIR)/srv
>         mkdir -p $(TARGET_DIR)/var
>         ln -s ../run $(TARGET_DIR)/var/run
> +       # prevent install scripts to create var/lock as directory
> +       ln -s ../run/lock $(TARGET_DIR)/var/lock
>         install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
>         $(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
>  endef
> diff --git a/system/skeleton/run/.empty b/system/skeleton/run/lock/.empty
> similarity index 100%
> rename from system/skeleton/run/.empty
> rename to system/skeleton/run/lock/.empty
> --
> 2.34.1
>

Fixes: http://autobuild.buildroot.net/results/3ee/3ee8f9ee55e51af38e9dbe7b9840c9589d88a30f
(and alot more containing the vtun package)

For someone not fluent with mailing list workflows, and working with a
couple projects,
it might help having a few example commit messages (-templates) in the docs.
ie for respins, bug fixes, versioning (potentially of series)

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
