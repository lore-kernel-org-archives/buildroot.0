Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CF0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBA7260F96;
	Tue,  1 Feb 2022 18:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_u7YrYVmSsp; Tue,  1 Feb 2022 18:11:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E92D60EE9;
	Tue,  1 Feb 2022 18:11:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0BA01BF5D7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EDB0415D9
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xrHFVFJRRba for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:11:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7E55415A3
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:11:30 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id t14so25271512ljh.8
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 10:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i9dOnSCiYbHV+EStKUEX12SYazON0g6DAY5ZnTcq6g8=;
 b=fntFN9wDIH0ry9PyjzwBqoEG/Kgz3AUtFpdvK73PMxl9p5OxfIwPudpCOn4clZ4I+d
 rIHzPIYTu6u7a4YFpmzy1jm/s4MIfF9xG6pMgyhDLsHThJbhtc7jdhPkccBWkyDLFngA
 THLMoJJ4J8W7OfcfbwtNAUonItCViiMTL0iYLGpFgz8zfufItEb9uyvb9ice4YmZoW4w
 VrnlSHPm9aD0mqy0tVvc20A3YozcuSdA2pbVkW/q46ElxXL4o/s5E5Dt8MM7zNjTxNPI
 6ijoJSZeDYisgJ2Wgkf6YXP8r+AUuSqY/eyKxwWaMAsfVlvbcD2B5QxGMtdgEvDmKiQs
 kbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i9dOnSCiYbHV+EStKUEX12SYazON0g6DAY5ZnTcq6g8=;
 b=B60r57X4gaQAEjNjeYRGhoBB3u8vTGpfb0jQ63x6rJHW8kMy1mVKsD5WZLG6j5PRdB
 cO9kTXb0AWpbcNb/K8QSa0zcoVnit3Zclk5SuT4Ch2tRrL/KZhTusSRqroDuIsf/jYKQ
 /RzntuH9EeVibFDbZS6G50MFCJqoRdJxhCOXKbJtqMSGZbFiOfyQ2mZ2S5I61DJB1AbA
 fOSOEPO0JzFx74dhw1cyQyzJwPPjv+nYPk5/Dl+QqzpnzvdkL0EFON/WUdqjwooc3zeR
 i6LZ+/iZWmYoVIGQkPbvJRgYM9B/1Fan744fnZp1OnfLnA7qkTVucCzoowRG2pRtdQHZ
 gGxA==
X-Gm-Message-State: AOAM5329cIb6nUhBzJ9tbgkzHws6yxr4YpXjrUbcER1h+LnGK530ftSr
 ao4kAWqMJ/sxD+HEq/6nZ3FIeFyOyIs=
X-Google-Smtp-Source: ABdhPJygAHVKirwlguOUQOm2MaX1pN+ctEDXzjUhlVKQvP/wbZzr/M2u+oQ7rQeDDV+F4S+IoPddHA==
X-Received: by 2002:a05:651c:105b:: with SMTP id
 x27mr17035596ljm.7.1643739088547; 
 Tue, 01 Feb 2022 10:11:28 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id b5sm3079049ljk.123.2022.02.01.10.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:11:28 -0800 (PST)
Date: Tue, 1 Feb 2022 21:11:27 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <Yfl3z9eL3D9nmplt@curiosity>
References: <20220131212456.3176156-1-geomatsi@gmail.com>
 <df90dc24-b44e-fcb9-ed82-7b517604f4b0@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df90dc24-b44e-fcb9-ed82-7b517604f4b0@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-zero-plus2: fix
 build after genimage update
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Hi Sergey,
> 
> On 31/01/22 22:24, Sergey Matyukevich wrote:
> > ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type
> > 
> > To fix the first genimage error report, change 'partition-type' entries
> > to the appropriate 'partition-type-uuid'. Then genimage starts to
> > complain about overlaps:
> > 
> > ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
> > ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> > 
> > To fix the second genimage error report, update the size of bootloader
> > file. Do not reserve additional space for GPT partition table since
> > new genimage is able to keep track of it.
> 
> Here we need a:
> Fixes:
> url where you point the failure

You are right. But I don't have a CI report for this. I noticed the problem when
building images locally.

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
