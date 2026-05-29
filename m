Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3647CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E9B84ACF;
	Fri, 29 May 2026 21:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yOVCNMfQENh; Fri, 29 May 2026 21:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A56BE84AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780091627;
	bh=2NDGvEiCwRDnRdgM9Cl+y97pETt/ufTm+bOQDZaV3cA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=piqAHAq8L19jKxH588tnjgebN+jD6UG9LMh/RGJrOrU2gDAKo3jQW6lRlLZmUxw5X
	 mkYwmlcn84B8M8eH6zmhUOI3F/8RL9sM+IlX28wh5bl+GwNozaPLDc24CjqGPV9d19
	 ETdluq7/sgwyr3cBScd2pONOofma4wLQrkt8vcoNMlzHpefgNyDq4juVFymNQPBYz8
	 bvIbBlVMUQQh5uwhno8yYaunXNVKdUXCTPshhZNNqNTgwF6hPCd4blNNPF1R91wTjL
	 gns8CyUd+9/UxLSb1q4HpF3PI98W0A7VtIKdbqsmnEVurwruvv7DBn7BrFItKdLhOo
	 5J5612oKE5LWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A56BE84AD4;
	Fri, 29 May 2026 21:53:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60E86288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F87A84ACF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 399lNLRiQ06e for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:53:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FED684ACE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FED684ACE
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FED684ACE
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 652884E42D90;
 Fri, 29 May 2026 21:53:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1D5E1601FA;
 Fri, 29 May 2026 21:53:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0BB0C10888650; 
 Fri, 29 May 2026 23:53:40 +0200 (CEST)
Date: Fri, 29 May 2026 23:53:40 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahoK1xafvTn-Nf0S@windsurf>
References: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780091621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=MJZc5f8oHngu2ZPVl4kT+hXt4W28UO74HJzrLaSJoJ0=;
 b=RWUlFXBo79N1nJqActRZLUyPBdGyBu9x1Ssy3TY8zSoljveFY4Re2fpkPkntTxHtiEvmxA
 vmngpTzf62H3i9BfE8D6EybJSOfMneuQhopQ1kAq3yc7VNAeUp/D0UWpirbBDo5pWmoRjI
 amNS3mYR48PHn695q4k06BUnWc3ighmDZyLc4vbly9U3eW+PO6bfdPUphF31Zu6r8DtfKS
 Obl/rlfN8/qNOZi+Lvaj8djotwYun2gElgpGLiNVdgizzOSHE1duRvxECzM0veHOM+fz2S
 6TZdDhON39iNFP+2C/oN3LM8I+dp+2oY+CXabWxjsRRtIhSpWxMNCkbaJx5zhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=RWUlFXBo
Subject: Re: [Buildroot] [PATCH 1/3] package/libenca: bump to version 1.22
 and migrate to new upstream
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

On Sat, Apr 18, 2026 at 09:25:10PM +0530, Shubham Chakraborty wrote:
> The original upstream site (http://cihar.com/software/enca/) has been
> deprecated. The project has been revived and is now maintained at:
> https://github.com/Project-OSS-Revival/enca
> 
> Changes from 1.19 to 1.22:
> - Project moved to GitHub under Project-OSS-Revival organization
> - Updated build system and dependencies
> - Various bug fixes and improvements
> - Continued maintenance after original upstream abandonment
> 
> Updated:
> - Version from 1.19 to 1.22
> - Download site from dl.cihar.com to GitHub releases
> - Homepage URL to new GitHub repository
> 
> https://github.com/Project-OSS-Revival/enca/releases
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Thanks, applied to next!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
