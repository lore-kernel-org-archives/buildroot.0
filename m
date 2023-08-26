Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50026C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 19:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9DC281F69;
	Sat, 26 Aug 2023 19:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9DC281F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9V566mm7Ro7; Sat, 26 Aug 2023 19:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2222381F78;
	Sat, 26 Aug 2023 19:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2222381F78
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65B2E1BF82C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA234098A
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA234098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SpdVR0i-MpNs for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 19:53:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6061408E1
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 19:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6061408E1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 268C41C0003;
 Sat, 26 Aug 2023 19:53:17 +0000 (UTC)
Date: Sat, 26 Aug 2023 21:53:17 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230826215317.4fbcecc2@windsurf>
In-Reply-To: <ZNRodM7hgvo2nT4T@waldemar-brodkorb.de>
References: <ZNRodM7hgvo2nT4T@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693079598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXb1wx5tAc4g5aZcCYvT8VTY1kcVplODAAEj5Dtfc7s=;
 b=LVclIemx8w7R+GzrY4bDX99VoT0qV7/mYy8+19zXMrLcCRWHxwjLmR2TfTPIt13GW90Bj/
 YupPoJS60GTlvnx8LFENCUN6RRE7K7EY8is+wfFo/UbyeDTqUGk1Z//KuzJM/0jGjtzFI4
 hH+kXYa64YZet6wvrmSlb5jT6imHQa1K9SmijkSNzW6I1xpv+aNL9o18qyrbcoYYg0AwN2
 RKJe4x7tm4gk6kdYlyUIqXJrL+1oImutUGFYql+Fxjgrk5qtSWX/t2acZI8IMljDNX5lSZ
 F7QYOpY1TLh7QSuPd4rBGCaiowHLhORVl/TiAidmNjW9UnDVYu1Zsp95idzdow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LVclIemx
Subject: Re: [Buildroot] [PATCH] package/gcc: fix powerpc toolchain issues
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

On Thu, 10 Aug 2023 06:32:52 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Some of the powerpc CPU's supported by Buildroot are dual mode CPU's,
> which means 32 Bit and 64 Bit mode is supported.
> 
> See here the gcc documentation for details about --with-cpu-32:
> https://gcc.gnu.org/install/configure.html
> 
> See here for a discussion on the musl mailinglist about the error:
> https://inbox.vuxu.org/musl/20220722162900.GB1320090@port70.net/
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/450/4509d8cfb7d99beb4ef023f170490def1d90f92c
>  - http://autobuild.buildroot.net/results/654/6545a464d49f9f3c6740a5208cfad7f09ec4cb8b
>  - http://autobuild.buildroot.net/results/cf8/cf866d5320b069eb1e8b4f05e8e58de0ad2ec7b5
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---

Applied to master with an improved commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
