Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4406C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6294D404BD;
	Thu,  6 Jan 2022 22:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPScA9oBVmbu; Thu,  6 Jan 2022 22:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 674E040131;
	Thu,  6 Jan 2022 22:11:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 880B01BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7704340185
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1UdkXlRWGUc for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:11:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 992B8400E4
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:11:45 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id o1so7045997uap.4
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nvgYem5AWSqfgGrx+scnPZ1HNWc4CAF08ptB+2S7TiY=;
 b=UesEoqj7AtfZelhg6ZZYu6wj46C8vwLQSrqblQkS8XJembClXblZErn5u01yRIE6ns
 z6W0rgQW8aEyqikylNXlqWVnMNkQsO4ArAcu+nUpK+CU2M7gRdcZmab+Ixu1csrgGFcj
 IxBQV7WuTM3/LTMpFCBdDlnpV9sPprxA9vSPFKej03k2TeHVAdeQswmCusQQqShGUzku
 N6qiuAblaoApYDcSD+WDTDc3A3eP2yw/0dMrsQhDTeR0oANT3R8rrxJAq85DdXvSWKO6
 idYyLKAiHfQJGHvqgvO8ALvQOD4qoS8yv1ioK975uREIcKEY8YDlgLwvOHjPmop/obxE
 CmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nvgYem5AWSqfgGrx+scnPZ1HNWc4CAF08ptB+2S7TiY=;
 b=O0A/uq8o95GT4ic6AEayn5vAM5kwCa2wmsQxYZNHLYSKoeruKDUhRZThcveFDDn4w5
 PvsFIu40FsT1oFIsSRr2w+Z2nnNn4sujq3Zwc8vSfRgbXd6exXyMlLmqR1IAOYHjGsxn
 gKudQkVYtizgKeIUTGPCtuoe0oVVBVAtRv0/CoeurlFYd0p/cXZJWjcVJ6LhQQQv2bLn
 aqv6yvyNhsOTsa6jlEoRFzGmTPqYf/OWJ0Qi343zgrtBpCTzitk9D12Q4ju9SzVll1/o
 ZZ57iomwnSRMvrAuau1qqg1dO0EkUGXzpgMgcv+RiwvDIOQ9cjLKGN10Zy8u67SOyDBo
 HyiA==
X-Gm-Message-State: AOAM532xfeTibCXV2LO0Rq6qTRUTi3PjfBPGwE+p01Ig8MnAV03Bcokx
 5RvUNlPRHyw7Qgi2LaX4u5DCkFAJIPWw0g==
X-Google-Smtp-Source: ABdhPJwTlNm3ajLqe0ExfwVvu1rbIqhoFaQyGvMl0Ub1obQP8+puL91HCPOWePBXADcRqTXy0U6HrQ==
X-Received: by 2002:a05:6102:160a:: with SMTP id
 cu10mr19621671vsb.24.1641507103639; 
 Thu, 06 Jan 2022 14:11:43 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id k23sm2424571vsm.1.2022.01.06.14.11.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 14:11:43 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id x33so5655962uad.12
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:11:42 -0800 (PST)
X-Received: by 2002:a67:3311:: with SMTP id z17mr19329245vsz.4.1641507102697; 
 Thu, 06 Jan 2022 14:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-11-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220106210000.397694-11-thomas.petazzoni@bootlin.com>
Date: Thu, 6 Jan 2022 14:11:31 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pBMknq+qPAzBd-n41mDqz9XHcErnSNOJxXCb+oAtFW9Q@mail.gmail.com>
Message-ID: <CA+h8R2pBMknq+qPAzBd-n41mDqz9XHcErnSNOJxXCb+oAtFW9Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 10/11] package/embiggen-disk: new package
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
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>, James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Thu, Jan 6, 2022 at 1:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> From: Christian Stewart via buildroot <buildroot@buildroot.org>
>
> embiggen-disk is a tool to automatically resize disks to fill available space.
>
> +EMBIGGEN_DISK_VERSION = c554fc1c93a4004ce0b6a3f69b0dabe0481a2308
> +EMBIGGEN_DISK_SITE = $(call github,bradfitz,embiggen-disk,$(EMBIGGEN_DISK_VERSION))

The PR to fix mmcblk resizing was just merged (thanks bradfitz):

https://github.com/bradfitz/embiggen-disk/pull/13#event-5854783562

So the patch can be dropped and the VERSION changed to:

9e7b2fc7b99c4dece41a805489a6ca377ce55a62

Thanks & best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
