Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432CBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 18:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E12AA40FBA;
	Wed, 30 Mar 2022 18:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3jpVMHM-Fzn; Wed, 30 Mar 2022 18:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B45140FBE;
	Wed, 30 Mar 2022 18:01:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E25A1BF47E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 18:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0D46848C5
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 18:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEoIqTI8bXWH for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 18:01:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B262484897
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 18:01:23 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso22821090fac.9
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 11:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k6DYQWmDLpMhw7+BN14f9bGqmy5EhxWpw6uXbiLd4NY=;
 b=hjA2GS9Y84h+/8OtLxAJj25w68NWaSkZZYGx4JGJiC4eNcbJKui9eQaUtXEG6jZrCl
 +SF6eJF1tF8eamPG4gnO7zlJHhdI8N2hFW3igtxggdpYFe1RwfYSl+zb2YQlmjO+2TrZ
 5iUH1XAzN47NKSIJdb//U46htVGAHheT2mVJ5eE0WFrrVJFb1eH1QswIrrubB1dlLQid
 TVtY/TOyNwXp328MDxg9DVzt5bZF6w1peDqbvSjfR/VvZsKTxDiR2NEqkl7TjyPoe1g8
 tiY0YCRjOI1BfPuaz0Ft29rahxfa3ix1/v/7Gmr2gh/2i4Y4OwnLxlpWR3OpoA+3YlGU
 xP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k6DYQWmDLpMhw7+BN14f9bGqmy5EhxWpw6uXbiLd4NY=;
 b=nKJj3z4IOpG/ZB7lAEizwshVlB0ktMP+h4N+iYnNtnvXbwOieDorlqv1eM2Rvg2d6o
 Q2ZZTco8Ep8ceCTJdLsv2u/yNvV9djXlcsWDH5iUnh0EP2zP+TFAHa+dCHR+1tIl3G+Z
 KhzzycsTwrPgJ/OW2QRQl6gQS3BP59KLkihxd5zQs0SNEbZ+kOy69JuMrLvOfnI8uuak
 WNYfQOYK5lTaxNkQzFaG0DvJb0Hn0Pjl5a8UhZ34WcpjPNMEDBxQ5folgIJJKw7PjsQO
 vH2bxtWk6Q1XRsV+g2Ez0YnL9YRffUmDn5e4htRbQOu+fj41gx/pvJrBWf5ZnJpiolIX
 WEsQ==
X-Gm-Message-State: AOAM5309HchTMiDWAfaylqFKLN6J3WqcWTv0tGofDEYkEi2j4f3ChIId
 Xx+zaXNAFfxxoE527knEFjkUEpupvRPWff7Y+IVa9Riw+vs=
X-Google-Smtp-Source: ABdhPJzxh8Hkh2t0YfMX1AGT4x9oEoK/wATlVhAqueFSkKyOgJsyo09c+kDhM5Wx49Rlw2qsamkSFwXvTiWvHxZrzoo=
X-Received: by 2002:a05:6870:d0c4:b0:dd:c7f6:2d62 with SMTP id
 k4-20020a056870d0c400b000ddc7f62d62mr464077oaa.99.1648663282052; Wed, 30 Mar
 2022 11:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
 <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
 <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
 <CADvTj4rNA_vsqU5-2Hu6XT4LjpRhmuO09FsZOEk8w16VMri6xw@mail.gmail.com>
 <CAM70yxD=tU7FK1uf2iEpFVK_jDQyHv6j8xAdW9nEDz0r8njz6w@mail.gmail.com>
In-Reply-To: <CAM70yxD=tU7FK1uf2iEpFVK_jDQyHv6j8xAdW9nEDz0r8njz6w@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Mar 2022 12:01:11 -0600
Message-ID: <CADvTj4qo_ac-wizQH_xvMbn5Y7urEHnNyopLGTmF4RJ3HP=+Hw@mail.gmail.com>
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

I think keep /usr for STAGING/TARGET OPTS but remove for HOST OPTS.

On Wed, Mar 30, 2022 at 11:37 AM Emile Cormier
<emile.cormier.jr@gmail.com> wrote:
>
> On Wed, Mar 30, 2022 at 4:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>> On Wed, Mar 30, 2022 at 1:19 AM Emile Cormier
>> <emile.cormier.jr@gmail.com> wrote:
>> > For me output/host/usr is a simlink to output/host:
>>
>> Yeah, I think it usually works but should not have /usr for consistency.
>
>
> I tried removing 'usr/' from PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS as well as HOST_PKG_PYTHON_PEP517_INSTALL_OPTS, and the print(PasswordHasher().hash("foo")) test still works for me on the target device.
>
> Do you want me to issue another patch with the 'usr/' portion removed from PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS as well as HOST_PKG_PYTHON_PEP517_INSTALL_OPTS? I don't care about receiving credit for such trivial changes. Please do whatever is most expedient to fix the problem.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
