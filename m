Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB6EEE49B1
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 21:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13D5640A6B;
	Tue, 22 Aug 2023 21:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13D5640A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B91QIbQaYFab; Tue, 22 Aug 2023 21:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 677DE40A5F;
	Tue, 22 Aug 2023 21:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 677DE40A5F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34CD41BF31A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 21:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F120A819ED
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 21:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F120A819ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61kNe7MhrJTO for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 21:40:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 895EF8198D
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 21:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895EF8198D
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7B73C0006;
 Tue, 22 Aug 2023 21:40:17 +0000 (UTC)
Date: Tue, 22 Aug 2023 23:40:16 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230822234016.5c4f8f5a@windsurf>
In-Reply-To: <ZNHmuZ6+nRwp71r/@waldemar-brodkorb.de>
References: <ZNHmuZ6+nRwp71r/@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692740418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAQeB7bDxMReDhUdODsexWqQc3L1jLTXgkRGM7lX66E=;
 b=k/j2QTndWA8HTfyEcCJojENvsCGX5XF35fU3BbnwGcyWMUC6J2eTpUHUDOoM4ZPU74Z8pb
 2+83x7y/D7DAYjK61c8HHed0yoFyJDyS3wT9tBYHaW6Zo5okr9Oyh1R0zmS+bW4aGP2DNH
 JHhnFpxfgMy2s7sd/xex6ptvg/ibjPkUJi2BVbdjrKXkSmzbH72doLcAAb0via6gF+T0uP
 T4azmOEUbhRtj4vTv7tdRAKrg2+AMIRA/k6lPgRzMEilqOnuQ28toicALNVEExgAEQOpBw
 c95ZnFECxmfXI1nTt1sk7cxn4yP9mzPOV7sdHmA6xCEr66ttxqqaqlWlRbYYdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k/j2QTnd
Subject: Re: [Buildroot] [PATCH v2] package/mpg123: fix linking error
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 8 Aug 2023 08:54:49 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> This was introduced since commit f8af24707b196eb64121d29a829fc31b5506409c.
> 
> Patch was provided by upstream:
> https://sourceforge.net/p/mpg123/bugs/353/
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/74e/74e1522cc9328c98186ca730eeb7ce0cb5fbbcb5
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>  - add a specific autobuild failure
>  - use Fixes: for link to autobuilder
>  - add a reference to a buildroot commit, when the problem was
>    introduced
> ---
>  package/mpg123/0001-mpg123-buildfix.patch | 24 +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/mpg123/0001-mpg123-buildfix.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
