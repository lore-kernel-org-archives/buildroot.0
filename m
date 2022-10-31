Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB6FFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 18:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A2EC4031E;
	Mon, 31 Oct 2022 18:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A2EC4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sUOPpWBY0ZNg; Mon, 31 Oct 2022 18:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 309D94021B;
	Mon, 31 Oct 2022 18:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 309D94021B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7976B1BF29D
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 18:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 612DD4021B
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 18:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 612DD4021B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-hrf53jzEi5 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 18:08:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BB1940202
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BB1940202
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 18:08:44 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 128so11387439pga.1
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 11:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vcr5g8+g3XX55Jn5AHJzf0YTh+0DEHeRUq8QNTxErJc=;
 b=NxxTjaFP/IiX8iQ2l2hPmqSe//08WfFwXKcbQgIi99AR27qLBD5VOGP/BzALzpn86S
 RI/AY7kj0c89KZYCatlxuZrct/dlVMefYaL20XbP/f40k/DBtusVkdksDlPK5aH3quuU
 J8qtFZ6nGdLYmL3dfWYqDeaeJYKtrmrvn7fFXOI8SQVuguW4zIKGz26v7fSJiHUf1hl9
 vKQxf3oNynl3QHbp2nruYBNTNYKLns7MAJopLkpzpQp+Ev1yzIMvhyswWdEnN/TbMk0F
 0j86CGotSNBzibg0yUNAtOb9qdUQAflVI5PusC/AH8K2BuifdsR8r7TMcAdn7dA8dL8B
 6RdA==
X-Gm-Message-State: ACrzQf03CJhAARkOqnp3tB5onjbPxkHr32ATgjS+rv59uD6UXKpBS/Mt
 D2dzrc0Fp0ZYcLjsSrgi06J8attCmYyQiR/HMpQQ1Osr5vo=
X-Google-Smtp-Source: AMsMyM5W/73klA8LLKLjnYky1PBUl8jKcvNB4zc2JtIoI2Jqtue+zLe91xhINZ4T0QZnMC+kKXdYENHS1C7bKlp/oag=
X-Received: by 2002:a63:90c7:0:b0:46e:c7be:16e1 with SMTP id
 a190-20020a6390c7000000b0046ec7be16e1mr14134860pge.296.1667239723689; Mon, 31
 Oct 2022 11:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221019215348.3262192-1-james.hilliard1@gmail.com>
 <20221030202718.GG1058960@scaer>
In-Reply-To: <20221030202718.GG1058960@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 31 Oct 2022 14:08:31 -0400
Message-ID: <CADvTj4r=68gOG3cfz58EKwWj4Xk6pf8Rm1ZC1TfiUS+UCUZsVw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vcr5g8+g3XX55Jn5AHJzf0YTh+0DEHeRUq8QNTxErJc=;
 b=qp0H0XRql7mVVr5e96CIrowl1uhaUO0F5N8YWdr3P96BBscqy3/tZbllJFf5gMqqDy
 /dX2GRIl3Wj4AeO4+Mrp2uGHvTlxju15CBwzRwHh+dYWyGOLnaYxydvFaZnnIrXMa5Yx
 VlKzVJ5b40HbhZKTxs9ktYUFBKUxo7gPS9dsCBWELyD4jvXih1lWxu8qY8itYF+aXojE
 ogPT6ZjC3EX5QVZw3QU/W0/G8GqIIqWMn2IkWitkJ0fibip/L7uhp1krdMEuiwzxaHVN
 BDIVnm+DTYpJZzVoPE8PgjCk3uwYXeB9a9YgZRuASU56zWxAicXQlypRdPUYAAqUGXmw
 kqPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qp0H0XRq
Subject: Re: [Buildroot] [PATCH 1/7] package/python-pluggy: enable host
 package build
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 30, 2022 at 4:27 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-10-19 15:53 -0600, James Hilliard spake thusly:
> > This will be needed for the upcoming host-python-hatchling.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Whole series applied to master, thanks.
>
> I really wonder how many pep517 buildsystems there will be, and how many
> packages we'll have to introduce... Fantastic...

Considering pep517 seems to have been designed to make it easy for everyone
to write their own pep517 build backends...could be quite a few...yeah...

>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/python-pluggy/python-pluggy.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
> > index 59382518ed..6dc6f970ea 100644
> > --- a/package/python-pluggy/python-pluggy.mk
> > +++ b/package/python-pluggy/python-pluggy.mk
> > @@ -11,5 +11,7 @@ PYTHON_PLUGGY_SETUP_TYPE = setuptools
> >  PYTHON_PLUGGY_LICENSE = MIT
> >  PYTHON_PLUGGY_LICENSE_FILES = LICENSE
> >  PYTHON_PLUGGY_DEPENDENCIES = host-python-setuptools-scm
> > +HOST_PYTHON_PLUGGY_DEPENDENCIES = host-python-setuptools-scm
> >
> >  $(eval $(python-package))
> > +$(eval $(host-python-package))
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
