Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B45ECA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 12:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37D93842B4;
	Fri, 29 Aug 2025 12:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfKlvckvpZJm; Fri, 29 Aug 2025 12:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 553978232E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 553978232E;
	Fri, 29 Aug 2025 12:01:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E0B5D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 12:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FCEB615F6
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 12:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NInwDULhdpE for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 12:01:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A270F615EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A270F615EE
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A270F615EE
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 12:01:21 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id D97CCE0069B; Fri, 29 Aug 2025 14:01:18 +0200 (CEST)
Date: Fri, 29 Aug 2025 14:01:18 +0200
From: Florian Larysch <fl@n621.de>
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	buildroot@buildroot.org
Message-ID: <20250829120118.dtvlqcbgknvuupen@n621.de>
References: <20250725184609.3794-1-fl@n621.de>
 <20250728225205.2c22044b@windsurf>
 <20250728212043.uxfacpm3fovokhcq@n621.de>
 <3b344658-7e1d-43e9-89bf-c776ba0c39b6@smile.fr>
 <20250810181749.43yrkmkud44pxwib@n621.de>
 <25600b94-4bf4-4be0-a446-e36114c8f38e@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25600b94-4bf4-4be0-a446-e36114c8f38e@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1756468878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=luBcIY2L87ekXqyYG9zUdQlAr45nJlzAgQerTWr3/Bg=;
 b=g/vUL0uxtNVIfrciiyvc+pO8noBKgzXIrqWfENeQvU2tz9V7reVTQhGM78YjpjynAQGIR0
 k9ZDQ238qffQm5B78rvfJuaJJJysnkIWE2ByPe4NzUA+2tHR6gFj/jqUxeTe8I/nmdH4pp
 YQNL7sb8ZS/EBAqUXesTtwV15oSb2bc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=g/vUL0ux
Subject: Re: [Buildroot] [PATCH 1/1] package/libmbus: switch to git repo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Aug 24, 2025 at 04:41:16PM +0200, Romain Naour via buildroot wrote:
> Ok, feel free to add a new entry in DEVELOPERS file then.
> 
> I'll mark this patch as "Changes requested".

Okay, I'll respin the series and adopt the package.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
