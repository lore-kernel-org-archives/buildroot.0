Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFA8CD6E55
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EDEA61340;
	Fri, 29 May 2026 15:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZmJEzcdxOYP; Fri, 29 May 2026 15:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F4060EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780068978;
	bh=AobcbrQ6ZGNQm8e0HEl/7fwHocfPS3hp7S6sU8TU4NM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q7VT9vZmkEfn/6BkaKX52mNn8XBcaVpnzVC2WVmDWBIBq32sLeO5Y6QsZa9LgTg7Q
	 5fpo3dViNvazPjXvkOBMp4UxNc1carowM93HckUYD+SsxXl6HML0BRoiPZamSDLh8l
	 xJRleO/8QtZWZQaIlUoaHU6/VTSLRZ9ordxZSGU6iV59LCV/7APtgqpKWCqul+iPRQ
	 PdZSlJM6Rmmlz6ldH/Z9G+qNKcbOwzTZqaP4kW9YtXeRIWcRlFBqYYvETfNtPjjXk2
	 SBctajuTMrHCmVa1yISrH1cKNveHRCg9yHMkz2bEpPT3xLWZELm1vsuf1MsmhExif5
	 YgG8O3a9pZ5NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F4060EE3;
	Fri, 29 May 2026 15:36:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2365B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BBE0406E2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afZMWjsAM8Wa for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16367406CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16367406CF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16367406CF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:36:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B6F0EC6245E;
 Fri, 29 May 2026 15:36:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 08277601FA;
 Fri, 29 May 2026 15:36:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6D14310888CC2; 
 Fri, 29 May 2026 17:36:13 +0200 (CEST)
Date: Fri, 29 May 2026 17:36:12 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <ahmyNyrnNa_0uwdI@windsurf>
References: <20260529150631.447940-1-thomas.perale@mind.be>
 <20260529150631.447940-2-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529150631.447940-2-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780068973; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=x70ayKmpQ8wegtSmOX8N01J8r162Zvg/V7W96aOq+3A=;
 b=HYNFuVuHezyO6gqoe+0zh/fmPugZJ3eXHwIG4VUEIU4gt6ANju6iG1q5ENWI7cMYdCBef2
 97mdHj/fE6ftn/dtZQrJ98ojDwDHUnkPjzK8iHMdTHlrBVuOp7529qsJEpfWp7UQ8CUpGf
 pxpjc95W0Xz1Qo9ah0AK1DPWafzkh+xXooump3g+STzEhvHYkV1hHYPJvurOp/jndRsPNM
 nAv1jtJI+WHrP2mvoyTmPbpP3CwqUk881fLHKMWGLvmleQpyXePqSdfNGrYpYqUmcMjSIX
 I0PR5fULBs1HgAxIffv7agMO/MK1Cz8PAdbgE6L6zQv67g8ugLpOJcNokLCb3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=HYNFuVuH
Subject: Re: [Buildroot] [PATCH v2 2/5] support/scripts/cve-check: add
 indication how to run
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

On Fri, May 29, 2026 at 05:06:28PM +0200, Thomas Perale via buildroot wrote:
> Always run this script from the output of 'generate-cyclonedx'. Do not re-run
> this script over an already analysed SBOMs.

Minor nit: "an already analysed SBOM" (singular) or "already analysed
SBOMs" (plural). I've chosen the first form, in the commit message and
in the code itself.

Applied to master with this very minor nit fixed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
