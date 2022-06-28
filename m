Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A54FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 08:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC2482C8E;
	Tue, 28 Jun 2022 08:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC2482C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnmGL8XdE7LO; Tue, 28 Jun 2022 08:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F13F682C3C;
	Tue, 28 Jun 2022 08:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F13F682C3C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A88361BF84C
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 08:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B659408ED
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 08:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B659408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWjvWlhUInQ4 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 08:42:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 141B3408EB
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 141B3408EB
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 08:42:18 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a2so21035499lfg.5
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 01:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l/NSXmKfyZ8q5/xXUbx807JeAzDUOGSRPUj5EykHho0=;
 b=oZCxvI3Y6OIsK33liHg+Yhj7R7bs+M1t4C881+Bi2bn4D2FQaORI/EURfGWp11d77D
 ngWng5c4ieAdbhrJhdC01FqJXWGl3ws1ZrM0KM/w1gv2rILgOYibMM80N6OiS3pff9xC
 0JxlyMzcCkY9aT8roR/EQ3iCmsWfgy/tBfCVQCeHuYecfBYVNt6fegL413SzUZqxRTsl
 fJbuY9jUancsijGpuOx8uvUJoZkfRUNx9KOKuZykvvxGzSnTUkAmqf+iUhz39n0fTcYe
 /DKltLsJfqWKF7/E1j//NP73DbRUB/IRfKsDp8yJ7goS3vJM8O5WwMLjnBU+Vi7Bl2MV
 cAqg==
X-Gm-Message-State: AJIora84ozQQ2WWp2ErslBiz6k23keiqkylXhHVXmlPv+l79RXlnah8t
 e3Yb8hAuYbH/idAinPMKjstbt9nOiSnihakrBqY=
X-Google-Smtp-Source: AGRyM1taBsXW+huy4K6qgCl/8eFaAU0XV8ioKGT9meW1tYeUAsZUr1JQ9aOpPlmrM33o71DYeqjmrXQsOAe6w0MciPU=
X-Received: by 2002:a05:6512:3b08:b0:481:1b90:bf55 with SMTP id
 f8-20020a0565123b0800b004811b90bf55mr5452924lfv.153.1656405736746; Tue, 28
 Jun 2022 01:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.2285.1655818273.17960.buildroot@buildroot.org>
 <f68f04d611f75d87d9fae2a0a04a3896@umbiko.net>
 <CA+_SqVbnBaZL6=DorHZTt-zjtGFHVXPz4kQjovQoJhFRjfW27A@mail.gmail.com>
 <0357b4f8-97da-6c44-134f-4b5b58b9259a@green-communications.fr>
In-Reply-To: <0357b4f8-97da-6c44-134f-4b5b58b9259a@green-communications.fr>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 28 Jun 2022 10:41:39 +0200
Message-ID: <CA+TH9VmW6_Ri0wm2xK=y1yx5f2HtsNMzY2NzrDDugfW0mOj6FA@mail.gmail.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=l/NSXmKfyZ8q5/xXUbx807JeAzDUOGSRPUj5EykHho0=;
 b=Tnd5sT+Wo2wCUEGYRw9mJRpO7grI7hNMdHMWG6Toik30kuh5YB/Wc/9A5g07+lEFSY
 4+4AeH2TK8Cof3HQPPOPJ06/Jm0Fe4IDxsWPF91YnFLL8OUJBA0x+J6Be/XX1kDRR0Rd
 8QWdjUAGis4vb2EiNRzmDkBh9iOHln1WEp7GY63YzPc5Bptrq2mH6Zilz5ZP5eSshkVn
 oj+KfSExEXcAMqi3PV9Xfudun71boN9EmSMJl+6TNWKN7n7y8H5Njw5TeG64lzt13feR
 1FAIg1qK28Q7MYdRKjTl5GBR16iYlt/lXdYZ2ywOh9QwqegSzJk1O/AM/x8tp2RbMct3
 UvyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Tnd5sT+W
Subject: Re: [Buildroot] [PATCH 4/4] package/busybox: add service to load
 kernel modules at boot
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
Cc: Andreas Ziegler <br015@umbiko.net>, Buildroot <buildroot@buildroot.org>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Il giorno mar 28 giu 2022 alle ore 10:23 Nicolas Cavallari
<nicolas.cavallari@green-communications.fr> ha scritto:
>
> On 28/06/2022 09:56, Angelo Compagnucci wrote:
> >      >> > diff --git a/package/busybox/S02modules
> >     b/package/busybox/S02modules
> >
> >     S02 is a bit early, [mu]dev use S10.
> >
> >
> > Can you point me to these  [mu]dev scripts?
>
> package/eudev/S10udev and package/busybox/S10mdev

Thanks! So basically the idea is to move this service after the
[mu]dev ones, S11modules should be ok, will do.

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
