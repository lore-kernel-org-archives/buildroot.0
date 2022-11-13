Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBB5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 17:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11DD40919;
	Sun, 13 Nov 2022 17:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C11DD40919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Rb2DGMJkBpL; Sun, 13 Nov 2022 17:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B084408CD;
	Sun, 13 Nov 2022 17:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B084408CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7B691BF2CB
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 17:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A340408CD
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 17:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A340408CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZTvfUeB8hSX for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 17:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26FAE4043A
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26FAE4043A
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 17:41:38 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id f3so1992743pgc.2
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 09:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y80gEz0EAxZckK0oPBdlMT29Q5ss+MvILu/HfwHbjMU=;
 b=TmJX5H1O/BfDIYiT6YHsQfCaTULSSPXthGX7IKceC1RJ2oUaOjxhbtW6XBVH2kj76Y
 E9u7bmz/b9RkeWZi7GtqJ8QfA/w2f+9wQFlX5BmFrQ3Ved7ICphjCrNK2QEfkPsz5PHq
 ShVi9SVEWS+QmMamyaXKEDrPDDq7jWYQ5a7LkKkoQnVyP/bJWrKCE5ouJEg3a1ayXyGJ
 78lIuz+lK148Vs8kdqDR24ziZ5NdfhLQiw7yMcXCdPHTcz1DUNXy8KCc6MEQNWYw50nv
 OZ7V6lpfcplWmFvUXnaCfvvQVHxqrGFshMKbjFo7wuNvsCn0rdT8SYF8wJPlTz41dnIy
 qzwg==
X-Gm-Message-State: ANoB5pm/RxZszcjc2Re+8eVqV40ZS4JWvn+eWSnL6TVCStiXd1pLcp++
 JOk9DMP9Oql2Rmv/M53UXoKA9Ivoek06mURmjl8z7vLY8peWRQ==
X-Google-Smtp-Source: AA0mqf4+KwV4FxYAoRBMoUw5s0akb/lfCr4JBiNvSEGn8FVDk08ksq5j3PlC4i4aPzLxa499rC1CYEtPagAS+xajfwU=
X-Received: by 2002:a63:3103:0:b0:470:2ecd:e9fa with SMTP id
 x3-20020a633103000000b004702ecde9famr8894550pgx.183.1668361297484; Sun, 13
 Nov 2022 09:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20221113160416.2991E836E9@busybox.osuosl.org>
In-Reply-To: <20221113160416.2991E836E9@busybox.osuosl.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Nov 2022 13:41:25 -0400
Message-ID: <CADvTj4rqN_yzMSq52vB1Kaj0=AK7WbsPEAb3BsnHoqpSvxXUqw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y80gEz0EAxZckK0oPBdlMT29Q5ss+MvILu/HfwHbjMU=;
 b=Lf2hsNLegdHbRB3KIGR6vovPSEGVQbZiqvXxhCMuhmq1I5a9L8ynmpPr2DZoEtFXcW
 Q4Ee92/+qt5QHif+6MkywWEn1XL2XzYJg8qMORq4xTd1TxJtouG0f6Jipsy87G+NKlou
 UAXOt8vSvEWHOGI+J4Jk1Amns94RRzWJiyafQjwAtfXqaFBGg2NklAG3s9o4K+8To4qb
 f4Tl2OYtuY0xQ6ONmEepqGxm35thTXWRbXJB4L1TWP2lqcYpuS2J5C8c8Yd38PYPjpa5
 ioMznJ7JHe4w+585IxJqA+fBNQAWgDqnSx7dm7yBiQvGTfPEupv6qi+piT5vwjxYALSa
 F5xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Lf2hsNLe
Subject: Re: [Buildroot] [git commit branch/2022.02.x] package/iwd: drop
 dbus check
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Nov 13, 2022 at 12:05 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=16361553911ca48bce1b043d6f18486b6fdcd1ed
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

There's a regression in this commit:
https://patchwork.ozlabs.org/project/buildroot/patch/20221031174959.604094-1-james.hilliard1@gmail.com/

>
> Since 6f5f6bc dbus is selected when iwd is selected.
> It is only a runtime dependency, so drop the build
> dependency.
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/iwd/iwd.mk | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 6814a04bf8..5bea3f12b4 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -15,16 +15,11 @@ IWD_SELINUX_MODULES = networkmanager
>
>  IWD_CONF_OPTS = \
>         --disable-manual-pages \
> -       --enable-external-ell
> +       --enable-external-ell \
> +       --enable-dbus-policy \
> +       --with-dbus-datadir=/usr/share
>  IWD_DEPENDENCIES = ell
>
> -ifeq ($(BR2_PACKAGE_DBUS),y)
> -IWD_CONF_OPTS += --enable-dbus-policy --with-dbus-datadir=/usr/share
> -IWD_DEPENDENCIES += dbus
> -else
> -IWD_CONF_OPTS += --disable-dbus-policy
> -endif
> -
>  ifeq ($(BR2_PACKAGE_READLINE),y)
>  # iwd client depends on readline (GPL-3.0+)
>  IWD_LICENSE += , GPL-3.0+ (client)
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
