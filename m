Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C6EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 10:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA52A40157;
	Mon, 30 May 2022 10:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VdYoluyldqwr; Mon, 30 May 2022 10:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDC5440C1F;
	Mon, 30 May 2022 10:04:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 540511BF3A1
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 10:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 504B440C1F
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 10:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChKDqjfauRLW for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 10:04:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 703FE40C1E
 for <buildroot@buildroot.org>; Mon, 30 May 2022 10:04:15 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-f33f0f5b1dso1587143fac.8
 for <buildroot@buildroot.org>; Mon, 30 May 2022 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dKkt37AWd42ZRd/+wAuPx6Sgi8Q7kS0kAoK+l9fin14=;
 b=dS5/zUP8yLq0uPFvyUznw5auvBj2iH+1TV3n5sEuSU/qunYcMCdJrGYcLNphs4CGVl
 +237ecnGyf7b4VUrbLNa/uuIF/+s9XLMjUMg1YCmhEdjKdHl8wgZBLLSL9raCqpWtViX
 n/cJ1IKWBIuoibLkgcItvUCnIGVUjfNKLicIpYqVkIuBzVxVYcfLFX3DvKZSz6NE54Bv
 E2GIkSWpX7lHuIjaPXi5YQ5+uzw1LGRDB2nlg/zyEl09INqkbCuCN+MInM2hZDBKdpY5
 EEaxjq7KX5JVSLdAEWGQByY2MRJr37EqfvZitrI963MCXMo2oUPlW4QyxhMCLPz/88wW
 wWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dKkt37AWd42ZRd/+wAuPx6Sgi8Q7kS0kAoK+l9fin14=;
 b=Z+/1BOPsqv0NdWb260GfQCADodSmZ2z18C+VDkEjTdwfAP6uKN8swey/sXNpHN2xlJ
 fSHyyq7YQQtX09IBaptuqfMwNMzHDzE7mASigbbJYyup9Ou5IjJuOEYNe01N8TZ4QRNI
 ACSSQyPG6i/F5HC6pm90mgkMCpveRi5HLCy1sy3ETsrNgn7BJMssFLQ50SEzPTgDHDvY
 JSYp4/cHXmgdkDTVN1CFYKC+aFDDFrfIxtxLmwFI0MEDotmlDDyI5SfLKTlR7/qLo5B0
 L5+6O2Ulz9H9G2tuLz1KSwtc441jAjv+MVpXAZgN3p+fN75XBaELJRSqp/81EJeTDYP7
 iuJg==
X-Gm-Message-State: AOAM532DaXu9zvErdz1UNOFj6S/iynQTDWAy5AjiK/onhK81vPwr08ZZ
 zChFNwTDrEIckpVAv0WIAyWFJdJyeA11sH9UyUe94f+jFEc=
X-Google-Smtp-Source: ABdhPJxU6RpFEWGfjArhqUZlzR+bRraXEGhbxiX9WUfPjJugu97jpfB0N6UD2CLlZiEidZpyCmNSq0ZBwsKdTvhsGKc=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr9811421oae.278.1653905054483; Mon, 30
 May 2022 03:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
 <20220530033836.474926-2-damien.lemoal@opensource.wdc.com>
In-Reply-To: <20220530033836.474926-2-damien.lemoal@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 May 2022 20:03:48 +1000
Message-ID: <CAKmqyKPhm35wDvgpT2Pv5EHv13tiPQLC=0hktTWobUSx8bWbfw@mail.gmail.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: Re: [Buildroot] [PATCH v2 01/11] package: elf2flt: fix config menu
 entry description
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, May 30, 2022 at 1:38 PM Damien Le Moal via buildroot
<buildroot@buildroot.org> wrote:
>
> From: Damien Le Moal <damien.lemoal@wdc.com>
>
> Keep the same style as other config menu entries by removing the
> question mark at the end of the elf2flt enable config option
> description.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/elf2flt/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
> index 2bab0095c2..339ed06b40 100644
> --- a/package/elf2flt/Config.in.host
> +++ b/package/elf2flt/Config.in.host
> @@ -1,5 +1,5 @@
>  config BR2_PACKAGE_HOST_ELF2FLT
> -       bool "Enable elf2flt support?"
> +       bool "Enable elf2flt support"
>         depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
>         depends on !BR2_USE_MMU
>         help
> --
> 2.36.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
