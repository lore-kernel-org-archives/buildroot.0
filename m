Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65171C7114A
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 07:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BCC3408E0;
	Tue, 17 Jun 2025 07:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDglE_QxUhbU; Tue, 17 Jun 2025 07:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B035408F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B035408F6;
	Tue, 17 Jun 2025 07:24:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EBAB151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 07:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A50E408E0
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 07:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRq7XDSPAzOO for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 07:24:33 +0000 (UTC)
X-Greylist: delayed 518 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Jun 2025 07:24:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9661D4087A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9661D4087A
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9661D4087A
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 07:24:32 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 46A15BDE809C;
 Tue, 17 Jun 2025 09:15:51 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 07:15:51 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.38047.1750071190.2108631.buildroot@buildroot.org>
References: <mailman.38047.1750071190.2108631.buildroot@buildroot.org>
Message-ID: <756d3a2cab51640ce9e3f6730120cbe1@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1750144551; bh=rvUYUSM009kvEui4sVk4Nw/E47SLmOvHuJWnUXWfQ4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=oittnpWAQqnHC7UjkJtTgQRhzCO6Yk/+NP9yBwmWPr+WTZ1SkYULyzb5YIL1KBXwA
 HWCJlXMnaN7jPWkjMOvM4tHxxoiivKHVzcl8y4i0BgT9CdEvXT7+22bcM3vHWeO/MW
 ZnTmBmGap4OXfrauIwT8dtl3zwRGbs3ghnkdRsDc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=oittnpWA
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-06-14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona, everyone

On 2025-06-16 12:53, Fiona Klute wrote:

> Hi everyone,
> 
> you might've noticed there are a lot of autobuild failures for
> host-gobject-introspection errors recently. One example:
> https://autobuild.buildroot.org/results/b9904209e13c1e4ce496aaff2f194064d2a6c691/

I noticed a dramatic increase in autobuild errors, probably since May 02 
[1].

>  From the error messages it looks like *something* links against system
> libreadline, which then links against libncursesw from host-ncurses
> (probably due to the LD_LIBRARY_PATH override), isn't fully compatible,
> and then the warning
> 
>> /bin/sh: 
>> /home/autobuild/autobuild/instance-22/output-1/host/lib/libncursesw.so.6: 
>> no version information available (required by 
>> /usr/lib/libreadline.so.8)
> 
> somehow ends up in the linker command line (which seems like a bug in
> itself, probably in in GOI, regardless of library paths).

I suspect an error in the autobuild routine itself, but am neither 
familiar with the actual setup nor where the autobuild code is located, 
so am unable to confirm this.

> My problem is that I can't reproduce the issue, and without that I 
> don't
> see how I can figure out where exactly things go wrong. I tried on my
> regular build system, and also with the
> registry.gitlab.com/buildroot.org/buildroot/base:20250218.2110 image,
> and both built host-gobject-introspection just fine with config from 
> the
> linked autobuild run (and a few others I've tried).

With your example, I get an error building host-rust _before_ 
host-gobject-introspection is reached, while running 'make 
host-gobject-introspection' the task completes without an error.

In the past, reproduction of autobuild errors on my own build system was 
fairly consistent.

> Does anyone else have an idea, or a suggestion how to replicate the
> autobuild environment (because there must be some difference if it
> consistently fails there, but not with the container)?

> Best regards,
> Fiona

Kind regards,
Andreas

<cut>

[1] https://marc.info/?l=buildroot&m=174661114911988&w=2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
