Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61BECD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60F7610CB;
	Sat, 30 May 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8kYPaOCYfBr; Sat, 30 May 2026 13:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 461F660DE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146510;
	bh=/lo+4MALItQF7bgpIa47bAdxrBGYWMQSzxbWi1tuXpo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K1E2SU4eJX0zh92Ep43c/XnVk/1hQ2HXzPibw8pSHicbnmQDuCLiB111RrPBfxd6I
	 lYFBqiLAhNv++2wRVjl3JL3Qetf/v21eV/uEwhsHokBjClzHAZ47fEtqdmxvtzcyD3
	 0kGpg118al0d/cAlXpiV2K2drPujId/eI9YqShyqlVGQmJY39xGN072UeqRIKbulMk
	 TUvn3XkCIuIWDnpPEMDLdE9LHhjTi2sHVVh9GYWurGyawB59NJT+Gaddr3lSkOynv4
	 GPvdjYD3GPVPIk/ac2pqcYTSAP0k8DOdvOs6uwMDd37mD0SN9SqUXLdpZ7oMC1pLHx
	 NSrxuofY2W5Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 461F660DE0;
	Sat, 30 May 2026 13:08:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99843F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ABBC85312
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3pYKY1I6vfi for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:08:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AE4485307
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE4485307
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AE4485307
 for <buildroot@busybox.net>; Sat, 30 May 2026 13:08:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 65CA81A3753
 for <buildroot@busybox.net>; Sat, 30 May 2026 13:08:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3B1566073B;
 Sat, 30 May 2026 13:08:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E28710888054; 
 Sat, 30 May 2026 15:08:23 +0200 (CEST)
Date: Sat, 30 May 2026 15:08:23 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <ahrhN1xUoL1KfnpZ@windsurf>
References: <20260116110503.808971-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260116110503.808971-1-francois.perrad@gadz.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780146504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Ye9eiWL1ynAAle3JazaX24eeyH9UvXjkuE+BCWKF95Q=;
 b=SZ3+DAV2Kp+2NJWpLNgh652N9oD498D+EEIF0IPc1z5lD+RPpEb9xTrG2IasvBbY8wet25
 jTnQS0SHzo9IplTO9MbDu+5H48Slip5kW7fGDaEeHavqE/t5XqckdDxi4yvSd3LBVUmagC
 FYv2pzvDd60p8cUqL3ANQ3/gMATkiGKB1sRxm9eLsalG+v4z9cWh2z5Jbu5TzhdO61iU7b
 ujLcBddsD/Gdspcb3uR+HcPPB/wegDZEQtX3oHrGBA6A+VH7wcbpLg87FI0/ChzzRwO6re
 3WaRH1em5hzLvpxCwHyjDJa2qRR7ANwAX8BMe8U2GdVtg/Cgd5MG80dkbZ6j8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SZ3+DAV2
Subject: Re: [Buildroot] [PATCH] package/luajit: bump to version
 707c12bf00dafdfd3899b1a6c36435dbbf6c7022
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

On Fri, Jan 16, 2026 at 12:05:01PM +0100, Francois Perrad via buildroot wrote:
> diff COPYRIGHT:
>     -Copyright (C) 2005-2025 Mike Pall. All rights reserved.
>     +Copyright (C) 2005-2026 Mike Pall. All rights reserved.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

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
