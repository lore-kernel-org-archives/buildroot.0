Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBFDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 22:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF82B410B8;
	Mon, 23 May 2022 22:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5TxhuMQ4P8X; Mon, 23 May 2022 22:08:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69846410A8;
	Mon, 23 May 2022 22:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB12C1BF337
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 22:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7DE3410A0
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 22:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFHH4IMM8TL3 for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 22:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2E0440A04
 for <buildroot@buildroot.org>; Mon, 23 May 2022 22:08:20 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id j137so8491655oih.6
 for <buildroot@buildroot.org>; Mon, 23 May 2022 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ZXnjy4sGw5HtC9RmrBdbkyjSnLSWSWn2rCxOAkF+TU=;
 b=D4pzv3/RaFyz7mzMsHZlix+St7zvIlPT4s5O8xhNFUBWaavfJq4SGiEqWx3bCfUdb6
 IajLI7cUeOBEdUhaTmX0FSqrDXrtB85LBonlXnAd76JAcecr4avsAbN8TPJ4VqwMI5a0
 zCJmULmILSiUhXGdV4FQGBgbUlRLDC27a5lpi3VsGfHb5sukKnvoYkYa1CxmFvAj72S9
 U/J9Die+FfGhOFkTm1R9svI/hwLZPYW6OhtHbs1l3opwrT5OqmCNuBMJuVpE0po5L/dd
 sW4MHYAkf/EwAcMupYfaK25YmmhWrk5anVajSTmQMirEbyBLPjVX5CVLLHyakfyLxGgl
 tXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ZXnjy4sGw5HtC9RmrBdbkyjSnLSWSWn2rCxOAkF+TU=;
 b=uY8bJa7owgLoudFpzfov0Wf4P9d2ffs32TmFIF43dv616EhNnjmieQmR7A+osxo/pf
 g48lVy3VuYjYNfOXvp6pkkwLXoo0TDFZtIgSp7qaU1LzLWYBUZiVkhVbAmSBqLIlIpvs
 QaPjr/0/pP/fsC+RkJWJyReRIxdvgeYjbRugZxIy02HImKusE0fxMGL8VoLophPSR2PH
 VlR8EphSZBewSgnfvyVhxcqmAbvsQ2sFvf9c/tPc+CwPyR6Sxa+DMbVPVwN7bMUTXyzn
 7Vl/Y959WfsjxbRidpBgBjRmtrcPSA+ii7omEl4VAk9n6bdIhuzN5bprrqs1YDUfXbAA
 l+4Q==
X-Gm-Message-State: AOAM532S+w9ybKDyQkMc37x4x/1BvJbGc3AjFDXHk7MO3lGyhQhX+/ls
 B98OP7dL78bdGlA8r2UXLv1WjZAZvNVjfCWkQcELkfvs
X-Google-Smtp-Source: ABdhPJy71IQo/kOy8vr0YSvxQf3qx2Ns89sh0uL5hXNuK5wNgoSXvrpZMesY+QtPsW08zwehi6wV9NmbU2JU81jICD0=
X-Received: by 2002:a05:6808:2014:b0:32b:1806:8ed5 with SMTP id
 q20-20020a056808201400b0032b18068ed5mr684809oiw.99.1653343699800; Mon, 23 May
 2022 15:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <b07a637a-9842-7852-61c1-b7ca549b0c42@benettiengineering.com>
 <CADvTj4puraDuVBrgA_wDGAcHsMTMbioDuoveZScziQ1A2WdTqw@mail.gmail.com>
 <0886c6bf-316f-10c8-ba7f-7ba6d306478a@benettiengineering.com>
In-Reply-To: <0886c6bf-316f-10c8-ba7f-7ba6d306478a@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 23 May 2022 16:08:08 -0600
Message-ID: <CADvTj4qRkBWM9Pv+bd8bPN-jJn0tXVzR3g7TfNLPq1uz3L=zsQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] Can't reproduce libnss build failure
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

On Mon, May 23, 2022 at 3:43 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
>
> On 23/05/22 02:40, James Hilliard wrote:
> > On Sun, May 22, 2022 at 5:58 PM Giulio Benetti
> > <giulio.benetti@benettiengineering.com> wrote:
> >>
> >> Hi James,
> >>
> >> I'm dealing with libnss build failure with host gcc on your asahi-mini
> >> autobuilder, the host gcc doesn't
> >> like -m64 option when linking [1].
> >>
> >> I've spent many hours trying to reproduce it on various dockers and
> >> finally on a VM with Ubuntu 16.04
> >> 32 bits but in the first cases I can't have any build failure, while
> >> with the latter I have a different error.
> >
> > It's an aarch64 host, not 32 bit x86.
> >
> >>
> >> Can you please tell me specifically which distribution and distribution
> >> version you're using on asahi-mini?
> >> I'm on it and I'd like to fix it.
> >
> > As the name implies it's asahi linux(arch based) on a mac
> > mini(https://asahilinux.org/).
>
> Aah ok. Thank you, I'm now building a docker container with buildx based
> on ubuntu 20.04 for linux/arm64, let's see if it behaves the same.
> I've tried with archlinux:latest but arm64 is not available, while also
> agners/archlinuxarm gives me problems.
> Crossed fingers.

If that doesn't work send me your ssh pub key and I can just give you remote
access to the mac mini for reproducing/testing, I'm not really using it for
anything other than autobuilders at the moment.

>
> Kind regards
> ---
> Giulio Benetti
> Benetti Engineering sas
>
> >
> >>
> >> Thanks a lot
> >> Best regards
> >>
> >> [1]:
> >> http://autobuild.buildroot.net/results/dffa00b04f407715b04b1dfd8d9e5e4bc62b5ba2/
> >>
> >> ---
> >> Giulio Benetti
> >> Benetti Engineering sas
> >>
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
