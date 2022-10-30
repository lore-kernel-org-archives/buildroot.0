Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A6FC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F25FA81271;
	Sun, 30 Oct 2022 20:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F25FA81271
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DE-jC5GvUGZ7; Sun, 30 Oct 2022 20:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32BC5812D5;
	Sun, 30 Oct 2022 20:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32BC5812D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E92D41BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C461460803
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C461460803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZ1_NQ-_-YkC for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:35:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B08D60670
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B08D60670
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:35:56 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id c24so9123376pls.9
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 13:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ETgE85poBD8nD9m8av+GA6OivaGv4gpo3YQ4/ON4+X0=;
 b=TaykZ71HEhKWrtY2Owqo9JhDdG3Y4lygCEKl7pDdZV/4ANZ9cdCP3e3PpdNNDil39S
 yUXXShSjIaLlZpAuh9jFVIn9Zj85vhlTDOM9Xf7FlDcWW4+MJbtvc8Yxvs0edFDDxZAH
 Qb8Zbincg9l9aspZoHb/EMLNl2jMEax04d9ubqZo1vHnaaRvCZbPDcXlJqVFdYWmM9Bb
 4/B1dVsWU749ALnDYmlo0TOVcdKhleZRNG4wB+GOXleaATKpkwbIHMZJCF/JXfrK6klQ
 ++KN2CjJva3virf6SK0PE4v6/dQo0SFxkBoHGZo5l7dAb13Zy/TDWkcl1nXcpOxcGDUT
 IYeQ==
X-Gm-Message-State: ACrzQf0zylm2KkoCTiXVRA3+JPbFuEXcSo0plVuGQnEtxcq4d3UaJy+H
 WmXOXv1GxI336lygqwmDsOQEj/2e5nn+1EZS+7WdRA/M3skmsQ==
X-Google-Smtp-Source: AMsMyM5WgcsFj8OX4W0gLk5ueUSsrIUUvWC+J+KX7j1U+KjWPKt26l6YGqFQvDdiitiPHKmcLYiZKxiulOMZM1RIb1s=
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr10698589plf.57.1667162155959; Sun, 30
 Oct 2022 13:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221014230905.3091021-1-james.hilliard1@gmail.com>
 <20221030212629.51bf650e@windsurf>
In-Reply-To: <20221030212629.51bf650e@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 30 Oct 2022 16:35:43 -0400
Message-ID: <CADvTj4qQ=esO-=RYZqzk3nGEYhw_1dGuOss3eN8xn-wu9WYogw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ETgE85poBD8nD9m8av+GA6OivaGv4gpo3YQ4/ON4+X0=;
 b=dylAWiC3NtS7PXkGcXbG8rur9O7xWqu7cXSSpqeK0TOsWGXz4to/Z4AyRi3MEdfjnL
 HETM/wsFsZRLXOLdW4u+D+9eYd87sI36cuTR47JB35tGXHJBAHfLZUm+7KtjqdB2Qt1M
 Z4f5PbsjJQQZTsuHCVi2pxqAV5ZA4sjZ9q+GoaNL79kkeYYE0i6F/Ir6ThLKWLzUBkMQ
 zsKd2cKW1PWVoEF9qoL6W0E6/5VXYzke3YLzhT4iZlSikWGj+3thJsYdQJSwO5UJlGgx
 EKDeoOV4xs88hD+dK2i4FnHep/pQ0zQmKuN3w64boEa1AlNA+GVuQq514LLoHCWvcBWy
 cx7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dylAWiC3
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: identify silent make via
 firstword findstring
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

On Sun, Oct 30, 2022 at 4:26 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Fri, 14 Oct 2022 17:09:05 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > +QUIET := $(if $(findstring s,$(firstword -$(MAKEFLAGS))),-q)
>
> I must be missing something, but why is -$(MAKEFLAGS) used and not just
> $(MAKEFLAGS) ?
>
> Indeed, with "make -s --debug -k", $(MAKEFLAGS) is "ks --debug=all",
> and therefore $(firstword $(MAKEFLAGS)) is ks, which is good enough for
> the findstring s, no? Why is adding a - in front needed?

I think so that if $(MAKEFLAGS) doesn't have any short options that it won't
accidentally match on a long option.

For example if $(MAKEFLAGS) is " --shuffle=none" the - in front ensures that
we don't match the s in a long option like shuffle.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
