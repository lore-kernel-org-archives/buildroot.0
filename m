Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A044C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09BB140286;
	Thu,  6 Jan 2022 22:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRDWi6PCZYsT; Thu,  6 Jan 2022 22:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26AE540131;
	Thu,  6 Jan 2022 22:05:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 678181BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54582833A3
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbRGXlYM993y for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:05:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94F4483396
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:05:09 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id x33so5631103uad.12
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GzpdW0fK8hoyliwFSjZCH81bDO+bJHdoyrBXXh7h4Lc=;
 b=AYA0jUT7v/heJw7//9B3utX7EXvvkaJ1Zz1jehMabcs9t7CDAoHLO3l+E6/4pUFBB8
 HE/BaBgZb9FQj5FchQfPLyO2P+LWlF5SLrgJ2wecqPlkfELBv1cCTRNuzYijzsHreUPD
 F4opLVsd+Pawvyb2TWuu8RvwNbMvhsutd8AlzV6hjk2L09CmfirL8ub6SR1gOtpJNfY1
 Diu1cja2gVlBSbAW8LGvFtXaVuipjZHaRSnWHZQQO0q1cS4rUEKLXZZeWOfP/VZz+IG8
 S58J8Yd2N+dvOA90z5KaEX/PQChHAXgyFvbrjN2EI8hUujtpl8tf72K8QpSGv49IrO9x
 3gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GzpdW0fK8hoyliwFSjZCH81bDO+bJHdoyrBXXh7h4Lc=;
 b=Pt8dcalKa41NoGiP8PXUK2U1cYpDnqojjYXVznsVgLt1yCetoyETiXtw54k/d6LDG9
 N48luzLx/B70VXDAJ+cLo5h9+t2jI/ti+anfQc/HPYxb2s4umsZm42bsluC3Y5iWL4bi
 YmgJzab8Xm7GBs7AAk3IZCXIBq1mXXF1XhuEhKfrZE1sBSIfuEkdctcnm9/3kre4KJKm
 4rpyn3X8zNFr09kgHsaIremDpd/P+PuabjVetZEyYWBTYZeNdiCmomxGy9lMKZ0dIgvz
 YfGc4Z3vickjDzP3geqPYm6eReMl4/ZCsY7sAS3x0LpDkry4WuYeryNQ+tcZ5EHvTMNP
 lrkQ==
X-Gm-Message-State: AOAM533kDeD30WkiylmpkqhUmpoh7DrwFNl4wEg6HbtFTUo+A50wTYNk
 G9Tv0LEodml0eXmlikL0ic6y8bQ68iCrCw==
X-Google-Smtp-Source: ABdhPJzlXy58sxdWqi2kUiwqC08/qQhfcjEh0pLzItI362YhUKeKIjwibauSHGBfjnrtChJ7hUosEw==
X-Received: by 2002:a67:e055:: with SMTP id n21mr19279722vsl.85.1641506707689; 
 Thu, 06 Jan 2022 14:05:07 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id x2sm2479560vsj.32.2022.01.06.14.05.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 14:05:07 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id c36so6925708uae.13
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:05:07 -0800 (PST)
X-Received: by 2002:a05:6102:3667:: with SMTP id
 bg7mr11144229vsb.81.1641506706920; 
 Thu, 06 Jan 2022 14:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-9-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220106210000.397694-9-thomas.petazzoni@bootlin.com>
Date: Thu, 6 Jan 2022 14:04:56 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qv7gBPc2KcgT=5tjDr475haSYMZwLzu4RbYFO3xV4-HQ@mail.gmail.com>
Message-ID: <CA+h8R2qv7gBPc2KcgT=5tjDr475haSYMZwLzu4RbYFO3xV4-HQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 08/11] package/sentry-cli: re-add package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, all,

I get a build error  with "make host-sentry-cli":

error: failed to run custom build command for `libc v0.2.71`

Caused by:
  process didn't exit successfully:
`/build/host-sentry-cli-1.59.0/target/release/build/libc-a39b7215be30da0c/build-script-build`
(exit status: 1)
  --- stderr
  /build/host-sentry-cli-1.59.0/target/release/build/libc-a39b7215be30da0c/build-script-build:
/lib64/libc.so.6: version `GLIBC_2.34' not found (required by
/build/host-sentry-cli-1.59.0/target/release/build/libc-a39b7215be30da0c/build-script-build)

I guess this is a rust-related issue? I think it's complaining about
the glibc version of my build system.

On Thu, Jan 6, 2022 at 1:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
###############################################
> +SENTRY_CLI_VERSION = 1.59.0
> +SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))

Thanks & best regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
