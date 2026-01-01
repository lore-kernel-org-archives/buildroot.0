Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AB1EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF4D81E11;
	Thu,  1 Jan 2026 09:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQHe0NdR_22X; Thu,  1 Jan 2026 09:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59C081DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260906;
	bh=O2DhE9TCsPhMueHUmzlY6zi4FJcV2RBK8lHlj1MdgME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HP3MjLlPC8Crs1VRrmM4frctgyHXcbmZlxW2ilrR+QjPH3j6XDKedoIz+WENPdltX
	 B8JNoP8ykeJyd6kqWp4apYFhy5wE+bfeUiEYS5Ib5N5j33iNk59lbSXA7kB29Q35A4
	 eR7qGWhrT1dzNhUyQIs9FNtvmd1N3nomPlCJ+5qHdjyR+rNW1HSly0xUPw52FLdKSp
	 xbZkv6O3L+Uc8wAxTm3Rd1ruG2ucN0oznFunZBraa/mwMxyvOfZ0t4VTt3tozeBlrf
	 DSbwSh8/2HnSfsL5ZZ+NKq8ZyCCsHFZoZlRdCgWBCGOluLyl7wJCCcu9Kih6QSdG82
	 XLzzOWEnYuoPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59C081DE5;
	Thu,  1 Jan 2026 09:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CFD7351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F380E81DE5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMk4j9l2xzvm for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0241781B71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0241781B71
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0241781B71
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 542FF4E41ED2;
 Thu,  1 Jan 2026 09:48:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2B25A606B6;
 Thu,  1 Jan 2026 09:48:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ECDDC113B0749; Thu,  1 Jan 2026 10:48:20 +0100 (CET)
Date: Thu, 1 Jan 2026 10:47:05 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <20260101104705.51d5d11c@windsurf>
In-Reply-To: <20251231221834.347467-1-james.hilliard1@gmail.com>
References: <20251231221834.347467-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=n0h8GoCZlfJxEmO5Ot0tJwpUvj1ZZ22odZL32TcAMug=;
 b=UDqw6ZspEP7mXYwS3rQjsg2sAqxiMGh/8eCNb0Uqi89KLkPRmCYo4OZDyDwEddfl0CeW94
 4MwdL7SOEeSEAAW0+aiNOfGvoSBE0vzwFJaCysAnW3P2Cfm+lzBVSXUwuwZIlJU3fMP8aD
 mrsa80uC9thZP9tfcvvncmIfCSVMn0JuVsrh4GQhUGkMKW7Z9FT4Fn2ckJp1UbDCruT3Ly
 VjtoL3w/xRr1JEKOOrMMjl7iieN12z0RP8CBvO9KJodVub8BunAE6C+GOMxFh8eMyfWH11
 KYpBPV5TrjZU9oXG1KQd4bxeNbwGt9fnhEopAUZGZLE7RCNVpvxscAw0c6vw/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=UDqw6Zsp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyalsa: bump to version
 1.2.14
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

On Wed, 31 Dec 2025 15:18:34 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pyalsa/python-pyalsa.hash | 4 ++--
>  package/python-pyalsa/python-pyalsa.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
