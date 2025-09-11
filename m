Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE468CAC58D
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 07:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72B8881000;
	Thu, 11 Sep 2025 07:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmc_wx3N8twH; Thu, 11 Sep 2025 07:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5163780F93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5163780F93;
	Thu, 11 Sep 2025 07:29:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6976B234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 07:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47B7D80F6A
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 07:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPMb6x7DJXXH for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 07:29:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52AAF80F54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52AAF80F54
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52AAF80F54
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 07:29:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1074A1A0D9F;
 Thu, 11 Sep 2025 07:29:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DB18F606BB;
 Thu, 11 Sep 2025 07:29:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2082A102F27E1; 
 Thu, 11 Sep 2025 09:29:31 +0200 (CEST)
Date: Thu, 11 Sep 2025 09:29:28 +0200
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
Message-ID: <20250911092928.03712eca@windsurf>
In-Reply-To: <5d9e384c-27d1-4e2d-9976-04570b37b793@green-communications.fr>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-22-thomas.petazzoni@bootlin.com>
 <5d9e384c-27d1-4e2d-9976-04570b37b793@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757575780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AbUakugufqF2w9PujWDJmZNQFy0JjNFQvnfBqX078bQ=;
 b=j5UWcB29FpVikq/ctoTC7Qn9xcK3ZgNezBfbiLPfcYFCEIc+d3syAYe3amf2Zz4uwoynw2
 wBgP+iJZZ1rzwZf9YOtKeIuz7VT+bRgI2bpLmV+p0LkRsw2Gr4HjubfBDyx3XWI3vxCHCw
 dYuUmvyKmgvs6trUOEGkuFrHrv2K2A1VlLXXBIKLGFUWcXfFNBPIK6moXf8/cnB/TVtZlf
 McAgaRcp1crt9P0iGQpxvyfixWLUtbvM6kwJLBArHddtGVPFbrN8LaFKDfGaGYZRcfpmei
 Rbdd6wpPTTV5IJiEDPVlHdfUFRM3rHJFeSRd3KhrzXBMNIV7sG1D5MMXVjm9xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=j5UWcB29
Subject: Re: [Buildroot] [PATCH 21/23] package/xscreensaver: remove package
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

Hello Nicolas,

On Thu, 11 Sep 2025 09:27:21 +0200
Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr> wrote:

> On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> > As we're about to remove libgtk2, we must remove xscreensaver as it
> > depends on libgtk2.  
> 
> The latest version (6.12) on https://www.jwz.org/xscreensaver/ depends on gtk3. 
> I noticed it because the version I have on Debian (6.09) already depends on gtk3.

Thanks for the notice! However, I'm personally not that interested in
xscreensaver, so unless someone steps up to send a patch that updates
xscreensaver so that it works with gtk3, removing it will be the only
option.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
