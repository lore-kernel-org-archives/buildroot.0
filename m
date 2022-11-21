Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550EFC4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D38A3409E7;
	Mon, 21 Nov 2022 21:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D38A3409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pAYL176c-a5; Mon, 21 Nov 2022 21:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C99409F1;
	Mon, 21 Nov 2022 21:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C99409F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2751BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75DDF402F5
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75DDF402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wetX6oUI9PEt for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:17:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96F1040179
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96F1040179
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:17:19 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id ci10so5329253pjb.1
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 13:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZAm9txlXIgIKqtc9hEbXS1OOvc29+gPV4dMOV57VwWQ=;
 b=YhE4A2Nqou+p8ibRyiB2o/9fTf9zmXVZSvtWooJYwRnXXTEgCOwpKzzQ61WnzFFOlQ
 /LYkrPxqtAevnKxosF25eUHQjBQ84XXjl+qs5Us0Jpbh/os828byvGhZWwSx/l+h5NgF
 DjpC9wAnk7ZsxT5wwxaTKraL4/+45oZg8BBrbbwIQVh65HxMATEO6TiXZ2lAOOFuJAfm
 IZJygxKPwujQ+Prb5H1eWhcFGm7f06Gjb5XcpjI2nunN48xPmuUB0OtTgkx03Q/dSbm0
 DmFLYXf0MjNbCBfJOYgwKrPlvEf7jdNtNO4U2HT2JXIjh9JNhd++OqIck1MhR0veMGKL
 LJwA==
X-Gm-Message-State: ANoB5pleTwqB0+xuLZoa2/PAV3cw184ZnE2oLEHyZMgGLVLBuBuamZP/
 QPibRUlWDyAlIehzb4lS+IDrv2mhZA5r+Cud5aK8rfFXNrE=
X-Google-Smtp-Source: AA0mqf6cMdTRQJMUQOg735zreSUE8foaEU8VbXwnL3AJsL3NR4oK/W9mRaWa4v4+fMJABHTqa6yONOIpQBXQomsgkR4=
X-Received: by 2002:a17:903:22c4:b0:184:cb7e:ba36 with SMTP id
 y4-20020a17090322c400b00184cb7eba36mr715386plg.57.1669065438963; Mon, 21 Nov
 2022 13:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20221121122021.287011-1-james.hilliard1@gmail.com>
 <20221121211024.GM2516@scaer>
In-Reply-To: <20221121211024.GM2516@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Nov 2022 17:17:07 -0400
Message-ID: <CADvTj4qMRj1UmCYhDpS0T8V+223NLjzxL5-+k1dd+pJ4-5+q5g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZAm9txlXIgIKqtc9hEbXS1OOvc29+gPV4dMOV57VwWQ=;
 b=VarPCzef3Z95CuegTkQJdZfs3QnKJ3GX/QEpoRUuFrU3VP3J+3pTvbNARF3myT2cc2
 LpMkflrkeUCHJOmIaIvCoOwAy4U/iXkwsVqL0UewzcLS5WkNuAhQ6W4b+CwDt1Hy5/lZ
 odeHtrxy1FIykHVXxwzMDS7FQ5QdEhB/HOCz6HXRCG3wNYp0M9f4lsF2HBCNU23lP7qz
 ZtwVqhbwelQuOysuJk7mxVv0YPsfunuqdSv9AmCZEeARFIDKIBvUChtRc0K1D0VSM/nI
 LfJ40ZWIfJ7/P4gq3x0lVa+wnAQhxq8m9XLhfmFLOUEtsfK4oU2ZyZc0QI+GWnCTpTsC
 5pNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VarPCzef
Subject: Re: [Buildroot] [PATCH 1/2] package/python-orjson: bump to version
 3.8.2
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Nov 21, 2022 at 5:10 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-11-21 05:20 -0700, James Hilliard spake thusly:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/python-orjson/python-orjson.hash | 2 +-
> >  package/python-orjson/python-orjson.mk   | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> > index 1de1d7cdc2..8563ed544f 100644
> > --- a/package/python-orjson/python-orjson.hash
> > +++ b/package/python-orjson/python-orjson.hash
> > @@ -1,5 +1,5 @@
> >  # Locally calculated after vendoring
> > -sha256  285091518bdbde8086c60c5ed6d7090eccc1c232b00138c964c410f1a7da654f  orjson-3.7.11.tar.gz
> > +sha256  dc06889b0ce52d5e96253573f6cbdf5939c5902022cbe2538cedc622e9378372  orjson-3.8.2.tar.gz
> >  # Locally computed sha256 checksums
> >  sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
> >  sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> > diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
> > index 0a266e827a..b18a5cdada 100644
> > --- a/package/python-orjson/python-orjson.mk
> > +++ b/package/python-orjson/python-orjson.mk
> > @@ -4,9 +4,9 @@
> >  #
> >  ################################################################################
> >
> > -PYTHON_ORJSON_VERSION = 3.7.11
> > +PYTHON_ORJSON_VERSION = 3.8.2
>
> In next, we already have 3.8.1, but I see you prepared the bump against
> master. Is there any reason to apply it to master?

No, I just hadn't noticed that we were on 3.8.1 in next, should apply to next.

>
> Regards,
> Yann E. MORIN.
>
> >  PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
> > -PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/fd/52/42520dbfd47191977140c49fa601624b9b4c6cc9d6a62d3e68970ee9eac6
> > +PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/13/08/d476fff015ccc0f043d3df6332c807695ae3d6abc1758b24f3d335750550
> >  PYTHON_ORJSON_SETUP_TYPE = pep517
> >  PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
> >  PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
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
