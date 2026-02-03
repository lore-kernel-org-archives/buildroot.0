Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D19E87835
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59C6660889;
	Tue,  3 Feb 2026 14:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MhgPNWeuiMl; Tue,  3 Feb 2026 14:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A3160874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770127787;
	bh=BiKcsGNHyiF1ynSUvKsRAQ0wFJXe+Yuzfg9prvDzQTA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VvEsynTuU1wIXocwo47QVwVAxeLOdiHLNwxAgiEVVuxAn9Hy7w42QleTtuxaCaO2a
	 8UUFSY7ypMVRMYUto6nvshvL75snkiwpraQei4xb1MQ8heh2/25s5EuXqpypErIQdD
	 efInRXMxAUPwGqTCbjrFS+umTLrB2hfixU23MCgXNAnJVzWV2k3VbZhTkq/3rRCgID
	 JV2i7qczj/W4FhaTLD/2S20rgBmecwSF7972SkqCCGSkc8qD2sU35T96ioRhb+FXgL
	 cR8DiInLDMFxi4NqR1SnnInblJxzfh5T0ImYC2V/80/A1sNp82BEjBOQ7LqY/XFq8l
	 Y3tWzJ1tk7fNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40A3160874;
	Tue,  3 Feb 2026 14:09:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 383BEF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 308B040BD4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94r2A4r6pauf for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:09:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED3E940BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED3E940BD3
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED3E940BD3
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:09:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B121DC1F1DF;
 Tue,  3 Feb 2026 14:09:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E84D60728;
 Tue,  3 Feb 2026 14:09:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C86A119A88EE; Tue,  3 Feb 2026 15:09:39 +0100 (CET)
Date: Tue, 3 Feb 2026 15:09:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <aYIBfKxiR5nrXP3-@windsurf>
References: <20260110133905.2518546-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260110133905.2518546-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770127781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=/hRXd36IOoLIEgTP2XqdsaGhJ+EDeTh54VD8KCBr72Q=;
 b=V5pqG4asLTeiIwfpUnUSh5KmsjQubseciVt4DffpnckyJgYvcgpHO4AVc+X+4Ck4GbfKWg
 jyH0y3s9pnkr1XxpS0v2fMnaQSYH5uWI84ZqLz0FzciWVwLcDYkBl08xw5R+NCpFqqHNGU
 OloFdTY401/Ly7Fo1Hl5zmsbMeIjMj4bI8UprS4+fnZmZ1hljST6kO3a68nMs8PUkWi/kb
 /3tm6qieKBuL5/GmC7q4zUFd7W4yqpvuJnohomsWR3qYBsGv2Oda1tV01ojClvf6jcFWKo
 2TAVlrO0RoyXSfEWr+oERQ2bXjDYAa2chz/R16gNEX3fzRR1zf1s9dzxmYZNpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=V5pqG4as
Subject: Re: [Buildroot] [PATCH 1/2] package/safeclib: fix build with
 gcc-14.x
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

On Sat, Jan 10, 2026 at 02:39:04PM +0100, Bernd Kuhls wrote:
> Backported two upstream patches to fix build errors introduced by the
> bump of gcc to 14.x.
> 
> Renamed patch 0001 to prepare its removal with the upcoming version bump
> of safelib, added Upstream: tag.

Adding the Upstream: tag in 0001 should have been a separate patch, so
I split that up. Also the renaming didn't make a lot of sense, so I
kept the same file name.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
