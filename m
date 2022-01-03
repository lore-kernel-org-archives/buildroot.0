Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E56C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 08:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF24813C6;
	Mon,  3 Jan 2022 08:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QkDXBBZEgG7; Mon,  3 Jan 2022 08:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F3881392;
	Mon,  3 Jan 2022 08:42:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9686E1BF384
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 08:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82D6740194
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 08:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JrdAyFC1cdGJ for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 08:42:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B0B6400E3
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 08:42:13 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id by39so54803817ljb.2
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 00:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=RAdagnoDhGYza9TSS+3JhDpLbXAhcBG6qQwkvYC9ors=;
 b=SQK/8zPZNENs98Fg5elPlwp3DYYtVS8NBy4QS6O+Y5KgGIKySiDer0VeEff0RyNCbV
 +QQopHNNxtEx+qMKJ1FaHlZFucBNnbhm9HHzg2XzcQrr8qBUiTocKCc0z2LqFYE4lAXc
 CEMWm14LoqbzemLurz08f2HrW9VJy3XV3kCxSTa7RNMAHX2lBJ1QdmGqw9aebexQyhgy
 rOwWpHn8oOwJ+cVTlusdNXdc/6DLY3NF0s/JI0pTI0MCfthDU8EZuHvyN3WKNEASg3/Y
 QNO8kqfGeubdHWqweW03UHUreOEPy4qrzTI17/dX81C1aF7aZmWeK98TevKQj89wnanI
 zlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=RAdagnoDhGYza9TSS+3JhDpLbXAhcBG6qQwkvYC9ors=;
 b=VYrUU0Tv4wEFJC6fZexvmL9nPRWrNZUABEo2+/3SBXIzxCL8e4CarnRGpYKL/phCwe
 ruVRl9dH8DraN+DqgSrG+xrw+iLnMBkKn7ZgC7gkVN4urDpjiZY9ONrymyfAEkV/H4ua
 7HownzIWsbw9AnbEh/wshZnbomSsgNpiQJOERiYrSpZGIiwVLBz/pMMAw2cFzaPzJJT2
 +bcKnrDgtvMjufDrHQsxynGbWlD1OffK7V8V7QwZSvM3t/oKKcFmKnRjFVQFw+naYoQt
 NnoMpayCS/01pXdDgEm/8ZN5V0ysgiY2t4DYqOCJy3+FDf/eGJBMyTdlKPdyTnfuK2e6
 jO9A==
X-Gm-Message-State: AOAM5338aNT7obufpqNd7Glw61x3bF1Jcl6rijHCnOUhBuYhOsoqb8m+
 YnDnKwtLKoKQzRAKxuaAU88=
X-Google-Smtp-Source: ABdhPJylrqiBKbNTE/WHp2r4WOBDaY/xFl5ik2h4CrmJylo9J6Slz5IQlmRIT5NdEOI9aCpCmA5Hdw==
X-Received: by 2002:a2e:3313:: with SMTP id d19mr22210886ljc.436.1641199331380; 
 Mon, 03 Jan 2022 00:42:11 -0800 (PST)
Received: from luthien ([176.10.248.201])
 by smtp.gmail.com with ESMTPSA id g19sm3483128lfr.269.2022.01.03.00.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 00:42:11 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
In-Reply-To: <20220101135737.956301-1-fontaine.fabrice@gmail.com>
References: <20220101135737.956301-1-fontaine.fabrice@gmail.com>
Date: Mon, 03 Jan 2022 09:42:10 +0100
Message-ID: <878rvx1a8t.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: new package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jan 01, 2022 at 14:57, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> ksmbd kernel server userspace utilities.
>
> https://github.com/cifsd-team/ksmbd-tools
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
