Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AE5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 10:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 017BD40A19;
	Tue, 10 May 2022 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09yfclKxXYzN; Tue, 10 May 2022 10:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16B8A4024B;
	Tue, 10 May 2022 10:00:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1429A1BF2B6
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 10:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 022144024B
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 10:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPOWY5fLkUC9 for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 10:00:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BC80401B7
 for <buildroot@buildroot.org>; Tue, 10 May 2022 10:00:36 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id r17so10999355iln.9
 for <buildroot@buildroot.org>; Tue, 10 May 2022 03:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=c+4r6ZSHPvk9gnhNvdddZ5qRBTazQDWeie+BsSyrLro=;
 b=BThRatKdiOgtQIfMPVJtrQ+K0P3iy0veHkA8E/HXm7LChPjjRAKN8pbhhvH0Ob2813
 rbYliEqOktz9gopTJbuOMue26NPgtnLoBADcZnBgyVfRPkHoVEfn8fNPG0ittOlyw3/P
 FlZ5HE4zfd4YpWt2e6JezCKAOR1HxQTVXLEWBQKPZm5O+ZeNz5pist1E6PBOQVwqy858
 MGuXN5TWofmKlD9/dmbPVA9+Drwm+XLV7IavUSdlOhgEMc6RhzuVudZ85W+5XQ4qrIky
 vufaYMYDOTxCcZ7RjZDthWw+T+u2JykqAKcZX9k4/nngLRp+REyRZzMf5JSAHJSZeArs
 UtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=c+4r6ZSHPvk9gnhNvdddZ5qRBTazQDWeie+BsSyrLro=;
 b=dgVAYKdPn7uopIS+1I2aVBqqUuZLiJ7KEcl75Z/prtVxDb0f1hQerZONF9giRACBLq
 k6QVj8Ud6x/n8Q77uM3USh3ItRTrEQw3embbujKfsp9wLf38GfNJqm07ZZMbI3YPfonB
 zwhP6uP85SOH4Oa1HqmdIDDNE6g1Q45/96qP97LU3kCQ77ds5G2s63dfsyWs5Dwle+uo
 hFFiVhc/UAXqPpz7b+s/5DKohXUUmiL7AbkUILpEd8TuAE9a4Eah+T/QSQG6HAhsH6fk
 t5g+psBSZ9AsGnO7n7Ejr2HFnC7ZuEwMcQVT0o9h1vhQA1ewYXn6Ma9SmSuJ9SKb+Kyc
 W6ew==
X-Gm-Message-State: AOAM532H+wJwlwVTBeCsUm5inmRnPOc3mw0kx3RtPgDsBpeHuymx+abA
 vFpLzRyl9s4zHDBMgwVvnCrE3n2Ph3QLPxjrSmImwGDY4a4=
X-Google-Smtp-Source: ABdhPJyk7/CTNtA/QYW25DRqExz2qIURfjTbdpfwvIDGdnLzpiVvA3I96ous2NtoxFRPOGPR/j7plGm8YgLVfowvFCE=
X-Received: by 2002:a05:6e02:1a43:b0:2cf:8406:f57e with SMTP id
 u3-20020a056e021a4300b002cf8406f57emr7800471ilv.37.1652176835259; Tue, 10 May
 2022 03:00:35 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 10 May 2022 11:56:58 +0200
Message-ID: <CAGm1_kvHtN6OeeidGFfbnC2e-xvvg6MjnQFmkGPPCqoAwMb+YQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] Adding pylibfdt
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

What is the preferred way to add a host-pylibfdt package? Changing the
dtc package to build and install Python bindings or to add the
pylibfdt package [1] directly?

[1] https://github.com/devicetree-org/pylibfdt

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
