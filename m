Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E071CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 12:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7603B410E7;
	Mon, 31 Jan 2022 12:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1UCkgXm6qc9; Mon, 31 Jan 2022 12:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFCE0410E3;
	Mon, 31 Jan 2022 12:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8430F1BF3A8
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 12:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7970083E7E
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 12:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xjQy-5XIJUW for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 12:46:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C64AB83298
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 12:46:11 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y15so26527695lfa.9
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 04:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MjiFFOj1KGVhxxuQQfrE9r5v24ZuDjcy2ScYUgsaDBY=;
 b=cOX5LsJfanB/cFwNSvDORcW4i7IcEZ3z7YAtlO4dWtBL9UljsqoQrD2N2G5t3BaqAi
 z6M6G6gDg7C3swquVDokHW8UhGJyxfyc+5nxHSn5ENMxY2r3FmcAu1ce0huxcqK4G1/F
 uWwuE18YO6KsVfmgTNcCZ0KyQ1JPU+3pVNjCSSC1FQnZCU7f6jhVA/1noLUWOUTQXZfO
 qtDjVxkg29egZ3Pc+SjY+i3eHa3KKL0wygoLVGDok2VYHhqxSwRMZZnQmC/1eMXdeJyp
 aY5QH1K/kTpWOUfFVNYOvLZ3aTbmKF42tj469jx9ae7Dd1ZnV04iNruHKg+m8FoG+WWP
 kNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MjiFFOj1KGVhxxuQQfrE9r5v24ZuDjcy2ScYUgsaDBY=;
 b=xEw2zd2BEwPYIAy+PEp0DnC3hIXo83qN+vg8CzcL9xq9mwVVt+rnvt3uWu1SV6tfL2
 hdZQmhIDk/A2gBxAV4AOb+zVeyHlG2FoLn+0Yo1MBktzc30/+5ZZirNqhRVEVsJbqdIs
 Pg7LDhl42nJcXKN6EsPyxkeTfYDQ0T/VKbmPm8uV8PaD4fEuMM7PxfBMhBUtx/qmydNw
 9LpxXGMSeOKvS7KIVJRei1lRwK6APoS3OhPwz3SEf8R7kVX4v0Cq28/pM2Tv+QCax0/I
 41XCPYb5xTFjnSmaCIukzN+Gp5nUa70UR+gj+FjleI9yQ3QJbEY0a1e/Nj00fVveDcN5
 QxYA==
X-Gm-Message-State: AOAM530p9ert6+wvkMiH543NtiYeL35EhZoxA1ifWVTeJU0EWPYo/mMj
 62lAr1HdlsZuMIEmCRmkmymjXphqmwYMgRIcyTFrD/7kLn8=
X-Google-Smtp-Source: ABdhPJx2Sft54y6WU6Ow2NOtQR4H51lfI4nFKREIZBAVP+1mxPsZCvIWeOgZaAKL5C8nJ69qdbfQQ2UwPJzg0CzNaMg=
X-Received: by 2002:a05:6512:3055:: with SMTP id
 b21mr15274545lfb.621.1643633169624; 
 Mon, 31 Jan 2022 04:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20220131085216.1256242-1-michael@amarulasolutions.com>
 <CAEyMn7ZxrTcZG1-UXGM2DEG9aK2pJwZ3YAmk7tDAh=GV9b1kcw@mail.gmail.com>
 <CAOf5uwnugp+xwjmNTdNUVwRRA3EkqoPQK-WZaEJHokXPVDJH2Q@mail.gmail.com>
 <d22d965f-7814-6e25-3e76-a76d16341346@benettiengineering.com>
 <32d9ead7-e961-0b9d-10a3-c1ea8337b957@benettiengineering.com>
 <CAOf5uwm-1PbsCsYVvp2tHUS2YOMDzGXWjCotEHXY9Zd5gZnsKA@mail.gmail.com>
In-Reply-To: <CAOf5uwm-1PbsCsYVvp2tHUS2YOMDzGXWjCotEHXY9Zd5gZnsKA@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 31 Jan 2022 13:45:58 +0100
Message-ID: <CAEyMn7bFTGHYGmUK=wFaEcJZxPbh=Vh2YahtnpLu6ZCMSGfQxg@mail.gmail.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH V2] board: Add support for iMX8MN BSH SMM S2
 PRO
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Mo., 31. Jan. 2022 um 13:43 Uhr schrieb Michael Nazzareno Trimarchi
<michael@amarulasolutions.com>:
>
> Hi
>
> git diff
> diff --git a/configs/bsh_smms2pro_defconfig b/configs/bsh_smms2pro_defconfig
> index 8472c6db2b..34d92fa4cc 100644
> --- a/configs/bsh_smms2pro_defconfig
> +++ b/configs/bsh_smms2pro_defconfig
> @@ -41,6 +41,3 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_IMX_MKIMAGE=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
>
> Those are not needed. Anyway I need to change uboot download point and
> waiting from Ariel

Yes .. this is what I meant.

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
