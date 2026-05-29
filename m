Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE862CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12CFD4089A;
	Fri, 29 May 2026 09:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SmKMIrp2jxU; Fri, 29 May 2026 09:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06A604066B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780048269;
	bh=UnAgmrmbfgoob4IMklvGlhyvndrg2N9zOpob4m4CO9k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=raue2Zz2tu2DaxjTz0hCvpeIq8VKGmu9tcQgPQaDkRzajKruRCigljpbrsi/tDC14
	 Im0GB3hPAxeVXap+aJCpUJtbEz/UmHMn5InxRTYJeDqmTDrKGygRrDpXLHPS1kfrtu
	 NEXXGEHNwPsX8T2hLSwcVbWKre+U95CMj5ESnQGTyxo/Nep9SPLZnmVYFuL2T/9Vsb
	 38m/3u1pGuGzOIQ4N+7DeTkroJfvHFQtO+M+XcnhNN5Xt1AJxuvGHRPJdO7AtBVrGi
	 tijij08xit7bwqrJHyhARrjvX3IbBcHPMGH2rBYowN++xs1VZjs/Hf3LzdH3HDUuw4
	 4xrE8M5ed3b6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A604066B;
	Fri, 29 May 2026 09:51:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 641C8D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 452DB416B9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpdD461kD6ZA for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D87940370
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D87940370
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D87940370
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:51:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2E8364E42D88
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:51:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F3D16601FA;
 Fri, 29 May 2026 09:51:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC7E71088805F; 
 Fri, 29 May 2026 11:51:03 +0200 (CEST)
Date: Fri, 29 May 2026 11:51:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ahlgatr3no6Le9KW@windsurf>
References: <20260419090115.1129567-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260419090115.1129567-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780048264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=DrlWaCs7rMRjSfyo0/xTet0+AIFoczCPOhEcyC5Rq9k=;
 b=cAJAwUyKnalX+sQ2tKkXtE2hppR2/bVXM9A0O0N5RQZODMbG1f8GW6Bh3Fgf6TwwY6lQ56
 rCtwzz7F9An+BSO5PWykjRs1urkwYAPen95eAbTdbdcu2YA0NHgqqgJED2LUOu75rDyNbq
 Ok57GpIZE0eWLbAOvzofpbaNsPUZD/HzDGfXvSCfIGrJZGwTQwCct+dU7RcWbOSCG3TWWV
 dawh84g7FyOx1SzR6amcftCVWOhzWsXNpOxIKfwHEp7nsa6FkwvBlXCSsNp1yACoA5Cxw2
 P2A6cMJpzGyh4CydWVDA3iAfks0B05yxYA8++SsmKSVpYPEr5EHj9jR3F88byg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cAJAwUyK
Subject: Re: [Buildroot] [PATCH 1/1] package/zeek: add various fixes for gcc
 >= 15.x
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

On Sun, Apr 19, 2026 at 11:01:15AM +0200, Bernd Kuhls wrote:

> Our zeek release 4.1.1 dates back to 2021 with > 8000 patches applied
> to upstream since then, current version is 8.1.1. Backporting python-
> related patches to fix the build of zeekctl looks really difficult due
> to many changes in the 3rd-party libraries/submodules used by zeek.

We discussed this during the ongoing hackathon, and we agreed that
removing zeek was the best course of action, so I just pushed to
master a commit doing this.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
