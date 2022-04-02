Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113CAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 18:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A766560E8B;
	Sat,  2 Apr 2022 18:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2VOCqj8xRVQ; Sat,  2 Apr 2022 18:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF9D60B9D;
	Sat,  2 Apr 2022 18:14:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89BCD1BF2B5
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 18:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F0F440256
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 18:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxZ6oJ6yHUPX for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 18:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56BCB401A2
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 18:14:08 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id q189so5934306oia.9
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yHYfRhbOpYCaYEbnwOvgcOSyBuT1mHOH7O8QnEZMW1M=;
 b=J5yvQ3d6kLC6hchx+VM5AR0KmI0p8N6nT7LYlB+Yycx1VBLAgXwEU3r5cAlb/oRxn1
 4l+vn8Fg+J7eBZy3/eEQBPc7ZqnLJ0qUe5rPfJJLLpCazHHeNGOkr/ufRutklThKQQkS
 kE7lOyxXzuNrYdpEGKd3iTq4knR9Wjj44PDjBwCUkI6eA7UfzXLWbbk1zZcnD66NK33y
 h/fmJTS9W6gUAmlaNRZvRVunuGCy0KA38tzOOnT6q+96o7B7Fywme1Y8Kk1dn0CGJw0K
 7BmnZYnNaZYuDg3SxYNgR7VWyvdP5qibhK42dU7u3LkSoL2Ho1dL5ZkAoBLe8mLsE4vE
 pmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yHYfRhbOpYCaYEbnwOvgcOSyBuT1mHOH7O8QnEZMW1M=;
 b=lHhace5aWEuy36gt5Z1SaiPDf/4Bchb8Cn5MW8rZ2V0ah7+cZXSo5ZnHYMBDetMPQh
 Xk0WTbp3hF6BKvlJFK+PzLChuaUmkqaBgoTbkjjTbgnwRaSYbmBCskeufN4VFaG7P9NB
 UvB0RzZRRnsIxtKqKhkqWBb6/QSW0YDZqElRD0LYmEJHdiSWkJmoyqQPhKSvqcsXjqsX
 hmgZHf9HcSspYjTdHqfTO7bru0agAUzRQ4MtEYdJzO6HuXNYt34qUeAqX9XQs0tsw9hJ
 60Iy2g4O0fNfOD8OfhijVVF0/9o7kpM7Beo9xb7wvvp2cmZ9LFnF1DcRubfkX2PicRrG
 vNVA==
X-Gm-Message-State: AOAM530Jsr7jjouZTOcQPhgybId9mCucMagwzkRjFOJ8/FW5r0kJZ8UQ
 GgIM1DAmFDT5SO4APevWvsMdJNwjcxR5aSGps2g=
X-Google-Smtp-Source: ABdhPJyKtjZi0weYZRiH/QHRRwhJp/JQn5JgzsnYK2nFKGbngP00ocaK5i12FUHGr/ED6o+ztwnKhYa2SCXjh3ZDOmw=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr6614275oic.200.1648923220437; Sat, 02
 Apr 2022 11:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
 <20220322232224.2842266-6-james.hilliard1@gmail.com>
 <c3610252-b676-f44f-a900-7ec8e9c6cb23@gmail.com>
 <CADvTj4pDYNkEmgxq=Zc4b+gRNeEoPMAhHu8zetRUNs5=dsrkCA@mail.gmail.com>
 <4ac4b8c5-875c-5559-7042-d7a87b42aa60@mind.be>
In-Reply-To: <4ac4b8c5-875c-5559-7042-d7a87b42aa60@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 2 Apr 2022 12:13:29 -0600
Message-ID: <CADvTj4r6uq8zc_zwGA7DnYQVw0XjSO++UQECSP-LzOcNUrsiDw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v12 06/11] package/libclc: bump version to
 13.0.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Romain Naour <romain.naour@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Apr 2, 2022 at 11:11 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 31/03/2022 23:38, James Hilliard wrote:
> > On Thu, Mar 31, 2022 at 2:50 PM Romain Naour <romain.naour@gmail.com> wrote:
> >>
> >> Hi James,
> >>
> [snip]
> >> Ideally, llvm/clang should be updated to 13.0.1 first (or to the latest version
> >> if possible).
> >
> > There were some issues with lld in anything newer than 11.1.0, see:
> > https://lore.kernel.org/buildroot/20220131015937.4113728-1-james.hilliard1@gmail.com/
> > https://bugs.llvm.org/show_bug.cgi?id=49228
>
>   To me that looks trivial to solve: we need to package libunwind (call it
> llvm-libunwind because we already have a libunwind package) and make lld depend
> on it. The CMakeLists.txt adds an include path that doesn't exist, but I think
> that will get silently ignored.

I think fixing it was a bit tricky due to conflicting dependencies or
something, since
it works with 11.1.0 I'd say best just do this upgrade first and
update to newer versions
after.

>
>   Regards,
>   Arnout
>
> >
> > So I held off on going beyond 11.1.0 for now due to that.
> [snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
