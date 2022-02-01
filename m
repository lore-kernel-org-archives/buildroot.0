Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFD1C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 10:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 388D382EA1;
	Tue,  1 Feb 2022 10:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDwUWh6pFwsI; Tue,  1 Feb 2022 10:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CC9482881;
	Tue,  1 Feb 2022 10:46:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB8831BF5DF
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 10:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B763160F7B
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 10:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9R2iAv63J_7U for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 10:46:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFB7F60AAD
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 10:46:18 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u14so32865050lfo.11
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 02:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QzRFUaAKHyJ1xRFrdYbbMaTWMCn9N8o/Cl3kQiOgjhw=;
 b=TufCGB3k4bjfYZDeWje0/EO72P9a7GysPCXny/lvkeQqrHylnvfrt2Sa6KltKNc/+E
 l3pfMUrGUBKj4q6VKbi2X99xpoCXSg22mwddoFMxsSwOPvLNAXZ4YgGn9Xj/Ntk55DOE
 jPB1wNkySzppCVLahXiEeySqp++rWW1m5ToCgF0OQ9XnjSatI/TtEjKmB8tXvzbDpGXB
 POunjnqxReRWjNlLEDWVpHAeRQhb7OFkiDP0f7FEz7+/udNpbPn1E22n9YOgZ82xqc35
 SWGQ7tvPTu2FYTwqYGlUBvDY7LWgKGoOZhoiTGCyAbAx++yC1CrMCXgd4eeAK7Zsvq4R
 UCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QzRFUaAKHyJ1xRFrdYbbMaTWMCn9N8o/Cl3kQiOgjhw=;
 b=NGHManDQOTed+RroOCRIwlOJet8fSq7FAGKRpbFQgEHO4EVnVgJz5XS7V/Qe3GLuCO
 +dWcTpIaBCWS04LmBd5S24+E34hIVTp/kZPpd9n24UdIQMwJ4Y/Sb8CDqPS5NN2LQb2p
 o8nMm89Jmh0DZlQKQyfHlKcZchzTPH5bbtaL8mTNUd3tlOvEvQgZ0LT3qCO9YvnjQ5ha
 VsXho9gSi4AeJWOvlY57jMAeaUU76r8aB2cvS08BRk7HUG8LVz8DI3l4QmnoWY+D80GM
 6d9Gpidwu02vbU5oJO+HBS933WkgLF1rIQzXHw8b7hxfL2HGfN8qT0fLFvFPPqChzw/b
 /SYA==
X-Gm-Message-State: AOAM531J3oiW7gawcTTAktoqUxy+iALKKg2LboCEGXBObJ2xbdyyAolU
 rjgWp2NiGO766f29g8/+lCOAOnbdu/g=
X-Google-Smtp-Source: ABdhPJyMutXHGzKbX1qaFQSEQj0wsfQVOG5B0pw0HY2vt+sNXLoJnVdzXIPFKmu3wBdBnRaLGYpUzA==
X-Received: by 2002:a05:6512:22c6:: with SMTP id
 g6mr18817056lfu.326.1643712376478; 
 Tue, 01 Feb 2022 02:46:16 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id j20sm758896lfg.232.2022.02.01.02.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 02:46:16 -0800 (PST)
Date: Tue, 1 Feb 2022 13:46:15 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <YfkPd6po3cYygwok@curiosity>
References: <20220131194818.2084092-1-geomatsi@gmail.com>
 <CAGm1_ktBCO3mnWL2LBF-zEqG0pf4wBr7KKF_Gsjs5HPg+kx3tA@mail.gmail.com>
 <YfhIzDNP6sIsaG7J@curiosity>
 <CAGm1_ku=iCDJZqDpDPoQAnF7YwtCtKdo3OZbdyb8yJ6Wv5wRXA@mail.gmail.com>
 <Yfj0+/0smquecnm0@curiosity>
 <CAGm1_kse4gtvY0pMo+12RoFMM_u09LwLq6RW42HMv_jfjK4N=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_kse4gtvY0pMo+12RoFMM_u09LwLq6RW42HMv_jfjK4N=w@mail.gmail.com>
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

> Hi Sergey,
> 
> On Tue, Feb 1, 2022 at 9:53 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > Hi Yegor,
> >
> > > On Mon, Jan 31, 2022 at 9:38 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > > >
> > > > Hello Yegor,
> > > >
> > > > > Hi Sergey,
> > > > >
> > > > > On Mon, Jan 31, 2022 at 8:48 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > > > > >
> > > > > > Update wpa_supplicant to the latest release v2.10. Drop all the patches
> > > > > > as they have already been upstreamed. Remove from .mk file all the
> > > > > > WPA_SUPPLICANT_IGNORE_CVES records since those CVEs will not be
> > > > > > reported against the new version.
> > > > > >
> > > > > > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > > >
> > > > ...
> > > >
> > > > > Have you tried to build wpa_supplicant without
> > > > > BR2_PACKAGE_WPA_SUPPLICANT_WPA3 and enabled
> > > > > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING? I've got a linking error.
> > > > > I have also sent a quick and dirty patch to the hostap mailing list
> > > > > [1] but still got no answer.
> > > > >
> > > > > [1] http://lists.infradead.org/pipermail/hostap/2022-January/040181.html
> > > >
> > > > So far I have not observed that problem. I think we can handle it
> > > > independently from the revision update, adding fixup patches if needed.
> > > >
> > > > I tried to reproduce it using the following wpa_supplicant configuration:
> > > >
> > > > BR2_PACKAGE_WPA_SUPPLICANT=y
> > > > BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> > > > BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> > > > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
> > > >
> > > > However build succeeded. Could you please post your wpa_supplicant
> > > > configuration snippet ? Probably the root cause is in openssl and some
> > > > of its features need to be enabled in package/wpa_supplicant/Config.in.
> > >
> > > I have pinned it down:
> > >
> > > BR2_PACKAGE_WPA_SUPPLICANT=y
> > > BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> > > BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> > > BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
> > > BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
> > >
> > > It is BR2_PACKAGE_WPA_SUPPLICANT_EAP option the selects NEED_SHA384.
> >
> > Thanks ! I reproduced the problem using your wpa_supplicant config snippet.
> > Looking into Makefile of wpa_supplicant:
> > - CONFIG_MESH for some reason needs SAE, so it enables CONFIG_SAE
> > - CONFIG_SAE enables only HMAC_SHA256_KDF, which is apparently not enough
> >
> > It turns out that at least HMAC_SHA384_KDF is required for successful build.
> > Here is a minimal patch for wpa_supplicant that fixes build for your snippet:
> >
> > diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> > index cb66defac..c8e53a3c9 100644
> > --- a/wpa_supplicant/Makefile
> > +++ b/wpa_supplicant/Makefile
> > @@ -246,6 +246,7 @@ endif
> >  ifdef CONFIG_MESH
> >  NEED_80211_COMMON=y
> >  NEED_AES_SIV=y
> > +NEED_HMAC_SHA384_KDF=y
> >  CONFIG_SAE=y
> >  CONFIG_AP=y
> >  CFLAGS += -DCONFIG_MESH
> >
> >
> > In fact, it looks like wpa_supplicant build would fail for any configuration
> > when we enable SAE without DPP. However in Buildroot we enable all WPA3
> > support at once which includes OWE/SAE/DPP. Meanwhile DPP enables all
> > the NEED_HMAC_SHA***_KDF options.
> 
> Would you then add this patch to the version bump? I'll keep an eye on
> what happens with the official solution on the hostap mailing list.

I will send it separately on top of version update patches.

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
