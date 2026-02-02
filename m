Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E79E7FDE0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09AF081EB9;
	Mon,  2 Feb 2026 22:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ee9D04qf-492; Mon,  2 Feb 2026 22:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D051822C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070530;
	bh=FZ1BuKG9sIUNdWPvacqwfm3IAFy+Uuf2M5aSs6RCo6A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n2QQcyeqTf7qrcSjzvMFpBsVhwbGRa1PieKAvIQA5iIuw5C6itR2RAmR3aoPzcqfj
	 /pSrPCSwKr4iPNEPHZFajbBhuXmDh9+L5W6kWZomt7xxARXD+SwgCdFaJv82eFfrxf
	 NMawXNhB12JFGyDVnmBFrD3ppd8Gt57tiV5mRa84PiZEEwE/wHhfupwinTjSVjdi1a
	 uFIbsdHAR9/dD1acnQyRP1V8kGEWJTN2yCEI8W60gmkp+yg7+0gsrbsKiWrQed94Iw
	 wD8/Q1i79cgarrS26vk9b2vmutsR2iy+gXag/WJ2O+FDpFn8w13YGDd64NK7srmMsB
	 r4ZOLVHHCA44Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D051822C1;
	Mon,  2 Feb 2026 22:15:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0532AF5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D99E1822C1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5biSVWwmlhq for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0143A81EB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0143A81EB9
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0143A81EB9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 60E88C237F6;
 Mon,  2 Feb 2026 22:15:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 72D6860767;
 Mon,  2 Feb 2026 22:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B893119A8891; Mon,  2 Feb 2026 23:15:22 +0100 (CET)
Date: Mon, 2 Feb 2026 23:15:22 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <aYEh2bxpSzVWD8cG@windsurf>
References: <20260107140858.129302-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107140858.129302-1-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770070523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=oKf5u/jhko3zKDRLu7qdVT3AT5XunNaZPhcibP6seoo=;
 b=TngqlviM/KO5qLKH6aMoEc35cURDqfOzNpV8ktFnmlkR259rqRbXhLVOche6Etv/xp6P7H
 ntp6BJ1s2/71P4aU7WJooy+z6vW03yfP/oGlTWL7FL6LsH3tAKfwfXWhp/q6hGCZlV/73j
 Em9vXxWXJGgD9VD7Fk1L+hmKcuX1nzkV4gqCOQdYV5/k0JIf4B2aOH6GeMeCPIrzsAgs4Z
 i2rAk4aemYOvCNN5S+Fy7YjAvFofOXS4i0ZZj128Fc+f+PwLViooStynZKNaE2dm/tJfCY
 iPq4Z94iAcaZKug2tRGF3kJhQr1iJnt1ADUrHjwf+SaVPOwY1c00SwekRKHBpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TngqlviM
Subject: Re: [Buildroot] [PATCH v2 1/3] package/collectd: enforce c++17
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

On Wed, Jan 07, 2026 at 03:08:45PM +0100, Michael Nosthoff via buildroot wrote:
> abseil since 20250512.0 and hence protobuf/grpc now need C++17.
> collectd in the currently used version sets C++ to 11.
> So bump the C++ Version used when building collectd like it was done
> before to bump it to C++14 in commit 5fcc4e19602ad37d018ccf3543fe82a291837f43
> with patch 0002.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

I've significantly reworded the commit message, which I believe was
still quite confusing, and then I applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
