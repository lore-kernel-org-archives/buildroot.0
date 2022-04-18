Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE55FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 16:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30B4040BAD;
	Mon, 18 Apr 2022 16:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBrzYyZwpV-8; Mon, 18 Apr 2022 16:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44A0540BA6;
	Mon, 18 Apr 2022 16:59:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4931B1BF20D
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 16:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 375ED8191E
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 16:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Z-WvDMcOuwa for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 16:59:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A61AC81839
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 16:59:19 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id y16so8873005ilc.7
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 09:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=TIWoV5YLeh5ye6Lr/lgX/3mrURHLKqCLOILbVZQp6Zs=;
 b=dHF2Sbf7TfGQZtTp0/HIzA7LUCS/rsochHK9W+fkZwWzi9loVJbBCeR5aFgB9h/3uS
 024DmIUqf5SPjRgUDNqD8glplz/CfasX86vabryCSicwWL5PWmRE+9KYyKdUXgRhBkyO
 xCCOlc16PD1RpxHaFc/0fJivPQVgQy18lTi64Dulx7FHniMIEVdqnP8SR+/x1La0Ys98
 idGr1nwoTlwzHSOWNMNtRg/PHgP5OqoMUxwl13DiweWNjWz9lejtx+b37vXYbuOR8jdC
 s/JVuhtILuJEUuKMLh3QURsoRk8vaIbYJXQITAkVTPoAfYAOQzQZ7HD2m6Sgz/zdu2UM
 GkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=TIWoV5YLeh5ye6Lr/lgX/3mrURHLKqCLOILbVZQp6Zs=;
 b=dscTfd0QAyBA1Q1dLNGiUNZMev9hGLm7pxwAbWu2Wk3pbv2suxSMk0aHul2soCntaS
 yLSzKDCsGHElk4zKxsuM6hvPBqZd1q0RAJ6Ekb7jZix8K7qRYAdEOb4h8TjWocEZR0oQ
 ZtVkgL3VvGzSmrDV7tGhCvauj5UlXrjhkMlMvlyV4ZP1+hEirCeI2PA/sUTq94jgLki3
 +XXQVeVm6Q8gttIXw8fE19jvemb1CpzQHXsFv9e4egrA6fYNTMYwsITG0a/LkdW7UjXA
 URKD1luwFBhIHpVdmCVAGfendWhoH+XPp0I0ePaBVRy7qo2yPxKvt5t1G2rBwJ+8y8jk
 nEaQ==
X-Gm-Message-State: AOAM533QoDkoRJgnN0qRoHGUUG32rCwAnV1a1wOsZ9X/U3ULACtGiZ2P
 zm7k/bMYFxUiHVUqEHoPCbU=
X-Google-Smtp-Source: ABdhPJzRrMoYBuhSMPC3JVGSgHuk+1PMfl4dSagSAYBV9c+qvXSAH374e2hhMoBX7yKWzVmbo/742g==
X-Received: by 2002:a92:ddc7:0:b0:2c2:91f5:146b with SMTP id
 d7-20020a92ddc7000000b002c291f5146bmr5142096ilr.21.1650301158756; 
 Mon, 18 Apr 2022 09:59:18 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a056e02174600b002c7f247b3a7sm7828860ill.54.2022.04.18.09.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 09:59:18 -0700 (PDT)
Date: Mon, 18 Apr 2022 18:59:13 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <Yl2Y4XU3oC+BW5PE@pevik>
References: <20220418142855.3489541-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418142855.3489541-1-tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 903b6fc
 (v5.2.2.4 branch HEAD)
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi TIAN,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Good point. But maybe instead of 903b6fc a previous commit
13531f3 ("rtl8188eu: Fix build for kernel 5.18")
would be enough, because 903b6fc just vendors hostapd-2.9,
which we don't need atm.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
