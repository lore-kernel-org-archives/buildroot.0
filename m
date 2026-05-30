Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307A0CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 020F56089A;
	Sat, 30 May 2026 22:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOasz2E5bNPo; Sat, 30 May 2026 22:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D21B6089F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780179039;
	bh=5lifsw+4z6ugJrWKkFhGSSiYFgHBhypWaBJ8bSOemGk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PCpEakEsxomPZXcojKixba1KTc7NLs8b7jMT+wNC0SVMJH4ltmMR5S8Qg6zBh3Keg
	 TaPabac+4iDZ2ZELUXEqLkKVW7L4cInx/Exf/uUWc/087rxMpK6hsTGsGIyQGI02tE
	 8FIYkNeGgG9corKs6wA/2dqnQX28AeTQyDiXe5bjpIUtOdu6VGqgkUEcfXQ2OdCAWH
	 1DWjEnTpe4ajZ16bvH7W7RUZfC/ftm9XfyCxIIE5dZEvJoqZdLqFYUlmDH9Jpbp5lT
	 rhwY2IRpjW/B38Ix1DkF3CKQZyZ53xClmwlBaY6Q3okN/mlKFfAzt2Sr4g6hfXKVa5
	 blPoZ2CLkz+eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D21B6089F;
	Sat, 30 May 2026 22:10:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BEB4AF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B09606089F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWlnU_5U0Hj0 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0AE56089A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0AE56089A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0AE56089A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:10:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E2AB8C6246A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:10:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 809676073B;
 Sat, 30 May 2026 22:10:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94E1A10888CC7; 
 Sun, 31 May 2026 00:10:32 +0200 (CEST)
Date: Sun, 31 May 2026 00:10:31 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahtflblRB-XoMzK1@windsurf>
References: <20260412182023.96383-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260412182023.96383-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780179032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=PxYVsW49V7bsUUYrWw+xx2cIAdnNhh2o8kjUzsaV+RI=;
 b=k/XRXxRi2ktyJReTc/3ZVz4vgYZEMbhvqEGz6YUywee/kLXO5dhSsfS9OTsexdSqGkxtdh
 N4bC4PMmGgeMi83L8XcGM/PUDPjliLUnC54iV/ALxTluTt1lvylitsVI4WFIpUphL2ngFY
 Z/E35rqrD1c7x1JlTI43DJ5UL1mttMldND3zYdMwR61ruH+9Cu61qotD0TvEYwmFLEUPg7
 rHxweLtuAne/JNrXgmy1XzNbLiEyLx9dwUits0ZzqjHACRiP6rVv4gVhsN6hPatAFJO6F4
 V3ycNrDzwIyL7AEQQ/IaEA/gThSa7Xi12zvNGkZ7qHnIyzJKiahC1xNgn3Gb+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=k/XRXxRi
Subject: Re: [Buildroot] [PATCH] package/bash-completion: bump to version
 2.17.0
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

On Sun, Apr 12, 2026 at 11:50:22PM +0530, Shubham Chakraborty wrote:
> - Enhanced smartctl completion support
> - Added recursive directory handling improvements
> - Fixed rsync/scp/ssh file type handling
> - Improved BSD compatibility for rsync
> - Fixed chgrp completion typo

Where does this invented changelog comes from? Seems like a vague
summary generated by AI. Stop using AI to generate Buildroot
patches. We will reject all your patches if you continue to spam us
with contributions generated by AI.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9e9c8a5a0f..9b123af415 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3062,6 +3062,7 @@ F:	package/wolfssl/
>  N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
>  F:	package/ccache/
>  F:	package/hyperfine/
> +F:	package/bash-completion/

Alphabetic ordering is not correct.

> diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
> index 7e952e5b02..294ab65a2b 100644
> --- a/package/bash-completion/bash-completion.hash
> +++ b/package/bash-completion/bash-completion.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac  bash-completion-2.11.tar.xz
> -sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> +sha256  dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58  bash-completion-2.17.0.tar.xz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING

Changes to license files must be explained in the commit message.

But again: stop using AI. Focus on quality instead of quantity. You
are burning limited and precious maintainer review time.

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
