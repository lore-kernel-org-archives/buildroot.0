Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3512C001B0
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89197815CC;
	Sat, 22 Jul 2023 21:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89197815CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olZAhJWbDuN4; Sat, 22 Jul 2023 21:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5415782184;
	Sat, 22 Jul 2023 21:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5415782184
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B574C1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CBE1415E7
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CBE1415E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_S-ZACuZyoa for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:26:35 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9302415E3
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9302415E3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EC50C0002;
 Sat, 22 Jul 2023 21:26:32 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:26:30 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230722232630.1c759813@windsurf>
In-Reply-To: <20230721213121.178783-1-romain.naour@gmail.com>
References: <20230721213121.178783-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690061192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOZ5wuz1kK6bjCHcEYQF4NEKKfU6TsBl4+5T5QgJDM0=;
 b=iZgOnSh+N8CCnZncak/v78UJGNn+i8LNECHxqHxZs45BXfVyK5LUCV357DT+0YPgnS15HR
 8xM0eaci5qlLvoknfN+K0ZiguIjmG+gjBsgUGPWMYk67inJl0XNZ/P/+ODUmKj46CqLyYK
 3Iw2rpnLeTu7rbxfpw0ZjD55peRfJ7KmBi1hTxU2J1uc2NrboiI+h9q2aw5EbiWIv7KxVo
 RNQicXIFkhQJyT8hGTLXnWe7k5uavWtxHDrcu5wJHoh+dluSoa/Zp4cWxbT5L10poAIQ1J
 GR//4L9tZfJ142niqz7sh9TVY/Gn45XbdbzL39tys5doDcMji37DtabkWByOIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iZgOnSh+
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump version to 2.39.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: christian@aperture.us, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 21 Jul 2023 23:31:21 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Release notes:
> https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/v2.39.1-ReleaseNotes
> 
> "The main objective of this maintenance release is to address bugs in libmount and
> resolve the regression that occurred due to the v2.39 rewrite for the new kernel
> mount interface."
> 
> It also fix a build issue with waitpid program when built with a toolchain
> with headers < 5.3 detected in our gitlab-ci TestDockerCompose.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4664846019
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> 
> TestDockerCompose still fail due to a recent update:
> 
>  # github.com/moby/buildkit/frontend/gateway/client
>  vendor/github.com/moby/buildkit/frontend/gateway/client/client.go:18:29: Reference does not implement comparable
>  note: module requires Go 1.20
>  # github.com/docker/compose/v2/internal/tracing
>  internal/tracing/tracing.go:102:22: undefined: errors.Join
>  note: module requires Go 1.20
> 
> Reverting 490882ada94cf98da145feb4e7e47302aa31104f allows to pass TestDockerCompose.

Christian, could you have a look at this issue?

In the mean time, I have applied Romain's patch, which is needed (but
not sufficient) to fix TestDockerCompose.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
