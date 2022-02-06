Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23538C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 22:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1A6402BD;
	Sun,  6 Feb 2022 22:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpj6ndOjjcLw; Sun,  6 Feb 2022 22:02:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97517402B7;
	Sun,  6 Feb 2022 22:02:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 130AD1BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 22:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F249814BA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 22:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rja3uyo2B3ap for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 22:02:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2223C81451
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 22:02:02 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 q145-20020a4a3397000000b002e85c7234b1so11683450ooq.8
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 14:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o1eubGLCfmagThqDNPdlBRec7RZNov+Xip2RL4TXnlU=;
 b=WzBzJr+lj2DXmzHJgHYxyUF2qflCWks8cbs8dc8iyoLFq+AfrHXOfyTRDYigi4936C
 Zn0pSOCFXdlCKePUdj6ZPPbAyI+/RduQEE2H1i+oEXSuK8ki4o4MUkm5k/POxHfZFnyJ
 Lp8Ylic5RVPbZ1d0DRwdICh4RpYt8l2M8ocT7AmhZxuzcpfT095FagwRp6lYl0ttQTSs
 rdnibMNOsHa4DY4516SP5/YTy5MeASlj9BaXJHMKUtMR6gLki4xDSLCDqnYnL3xIyrvG
 HZIDcE6xg7112ovuQ87EfkBwUMYbxLLaLEeNL8Qpq0rayAepZLCIha2BpP2jvrwwubsO
 rRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o1eubGLCfmagThqDNPdlBRec7RZNov+Xip2RL4TXnlU=;
 b=d+g2Gq3tkY+7WuRA5NwxIdgbLVLKsNXhNVD+zPEWX2nIwO7bsm7DJRrBXvk7mw8L89
 LKWXiCS78MwvE04a6u8uSUVoch+tc/W1g22LuFgyrsgDHNGYr0oHMsYh1hVQ2y8GHd9L
 zoNipJeEJMdKxgEn6tgBhrLRs2Q2jG+bHleY2RJBXWyLLxP1WwNeZJGa+jG9wanjSsxj
 3dsTlXaLSfB23zzXv0lcIGhHTHLKTz2DxSrds133aq7J1QrhAIsi6Ea+L0lcpnZPcR3+
 HSZ21RGRrsu6TThTfFmiwASHAT2oTWKAJMLwD5mvpkzp6rHx/NxjOXNziSuoosnOGE2l
 D3AQ==
X-Gm-Message-State: AOAM533szBB3qIM6l52/4JTlGxKiFq6J7mHZc9ZgQvIIonFuKUocsXBa
 2sCO0kYviVOXh9N2VOTX5yjBMFc0/bmRmj0MXWk=
X-Google-Smtp-Source: ABdhPJy5/FZ8piqJ40ov2tQ0ZFrx28+HCVihKMnEcn+HkLRJZfkR55jp0pRFkkv13IWiWtjqWSoYtcVfV1YATWMgMGo=
X-Received: by 2002:a05:6870:9483:: with SMTP id
 w3mr2609762oal.124.1644184921068; 
 Sun, 06 Feb 2022 14:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20220131225622.90226-1-james.hilliard1@gmail.com>
 <fe89e71a-ad55-44ab-20ba-d2b46b15a271@mind.be>
In-Reply-To: <fe89e71a-ad55-44ab-20ba-d2b46b15a271@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 6 Feb 2022 15:01:49 -0700
Message-ID: <CADvTj4o5pPMCw8xtT-7A_xDwASCS3YXJLy1vM1nJUC9d_kFNkw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v7 1/1] package/qt5: bump packages to latest
 kde submodule versions
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Feb 3, 2022 at 12:35 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 31/01/2022 23:56, James Hilliard wrote:
> > This points all qt5 packages to the latest kde submodule versions
> > available at https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
>
>   It took me some reading of the patch and of the upstream repositories to
> understand that there are actually no release tarballs or tags, and the the
> 5.15.8 is something we just pull out of our hat to be compatible with
> qt5webengine. So I updated the commit message to (hopefully) better explain that.
>
> >
> > We need to remove some patches applied upstream already.
> >
> > We need to rework qt5location to pull in the mapboxgl dependency from
> > a separate package as that dependency is only included in release
> > archives.
>
>   Instead of creating a separate package for it (which BTW you forgot to add to
> DEVELOPERS), I changed this to use the git download method and _GIT_SUBMODULES =
> YES. I checked that it extracts to exactly the same thing.

Looks like the package selection for qt5location-mapboxgl wasn't removed:
https://patchwork.ozlabs.org/project/buildroot/patch/20220206215734.3853337-1-james.hilliard1@gmail.com/

>
> >
> > We need to pin qt5 packages not available in the new upstream to the
> > previous 5.15.2 version.
> >
> > We need to set SYNC_QT_HEADERS for all qt5 packages in the new
> > upstream as headers are only copied in release archives which are
> > not provided in the kde upstream.
> >
> > Set the MODULE_VERSION to 5.15.8 to match latest qt5webengine which
> > should be the closest release to the kde patches which don't have
> > proper version tags.
> >
> > Create a .git file so to trigger headers sync during configure.
>
>   I don't really understand why this was needed rather than calling syncqt
> explicitly, but OK.
>
>   Applied to master, thanks.
>
>   Regards,
>   Arnout
>
> >
> > Hold back updating qt5webengine for now since the latest version
> > requires significant changes to build, just tweak existing version
> > to be compatible with latest kde versions for now.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> [snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
