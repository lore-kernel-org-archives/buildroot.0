Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2378F3381E
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 09:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0EB583DE6;
	Tue, 17 Mar 2026 09:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qD9qqApfnaV; Tue, 17 Mar 2026 09:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7B5B83E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773738488;
	bh=OHAq1a3hqfyGQ14zTVosxsZWDV4SWnR3mCwYavRN9C8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nob76p2sY/LrMlHR8OdrP3h6f179kZ6VNgnthMPquZHXf/CiWXLejBMsFfeLRy122
	 7/gRtusIPL6QHQJQNOZPUf6CH5lo3qOMdocgCNBKS402ItkdEtSmiS893oQHejBUT+
	 1uRu5rUkm//OUz9PJviTTem803jChuXW666ibqMUi5g+pr4luHoWaNDYqYJaKUWgt+
	 c5WEfBZut9g+VGWW6otM9qMwC9LF6lhNCuJG0wXq8yc0DvPoWqR7GUlTpVKOG+tVSr
	 VOQa5F2txQP7Sy8DWrY2Kub3Q7b2cDuh+P17/ocvCwfZZAR4cIXu110G/6D34wUfrJ
	 3wA3jL9AZjXxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B5B83E37;
	Tue, 17 Mar 2026 09:08:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96BDA1B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C55683E37
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiyuJB4YfnFN for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 09:08:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AB9483DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AB9483DE6
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AB9483DE6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:08:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D3D75C55056
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:08:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9A5445FC9A;
 Tue, 17 Mar 2026 09:08:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D03F10450425; Tue, 17 Mar 2026 10:08:01 +0100 (CET)
Date: Tue, 17 Mar 2026 10:08:00 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <abkZkgE3Qe7wvaOr@windsurf>
References: <20260317074923.981623-1-chakrabortyshubham66@gmail.com>
 <abkJYg9QXlB-Lrii@windsurf>
 <CABvxkszOWB5WVYyqnktqvyYp=9tOyha17vB4xTUtOm1ERhcc7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABvxkszOWB5WVYyqnktqvyYp=9tOyha17vB4xTUtOm1ERhcc7A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773738482; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=4bbaw69I6f3IjN1QrFLetShbhtoj+4LifMDJqKAVukE=;
 b=gg/rYLIC6orHMJ642HLSu1HFSGoVp0byPp+ofL4QTzdU/xT8uBr9zGnCFJhTdgUW468kA9
 WVLgYKYr3KJ7nKSiA53g2TBSN/1BM2/nI5hlhtYOnP1WuuvceExUbRGaAifBzUF3csCzTa
 ddFF5IjzVF3KQo2zwOJyCn6QP1kbvfENVQQEQHbcM25/CNQRnZhmjUjGTfig+l5LnFdlQJ
 UGmp6P2qNW0HFFLNUN/oJ18r4/WlgYe6Pv0dPbMmJRYH8tLgLyzp26TEHQCtxu1FA0MhT7
 b1Eob4Ysi+GRHT33Nw/nrzy40K+KWf1Pbt2/esZEXOH0nrLSza/Xttdm2KW1MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gg/rYLIC
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: add support for
 uninstalling packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, Mar 17, 2026 at 01:41:25PM +0530, Shubham Chakraborty wrote:

> I didn't consider reverse dependencies. The scenario you described
> (uninstalling openssl breaking ntp) is a
> serious problem that makes the current implementation unsafe.
> 
> I see a few potential approaches to address this:
> 
>  1. Add dependency checking that refuses to uninstall if reverse
> dependencies exist (similar to package managers like apt/dnf)

This would make the feature useless for a significant number of
packages I'd say.

>  2. Implement cascade uninstall (uninstall the package and all its reverse
> dependencies)

This would probably be the logical thing, I guess?

>  4. Simply document this as a "use at your own risk" feature for advanced
> debugging scenarios
> 
> I wanted to ask: would any of these approaches be acceptable for Buildroot?
> Or is the fundamental issue that without proper
> dependency tracking during uninstall, this feature is too dangerous to
> include regardless of warnings/checks?

This has so far been the project's opinion on this topic. But nothing
is set in stone forever, so we can always revisit/rediscuss things.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
