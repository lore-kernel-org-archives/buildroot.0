Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF53C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 15:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 864D6407C6;
	Thu, 27 Aug 2026 15:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3P7sTTY-bZH; Thu, 27 Aug 2026 15:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787845378;
	bh=Lye9/DEoT0hXvavt4jWFBc4zHoTYS0+HcFkwznqiiUI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TFQrVPDC8/klN4/HDzD61lpkOFVQAVFZUGsQc7vXjO1rsBQp8la+HcjBRdLw6825H
	 DY+l8YpDmkIFYpxB69WxsNhu83Hf5+4ANXgIs8spEiEPUuBRMHaAfLkwWJlmPWrZbP
	 pOGWVoseexDpbE/3xq/Q9i61woahV+LpeMjlsYrvZiH7TeRDnEAIr0mAu7Qv/atJKO
	 dH+VKEjZwFTUg1SLqaNJPdVcjqh/m/99L3H+K2cA8NX0UlLfaRazPc/1nN3BVVETgS
	 6AuAYcjW8FnT3cX0z07Owr/b71DNQMBQXMGNe9/AMvCBGt9iVF29yw9VBqnsouTKNj
	 G7cwH599Xjh4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1B1E406E2;
	Thu, 27 Aug 2026 15:42:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B03F334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 15:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BBD6406E2
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 15:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVspReJdBV1v for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 15:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13D24406D9
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 15:42:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 999A81A185F
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 15:42:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6709B602B8;
 Thu, 27 Aug 2026 15:42:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A378011C780CB; 
 Thu, 27 Aug 2026 17:42:47 +0200 (CEST)
Date: Thu, 27 Aug 2026 17:42:46 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <apBarq7is6OL_UQu@windsurf>
References: <20260826155155.4146765-1-thomas.petazzoni@bootlin.com>
 <20260827152922.453102-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827152922.453102-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: always use
 BR2_BACKUP_SITE in the autobuilders
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

On Thu, Aug 27, 2026 at 05:29:22PM +0200, Thomas Perale wrote:

> How and how often are the 'source.buildroot.net' backups generated right now ?

Pretty much constantly:

3 */2 * * * flock -n /home/brmirror/br-mirror.lock /home/brmirror/bin/update-br-mirror.sh >/dev/null 2>&1 || true

> By reading this paragraph I'm thinking the upstream location check could be
> coupled to the generation of the backups instead.

I'm not sure to understand what you mean. The "upstream location
check" is done by the build machines, which are completely distinct
from the machine hosting sources.b.o and doing the mirroring.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
