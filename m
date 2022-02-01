Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC5C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 08:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 241AE82C1E;
	Tue,  1 Feb 2022 08:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id az5o50gPS6ii; Tue,  1 Feb 2022 08:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B0D882B24;
	Tue,  1 Feb 2022 08:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50E7D1BF4D5
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 08:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46EF14016D
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 08:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z17L99CgdFAL for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 08:53:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43B6D40156
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 08:53:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p27so32378716lfa.1
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 00:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JUjGUj2mCOn71607u9Y0D73GoaVjBJX1aiH4S0r5e24=;
 b=BzAuHZFsRV7ppAhfmQK5iLneqXa0QUDAlxTsvlVeCfa6szk0aeHrL+L1axcyI7LhvK
 M74jg1VtB+0gxLUgkR2iCJMrKo/8oF1VIy+vFxVAWOyRfnJFqkOT9SRVThPgIxsro1dz
 zc/D1zl7W+jN5cdTqUuoaAT5cjoIWYHkepg7EzwmoancM586tvnFqCFt+rbtnBw13taj
 p4CnveAsUSZzvzmS+eWxdVMhoFOdfesjAnJmZIMGGbes03vj4+vN/VrB619Ap3gVFt4w
 nWNGB/lemLuItZbkxXUlE+RVEm1FsjRlQ9ZpgHrzdAfXUmsLyQciMetC42lmqlRVTPou
 DJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JUjGUj2mCOn71607u9Y0D73GoaVjBJX1aiH4S0r5e24=;
 b=ognpYwKZonZ6q6MDeoexsPvYUnG6/OngJYepZ0I/nBdRCO93Pu6NSP3TcY+ZCNN1pF
 /Loh9Wo4uq9ciimcNHSERH4wd1Ok1Zh/RGnDGmW4MCgziLgpH9Qijm5cWJXINEQXBUQB
 guad4d9ayaHlFclJ0UTobh3yGQd27wQh9nCSglwiP9I111p1lsa8kZ6bNhMlc3cYWXpl
 MeXmaD6OWpM5MvB7mvMT2QRR6vzm7JoU+85UzduKQ/DdlPeh3FUqZS9MFVSTT8G7vDjN
 ce/ywA7GiV+XTXMl3LqmotxiDV/P88cKHOEocNu6htfGhFMhBrXSVQATynrWwYAqbzc0
 rAPg==
X-Gm-Message-State: AOAM533Xungp6bubjTZmSew1GZ8K7aUmhUecMwd/TvO2BiQu3cRi2+ea
 v+TIhex4rtpjkJ+h3pFXsFY=
X-Google-Smtp-Source: ABdhPJyNPKVcYAHVtVXcbTgYLfALOrrQCp2BXwgJ/7+6kuTB7xGPsTmM5a1a7mWQr/AdioVEk1vGvw==
X-Received: by 2002:ac2:54b7:: with SMTP id w23mr18068550lfk.6.1643705596019; 
 Tue, 01 Feb 2022 00:53:16 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id d13sm2122218lfn.137.2022.02.01.00.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:53:15 -0800 (PST)
Date: Tue, 1 Feb 2022 11:53:15 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <Yfj0+/0smquecnm0@curiosity>
References: <20220131194818.2084092-1-geomatsi@gmail.com>
 <CAGm1_ktBCO3mnWL2LBF-zEqG0pf4wBr7KKF_Gsjs5HPg+kx3tA@mail.gmail.com>
 <YfhIzDNP6sIsaG7J@curiosity>
 <CAGm1_ku=iCDJZqDpDPoQAnF7YwtCtKdo3OZbdyb8yJ6Wv5wRXA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_ku=iCDJZqDpDPoQAnF7YwtCtKdo3OZbdyb8yJ6Wv5wRXA@mail.gmail.com>
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yegor,

> On Mon, Jan 31, 2022 at 9:38 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > Hello Yegor,
> >
> > > Hi Sergey,
> > >
> > > On Mon, Jan 31, 2022 at 8:48 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > > >
> > > > Update wpa_supplicant to the latest release v2.10. Drop all the patches
> > > > as they have already been upstreamed. Remove from .mk file all the
> > > > WPA_SUPPLICANT_IGNORE_CVES records since those CVEs will not be
> > > > reported against the new version.
> > > >
> > > > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> >
> > ...
> >
> > > Have you tried to build wpa_supplicant without
> > > BR2_PACKAGE_WPA_SUPPLICANT_WPA3 and enabled
> > > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING? I've got a linking error.
> > > I have also sent a quick and dirty patch to the hostap mailing list
> > > [1] but still got no answer.
> > >
> > > [1] http://lists.infradead.org/pipermail/hostap/2022-January/040181.html
> >
> > So far I have not observed that problem. I think we can handle it
> > independently from the revision update, adding fixup patches if needed.
> >
> > I tried to reproduce it using the following wpa_supplicant configuration:
> >
> > BR2_PACKAGE_WPA_SUPPLICANT=y
> > BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> > BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
> >
> > However build succeeded. Could you please post your wpa_supplicant
> > configuration snippet ? Probably the root cause is in openssl and some
> > of its features need to be enabled in package/wpa_supplicant/Config.in.
> 
> I have pinned it down:
> 
> BR2_PACKAGE_WPA_SUPPLICANT=y
> BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
> BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
> 
> It is BR2_PACKAGE_WPA_SUPPLICANT_EAP option the selects NEED_SHA384.

Thanks ! I reproduced the problem using your wpa_supplicant config snippet.
Looking into Makefile of wpa_supplicant:
- CONFIG_MESH for some reason needs SAE, so it enables CONFIG_SAE
- CONFIG_SAE enables only HMAC_SHA256_KDF, which is apparently not enough

It turns out that at least HMAC_SHA384_KDF is required for successful build.
Here is a minimal patch for wpa_supplicant that fixes build for your snippet:

diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
index cb66defac..c8e53a3c9 100644
--- a/wpa_supplicant/Makefile
+++ b/wpa_supplicant/Makefile
@@ -246,6 +246,7 @@ endif
 ifdef CONFIG_MESH
 NEED_80211_COMMON=y
 NEED_AES_SIV=y
+NEED_HMAC_SHA384_KDF=y
 CONFIG_SAE=y
 CONFIG_AP=y
 CFLAGS += -DCONFIG_MESH


In fact, it looks like wpa_supplicant build would fail for any configuration
when we enable SAE without DPP. However in Buildroot we enable all WPA3
support at once which includes OWE/SAE/DPP. Meanwhile DPP enables all
the NEED_HMAC_SHA***_KDF options.

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
