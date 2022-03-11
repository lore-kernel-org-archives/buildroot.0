Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DA2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 04:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AEBC419C3;
	Fri, 11 Mar 2022 04:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4Z0dTO8-BtK; Fri, 11 Mar 2022 04:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD09419C0;
	Fri, 11 Mar 2022 04:32:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4635F1BF3A7
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34F4D847D8
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cobr6ML50Z7k for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 04:32:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F2E1847CA
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 04:32:39 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id v62so8368108vsv.1
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xk0VD78ilcvtkTHQBXqFcLHmpcJV82peTaBW10ZaN1U=;
 b=gujMuvSMu+DG5eBuovD971wStQyknx4vqeYf7mWFwg8jJFnHJwHAYYTS3Hp1zk9d/2
 bxoYXOWZ000lJBY9cgbzgSvKUDan6BjLc4eDT4UdDVPwM1+tWPRSpwFngGTmmPYchlJJ
 E3r3EMwUcxyvBMR4oYzrAM7mV51j5dnvZdyIJaaYQ5Z9tAGw9RNE7ZVro9g6hZbnnwR1
 eKCG8kUEQClP1z2mqMSelttN34B8mR/NADflJpSg5jORw4eQAVbgglDnjoIf07XO4o/z
 2t0AB7SdbZkA851x9VlI3ZIrXWbDPMqX/gHuIe2SZM/TCI/NjpLsJm3JNTSUyKpt/U+B
 b03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xk0VD78ilcvtkTHQBXqFcLHmpcJV82peTaBW10ZaN1U=;
 b=Rvi0l+LPBCE4Kc5ucWTJ403unJPr4C7y9bg0AqnRpzZoTkf4zB+OLLySjXSCeNELiv
 BKv/Rdt2y8VIhM6NCnBSPzv1e702pi062Y+SxOy32IBAvY+lbp0yg8vEnOQdeB9F/txl
 9tNLyGMbqUFdUL8z3c+eBKCWm3BXLFYm3YzJP8Sn43FkJT0aKtVPIVIA1TK8FIFzMrEO
 MD7vBEoI4O3OAxNbR5thzLbkNNQiz7iT7O619SZ7+VB+A8jXvA94XtaValSL4GeLKkyq
 yKsqkHBw4ZXzeSureX3agk5MYxtuaS6pI325MUXH/iSndaok3dfs9VcSh8fMmBNf32Er
 fmQg==
X-Gm-Message-State: AOAM530JFd0UQgC0HVmzCLBYQslsyv+XSA2GfYBIxsynTZJpFDnTtjhH
 at8BdLc5Cjv03knegCJ31LcMiLNhElsiXA==
X-Google-Smtp-Source: ABdhPJysk4nffEMUqAkFg9mjXM0Kxmsagahn2spX9oKJDnv1GU7Opg7kUv8tHnE757zkoBBXf6kiqA==
X-Received: by 2002:a67:f955:0:b0:320:add2:eb3a with SMTP id
 u21-20020a67f955000000b00320add2eb3amr4288509vsq.76.1646973157443; 
 Thu, 10 Mar 2022 20:32:37 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45]) by smtp.gmail.com with ESMTPSA id
 bb19-20020a056122221300b00332d39ea42esm1241541vkb.44.2022.03.10.20.32.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 20:32:36 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id v128so8304756vsb.8
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:32:36 -0800 (PST)
X-Received: by 2002:a67:f7d9:0:b0:320:9c38:1ac2 with SMTP id
 a25-20020a67f7d9000000b003209c381ac2mr4488241vsp.6.1646973156408; Thu, 10 Mar
 2022 20:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20220311043137.3210407-1-christian@paral.in>
In-Reply-To: <20220311043137.3210407-1-christian@paral.in>
Date: Thu, 10 Mar 2022 20:32:25 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rd_xPp8yYTn3iCv088WsxQqZ28GZrG33DL2-pUMvZO1A@mail.gmail.com>
Message-ID: <CA+h8R2rd_xPp8yYTn3iCv088WsxQqZ28GZrG33DL2-pUMvZO1A@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/balena-engine: bump to version
 20.10.13
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yunhao Tian <t123yh.xyz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

My mistake, seems this patch somehow got rebased incorrectly.

Will fix.

On Thu, Mar 10, 2022 at 8:31 PM Christian Stewart <christian@paral.in> wrote:
>
> https://github.com/balena-os/balena-engine/blob/v20.10.13/CHANGELOG.md
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/balena-engine/Config.in          |  1 -
>  package/balena-engine/balena-engine.hash |  2 +-
>  package/balena-engine/balena-engine.mk   | 42 +++++-------------------
>  3 files changed, 9 insertions(+), 36 deletions(-)
>
> diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
> index f48f361dc2..02f694515e 100644
> --- a/package/balena-engine/Config.in
> +++ b/package/balena-engine/Config.in
> @@ -6,7 +6,6 @@ config BR2_PACKAGE_BALENA_ENGINE
>         depends on BR2_USE_MMU # util-linux
>         select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
>         select BR2_PACKAGE_IPTABLES # runtime
> -       select BR2_PACKAGE_SQLITE # runtime
>         select BR2_PACKAGE_UTIL_LINUX # runtime
>         select BR2_PACKAGE_UTIL_LINUX_BINARIES # runtime
>         select BR2_PACKAGE_UTIL_LINUX_MOUNT # runtime
> diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
> index 3f632ef381..1054e22550 100644
> --- a/package/balena-engine/balena-engine.hash
> +++ b/package/balena-engine/balena-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally computed

[SNIP]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
