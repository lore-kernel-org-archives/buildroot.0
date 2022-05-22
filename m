Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA3DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 18:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 224B760B12;
	Sun, 22 May 2022 18:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kzV0ve1jz2h; Sun, 22 May 2022 18:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B4560634;
	Sun, 22 May 2022 18:46:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA061BF318
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 18:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D10D40580
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 18:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qE9XT8-YVFZH for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 18:46:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C45D40102
 for <buildroot@buildroot.org>; Sun, 22 May 2022 18:46:34 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id b5so4261953plx.10
 for <buildroot@buildroot.org>; Sun, 22 May 2022 11:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UbYpGIxA5xd9ZnwKoF5pxULBrvyrDImxOlegY/oRQOQ=;
 b=X7Ka7tPOVVUh/YAKPP5aoafGFPkVTXZrht2wMviAKPwYQVygdICNpEuYSvRgTUohCv
 miJTXAnjum15YhyO0VfT7Fkhdd6MltnSSKZT0FpmFKc+pJfVRcG8IHgu+nuVh6zkuLlL
 04Ga6iwI6skDklIa3cQiczFvoGSUNJmh0dnm4x29ebVfQ6zG6P9peFvVti4Uzrkqj/+O
 Mlpu7/95/RLslvYTErPuslkSP/NBuYe2TzqstYnWXRuuD1yKz2S2l6ws/mBi86I72YT6
 qETeVOOWYA8dbU3HwtLrUR375ZtqXPk3z+ownlghmdzfM5+3OGwTJSx0/hVPqhQii2ie
 wc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UbYpGIxA5xd9ZnwKoF5pxULBrvyrDImxOlegY/oRQOQ=;
 b=ZtvFNOkss5lZoWJZYIS1JUSokj53I42vN0KdnTx1yTaRTMdJfI/60EJeR0zi2VdO9w
 QSQiaRnQDVNVw/RFz0frFAUPkxt9nHnDOzVlMgUpE8hXHebEsCGOiCr+6zsvPAQZqbPj
 8YOsIzC54g4E3xOtNW9Pgli+aiiqRta0SA6v1JBcKyjZFTXEoPyQHJG28LwPbDh7kU/E
 wPhksNvrb2VceTcEdsyLUgXN0G0fCRkrcR+dCJt5T0VBpC/y8AU2zTOBPiUOjTOQ+DUO
 5tF3Aih7cDb8r9uTVaN3xJ3OYvNbLxo48p6q4n0CNE6fGbC4C56C1/VZf78qwS83sM+F
 m9TQ==
X-Gm-Message-State: AOAM532R0jPkcpA9HYOTBuXme29ExSHfnADktq04MH7pg1h/50mc3dHQ
 LZ2fDMadEh4rPMIc/gxaH1vbwqyM4ecy5FhUvIxO3O8g
X-Google-Smtp-Source: ABdhPJzSQcKRDTQ+zIcbtuTK8l+97LcDluDbQu/UA17IKgYJm8tte9jAx8syoz8QoKI8AnSuez8NUfjSklRI828qx3A=
X-Received: by 2002:a17:902:e8d6:b0:161:ea52:cd52 with SMTP id
 v22-20020a170902e8d600b00161ea52cd52mr14920952plg.71.1653245193821; Sun, 22
 May 2022 11:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
In-Reply-To: <87zgjapr8a.fsf@tarshish>
From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Sun, 22 May 2022 20:45:58 +0200
Message-ID: <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] How to select python-cryptograhy package
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
Cc: buildroot@busybox.net, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On Sat, 21 May 2022 at 22:26, Baruch Siach <baruch@tkos.co.il> wrote:
>
> BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS is a blind symbol that is enabled
> automatically based on your host (build machine) architecture. Being
> blind means that you can not enable this symbol manually.
>
> BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS is defined at
> package/rustc/Config.in.host. What is your host platform?

It is Linux, Ubuntu 20.04 (x86_64).

> Do you use something that is not listed there?

I am sorry, but I don't know what you mean by this question.

Oscar Gomez Fuente.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
