Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98881C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 13:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A3044026E;
	Mon, 31 Jan 2022 13:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Epj_s9TOpTng; Mon, 31 Jan 2022 13:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AF8A4047D;
	Mon, 31 Jan 2022 13:09:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D62021BF3D4
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 13:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0321828DA
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 13:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqBM8yd4V9sw for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 13:09:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 868C782919
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 13:09:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bx31so7644018ljb.0
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 05:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tU3tJXAPWJ/gZSTrhnHh3Ymwtd93wPl9ebl6OeD37Rc=;
 b=KJkZfDSRuBlWX/oBEvlicsvrknuXBTiz+h7RO7RyTBaF8tSaNk8+Kheo/xjCXxaWsv
 deUls7iW+eveCN3W/Dyft/n0XMUJcdqqEXgQedhnAN31ERnLQRvUbMAWhJzXMEgXvSVX
 bxfKt5K0ZmAOhRz7wIIHvIZWyoRZo1G8u3TYwEs0S80HkW+s1DcKUvxslxHny/I7XF+2
 TUH+OLjKh5+O3slR3goI/Pb3pDLdfv18lewgHBGHX1MDjrlDoRZTxmO27ibcwNz14jJ8
 wHqnAeFqb1Xy+1z1QQzcPi0nz2F96oOhoYU+OUDCgjqrw+njpW7A0e9KgVFC2GkSqWGN
 Lj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tU3tJXAPWJ/gZSTrhnHh3Ymwtd93wPl9ebl6OeD37Rc=;
 b=qNMeOqu8jACCm6Ir/hawYp/+k1BnqWFD+YktCfkjLZzTNoYniv2MlSxtcrlnZ9N4A/
 rGDbXekk5yOXT2OLi5krxXtx3KL6JxYtUQSHDow1Ov0QZcJt5woDjDBylPtSGW6OkkES
 4FijCz9zJgwkjm+sSXftEyhoXUmkMnOOelw70O83F+RWUO09gpFJow6LMxmDGVaPJS+n
 V9MEOqhNhiQGsqohByQK1tpSFMinNwObeBx4Rsd+Iv7MGlzOp2beb+Fs0rt4W9Bd3Ii9
 tBRhBFU54Fejt1k/Fwc/YVgmDgZzeBXNlDKbig57yY5HGCKFmNsVvFivTj0IK/KVgbup
 lJkw==
X-Gm-Message-State: AOAM533LX1slOY/o346XnHNQZdlg0GltK5943VscCkvR1fIW91xciLlZ
 6kEiMQ05tq8vGzmANBuJ2Mw=
X-Google-Smtp-Source: ABdhPJxNdu8eLrjq5kxsnKqDBSFa4wBmf4ISbDUbPhClvVE+IbkQL4Z2o5ni9Xmzfmh8JccMMy6EKQ==
X-Received: by 2002:a2e:a5c2:: with SMTP id n2mr14045667ljp.174.1643634544450; 
 Mon, 31 Jan 2022 05:09:04 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id f17sm3656330lfj.173.2022.01.31.05.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:09:04 -0800 (PST)
Date: Mon, 31 Jan 2022 16:09:03 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YfffbzLZg+b6yOFY@curiosity>
References: <20220131081214.12773-1-geomatsi@gmail.com>
 <48cd0534-15fc-3dda-4a39-64487b112229@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48cd0534-15fc-3dda-4a39-64487b112229@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 0/5] synopsys: boards maintenance
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
Cc: Joao Pinto <jpinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> Hi Sergey,
> 
> On 31/01/22 09:12, Sergey Matyukevich wrote:
> > Hi all,
> > 
> > This is a maintenance patch series for Synopsys boards. Outdated
> > and unused VDK configurations are removed. All the other boards
> > receive Linux kernel and U-Boot updates.
> 
> Have you tested on the real boards or only check if they built successfully?
 
I have tested all the images on hardware.

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
