Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C82C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 22:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2920460F14;
	Tue, 22 Feb 2022 22:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmrExJKqaCGH; Tue, 22 Feb 2022 22:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51ADA60E2D;
	Tue, 22 Feb 2022 22:06:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C34A81BF429
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 22:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE3BD408D9
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 22:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3iJHww760ZV for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 22:06:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2710C402A4
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 22:06:56 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 k9-20020a056830242900b005ad25f8ebfdso10623981ots.7
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 14:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=eHP8eiVgT2n+ehhJ4MTR96s57dUM2Q7zKa1lGBVTLF0=;
 b=Y5hvOIrANJEOXnkQrimQgtyNV58IrkqMBWas8Q8dFX2NTqFYoANdnBaCwNuAbPFZEa
 eCHn09/QG4+Vb1EZzYxY1RByB0Ux1IwbWIv9k8iV2d6qrHQyj5qFqYRs65AhdCjWPgpP
 KvBZ6CNzv+sSLj1IcOfn+lYl+TfUJQjwAzbAd8G1kMAXzWmD7qby6PD4JVLZbtp9j6Le
 MsH4tRSm9A/MBQYI77x2wG6cDm8od97rrpXkNS+24IKU8ZaCpFgwSticS/+dTd/Tj6Tf
 DLnZjnnzrO8Yb0Uq7ETyEPnFCoe393qkaXv4d4avAurYq7714gAjrudYCGXbgWVLCSZv
 ApDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=eHP8eiVgT2n+ehhJ4MTR96s57dUM2Q7zKa1lGBVTLF0=;
 b=iNmsy/ZLVasj4NChQVseeIKw+CyzKU8iVvQQvB86oTeK13pa+PCQPVykXS0JzijcYb
 GM2PFTZQSg/+uFzcx8PDxxtw6RNCzivPeyKgH3glzaADqv4fafO0Lg+KprF9ngMMsPLd
 KNSqm4in0TNCURRMBE8+/c0g16OKkLD1eFHuI3IFFyjSiz6hkhJb/1I/zmJ3Wasznxco
 +nce6kM5hGXYpIxQcWr3Fq5K8yMfnWMCdWFJFSmdhP+ZRxFaxYrPFfdS3xO6UgmeWWyv
 6/ABThErQ0wx04HyLXtubHSXQy8PZqaybwbnbB0omsMvwxv3M56aG90RF05VjuL7QltN
 fFPA==
X-Gm-Message-State: AOAM532wHO+8sgvn5OtBONXEMfitiXd++mYj4XP+x8aFUD+h8cS2nOTH
 5AOYFqFnYyB9z7cpK1qeOlfh6nQy3nd2AZEZ
X-Google-Smtp-Source: ABdhPJz8SDGOXe14lPEAAZ4t2oT9M/d+1DO5VnTh94d+TbhyKvGzBDVwXD/edkygVVa+h5eOeowADw==
X-Received: by 2002:a05:6830:4d4:b0:5ad:52fd:5c38 with SMTP id
 s20-20020a05683004d400b005ad52fd5c38mr6606526otd.255.1645567615070; 
 Tue, 22 Feb 2022 14:06:55 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id y3sm9584603oiv.21.2022.02.22.14.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:06:54 -0800 (PST)
Date: Tue, 22 Feb 2022 23:06:50 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <YhVeeh7tNDJEzNM5@pevik>
References: <20211011220025.7998-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211011220025.7998-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC PATCH 0/3] make: support: use `command -v'
 instead of `which' *second try*
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

could anybody test this patchset please?

Kind regards,
Petr

> Hi all,

> this is a second attempt to introduce command -v.

> Changes v1->v2:
> * reproduced original issue and fixed by not relying to
>   $(shell command -v ...) but shell with:
>   $(shell $(SHELL) -c "command -v ...").
> * quote variables

> Tested only with make defconfig && make help >/dev/null


> Petr Vorel (3):
>   make: support: use `command -v' instead of `which'
>   make: Drop `type -p ...' fallback
>   support/dependencies: don't check for `which'

>  Makefile                                      | 22 +++++++++----------
>  package/Makefile.in                           |  8 +++----
>  support/dependencies/check-host-bison-flex.mk |  4 ++--
>  support/dependencies/check-host-cmake.sh      |  2 +-
>  support/dependencies/check-host-gzip.sh       |  2 +-
>  support/dependencies/check-host-lzip.sh       |  4 ++--
>  support/dependencies/check-host-python3.sh    |  2 +-
>  support/dependencies/check-host-tar.sh        |  4 ++--
>  support/dependencies/check-host-xzcat.sh      |  4 ++--
>  support/dependencies/dependencies.sh          | 18 +++++++--------
>  .../pkg-toolchain-external.mk                 |  2 +-
>  11 files changed, 35 insertions(+), 37 deletions(-)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
