Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E541EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2420540874;
	Fri,  2 Jan 2026 17:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhcRnYK_JVRD; Fri,  2 Jan 2026 17:17:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F771406EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374257;
	bh=gtJxXVj6HXlZH5Ngc1k/1uFBFcurAh2Y8mwVcWsxSTA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RsHi019AhssWoPmxs9PYAP0LUW+q/PoVA8CnzhaDWMIdOugChLzjzHt4kagIMcNTu
	 uW2ROcbuVu6zWtZloFduaVae+xcy3Z7T+5k4klLkykeRfDzlzwc4nvPU4h5AKhXd/g
	 Z0JvZUJ9HOhD1Nsr0NZFAcMCtUsxEXHW1XzxTOfWAQDJzGlOMexgx7hCTphkEym8gN
	 vKGBIUGbbc/XRWsgxqN17DUQQ8mQvniktkShK1fZJ2CvUGY9Gole5uUTNH17CiOG/J
	 Yu0BMYrbQExoCO6oC+p4z+3RIoN/yOqwFOARHA43jhKO1MMlK1NxSIBo/bFXJYvPnn
	 TZYjrY4ahWTZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F771406EF;
	Fri,  2 Jan 2026 17:17:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86D8A351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7937680E90
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JQhyMd8pF4Q for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACC0A80E63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACC0A80E63
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACC0A80E63
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:17:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6CC2CC1C3B7;
 Fri,  2 Jan 2026 17:17:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3C29A606C7;
 Fri,  2 Jan 2026 17:17:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1AF40113B0718; Fri,  2 Jan 2026 18:17:31 +0100 (CET)
Date: Fri, 2 Jan 2026 18:17:30 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, James Hilliard
 <james.hilliard1@gmail.com>
Message-ID: <20260102181730.1c782d60@windsurf>
In-Reply-To: <20250811161809.3641323-2-fiona.klute@gmx.de>
References: <20250811161809.3641323-1-fiona.klute@gmx.de>
 <20250811161809.3641323-2-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767374252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xHjX7SrEeeHHTafsosUv7g0LZCCevBaoIHcC9FTYbzo=;
 b=s985eZ+tm6iHCvOWiUILemSjHNBTyOrWeyjKhvC7FPCfuOSvswbnAckfGCYoK/ZOSuiCfW
 AGlncIZpuCoLEN4tmpWbPe9ICSJ3qNrgscO+zrXJvnx/KNbdsId/F+hVMKrJR6JZpPBrWy
 iI0JfHVwTEnI3UO92+lImIZfklUTlVdlWfSir04GHObNMzoTsRM0sGDMewz60KoAIZ7l1y
 8pYX+9KC8onxxynC86MTjP3yECA5KjtJ2nGRfhAmNes6woCGT02eZjUPN4PTK8AbVI0t6X
 KQhspZHLnLDzMvn8ohSgUfIWHjx2xs3NrG8Ds8xD2+EY5NOyk+Q5skRTZM7s9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=s985eZ+t
Subject: Re: [Buildroot] [PATCH v2 1/7] package/elfutils: new option to
 enable building libdebuginfod for target
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

Hello Fiona,

On Mon, 11 Aug 2025 18:18:03 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This does not make debug info available, but allows building programs
> that link against libdebuginfod.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v1 -> v2:
> * add option to enable building libdebuginfod, instead of building it
>   if requirements are met

Whole series applied to master, with only very minor tweaks (dropping
"default n", simplifying comments on Config.in depends on, etc.)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
