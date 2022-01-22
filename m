Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DA4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F04A14095D;
	Sat, 22 Jan 2022 19:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1AeH-mAkMVTy; Sat, 22 Jan 2022 19:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA8A40992;
	Sat, 22 Jan 2022 19:35:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB0FC1BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9908410C7
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZmYRhwBtpNgJ for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:35:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEE6C4095D
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:35:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so24888843wmb.5
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 11:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=mAyJ0yCJs99F5RBzqra6M6bLhU/2MEbqPEkKxCiiFec=;
 b=KBFBiRUdPxnGgv38FG507pOucMGn1ciRX0EkWnOmcedyyO9ZX6HQCTMuekLL5LTwhN
 GXmKXoNm2NnvLLQSW6kLOH2ZD92J6L1DBTDmXjnFkrj9oYC5YTDRo77qnAwmhvnjOznF
 v+SxnGAKOeEzoeXNvdTVHddzqZrV1gdK20ucYmr6LbcHkQ9Ghnq8/2EhO1zsRjqbnf+X
 xeMXbbuNv3pr3sW8M0qMk97D1HYPFOmjmssvF4vfbzUA3T1Pn3cGbInoJp2wRRfmgePe
 ng5u1gU6tLaZhmEPMEOzzZ7jHjjdgWBgrSKIVzTNmPGwLlnCWlnwIoZ47WOUal7TTZu6
 JrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=mAyJ0yCJs99F5RBzqra6M6bLhU/2MEbqPEkKxCiiFec=;
 b=H3QVwMdi+P9ICW6SdrwuoRtPny/1GoSu8nh0t95W9aSJXbiJUno8KWSoqc5CDy8VYN
 IqEqK2boteGVTBvAT1v5NWmvyWnBlkV1KTOBZZ9Q9O/DnJRuzu5NNKFfKmfeSwrH+usB
 JWQ9gkHa9/4U5Ra7iFoFxFAa2XYtXIz7cwL29IjSmqwTgUlsDhzQGKQlIYElC8qxe4Vl
 yrkKa8T2QGPhQVEkHe8LV678DCf21wUu3XWkBCVi4DKla8CxTanbjJ5vXCp0L2oSOXS7
 r+ZFIofK9Vr82v8HAVfzLKwXv6lu8LXGY14RyrIXPBeuUPRIu5YNdmbGeyqL26Ahlvrn
 a1lw==
X-Gm-Message-State: AOAM531zuCDkVhS7wjRgD0w2/u23IizOus8HNQSHu4AnJTQji2BgnVKA
 q3Pha2V78tYmiEhbJYwlGZk=
X-Google-Smtp-Source: ABdhPJzfBgAc+XmRAudljyf1RrIkYk/EAP8Lo7i+tgj4icjpw6JbHvcrXTJZz6CCfCDvOvWGJX/QMA==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr5368671wma.28.1642880117051;
 Sat, 22 Jan 2022 11:35:17 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id h4sm11460260wre.0.2022.01.22.11.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 11:35:16 -0800 (PST)
Date: Sat, 22 Jan 2022 20:35:14 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <Yexccv1tc6kkQ33L@pevik>
References: <20220122185049.1194-1-petr.vorel@gmail.com>
 <20220122185049.1194-2-petr.vorel@gmail.com>
 <20220122191434.GC3621364@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122191434.GC3621364@scaer>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/nfs-utils: Update supported
 versions
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Petr, All,

> On 2022-01-22 19:50 +0100, Petr Vorel spake thusly:
> > Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

> The commit title was confusing, so I amended it a little, and applied
> to master, thanks.
Yann, thanks a lot for fixing it!

Kind regards,
Petr

> Regards,
> Yann E. MORIN.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
