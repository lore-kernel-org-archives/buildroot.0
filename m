Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF92BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 00:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B9361073;
	Mon, 23 May 2022 00:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxPdAF7C2rE7; Mon, 23 May 2022 00:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 394196105B;
	Mon, 23 May 2022 00:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A41911BF96B
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 00:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F9D5417FB
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 00:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmSuHm-Idj23 for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 00:41:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9875641767
 for <buildroot@buildroot.org>; Mon, 23 May 2022 00:41:00 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 f2-20020a4a8f42000000b0035e74942d42so2482129ool.13
 for <buildroot@buildroot.org>; Sun, 22 May 2022 17:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TPWBUum9AoKT8RF6eyaldVggjlDWbwDJfAn6r0PFI5U=;
 b=dkl+z57kXHsBXR0YHdm0FcpKhgGZXW6zd81w9bQGSLYH2r5/dxeWB1V8hFEtQ7/Jig
 7Lnyx5Wpg2YL0CO0p3NlFZDJXHEqFUizspHQ1JjJuUUoV2ih+nU0bIq8U/lY/W1E/rH6
 TJ1Ko6bQn6vymqHnGyHydHqjDnXDNR/WcEe7peJ39T0jYFYHALTgONGsO+1d4vVLXHlb
 xzeZ7meb0h2wr5qpvdeeGegpiCOA4bKbusY86yhrvqzpd+Grfnb9RB6kwvTjup0R/vWr
 9siIgB1Cty1ml4CPZIpWAA7xpkDDSq1GY3g9Ofn+cTgmigqDqMCJkigU+swkZqHpqF5j
 1myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TPWBUum9AoKT8RF6eyaldVggjlDWbwDJfAn6r0PFI5U=;
 b=5kNeB43VHdUzI/zaZgrvB2K9OA+OXExn6bXfdaLvXUkMNcv50sU/tRvrwYes1UWWfU
 LN1JCD1W3JJot80Ngpv+nLlIP2sfCTBV1EIpleGs5TQ5chW+3HWjNUBf4hgv1wvcKTBI
 P4GRF4w3HXBsgBcc9r4L3pife/e1kpnu23o+f2RpJQ6oXyPuf7AI4DfjMXFDb4gTqIGz
 qvR92TjkWl1jHWQHJcuNluIwThX1zMGM8yR+zT4QV0fhiPgKEOpPZ80Y8zEpFHHy8KQC
 20HRLOc7gO0QQMKo4LfQnimx6S1cANvejxZCBChbfeUKUiRTgJi9+iX99bGIx88yEN9+
 UBCQ==
X-Gm-Message-State: AOAM530RXtZeINkPw2dKQAQMnCJziPEN0/jRUXKCd7mOGAfAlpfnNQMs
 7yt9gybiewmOxYoUCHzlZd+z84eW9FxNOzQa9P23onozf+Q=
X-Google-Smtp-Source: ABdhPJxxvQ43kx6zojaebAePSwWe3Mdfpi3E0xfw9B0i6yS/0nbCWt5MRM4mu80SQAN77od+4b/Hx/neTzp0vStQSEs=
X-Received: by 2002:a05:6820:16aa:b0:40e:880b:2008 with SMTP id
 bc42-20020a05682016aa00b0040e880b2008mr1131441oob.69.1653266459323; Sun, 22
 May 2022 17:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <b07a637a-9842-7852-61c1-b7ca549b0c42@benettiengineering.com>
In-Reply-To: <b07a637a-9842-7852-61c1-b7ca549b0c42@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 May 2022 18:40:48 -0600
Message-ID: <CADvTj4puraDuVBrgA_wDGAcHsMTMbioDuoveZScziQ1A2WdTqw@mail.gmail.com>
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

On Sun, May 22, 2022 at 5:58 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Hi James,
>
> I'm dealing with libnss build failure with host gcc on your asahi-mini
> autobuilder, the host gcc doesn't
> like -m64 option when linking [1].
>
> I've spent many hours trying to reproduce it on various dockers and
> finally on a VM with Ubuntu 16.04
> 32 bits but in the first cases I can't have any build failure, while
> with the latter I have a different error.

It's an aarch64 host, not 32 bit x86.

>
> Can you please tell me specifically which distribution and distribution
> version you're using on asahi-mini?
> I'm on it and I'd like to fix it.

As the name implies it's asahi linux(arch based) on a mac
mini(https://asahilinux.org/).

>
> Thanks a lot
> Best regards
>
> [1]:
> http://autobuild.buildroot.net/results/dffa00b04f407715b04b1dfd8d9e5e4bc62b5ba2/
>
> ---
> Giulio Benetti
> Benetti Engineering sas
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
