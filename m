Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D1EC5AD55
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 20:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F40E605C9;
	Sun,  9 Aug 2026 20:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRO6Oob7MRwV; Sun,  9 Aug 2026 20:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71647605E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786308370;
	bh=O7ZTz9WlPc7ra/mTZJVOHHDqqnvGkr58cGbqdHAlFTs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HfeiDh52P1DFMJNk99K0Fz0uzykZFkiYfYNOF11hVDRoO/Br/1YjyeVU31Uuqc9PV
	 NrjkADbENorHuLwb4N4Hr0ijwneqm+ipmum+Kt2lKQyXauJG2MLSQFCWt3WK/Qijoe
	 n/fey8xxDxoptIJWmO5m+Rz7k09a/86U0VlIZOOHG/jLZvrJpu4vi/IhOIV7Z4rkP/
	 J6Sv6+LpIIy0noY9rXVOwuhlTBGAKhUhO6jZz7xujC3o+Jkhwe/mbJRN2IAp4z/QjO
	 Wv1E4d8iq6DIF1KEIytY/bkf5fFqdGnAuu8vdHD/148k6s/RiKNvDbT+NvexPA1DcB
	 Df3igMdKni1Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71647605E6;
	Sun,  9 Aug 2026 20:46:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DAC5F282
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D89614006E
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUAjCSV_7zyD for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 20:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D4834004B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D4834004B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D4834004B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:46:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0FD0C1A1504;
 Sun,  9 Aug 2026 20:46:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C74AE6033B;
 Sun,  9 Aug 2026 20:46:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 049A911C4955E; 
 Sun,  9 Aug 2026 22:45:59 +0200 (CEST)
Date: Sun, 9 Aug 2026 22:45:59 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <anjm8rL5fUlUSu00@windsurf>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
 <20260807125510.1285300-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260807125510.1285300-2-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786308360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=KT7WA4jqoOqL+ztqrAYJh8LNf5h7PickVblY/mBfuHM=;
 b=LImBOGzC7htVseLAA651twnwzf3R79GKFSbeD6W/7mB0i3pH3bp+EAWnbE9hSpqGBq6B4R
 2SRta6fj3HFl2MrYT4ndsR6q1SNZbo9IOG9dVaA2GN3ribV4GCbb5K/EfoX33Df19JNq8b
 f3rNmIeU2Gc8FzumqSzMsGeA9lQicHMrVG1BAwfuLlQoxpYMxfJXHxR/MxwDvga0PDOl6c
 8BchPMTE7B+F8V4lNvZnXdsPkcpjGdCShLrq2BvszW2qWUnkrut7CFDrBAO99wWClSaCyg
 U0uLU/8f9z3B/Fj4kBCkHHuG9E8lMBI/xnMvyxMjmELVgDxnZazNvixth+5gnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LImBOGzC
Subject: Re: [Buildroot] [PATCH 02/11] package/mender-update-modules: fix
 license hash
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

Hello Adam,

On Fri, Aug 07, 2026 at 02:55:01PM +0200, Adam Duskett wrote:
> Fixes:
> https://autobuild.buildroot.net/results/5afb0ab3362cb67014f470dd976449b756224566/
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Thanks for the patch. Which commit/version bump introduced this issue?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
