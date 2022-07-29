Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8C6C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 08:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E95F6105D;
	Fri, 29 Jul 2022 08:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E95F6105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1cPOt55rYsbE; Fri, 29 Jul 2022 08:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7496061032;
	Fri, 29 Jul 2022 08:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7496061032
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1BE21BF31B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C9DA82D7C
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9DA82D7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-aberJt9_2C for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 08:00:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B82082D07
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B82082D07
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 08:00:47 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id 125so3786665vsx.7
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 01:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m1LpHbFM/mJ3jzsyu6UOAIqHZBo0s3JJcrgEaimcpL8=;
 b=uGgiO8lKyyZNm8ezpLgpFoP5su6j0OliJg3Fj4kuk0nfH98SsaG5Xc0bfui5k9ptX/
 /BCYe3Wol/AnmMyJtT3+HCCjhctWGjdKOVaIPNWFdwWPLDXe0YTn8+NixVKoegTtHW2V
 hAIB/kxcH0NPit1GQsWeq4L4qO4AfALvmKeX+2TvpKNxiQfJSOv5e6YHciDB0e4h54rA
 m7akvXWmuH+vzKeOZBIoMz9Sz5B8kKpt4MGX7TXorGbHy99f0xw7d2oUM2s2l28nhCSl
 5hwGtMum+TqBX6ottpIHFnvQJhF513M4h0vxlM7eoaNKer1qjcfpmmOfS8OQhUYd+Vvt
 n0mQ==
X-Gm-Message-State: AJIora+C1rSmP5eL6LajFTUCfnF5dZ7tKXFsqto+z1aQPvS4CwEuETxq
 EUdHx+f1Ppp0xOPRpyPJpfv/RN0vkFm0uq8p41i34OEJ
X-Google-Smtp-Source: AGRyM1uG7akozG+LkYD+guv+ygHoidOMH2YD5iq2Lw8hEoyJsBcWcA2uxU9lYan8ifr7zzu0FGGbrQ0dkkjyiC//B8Q=
X-Received: by 2002:a05:6102:a30:b0:358:58ed:3d2 with SMTP id
 16-20020a0561020a3000b0035858ed03d2mr830890vsb.32.1659081646193; Fri, 29 Jul
 2022 01:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220222102211.74573-1-nolange79@gmail.com>
 <f5755138-0cf5-1ace-ed13-7718c5799189@mind.be>
In-Reply-To: <f5755138-0cf5-1ace-ed13-7718c5799189@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 29 Jul 2022 10:00:35 +0200
Message-ID: <CADYdroPyUK6g_LW=8Hq0gbA_c=RpPbYK5y6k4FfXit+s-g64EQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=m1LpHbFM/mJ3jzsyu6UOAIqHZBo0s3JJcrgEaimcpL8=;
 b=UnzQTxYJp9QOZWy700iIAZrvC/tUOfPeqrzR+ILtbPwaHO9utQLg/tJDIC7P57sm2K
 MpGWkQK1S7n4/ghS6jbWU5VzhppfTY3v06tOXsEUZ3n3qeMqjWm/yFhuye8tKjvMgxjM
 9+GL8hi672ANvDeQ3oufQtsxXYmQ2R6l+Rt2Sr1m2261eLbnHd7KB4sfSQiGvbXgr1hw
 tEYVjNfQjn738FXDplCI3Ex8F8I7wh4m0cHLASBCtZvJ5evUfPdXwLEg690pBFlE1hBU
 E9XRQUfibQI1cbuP+I3k/IjfMH059scRCy2xuFcRGEN2u3Dskl/SM7vfA6PQAKeEhwmz
 VLZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UnzQTxYJ
Subject: Re: [Buildroot] Patch series
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

Am Do., 28. Juli 2022 um 21:05 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>
>
> On 22/02/2022 11:22, Norbert Lange wrote:
> > As is was suggested I pulled my patches in a series,
> > this should combine most of my open work.
> >
> > It does *not* contain:
> >
> > -   toolchain: support mismatched merged usr [1]
> >      recent enough
> >
> > -   package/dbus-broker: new package [2]
> >      recent enough
> >
> > -   package/openssh: improve integration for systemd [3]
> >      outdated, no time to fix it
> >
> >
> > Patch 1 and 2 set the runstatedir for CMake and Autotools (new patches)
> >
> > Patch 3 and 4 are rebased and adopted to feedback.
> >
> > Patch 5 contains a better commit message
> >
> > Patch 6 and 7 are new
> >
> >
> > [PATCH v3 1/7] package/pkg-cmake.mk: use /run as runtime path
> > [PATCH v3 2/7] pkg-autotools: optimistically set runstatedir
> > [PATCH v3 3/7] package/systemd: use current tool for generating HWDB
> > [PATCH v3 4/7] package/systemd: remove hwdb-update service
> > [PATCH v3 5/7] Makefile: remove /usr/lib/rpm directory on target
> > [PATCH v3 6/7] package/zsh: Enable dynamic modules
> > [PATCH v3 7/7] package/zsh: enable static regex module
>
>   Series applied to master, thanks.
>
>   I updated the commit messages in almost all of them. They were already pretty
> good, but writing it down myself helps in understanding everything.
>
>   I have a few more comments in individual patches.
>
>   Regards,
>   Arnout
>
>
> >
> > [1] - https://lists.buildroot.org/pipermail/buildroot/2022-February/637079.html
> > [2] - https://patchwork.ozlabs.org/project/buildroot/patch/20220109221650.777610-1-nolange79@gmail.com/
> > [3] - https://patchwork.ozlabs.org/project/buildroot/patch/20200611091407.12688-2-nolange79@gmail.com/
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot

Thanks, closer to the day i can just use upstream BR ;)

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
