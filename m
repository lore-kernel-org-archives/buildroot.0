Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783EFC982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3806561651;
	Fri, 16 Jan 2026 21:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WC9luYH3Ha5J; Fri, 16 Jan 2026 21:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C13376164A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768598820;
	bh=IRg0T1mIaPtHqqnCq059P/5RdOW4pImifiOwKez0rPQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OloYPEKAbr7AVN/3nD7rzMIDUVaTkiHtSH7pQHWHY4nwbN7FKgIQK//+XqX9FTuzO
	 7lWFQL4G0tZZhzRBYfrYClIaGMb9hMj1l4JAvY88MYu75ynbCGzEhTFuDacQHg5TGC
	 gytr8dte4+UnRPkzah+ceb/BTP1YN8GXaCOJvp40vUm9KLiutmMse+etE3s18yUgY+
	 AiZzkW9NBV3tNu8W1MHnggPm2sY1r+B6ZSr/iCp7aMZ0759PUFHg+Q9i6G5rnyDBdi
	 YtDtUaY5jjxlffd/JIxOjPceDj0z4H7UCYf5vwvCyuAIGH4h1VtvFLw26tyVRFyKPM
	 CJ6PglLtRhV5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C13376164A;
	Fri, 16 Jan 2026 21:27:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BDA2160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BE34401CB
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c99W90XESg2u for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:26:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AA40400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA40400FF
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AA40400FF
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:26:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1DDB51A28C8
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:26:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DF41D606F9;
 Fri, 16 Jan 2026 21:26:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D04110B68CC3; Fri, 16 Jan 2026 22:26:54 +0100 (CET)
Date: Fri, 16 Jan 2026 22:26:53 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aWqs4r1FGNf5CH_L@windsurf>
References: <20260114173925.1877799-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114173925.1877799-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768598814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=H197Id8O3yyvnBd/Ax+Y+5O4tJ201XolE4np5H40yAo=;
 b=hnffUucj5pplQF9/PmFuY3uoEtdeB8jyXsxsdQFy4Ubmpm38bOkv3mN6ihRLaMFEX2u+Ln
 6gpxumN5ZOUr3olz9lsj8CPfKpFLlkTzSbeIEM89MTl6EOiQMJGG8/GL0LTDyHuEY5/pVq
 0Q8pZudt00Zl+1BImBy97Kqvqm2JK5VunmrfNbgxWEZrv5sRfYph5MwfX2eCB8tAr8b4pv
 byJzYYqi7ML96xf+SIvPmA/V8V4Zl3Nrb1fcuqQaZfV5jo5ltHm7uTxYSARDQcgm1zWdz9
 K/RmvqCxQRWCxUlIJAY5u+pklC5y3QgTkRKGADJ3LeHyTULXB45fuPtE6MnGEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hnffUucj
Subject: Re: [Buildroot] [PATCH 1/1] package/rp-pppoe: update tarball URL
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

On Wed, Jan 14, 2026 at 06:39:25PM +0100, Bernd Kuhls wrote:
> The project moved its repo to codeberg.org:
> https://dianne.skoll.ca/pipermail/rp-pppoe/2025q3/000663.html
> 
> Updated tarball hash after verifying that no files changed, only the
> directory name changed from rp-pppoe-4.0/ to rp-pppoe/
> 
> Fixes:
> https://autobuild.buildroot.net/results/5ff/5fff21a4150a5f668d43830591e21b660299ed9d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

> -sha256  17d45712778f2bf6b0859ff610a3dacd24bc4462e9f53bb1466d47af391701d3  rp-pppoe-4.0.tar.gz
> +sha256  459904065fd4a70c927757d84cc7b4ef70946a707fa1b83f16246f925158b13e  4.0.tar.gz

It would have been nice to find a solution that allowed to have a
better tarball name, but I couldn't find a quick solution, so I
applied as-is. And anyway, having a different tarball name is needed
to not have clashes on the hash value.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
