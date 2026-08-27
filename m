Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC52C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6807960825;
	Thu, 27 Aug 2026 20:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjaMmuq1rFZW; Thu, 27 Aug 2026 20:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787861848;
	bh=mPkIfowrxTiiF6tyXdkyjFNxV8UdpCbcNbQW7b78z3Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=izbh5IYVpaxJcbet2CQjeQN0ozIwrLF7rnQOpXgwo48DLai5CetKxdRkE372YK7Ar
	 Tt1RjOmVs6OUIgc9mgymfX60kWJ30DgHjNDfrP8g4A5dm5a8fA0UoysfhQzrScnLrh
	 +hDp/eYWg3kF08C3lNhRpJGUu24JfLmrzMDpaI3p1ppIPcJinCOq7bVegIHw+XWdNO
	 uW3Bz9nrBzUezFyYAbr+L6pbv9b4PqrE+oN4C3XqUbTjbb7A3rDKKQLEAWa3PuKPZT
	 KYRCD3ofQ+Tg09STmhRVm/nF8oGZM77cv2BtDSCKdJRXYuSthGOKslvDo9GUviLBl2
	 QGc4YuA3UFAAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD9E36070B;
	Thu, 27 Aug 2026 20:17:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7137B2C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD65040697
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeofN4NGInSY for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:17:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE3CB405FF
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:17:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F09D54E413E6
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:17:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C0DA05FFF4;
 Thu, 27 Aug 2026 20:17:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 186C111C78023; 
 Thu, 27 Aug 2026 22:17:18 +0200 (CEST)
Date: Thu, 27 Aug 2026 22:17:18 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <apCa75D8DdbyTwPo@windsurf>
References: <apBarq7is6OL_UQu@windsurf>
 <20260827173328.8765-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827173328.8765-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: always use
 BR2_BACKUP_SITE in the autobuilders
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

On Thu, Aug 27, 2026 at 07:33:28PM +0200, Thomas Perale wrote:

> Yes that's what I meant. Since doing this verification by the autobuilders is
> an issue you could move the verification and publishing of the stale entries
> from the machine hosting the sources. 
> 
> Since it already has the responsability to download all the entries, it seems
> like a perfect candidate to detect stale locations.
> Unless 'update-br-mirror' script only trigger a the download if a new location
> is detected ?

It does "make source" so it only triggers a download if the file is
not already in the cache. And typically dead upstream servers are used
to host dead projects, which don't see releases very often, and
therefore we likely already have the tarball in our cache.

> What I'm afraid of with the HTTP header solution proposed is that it's gonna be
> burried in logs that would be quickly forgotten about. The current solution
> while generating a lot of false positive manage to catch some real stale
> locations publicly.

True, but it's also generating a lot of noise.

To be honest, I am not 100% sure my proposal is the best solution, but
if we're aiming to reduce the number of build failures, dropping false
positives is important.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
