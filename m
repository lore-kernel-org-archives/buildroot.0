Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D321ACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31211614FA;
	Fri, 29 May 2026 16:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pc0BUA8LYVLf; Fri, 29 May 2026 16:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 880F1614F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071387;
	bh=tShhZv3okN395kCYE4HbeLL+D78XjaySmCdP4CRxz3A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bXIaxwg1Nx3gWIBQIAMApkyplhkXqNrf6X7fFg+z5Ul3xzydcJLfrtRAOiJoUwfvh
	 SVRTAZZFaRywqhcG39ow9BWZqzgHdu08kHec0UDvZ5n0PDkg+PqyueNksju8p5EC5P
	 2c2bnihg/SU6TPI3W6QMQzBMFdW+RsdvQ3eRe2HkDdeUUo4N29s3SmvylEXhdR4rTf
	 K/3MJm7Nsk5/ixkd/A/38frJLI5ATsjb1HbOr8L/7z4jseKRqGgbfAuGzroFqBUNzy
	 3KIa8BSpNy9o3nkii2l5QRLlEps/iTtbcJLnJikhd7lrYVJSOVvk7D4SWrf8iYi/MF
	 bkquX7CK0Fmvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 880F1614F3;
	Fri, 29 May 2026 16:16:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A76372
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55FF7408AB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfuqmlV5doPX for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:16:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 722EA403DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722EA403DF
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 722EA403DF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:16:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C5B144E42D8A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:16:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 94F64601FA;
 Fri, 29 May 2026 16:16:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E00B010888CBC; 
 Fri, 29 May 2026 18:16:21 +0200 (CEST)
Date: Fri, 29 May 2026 18:16:21 +0200
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: buildroot@buildroot.org
Message-ID: <ahm7x4gQXNxBs-Ty@windsurf>
References: <20260516123325.612495-1-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260516123325.612495-1-jarkko@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780071382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=42BRz9cJ6KS+IxUatYjoiWMT+8twyPMnJwVwziMvPKs=;
 b=aKBj0S1pd+nZBIa3JXnWQl1NHON6EuoUM5ZpbWyWhLW4NIo5VCil6O4ktovYIiOuAGEXPm
 ST0RwCK7ut5WGbp/YUcsiWDEkfIVwwG9g29YGpC5Xk9qNc9OhnHT2S6vhLfu98Mi0HtGfA
 GbPjmkhoD8aP8olYoonauA62BOqUU9tPyCpl97cwf/2NOA+w5CfW8Efk6lpLRMrC+pDL0F
 JRjXCABiC7YC5CuutE6djinSdVty45Bj6bHaBVfciYPbdhyRRmH2uQMLWLT/ZX4D7YaTgQ
 +wny9hklGUjLScZ6JsCbPJ/ogUpVPzlKDu567W00FjUZvxtLOVuSNMrbiTB7hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=aKBj0S1p
Subject: Re: [Buildroot] [PATCH] package/quota: bump version to 4.11
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

On Sat, May 16, 2026 at 03:33:25PM +0300, Jarkko Sakkinen via buildroot wrote:
> Bump version to 4.11. Removed patches given [1] has:
> 
> * setproject: Fix openWRT build (Jan Kara)
> * setproject: fix openat() call (Konstantin Demin)
> 
> [1] https://sourceforge.net/p/linuxquota/code/ci/v4.11/tree/Changelog
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
