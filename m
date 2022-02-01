Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B6EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 10:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA53560F7B;
	Tue,  1 Feb 2022 10:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6crmjaetqtES; Tue,  1 Feb 2022 10:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EFFB60F7C;
	Tue,  1 Feb 2022 10:26:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF69D1BF5DF
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 10:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98DC8415B7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 10:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfsKrbbxYJW0 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 10:26:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5724A415B6
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 10:26:03 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r10so33425854edt.1
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 02:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEuvXuRz+HCVQQcrI5k/d06WeQzTspvcuraQDhnDVo8=;
 b=boKCJDy6vdoIv9Zlf7wnD8cR3D3BMVzfWyC3GkmJ8YWFJkB9HG2Cco7AEHO5mvMS7K
 lL2ZFRTUseN9HaxtAXmx59ERWP+aNoeSFxawVi2bYGn1lGVRvaE6VS/TUpcaq/58eFmY
 n8IcN9tlydE/EKr7A9COCZ9j+e2Vm1o0/Bc75CGbRhGi4Sz0jMoOEBrEIA8l0OivXShF
 sbGRkZxs0ouT+eOsa3gGqQrToLmXMmBXgOaSGxFKOMynjC7acRaeesEwXIPGeqVvoA3X
 XtgFy4LV0Ea6lyfHg3uMC+QSkxfmJWGrYJLvDOciAqsLYK8ZxL+jKJi+0Xzl6ta/SkJ4
 I+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEuvXuRz+HCVQQcrI5k/d06WeQzTspvcuraQDhnDVo8=;
 b=eqLtDbwH8Lr2KNmRUr6H4xFuXeSY2m6G5jLm/yt3YWj4veZSuVoHsphMCNaDZWwHPR
 0pXu/SL6ksZl8x2ar9aZ3ZLZaN1q7eLeyEUvm4Rv4ZbrxnIWgEdpPUe29N2DVVk3eJcl
 UPkoL+8WnSYTFnslU3rRO4KFmD9mONIg9oHYk+GOKJ4H2YgWDv31wQ3PH6z8EkfF9Y0h
 IxLGujWYyuAgOaw5ZE80/MVAtKSfg6xUyNXSIvLqn9chQNVWOWIJFWNAkJMWUkZoW35g
 vSwgn7R+tSNOi3y7kX+bVXzAigLW48TkqEPKR4+xDqClnvw17/Ehp39jRV9qBaUVWJed
 tVVA==
X-Gm-Message-State: AOAM53262k66W9JKJQKaud9YwI0n95w4YILwds+XuW1wD7WZKV8Z9QnK
 IPh1wz2DJsG2hou1qHXKaDqEgjeEz6kBUgx91bFJGqtX
X-Google-Smtp-Source: ABdhPJwK1BqohEVye4GZyAtEd/uBw/gKUbwZV6Cm5/2gATPJjp/bcL1kq3rrFpUTdoGJ3mwjjTGEd4PVB4stO6kNpc0=
X-Received: by 2002:aa7:de05:: with SMTP id h5mr24270646edv.356.1643711161256; 
 Tue, 01 Feb 2022 02:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20220131194818.2084092-1-geomatsi@gmail.com>
 <CAGm1_ktBCO3mnWL2LBF-zEqG0pf4wBr7KKF_Gsjs5HPg+kx3tA@mail.gmail.com>
 <YfhIzDNP6sIsaG7J@curiosity>
 <CAGm1_ku=iCDJZqDpDPoQAnF7YwtCtKdo3OZbdyb8yJ6Wv5wRXA@mail.gmail.com>
 <Yfj0+/0smquecnm0@curiosity>
In-Reply-To: <Yfj0+/0smquecnm0@curiosity>
Date: Tue, 1 Feb 2022 11:25:50 +0100
Message-ID: <CAGm1_kse4gtvY0pMo+12RoFMM_u09LwLq6RW42HMv_jfjK4N=w@mail.gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/wpa_supplicant: bump version to
 2.10
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On Tue, Feb 1, 2022 at 9:53 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hi Yegor,
>
> > On Mon, Jan 31, 2022 at 9:38 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > >
> > > Hello Yegor,
> > >
> > > > Hi Sergey,
> > > >
> > > > On Mon, Jan 31, 2022 at 8:48 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > > > >
> > > > > Update wpa_supplicant to the latest release v2.10. Drop all the patches
> > > > > as they have already been upstreamed. Remove from .mk file all the
> > > > > WPA_SUPPLICANT_IGNORE_CVES records since those CVEs will not be
> > > > > reported against the new version.
> > > > >
> > > > > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > >
> > > ...
> > >
> > > > Have you tried to build wpa_supplicant without
> > > > BR2_PACKAGE_WPA_SUPPLICANT_WPA3 and enabled
> > > > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING? I've got a linking error.
> > > > I have also sent a quick and dirty patch to the hostap mailing list
> > > > [1] but still got no answer.
> > > >
> > > > [1] http://lists.infradead.org/pipermail/hostap/2022-January/040181.html
> > >
> > > So far I have not observed that problem. I think we can handle it
> > > independently from the revision update, adding fixup patches if needed.
> > >
> > > I tried to reproduce it using the following wpa_supplicant configuration:
> > >
> > > BR2_PACKAGE_WPA_SUPPLICANT=y
> > > BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> > > BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> > > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
> > >
> > > However build succeeded. Could you please post your wpa_supplicant
> > > configuration snippet ? Probably the root cause is in openssl and some
> > > of its features need to be enabled in package/wpa_supplicant/Config.in.
> >
> > I have pinned it down:
> >
> > BR2_PACKAGE_WPA_SUPPLICANT=y
> > BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> > BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
> > BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
> >
> > It is BR2_PACKAGE_WPA_SUPPLICANT_EAP option the selects NEED_SHA384.
>
> Thanks ! I reproduced the problem using your wpa_supplicant config snippet.
> Looking into Makefile of wpa_supplicant:
> - CONFIG_MESH for some reason needs SAE, so it enables CONFIG_SAE
> - CONFIG_SAE enables only HMAC_SHA256_KDF, which is apparently not enough
>
> It turns out that at least HMAC_SHA384_KDF is required for successful build.
> Here is a minimal patch for wpa_supplicant that fixes build for your snippet:
>
> diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> index cb66defac..c8e53a3c9 100644
> --- a/wpa_supplicant/Makefile
> +++ b/wpa_supplicant/Makefile
> @@ -246,6 +246,7 @@ endif
>  ifdef CONFIG_MESH
>  NEED_80211_COMMON=y
>  NEED_AES_SIV=y
> +NEED_HMAC_SHA384_KDF=y
>  CONFIG_SAE=y
>  CONFIG_AP=y
>  CFLAGS += -DCONFIG_MESH
>
>
> In fact, it looks like wpa_supplicant build would fail for any configuration
> when we enable SAE without DPP. However in Buildroot we enable all WPA3
> support at once which includes OWE/SAE/DPP. Meanwhile DPP enables all
> the NEED_HMAC_SHA***_KDF options.

Would you then add this patch to the version bump? I'll keep an eye on
what happens with the official solution on the hostap mailing list.

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
