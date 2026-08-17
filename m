Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EC3C5DF66
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 20:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 795F3607C9;
	Mon, 17 Aug 2026 20:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZdRHsZoF_rF; Mon, 17 Aug 2026 20:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A27860721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786998421;
	bh=ENXH6fWzuz09pzKWK7bm92J3zi5J0ue58bhZDKU0lUY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q4vzXiVS3C07n+Knkm7a3FPo41VhZh7T1PMeLXL5U4zie7ofEn9x6j0OiR+ZzF2u4
	 d6yNJ1VH+kRuzTzi6fL4MB8+FuNMjSclimy8VIrqEVR3PgjrlLs4sTKTGMvXRwSR7h
	 JoHEB4v6GqFDDa/nKaP6MDyrUdtrBXJ9J6dyRsqlh+r5qjB2G9J5VXyOdvQ7a9uhuT
	 R4Vd4Ep6NxiEWGKhn/suzAyWiJ8YcpRje8mDFMmrzr5s5ILwHGsXKVLKMLfTwylyf0
	 j8SSn8n3EHUf+z8tWHC449zzrOpOX0Z3lsDavOuTBDM4SFmbfRXnnyHGgwh9fReKvU
	 xsEsPAUkbh/zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A27860721;
	Mon, 17 Aug 2026 20:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3143B337
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 20:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2327B60721
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 20:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gmZx5bk4N5R for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 20:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3761606E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3761606E5
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3761606E5
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 20:26:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9374A4E41298
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 20:26:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6159D60352;
 Mon, 17 Aug 2026 20:26:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C42511C7428E; 
 Mon, 17 Aug 2026 22:26:50 +0200 (CEST)
Date: Mon, 17 Aug 2026 22:26:49 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aoNuO__aQMnMl0ni@windsurf>
References: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/unrar: bump to version 7.2.7
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

On Mon, Jul 13, 2026 at 05:07:07PM +0530, Shubham Chakraborty wrote:
> Upstream does not provide a per-release change log for the unrarsrc
> tarball itself, only for WinRAR. Fixed from Repology/rarlab that
> 7.2.7 is the latest unrarsrc release available at:
> 
>  - https://www.rarlab.com/rar/unrarsrc-7.2.7.tar.gz
>  - https://www.rarlab.com/WhatsNew.txt
> 
> While at it, mark CVE-2022-30333 as ignored, since it was already
> fixed upstream in 6.1.2 and is falsely flagged by buildroot autobuilder for this
> package.
> 
> Fixes CVE-2022-30333 (false positive, patched since 6.1.2/6.1.7).
>  - https://nvd.nist.gov/vuln/detail/CVE-2022-30333
>  - https://security-tracker.debian.org/tracker/CVE-2022-30333

Where do you see as being flagged affecting unrar in Buildroot? The
NVD database says this CVE affects versions up to 6.12. We're using
7.2.7, so we're not vulnerable.

https://security.buildroot.org/master/component/unrar doesn't show any
known vulnerability.

Could you clarify?

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
