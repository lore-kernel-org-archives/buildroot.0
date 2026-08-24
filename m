Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A9C5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 19:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D5D780CA8;
	Mon, 24 Aug 2026 19:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PM5T6pG7UL-P; Mon, 24 Aug 2026 19:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787599489;
	bh=Q2h+ouR74wmKBkhuBvxQJXhyZk//SYgyX9r26AR/Ecs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AEG4YIndHygPULArm1ZMgCo88n5xXlk477BiJjP55HxG/swvGxF+SwoSHtODfc7V+
	 iCqL5wBqH5Jj+dsM0KRECZ45mQ2zEHFhMPrJFR5GNpxd/8MzXRdty4KRqQwc4iHhkO
	 RjqUfxWIXK0cmflVJlvt9ObbMS8JFPbUvlX7JJAQJsaAakqDAXgsnuyPsTBX+1bF7R
	 DpIFWOOSZqEXNvlGqdry7BqTJZeTgimJx8OLY8/ofb9P6ZCxWTYxAgCajcN3+jEZhr
	 lCfE4a9/oA+jkBO/DlxzMPLP6HAHMyLCctwJe2Cjke4CEEE9ROYN08YEPrf5gdv7F7
	 YFTUDudTv23dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BF5280CB8;
	Mon, 24 Aug 2026 19:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E310D4B8
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4EE2400A2
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzvJkrm3DX57 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 19:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D48B840083
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:24:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E17F01A1804;
 Mon, 24 Aug 2026 19:24:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B09DE5FFC1;
 Mon, 24 Aug 2026 19:24:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4412F11C79B32; 
 Mon, 24 Aug 2026 21:24:37 +0200 (CEST)
Date: Mon, 24 Aug 2026 21:24:37 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, 
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <aoyaaO07A4YIzDj2@windsurf>
References: <20260811120530.130487-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260811120530.130487-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] docs/manual: update 'releases' to
 reflect LTS changes
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

On Tue, Aug 11, 2026 at 02:05:29PM +0200, Thomas Perale via buildroot wrote:
> With the release of 2025.02, LTS releases are now made every two years
> with a 3-year support.
> 
> This reflect the table showed at https://lts.buildroot.org/#releases.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
