Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCE1E6E7F4
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E33E58141F;
	Tue,  3 Feb 2026 10:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5ZNisvjv1e1; Tue,  3 Feb 2026 10:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0191F81450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770115292;
	bh=78UZiR12OzPGrTyk/5iVxD/+vub+jEGkew2Hl+MfifU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rVCEHHod9ET0wN+51MXWy2JYiCA+Ln4jx6J2SGpvhOUEJxkYQG3Vq/UkKDUvRf3Mp
	 ssbvPWAb+ftmMFtGSA0l0qwvUaLfFEl9uTwrnf9dqfjMFUsPH0XPAWN46wIkBs5or6
	 yaIbo/ao7n8myNsAXCbQzm612ZRxxtQjRuqi8kW1DuUDa58HP+BbWkKDxwcFJBoH12
	 mMWPnPSY5Xn7YOKYeqTn8zHdoFdxv0UrikoMtNUML5SGvft5GomK5hzu2GofHIB0QM
	 ODhdO6yAZoKyDETlupTHRlJZ9wQdq1/Rz2iHVuwwqsiKWjF/en4rk3JWHUQS0qmc8e
	 inDkXqpnUUU0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0191F81450;
	Tue,  3 Feb 2026 10:41:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E308FF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3A0D81450
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEuxJVWDopGm for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5DB28141F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5DB28141F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5DB28141F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:41:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D360D4E423E2
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:41:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A947860728;
 Tue,  3 Feb 2026 10:41:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8763119A8888; Tue,  3 Feb 2026 11:41:25 +0100 (CET)
Date: Tue, 3 Feb 2026 11:41:24 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <aYHQjwF-IrYqiszL@windsurf>
References: <20260104172232.3437646-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104172232.3437646-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770115286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=+2FigrF6JoLS/rHW6kJAKMPJt8PohnPfEjGKup55oaU=;
 b=FY6aBABUzlZDacGEj4onGr71P6mlSNZuGDTQjQJGPTUE1FyEVNhWUQu1m93ie6pUXGbSnf
 vI/N/evyNLYQXVaxnOAn8zQkahUbC3pjCsrJXAsyeudBWGFX3XGrBHtcRWg92JJgipHtp3
 wgiLGIvXKVeqtLAJ0ulyTTSnWtB5x805AiioctmFv5DNTJCiBDcENzfzL1/4EyJibWqZsM
 AopymGsT1uufEDwrZLUfKE7IJ7S4u7DwtYD8/+uKXs3QxMJCZuV+ygtrNOArpUmgqVGPxK
 8JVIEtSdYlBZx1lQOFNzd+o3+L1pz7b6babcZYArUwcL5wpzv8dGYjO7o/Q9dA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FY6aBABU
Subject: Re: [Buildroot] [PATCH] package/bind: security bump version to
 9.20.17
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

On Sun, Jan 04, 2026 at 06:22:25PM +0100, Giulio Benetti wrote:
> Release notes:
> https://ftp.isc.org/isc/bind9/9.20.17/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.20.17/doc/arm/html/changelog.html
> 
> No new CVEs fixed compared to version 9.18.41.

I'm confused: your title says it's a security bump, but your commit
message says there are "no new CVEs fixed compared to version 9.18.41"
(which is the version that we have in Buildroot right now).

So is this a security bump, or not?

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
