Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F05C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 23:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E939415C1;
	Fri, 10 Feb 2023 23:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E939415C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17dhceQgRg3h; Fri, 10 Feb 2023 23:28:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53366415B9;
	Fri, 10 Feb 2023 23:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53366415B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3A91BF473
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2686F61055
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2686F61055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEkLuxYUI8xz for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 23:28:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D2560595
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13D2560595
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 23:28:54 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id 3so3107293vkl.4
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 15:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4DhizIRpLqNMU2Fqmta8vue2MRvH5qPY9n+tXmS6Cwk=;
 b=j3j6zTeFOovg1GjgSC7p3OFvlNxEP31h2PG6uVrUQaTol8B7dtXQmyS1LO1VAqo/hc
 ua5zdoFDkAJDuLFVTueV1xgzADEgtt/4g8DyMbw/fsfh6xKsZUvxK6iYKiYJjBIRZQrz
 P7pzV1bcmzI+rZTCFDcIADTXKHA6TCHw/5RyDj3vn0qFVwbDo8s9dYI/+SIRuAmjzDDx
 mcQAwxiuX4zfWVVmVhI8qqBOlHqHe9Vj7/QvGG6QCgk8Ac29Z2qtfeJGvHYZ61DOJaaa
 LO9tV0vb599ykCAPVXduYK4Sk+AkhvCHg+2P8ZGurJ96gs3VLY9TzuPi7C89KjncKauK
 oxsw==
X-Gm-Message-State: AO0yUKUQCVm+/CDwzvWxIrREtl+Ix+bXbi8hsS+JQWaNSiibqjVrBJd1
 uuQTD835p8ek5EFp8uKG+xVg6h7ViqIIJGnhmCw=
X-Google-Smtp-Source: AK7set8ASjDg37C2/MzdFXwpXUbOmIuHC3cuMsBxi9v2IY2pg40Q1J8PCPJBHvBha8txW4D4SPaXQrDJghGNOqsy4ak=
X-Received: by 2002:a1f:988a:0:b0:400:f7b8:75c with SMTP id
 a132-20020a1f988a000000b00400f7b8075cmr2281297vke.34.1676071732717; Fri, 10
 Feb 2023 15:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20230210180222.88328-1-nodeax@gmail.com>
 <20230210231315.17b367e6@windsurf>
In-Reply-To: <20230210231315.17b367e6@windsurf>
From: Akshay Bhat <nodeax@gmail.com>
Date: Fri, 10 Feb 2023 15:28:16 -0800
Message-ID: <CANiP4c84o19-z58-m_J3-T04jbu_rfWUFdoDChWKP+ye6TNFkw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4DhizIRpLqNMU2Fqmta8vue2MRvH5qPY9n+tXmS6Cwk=;
 b=SXY10yuaKcZgQlQwMHmXWKvcXlj9wWVptkMhzphb4mBB7Job4iF4PVPGVJ4M5U2DD1
 QoxRnrhwFvYVaijr6Jp5rJBhspIFdkvrafYU/+UcTNclh2IWC000+Maqe1ewFCiRvxkm
 GJtQsOb17pdDsra96wd2sPlgjEO2zAQM6QVZQta0JeXCs9+buBUxz8LCUr1/L8LG1c0d
 NhRU5IDoiJMucukBcL2Rry6GhUA13a0B+zFE/kd4J92CMYdCt6DpuCtGHneR1lRmGVlM
 C1Bg1EnLLOdEwGi6CYExj2zzIW/zAth+DnoTEHOQdgjeh7gKkdP43f7/p/HexmGjid8e
 yaIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SXY10yua
Subject: Re: [Buildroot] [PATCH 1/1] package/libiberty: bump version to 2.38
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Fri, Feb 10, 2023 at 2:13 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Thanks a lot for the fix. Is this fixing
> http://autobuild.buildroot.net/results/eaf/eaf23ea0c8d7803e3768da40b7070d04801cd36f/build-end.log
> perhaps?

Yes, that is the issue being fixed!

In my case, I enabled the partial initramfs feature. This resulted in
the below dependencies:
host-dracut -> host-prelink-cross -> host-libiberty

If host-libiberty gets built before host-binutils and the versions are
different (i.e. functions don't match up) then it results in the above
error.

>
> One issue that I see is that the binutils version is configurable: we
> support 2.37, 2.38, 2.39 and the special ARC version. Do we need to
> make the libiberty version match with that?
>

FWIW, the 2.38 version of libiberty does not result in build errors
with either 2.37 or 2.39 version of binutils. Happened to get lucky
because the libiberty related function defs are largely same-ish
between those versions. Obviously this can break with the next version
of binutils, so a long term fix is needed.

Not sure about the special ARC version, I did not test that case.

> Also, see the conversation starting at:
>
>   https://lore.kernel.org/buildroot/3f3d266c-2f21-197c-29b7-fff3e230e97a@smile.fr/
>

Thanks, hadn't seen that post before sending the patch and it looks
like this package has had some history! I agree, whatever decision
comes from that discussion should be the long term fix.

Thanks,
Akshay
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
