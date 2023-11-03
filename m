Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70EAC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 588D6402DC;
	Fri,  3 Nov 2023 19:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 588D6402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7qHOTq8JvYz; Fri,  3 Nov 2023 19:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AA75402E8;
	Fri,  3 Nov 2023 19:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AA75402E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3031BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46FA3402DC
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46FA3402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1k9YjmRKhBWO for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:31:46 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D07D6402E8
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D07D6402E8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0457D1BF203;
 Fri,  3 Nov 2023 19:31:43 +0000 (UTC)
Date: Fri, 3 Nov 2023 20:31:42 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20231103203142.6390a8ab@windsurf>
In-Reply-To: <20231103111618.548198-1-buildroot@heine.tech>
References: <20231103111618.548198-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699039904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZTWedIFZMsod7qjnU/YyEf+bnUodOGRogvvnF+BDaM=;
 b=DgzxqkZclNRYdI6ZKyHaKWrYiF2wk03ypGEOxEKWQjcgFsyxXvAy6K1cQ2I0CyRIOgjLr8
 5dnJKv0DRt8vLp39XCaMzILu8TbeknUlKMDz5gTxEy1VQNH3FAiSGZomCzmf99ggk0P9r1
 1SIvw+hWKDZfWmmZ7M0JQu8pxT9D7CWmGA7WYESc5tCuDxYOSfa6GrKjN0aODAfx8h5s0y
 ySFQwPMlfJL7Hwgw52tVEs93NHT0VvnyhOXug/H1sLGpITIx8CMquDSdE/PS0YzRNcKgoj
 wjIcTQm59KxebGB16FyVVwwD5e6YYR9sjLPj5RLwY6eq1QaBqx/jCKmwWDrBpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DgzxqkZc
Subject: Re: [Buildroot] [PATCH] package/websocketpp: fix build with C++20
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
Cc: Ryan Barnett <ryan.barnett@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  3 Nov 2023 12:16:12 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> websocketpp had some ill-formed usage of template parameters which was
> finally removed in C++20. Hence build fails when building with C++20 support
> enabled.
> 
> The patch is already in the develop branch but no new release was done.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  .../websocketpp/0001-fix_cpp20_build.patch    | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 package/websocketpp/0001-fix_cpp20_build.patch

Since there are no autobuilder failures for this, could you provide a
defconfig that reproduces the build issue?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
