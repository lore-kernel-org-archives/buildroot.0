Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC12AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 23:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 910D98128F;
	Mon,  7 Mar 2022 23:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frJ049VFMtQS; Mon,  7 Mar 2022 23:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C875B812B4;
	Mon,  7 Mar 2022 23:03:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37F9D1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 23:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 255BE60B7C
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 23:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1w1fJLjrKUWP for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 23:03:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C336B60B50
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 23:03:39 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id c4so8743051vkq.9
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 15:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oY3ljk4oDEaUAKNGsgs5atiC+mZ2vbE2vAEXGcikswk=;
 b=BR5tDTVRL8XV8+VY4/7fzrPSvNCUcHZcPLO1uNonUKskZ9dRw4flnyuFWwxIJAMWQ0
 wq6qfObrS9AvaGivbW/86Ht8x8a6RKPzUJ8YsRG72L9Koz78JyL2MVxL2SKB4G3zj+5C
 4xb8kfcvlL18UCTkELMwJjpEb3DzaF/HqspUS+NaUoDkS3YB7C0CBEj/granTZFaZclY
 x27vBkefluFfaB6ijXbQzpfPWzxsi901K8JMhQBQiq72zwr/Z2LJA38nareBBFhpvT6E
 opSadflccomGhDT1vO5fWyLs/E+vKOSt0ktaXE9ancEsl+UZ1cQ76+r37jvbLt8LjEOI
 /wuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oY3ljk4oDEaUAKNGsgs5atiC+mZ2vbE2vAEXGcikswk=;
 b=49Z0HKDSkYD90uDAeHkRPu2nnb/5GEQhTp42gx7sHiJ/eUuweaZ55fKu9mOlnxdl8E
 TsOqoSV80Za5nvJzepCYR2YQBwOepEuAHwn0XEW8feIwZ23iuDHD7ku224mAOOoPjRnQ
 YySSCIp8qJxakJj8q8aYv63SDasiF6OzSHpMkMAxuU+GVTiIyuci8QKtk0MUeG5pVRqN
 Gel6JgHzmaUiUYi/ZfFXqk553scCJ0CZRnOoDdsHWzuiLsV1e+O6yO7IUAETotkujEsq
 oDKj72WYRnrU28QrxZxjrgBfSsU9PffP5AdaoFdOD5lZvX3oUxkImR1dzJE0hS/j5zMg
 w7Mg==
X-Gm-Message-State: AOAM531BBSj9geIfsR2O1Om3s3LYbXIfLJHn7+xzzs5EL9O/7z+qKGGf
 95Koh5zgCxbsBOkYYo+K28+os7O+IilbkA==
X-Google-Smtp-Source: ABdhPJxBMeZdkUO2IEe+Xsnhn7LBHztIkUx0o2AJ0zs1RbdeIQaKxCtm9bzA+s/bO5UyA2sqxVYw8g==
X-Received: by 2002:a05:6122:179a:b0:337:8a82:f247 with SMTP id
 o26-20020a056122179a00b003378a82f247mr300975vkf.22.1646694218252; 
 Mon, 07 Mar 2022 15:03:38 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 d189-20020a1fe6c6000000b00330e6945b4esm2071583vkh.41.2022.03.07.15.03.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 15:03:37 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id z85so4079373vsz.5
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 15:03:37 -0800 (PST)
X-Received: by 2002:a05:6102:21d8:b0:320:aff7:82f2 with SMTP id
 r24-20020a05610221d800b00320aff782f2mr3108004vsg.4.1646694217595; Mon, 07 Mar
 2022 15:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20220307224226.1375696-1-christian@paral.in>
 <20220307235417.279e7751@gmx.net>
In-Reply-To: <20220307235417.279e7751@gmx.net>
Date: Mon, 7 Mar 2022 15:03:25 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rvGjfPkc=AdUXJobisbhHCL6FLJy7D1SGq94mk0HFJ_g@mail.gmail.com>
Message-ID: <CA+h8R2rvGjfPkc=AdUXJobisbhHCL6FLJy7D1SGq94mk0HFJ_g@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rpi-userland: add support
 for aarch64 build
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
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

You're probably right about that:

On Mon, Mar 7, 2022 at 2:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
> On Mon,  7 Mar 2022 14:42:26 -0800, Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>
> > Tested on Pi4 Model B (aarch64).
> >
> > Note: rpi-userland and upstream rpi os now support arm64.
>
> All issues/questions solved since discussion [1], [2] about
> missing libraries/features?
>
> As far as I know rpi os graphic support is based on mesa3d v3d/vc4
> instead of rpi-userland libraries?

I use this package on arm64 for vcgencmd (videocore) and other commands,

however I have not verified that graphics work correctly, and you're
most likely correct,

the arm64 stack probably is using mesa3d vc4. I boot the pi4 64 bit with:

arm_64bit=1
dtoverlay=vc4-fkms-v3d

So this is using vc4, as you've mentioned here.

I suppose to fix this patch, it needs something like:

ifeq ($(BR2_aarch64),y)
RPI_USERLAND_CONF_OPTS += -DARM64=ON
else
RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
endif

Is this correct?

Thanks & best,
Christian Stewart

> Regards,
> Peter
>
> [1] http://lists.busybox.net/pipermail/buildroot/2020-June/587538.html
> [2] http://lists.busybox.net/pipermail/buildroot/2021-October/626080.html

PS: I've noticed that my e-mail / name is wrong again:

Christian Stewart via buildroot <buildroot@buildroot.org>

is this on your end or mine?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
