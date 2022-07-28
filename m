Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01F7C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 15:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7844460F74;
	Thu, 28 Jul 2022 15:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7844460F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoOzk02z1pTI; Thu, 28 Jul 2022 15:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9903160F66;
	Thu, 28 Jul 2022 15:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9903160F66
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64B471BF3ED
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 15:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA0260F66
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 15:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EA0260F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kp7-X13oJMdu for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 15:24:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE7660E69
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DE7660E69
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 15:24:33 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z22so2611865edd.6
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 08:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AeIoZOaYW6D/LQEktDyGKiqTNvEDcfc5ITbB5VGJASA=;
 b=lS1pjmxg/WEM4ZScr0h+F+C1ht2KxmAU2SYO8vFcq9uA05Uupc/rNHBYiIrou7JVN7
 P/LDcoq7+2o4jXVT0FE3yuhPCOd3pCDU/O+6J3sb8JiUQ18Ashj4cwJ3isM367WFNKqV
 UFbHftGsdeyxzUlfK4gYFC0lLY8jeTCDWIenTrqPvIuQ3WfTdyUnRXF2e2vpOx2/CDQo
 sN8yOZ6tfR2DRHpDfm1toHJDjW+iCLGKCm0r0zMRoxRqeiMtahWHHdGlRfT8fbOmO1Iw
 88zJKyMtNL/PXaS2Tqu1oHHGf7AB8FUBWe1bielq6I3iRxazagutLKEM+lzYNZGejJCy
 8S0Q==
X-Gm-Message-State: AJIora8ucFPetzXZ/Pedm+wirTaVkGMp6aC3hRzuC08Z6KpK1ZHSGaba
 78g52pCKFOTYlsXelgNV0zBeyYSXwk7Hf4QS
X-Google-Smtp-Source: AGRyM1vB8XHn667Dnh26w0JN4hx6naU1HFfaxo4/H33hrC4pVuPHW86PtIfZP1PFrRrG5pDSd8hN9g==
X-Received: by 2002:a05:6402:5107:b0:43b:e073:d802 with SMTP id
 m7-20020a056402510700b0043be073d802mr25310841edd.409.1659021871133; 
 Thu, 28 Jul 2022 08:24:31 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05640207d300b00435a62d35b5sm851634edy.45.2022.07.28.08.24.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 08:24:30 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id ss3so3712685ejc.11
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 08:24:30 -0700 (PDT)
X-Received: by 2002:a17:906:58c9:b0:72f:4646:1f6f with SMTP id
 e9-20020a17090658c900b0072f46461f6fmr21908028ejs.181.1659021869778; Thu, 28
 Jul 2022 08:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220724234718.676572-1-christian@paral.in>
 <20220726191133.26dba919@windsurf>
In-Reply-To: <20220726191133.26dba919@windsurf>
Date: Thu, 28 Jul 2022 08:24:18 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rq1GonYRs0o=BN_gcJnJwYCVosjY9FEeZs-3os97Kt8w@mail.gmail.com>
Message-ID: <CA+h8R2rq1GonYRs0o=BN_gcJnJwYCVosjY9FEeZs-3os97Kt8w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AeIoZOaYW6D/LQEktDyGKiqTNvEDcfc5ITbB5VGJASA=;
 b=B/LSrAmzAAHooUUla3N7f+8yu54LScCGB6Y9cXEhS2UCrQDonV6jS6/WcEMLNUcr6U
 Hdx0i2v9YIHemdPe91Be/VHCBdSJDinmM0MKlNxBDVJqfQ09b5HATGxYj723Z5iXmNdZ
 46CfsCdvSJJPAqzxTjP5EREvcy6tYRb0euLKUNT44Bp4KkLoNmsFbEUYNFqAI/pn2TMa
 typIYvUXxftz9r7ZyqO9ZUExOIQhKI/xCpIAEHVUSKflNEPvZkw0pA42ONvRo1t0pUt6
 6urOBYxHfAVixow14RmDh9+fkko3IETKr9JSzdIO7f0386NdDKywjqVpJqsCeKWFJ6YL
 k+QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=B/LSrAmz
Subject: Re: [Buildroot] [RFC PATCH v1 1/1] package/android-tools: update to
 version 5.1.1.r38
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

On Tue, Jul 26, 2022 at 10:11 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Christian!
>
> On Sun, 24 Jul 2022 16:47:18 -0700
> Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>
> > Update to latest 5.1.1.r38 from 4.2.2.
> >
> > Dropped old patches and added several compat patches.
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
>
> Really great to see this updated!

ACK on your comments.

However, I think even this updated version is still extremely old.

It doesn't have all of the arguments like --page-size or even --version

The Gentoo package reports version 31.0.3-android-tools

That's way way way more recent than 5.x, right?

I'm a bit confused on these version schemes.

https://github.com/nmeum/android-tools

This package has a Cmake version of building it which seems much
cleaner, and also brings in all the other tools like simg.

To be able to build it, it requires using the Git submodules method:

ANDROID_TOOLS_VERSION = 31.0.3p1
ANDROID_TOOLS_SITE = https://github.com/nmeum/android-tools
ANDROID_TOOLS_SITE_METHOD = git
ANDROID_TOOLS_LICENSE = Apache-2.0
ANDROID_TOOLS_GIT_SUBMODULES = YES

And carries its own patches for adb, etc.

Would it be desirable to switch to this version instead? I certainly
would prefer it for my purposes.

Thanks & best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
