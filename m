Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78648C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 22:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B58641E1A;
	Wed, 30 Mar 2022 22:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dkG6zx5qWT40; Wed, 30 Mar 2022 22:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC6141D0A;
	Wed, 30 Mar 2022 22:53:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF2501BF359
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 22:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B47F41CFB
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 22:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGU63nBL5OZb for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 22:53:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 116B441950
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 22:53:26 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-dee0378ce7so13214357fac.4
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 15:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFpXibFYKoUFcOMTJuhiWTOBPivI3pY9svvAKC73joA=;
 b=aYQX7xwkJqIuyGmuccKN5R6XDcDk3AoS1kKbUIBlUdM8pYtdm4OtTn3J7VTcYzlP7p
 YzJ260lMpvB/Vtooik7ZtTIlp8ZbUyfda2N3XU+IT4gvMVuoiWqgTdweKG7gNEfAGxoh
 9eTcuGxkZYb6oXTwh+aKI0tS4DEbtHBX3qMWBpfLzMu5uWHPnTnHClbumz2dE/OzYUvw
 0a7PxHi2wif68Q0MwNTz7BnxWb2uLaRWyOrg1HACU7lgudN0MpG1BOJ4ikYSH3uVaouv
 booIYwKM42P9soBV6tf1P5G7syai2DXYFke2YWZom0o1kk5XsGKlglCbJKB9/1KQkcb9
 KEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFpXibFYKoUFcOMTJuhiWTOBPivI3pY9svvAKC73joA=;
 b=eNl975PQmChvyEReDhLm7CCYIInfICyqLj0cn+3J/lJJUoqp3jUh7bXObJlIIlLK7e
 voUG0h4wXTaF/B2BsB9GRyvUYxTrw8L/ZTfGN7YcGLUrYVIypSMGEfFl3+jDjw+IkP7Y
 AQsCc9NyHyPcxx7jcOMpapZczyiIQ0EeqziQdieMXywBqVIWwR1gACGFF5cm7nsQEClU
 Z+Q1su9arLk3nntWwJwsfx5p2NsepWbxuZvfQRDSJG4Kt/LDKD4HBweO9Gl/XS2M9+Qx
 rfTBdD4YN2iNiHfDiWHfRePwQL+wXvGD1fn1tajJDf7ihKsKimXOqFprz9F73TLPC4wF
 ZMww==
X-Gm-Message-State: AOAM533Wj7jLP1y3YcAFPj4Wxv3e0wuHCZH017M70uYZuDY4z0GOjgQW
 6Tf4lLN/RgfYBBBmFFwiOquH/ElUT2ctRko2WF4=
X-Google-Smtp-Source: ABdhPJzGyN9lle1Poj1WGW2GINSiDRdMkfkKWP/BRMScKp/UwJp6Sq1KwItTVlglES7dpgSy/z6lm458EML4WQ7qUok=
X-Received: by 2002:a05:6870:d0c4:b0:dd:c7f6:2d62 with SMTP id
 k4-20020a056870d0c400b000ddc7f62d62mr1182193oaa.99.1648680805901; Wed, 30 Mar
 2022 15:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
 <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
 <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
 <CADvTj4rNA_vsqU5-2Hu6XT4LjpRhmuO09FsZOEk8w16VMri6xw@mail.gmail.com>
 <CAM70yxD=tU7FK1uf2iEpFVK_jDQyHv6j8xAdW9nEDz0r8njz6w@mail.gmail.com>
 <CADvTj4qo_ac-wizQH_xvMbn5Y7urEHnNyopLGTmF4RJ3HP=+Hw@mail.gmail.com>
 <CAM70yxB61g2r5+aHZYPbit+3TjaWG4khnb71vHC-2pfF+WoyfQ@mail.gmail.com>
 <CAM70yxCMj-_4q_Rix-PK2=sG+RcfVE0GQr8FK4UqrRT6c7AsSw@mail.gmail.com>
 <CADvTj4qO-YJDa4uqW8SzQpEHYyOPc948cxFrRonXCJMSO1m=7g@mail.gmail.com>
 <CAM70yxD0LGfsKrDwHH8v8-nN9Xu3KQEvmo=jYXKKXMjQGq-isg@mail.gmail.com>
In-Reply-To: <CAM70yxD0LGfsKrDwHH8v8-nN9Xu3KQEvmo=jYXKKXMjQGq-isg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Mar 2022 16:53:13 -0600
Message-ID: <CADvTj4rs50K4FvGWnyu6ar7Afkdv=5SGNxuOvhf7TuBai4jTjw@mail.gmail.com>
To: Emile Cormier <emile.cormier.jr@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: fix PEP517
 purelib deployment path
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

On Wed, Mar 30, 2022 at 2:18 PM Emile Cormier
<emile.cormier.jr@gmail.com> wrote:
>
> Oops, missed the interpreter option for HOST_PKG_PYTHON_PEP517_INSTALL_OPTS. I made the change as you suggested and it still works. Revised patch follows:

You also missed data there as well, and it seems your patch has
formatting issues,
I went ahead and cleaned it up here, see if that works ok for you:
https://patchwork.ozlabs.org/project/buildroot/patch/20220330224521.4142504-1-james.hilliard1@gmail.com/

FYI I think your email client is corrupting the patch a bit as it
didn't apply cleanly,
see guide here:
https://buildroot.org/downloads/manual/manual.html#submitting-patches

Make sure you send the patch using git send-email which should make sure
the formatting isn't messed with by your email client.

>
> -----
>
> package/pkg-python.mk: fix PEP517 purelib deployment path
>
> This allows the Python interpreter to find packages built via the new Flit
> infrastructure and fixes bug #14721.
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
>
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 52ce402281..81c33ba557 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV = \
>  PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
> - --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> + --purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   --headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>   --scripts=$(TARGET_DIR)/usr/bin \
>   --data=$(TARGET_DIR)/usr
> @@ -135,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>  PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
> - --purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> + --purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   --headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>   --scripts=$(STAGING_DIR)/usr/bin \
>   --data=$(STAGING_DIR)/usr
> @@ -147,11 +147,11 @@ HOST_PKG_PYTHON_PEP517_ENV = \
>   $(HOST_CONFIGURE_OPTS)
>
>  HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
> - --interpreter=/usr/bin/python \
> + --interpreter=/bin/python \
>   --script-kind=posix \
>   --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> - --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> - --scripts=$(HOST_DIR)/usr/bin \
> + --headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)  \
> + --scripts=$(HOST_DIR)/bin \
>   --data=$(HOST_DIR)/usr
>
>  ################################################################################
>
> On Wed, Mar 30, 2022 at 4:25 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>> On Wed, Mar 30, 2022 at 12:52 PM Emile Cormier
>> <emile.cormier.jr@gmail.com> wrote:
>> >
>> > package/pkg-python.mk: fix PEP517 purelib deployment path
>> >
>> > This allows the Python interpreter to find packages built via the new Flit
>> > infrastructure and fixes bug #14721.
>> > Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
>> >
>> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
>> > index 52ce402281..ab4f7af6a6 100644
>> > --- a/package/pkg-python.mk
>> > +++ b/package/pkg-python.mk
>> > @@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV = \
>> >  PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>> >   --interpreter=/usr/bin/python \
>> >   --script-kind=posix \
>> > - --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>> > + --purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>> >   --headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>> >   --scripts=$(TARGET_DIR)/usr/bin \
>> >   --data=$(TARGET_DIR)/usr
>> > @@ -135,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>> >  PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
>> >   --interpreter=/usr/bin/python \
>> >   --script-kind=posix \
>> > - --purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>> > + --purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>> >   --headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>> >   --scripts=$(STAGING_DIR)/usr/bin \
>> >   --data=$(STAGING_DIR)/usr
>> > @@ -150,8 +150,8 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
>> >   --interpreter=/usr/bin/python \
>> >   --script-kind=posix \
>> >   --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>> > - --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>> > - --scripts=$(HOST_DIR)/usr/bin \
>> > + --headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)  \
>> > + --scripts=$(HOST_DIR)/bin \
>> >   --data=$(HOST_DIR)/usr
>>
>> I think it should be something like this for the host:
>> HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
>> --interpreter=/bin/python \
>> --script-kind=posix \
>> --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>> --headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
>> --scripts=$(HOST_DIR)/bin \
>> --data=$(HOST_DIR)
>>
>>
>> >
>> >  ################################################################################
>> >
>> > On Wed, Mar 30, 2022 at 3:51 PM Emile Cormier <emile.cormier.jr@gmail.com> wrote:
>> >>
>> >> On Wed, Mar 30, 2022 at 3:01 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>> >>>
>> >>> I think keep /usr for STAGING/TARGET OPTS but remove for HOST OPTS.
>> >>
>> >>
>> >> Alright, I've changed it as you suggested and it still works for me. I'll post an updated patch.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
