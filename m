Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D01C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 10:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97AA14154C;
	Sat, 12 Feb 2022 10:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcuYd3c-32fu; Sat, 12 Feb 2022 10:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B467B4152A;
	Sat, 12 Feb 2022 10:12:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB6A71BF853
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 10:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A901460ACD
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 10:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id augl5MXEcAjo for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 10:12:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B541260ACB
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 10:12:21 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id w1so6601589plb.6
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 02:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nIGTRIAv/YdEMytiDCKmtp6XpZKHnAdHfKzdUN29K9o=;
 b=YM/6Jn5sPxIWaCRBAV00MGff+LhLJ1J3oWGAG1Jgz9EreN0Bi6XUgNvsPj19DnZt72
 nsFBLLA7aheBk+6oP8lecgPcq67g8ulyYzMCe5JnfOUV2ZjUxPAOLBvVcwjQJDMcHm3W
 mdBiGNzJ0BJHFQ4r7Ln8KXjxkvO6DIGgwqEpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nIGTRIAv/YdEMytiDCKmtp6XpZKHnAdHfKzdUN29K9o=;
 b=sxogxI69b6PdPY4g8cmaD6gs/r+p2WuFRROM5wzGwKTDGqc495f4biQ0lDpFZtt+Iu
 rFjwry+yff5PshrHUDkVKQehZ5+JoDcAeOaeoyuOVtSICkw6ISk6Bpe5g3FaHi8yEFrP
 N/FajRakwQ8tW9ki3yf/ewcRGbh9F/lyR/3/LKCaO8166gUBoK2XoiEALs2jI+KR7Qwm
 IbcFIU5YjQmoLvFrAfVb/gqu5insx/wXLP37jgupyJu+h1JA1N11cFZwVDykXK9b9IW0
 V3oqdSkS+k5/JdSgtnapzCFOzI2SvBEKgvyuhI/+2NSC2qpvzCGa0101Bb14ItdLqcNy
 3myA==
X-Gm-Message-State: AOAM531t7gF8CWs0hRAS2O4uc2bsiRft9r0CeqSH79WhcbVVPN7zqoQ/
 oxqbJfMrAv11OjW99vEl7ef8VIyqtSL6SvrtHKk7rA==
X-Google-Smtp-Source: ABdhPJxLfUA8Y9u3gx6GNVeyJyYTOQu+2sx5Y9NfiV5O1hIXqFCHltviNRcwSpzUutwIhBQQgaPfralZvR6M82yD1tE=
X-Received: by 2002:a17:90b:1bce:: with SMTP id
 oa14mr3714174pjb.59.1644660741039; 
 Sat, 12 Feb 2022 02:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20220131145555.2819020-1-michael@amarulasolutions.com>
 <eb50a462-7e8e-ce73-7726-874c930a0b7f@collabora.com>
In-Reply-To: <eb50a462-7e8e-ce73-7726-874c930a0b7f@collabora.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 12 Feb 2022 11:12:08 +0100
Message-ID: <CAOf5uwnxfXC5HoJcsgJGzLaO5hGoTvT0aAs61Ct9+=+CFZAn=g@mail.gmail.com>
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Subject: Re: [Buildroot] [PATCH V3] board: Add support for iMX8MN BSH SMM S2
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all

Should I need to resend? anything is missing now?

Michael

On Mon, Jan 31, 2022 at 5:20 PM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
> Hi Michael, all,
>
> On 1/31/22 11:55, Michael Trimarchi wrote:
> > Add initial support for iMX8MN BSH SMM S2 PRO board:
> >
> > - Linux: v5.17-rc1
> > - Uboot 2022-01-rc1 (reference tree)
> > - Default packages from buildroot
> >
> > https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
> >
> > Add Ariel D'Alessandro as co-maintainer, we work together on
> > platform mainline
> >
> > Build and tested using:
> > docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314
> >
> > Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > Cc: Heiko Thiery <heiko.thiery@gmail.com>
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>
> Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
