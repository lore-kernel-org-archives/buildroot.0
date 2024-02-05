Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0990C4828F
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 00:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16AED402F2;
	Mon,  5 Feb 2024 00:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16AED402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtf30fh3APeE; Mon,  5 Feb 2024 00:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25A2B405B7;
	Mon,  5 Feb 2024 00:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A2B405B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFE1C1BF376
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 00:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8AC2605EA
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 00:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8AC2605EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDa7MBPVcx-3 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 00:03:41 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8D6D605AE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 00:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8D6D605AE
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40fc654a718so21261865e9.2
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 16:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707091419; x=1707696219;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SKFKX7WmQs46Yf1IteJ6pRhOq3PRGNHVtAhGD3wkxP4=;
 b=nZdwt2tdUmgpMoBJNQ8u9SSvKUfNVE5dtm7/zOT0pu6oFXf31W/vJSUp3BD/cr+ZTB
 gqreMqgewaC1TEpGFrWM/apZRthh7FEKKIdD6OWe6v5+GbrXcbXC0CK4g02b6BI+GJzq
 QL1OfyU4vFjGcqqokyOFsYNj1Lct8RwNGpSevPJ8Ao3TydfedyvL4H9ZbG35VGYqWN7K
 pojGBxnrbC/NNzt8wOU1cbnjGzj+ZfQ3unvjdyLqp+OEbvVDqARW7ADf4W2wtfgPS5yt
 x/zvnMKVkreNrwKVWlGT/rPETOxMyhpoBjgXi78miqcl8TbUaTNAF5oZpj2nq/Gz6tLS
 z5Kg==
X-Gm-Message-State: AOJu0YwSz3IifGpL8Z0u+CzUH4vOet1S41t3NAH+4DouyveSowkH+wUY
 rFyn5UZPCFNLcJZhVw0I2dy0YcjoAyXQ+zIwCMkvDwnZJjgwgdDK
X-Google-Smtp-Source: AGHT+IHBBqC6CSiTwS/kLbYLVglQ4siNE0IZfrI0oVrVjuRIkohwPAdDkCpETWngD2BgVfpc18cXfQ==
X-Received: by 2002:a05:600c:468d:b0:40f:dc51:1882 with SMTP id
 p13-20020a05600c468d00b0040fdc511882mr333631wmo.8.1707091418658; 
 Sun, 04 Feb 2024 16:03:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW11qxeuhHJwd/V5uvpV6Z1JneYVnQ/xPI+ZRMz47Kvx2B2TdTvTA07Syk8pcCikDK9CyuZ79zaucvjXIf8uHnEoK6fy4kBT1m8QwQ6bNsghRDiOYUn
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b0040fc5ccf3easm6930951wmo.38.2024.02.04.16.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 16:03:37 -0800 (PST)
Date: Mon, 5 Feb 2024 01:03:37 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205000337.GA166229@pevik>
References: <20240204102056.1409453-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240204102056.1409453-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707091419; x=1707696219; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKFKX7WmQs46Yf1IteJ6pRhOq3PRGNHVtAhGD3wkxP4=;
 b=bMCfzUgJ7mJ/810BICsDuBmYya+XCo/bE1GYWeiQTn/dNnepVPKQv8IhiudCllaG+p
 fmaGW9MzeKbE/JXP4TNALDmmdrW0/nPaRba4h2xiPThVHuu4eeMATnR3M3KSPCwEV4dy
 bsV1PYXRtY3MLxd30rRjLuywAPip3Vkssz9iAgojYs59iX19NuLRzmlNVFsUGN+vjYBs
 GZA95wX3YIes/gvADfyRGZBVsKthPiJD9wG+sTRHcHykqqONQQz63m8m1EdlFnKAqis1
 zgSk5Z5/27Skb2fRw+vuQ5SwXWdPpDIODlWfoRSWe8h5zMWfXErOsvgbU47hlZPqfGbq
 MDdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bMCfzUgJ
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: drop
 NFS_UTILS_AUTORECONF
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

> Commit 63332c33aa0771532807fd2684d4eee4eb952435 wrongly set
> NFS_UTILS_AUTORECONF

Hi Fabrice,

thanks! (too late to review - merged).

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
