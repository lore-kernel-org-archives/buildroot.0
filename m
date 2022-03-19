Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41EBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 23:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6271C81C21;
	Sat, 19 Mar 2022 23:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qO5HSY3-gek1; Sat, 19 Mar 2022 23:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EBA781BCB;
	Sat, 19 Mar 2022 23:47:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A902B1BF3F7
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 23:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 923E760ADE
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 23:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPIJ84DX5KEv for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 23:47:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73B0860669
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 23:47:26 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id n7so12726122oif.5
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 16:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JQed4xL3PkQvnJJ628+D/ltt3wfGy0C5aNMp1zbbCh4=;
 b=h95/GSS8vbyUEvoDgT7sfeybLvih/zGB4iF0Nk1PyfwRvm9UujBAbIqldsPcN9GGBk
 Koll5SySJpFnLkqSIxIYY9ac6mzl8Q6YQBGYGa74kqtSlcxdSouTV4JU1tz0GCW8YSs6
 Q01Zu3vTbzSAQEAr9xAeiGw/+jW+PsiwiUCn/jf8EsHOZ2suSwyi4C1m4taYuR75xqLY
 PzoS+MmD5KpxMX1/hYT0a5iXmvKJPrwCjgtyQWj9+TL1ZCokY4IMJjatDWSxVQ7NdnU7
 7KF/sfmRmtTHHYRxC8JxMUHBk76D5hSM7GnL3sFmpvpNKBHLBl3mjKkfakwijgomxAZ7
 6eeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JQed4xL3PkQvnJJ628+D/ltt3wfGy0C5aNMp1zbbCh4=;
 b=cbU+dAxvpxEprqHIOGLHBUDYPlJEACbZbADJVly70PVC/zgeYZtOxW/+BGfT3hhsaZ
 +4/GfmWhwmTbyWgjqtlJMYP3VQ8w4a8QK+slw4gAjFvq3TIBgMeshIsqkmJY/fepAR2V
 mXlalEPzOfj6Khq6KU4vR3l/yHzpn1gmJhbm4PwbwkL8QKAEg0f3hdpXT93sEWKIiW28
 yRVD9t4Ky2vFCk9f+/sHbJBfQ1IBLWZkanvjw3ltbkc2/m6z1P7fUFcXAG8L1EB8Le52
 Pqj3RG6ktgl6u1gtZ6P5gJS8zXG9GLgdOMc8wRJbZto0y6j4kvSnkJRvT2trqW6KFXV9
 3m3Q==
X-Gm-Message-State: AOAM530WBSAREbVFBMEoLVFbI/puQa5csdDzDAlzgeSJ5BtFHYaBfsMF
 mARGaHl5yfNt+qMA6FgS8EjqZEbmAktnG05qE7+Ga2YynLA9YA==
X-Google-Smtp-Source: ABdhPJzfeIrYmbUTFg0XRYkLICWGzlCJlvM+RpnGDYtTe6/+rt3Aag9qBbzlFBbxJpJyGHBg8bs+PbKaYDx28LYcCXY=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr10080405oic.200.1647733645494; Sat, 19
 Mar 2022 16:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220222113336.2608916-1-angelo@amarulasolutions.com>
 <87r16xpxjx.fsf@dell.be.48ers.dk>
In-Reply-To: <87r16xpxjx.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 19 Mar 2022 17:47:14 -0600
Message-ID: <CADvTj4rFcAfi=a1qzYmuRJO6kDBd2MKwAK4Az1m54VktSs0Egw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/python-pillow: bump to version 9.0.1
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
Cc: buildroot <buildroot@buildroot.org>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Mar 19, 2022 at 1:11 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>
>  > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> Looking at the changelog, 9.0.1 seems to be a security fix release
> fixing two CVEs:
>
> https://github.com/python-pillow/Pillow/blob/main/CHANGES.rst
>
> Please mark such version bumps as security related so I don't miss them.
>
> Committed with that fixed to 2022.02.x, thanks.

FYI there might be a regression, 9.0.1 is broken on master at least,
this should fix it:
https://patchwork.ozlabs.org/project/buildroot/patch/20220316060219.3448648-1-james.hilliard1@gmail.com/

>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
