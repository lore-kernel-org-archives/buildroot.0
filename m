Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED22FC61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 19:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20D8680F31;
	Fri, 28 Aug 2026 19:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQB1HDdUJqFC; Fri, 28 Aug 2026 19:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787944487;
	bh=JyKuYGojVuyarWNneC5oD9U3ZesUtuiPEfJ2ql/DFmw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FztUkzusiG75r+0JDftr1m28joneAcRP4R/mzGUt9vBPRV1iTDo1kWuyVzb/TKSx+
	 fV9xBIIuzQ/xsDJBudG6aHPmSgHd8SMlhmZbJwFquY0o5Y1ywvIOiM4eTqIZ4L4cgY
	 67d3uHu5sx2QY4apDUyDrTMYn3+2Zzz6qIQmlCyMEltP2oKQ03nuES4raJQAPGm2oE
	 bgol4hdAqXf5tATdSugsKYUs1JUZnhqnVn243USO12LyO3QMVT89cuGsQIURMxU6xq
	 d2YyH7r5bXf2yPagXCJnUeqXuMX0gwxABkHvgdN+j5UYZzYRWhRDCCHEVFFz4gtqzg
	 xLtwhEJxuZ7tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DAF280E1D;
	Fri, 28 Aug 2026 19:14:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 364ED23E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27D8C606B6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaWIozGRNucx for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 19:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31A3460679
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:14:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CBC604E41407;
 Fri, 28 Aug 2026 19:14:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A094B60537;
 Fri, 28 Aug 2026 19:14:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC47411C78082; 
 Fri, 28 Aug 2026 21:14:34 +0200 (CEST)
Date: Fri, 28 Aug 2026 21:14:33 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
Message-ID: <apHdyUUu88PQur7A@windsurf>
References: <20260827040513.3903-1-br025@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827040513.3903-1-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libnfs: update version to 7.0.0
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

On Thu, Aug 27, 2026 at 06:05:12AM +0200, Andreas Ziegler wrote:
> New version contains all current patches, plus one that fixes
> "undefined reference to 'gnutls_*'" if libnfs was built with
> GnuTLS support
> 
> Change log:
> https://github.com/sahlberg/libnfs/compare/libnfs-6.0.2...libnfs-7.0.0
> 
> Fixes:
> https://autobuild.buildroot.net/results/b07/b070248b2bceaceaaed8e826b1247ccfba1ba9fb
> https://autobuild.buildroot.net/results/e14/e1461b76121addd8f04f08819b2e3e453a12c679
> https://autobuild.buildroot.net/results/87c/87c79193d2ea86f47e36232fe514837ad99c5f30
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Thanks for the patch, I was precisely investigating this build issue.

However, we need more than a version bump: we need to understand since
when the problem exists, so that we can understand whether the issue
needs to be fixed in one of our maintained branches (most notably
2025.02.x). And if that's the case, rather than a version bump, we'd
prefer to have a fix backport, unless of course the fix is massive
and/or difficult to backport.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
