Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A1DC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CADA60EE0;
	Tue,  8 Feb 2022 21:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtgYTwJjuBGO; Tue,  8 Feb 2022 21:39:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B815A60AEC;
	Tue,  8 Feb 2022 21:39:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A82A1BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 584FB8123F
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2Jp38F8Glep for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:39:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9232681002
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:39:16 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id c188so776930iof.6
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 13:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oXLP1B8OziePvnPxgaChYeouEWfW0uGaFNih0T8wF/0=;
 b=Oj3FEyEqg+1J8RMxY6bxp/Y2u3a5sMQcASP+2oVyjgOyhecBKAHTxCDC6ViD23VY4r
 llQ+7jyxYYmcj1ujjxp/4K45GSYq5OVc3UFcZBlVHHCSH8Kv6RO50bKi+iTk68YN0E9s
 Ff4m1ZWKIdNLfOuxUYv6CWHyqfSjxRCALwTo+wuhydem9KQC8TVXa6HYn1AWjVD/E5OX
 abZvN5P+mAZb6g/joYc1qpCI8mge6Z4iLHgFlV6wK8mDsj44+qbv0Cv3g/stoTp10I9A
 PAFnBm57caPfqYOnwWgN9NIIOx8NdmiYZh/QaVC3J/cAULZsZS6nhxOiUoYZJne38jsd
 2gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oXLP1B8OziePvnPxgaChYeouEWfW0uGaFNih0T8wF/0=;
 b=FyGM/vgDDfXKuXNfAOr4ukXOSAxi+XFKZTT7b39OGIFUTU75R4Goe9yjvGMfDkAKFr
 wrWxNEn8M9wEXIRPsb6XAtff10dlwDR5bRibzpwI6O4rUffTAVKGk6RG5Vjxq6tjRI2B
 fyFg74LiD01mu0xT75iBlEOcuj/9W+qCCCvCPVWM1ZAiBudTfiv/WNxvEiOZ1b+RLGH2
 SePzAl97EGDjHeSU7akZC+fLBRmOKTbaimdHC+ENamL9zEKxPFEXd7wPpsjthpCagfpA
 go8VOgl/NfJqCYj/ErDhqdRy4OxYuHjS0ATnjqP9VqYAobZ/7a26it0eXu9Z4Pqv1QVe
 PqqA==
X-Gm-Message-State: AOAM5321hpc4eyd+MX8he4rFioNjxh05Ps6aDvOfL2uwKocL2eFrV38N
 cOOxygNIx8lZv4vrx0YNqMAPHaZh9zh7g9jpffRnjGM5
X-Google-Smtp-Source: ABdhPJx5aSMW9hd94B1bzLuBFDYK743ifEVs1a7WhNSByuSQkjankQ4AQ1YNVIkZsbpNaQpB6h1X0YskTjaHEZ69JJs=
X-Received: by 2002:a5e:c20b:: with SMTP id v11mr2973352iop.197.1644356355302; 
 Tue, 08 Feb 2022 13:39:15 -0800 (PST)
MIME-Version: 1.0
References: <d334bc81-6032-348b-2871-e3147b17c442@steinkuehler.net>
In-Reply-To: <d334bc81-6032-348b-2871-e3147b17c442@steinkuehler.net>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 8 Feb 2022 22:39:03 +0100
Message-ID: <CAEyMn7bXjyE-=-F-SxPkVDrxnZeiOtaUwEm+DfswQ=iwdWYvOw@mail.gmail.com>
To: Charles Steinkuehler <charles@steinkuehler.net>
Subject: Re: [Buildroot] Buildroot + RAUC
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Charles,


Am So., 2. Jan. 2022 um 00:53 Uhr schrieb Charles Steinkuehler
<charles@steinkuehler.net>:
>
> Buildroot has included RAUC for some time, but I was unable to find any
> working examples suitable for experimenting or as a foundation for a
> production system.  I have attempted to fill this void and have crafted
> a BR2_EXTERNAL project that layers a basic RAUC setup on top of
> Buildroot targeting the Raspberry Pi cm4io.  As I am new to both
> Buildroot and RAUC, I would appreciate any reviews or critiques of how I
> have managed the customization required for Buildroot, U-Boot, RAUC,
> Linux, and the device tree.
>
> The project files and instructions are on github:
> https://github.com/cdsteinkuehler/br2rauc

For me this is a great work and a good starting point for my first
attempts using rauc.

> All comments welcome, especially the "no you fool, don't do it *THAT*
> way!" variety.  :)

Thanks
-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
