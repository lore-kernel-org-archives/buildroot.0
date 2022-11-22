Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D9DC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E95FB40A01;
	Tue, 22 Nov 2022 22:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E95FB40A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11ZCJPDih72a; Tue, 22 Nov 2022 22:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12A8F40BBC;
	Tue, 22 Nov 2022 22:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12A8F40BBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEDA31BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A1CA40BB5
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1CA40BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuxnLaxgQROR for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:33:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3751740A01
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3751740A01
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:33:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49ED6FF802;
 Tue, 22 Nov 2022 22:33:50 +0000 (UTC)
Date: Tue, 22 Nov 2022 23:33:50 +0100
To: Tim Gover <tim.gover@raspberrypi.com>
Message-ID: <20221122233350.6b00aa83@windsurf>
In-Reply-To: <20221031150235.12074-1-tim.gover@raspberrypi.com>
References: <20221031150235.12074-1-tim.gover@raspberrypi.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669156432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMWTs+l8CHqxbiMVFvBPL3NKS57lhWNLZ2E7JSuyggw=;
 b=WZvaRwfgDQssWRN1cLoLJrxtyUE8/X7ucN6e76+GZRUJOywdlXDwSzYYRlkzqcFyQiZhcl
 tNDUrb39jlxPn+ZebvHFmeIEMjlhIj+OG7/B55TsRXYNlFngyv03xszZIWies4mZcBme75
 8xLvBSc68Z7oifTCkP38LD2sG+Lcp0RVB8wN89/yUh15heHN2k+mQdgqrl880NvF4H9vbE
 a1/+DE4t4xYzE9VNF9wxlLqoVbTCcNJi0v4wDsJ/MNLFoedJvuGGK+jdIkDXanFytWEx9e
 qxdIriPvuEf+Lc2I3R/Kgm5EPFOTiV5dFhxii1uOSdCDXV+gAKer0g3QNlMH3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WZvaRwfg
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: add
 overlays/README
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tim,

On Mon, 31 Oct 2022 15:02:35 +0000
Tim Gover <tim.gover@raspberrypi.com> wrote:

> If a custom os_prefix directory is specified then the Raspberry Pi
> firmware probes for the README file in overlays directory. If
> this is not found then firmware will use the top-level overlays
> directory which can be confusing if os_prefix is used in conjunction
> with other filters to implement alternate boot behaviour.
> 
> In Raspberry Pi OS the README file is always included to ensure
> that the relevant documenation is in sync with the overlays. Rather
> that including the entire file let's just include an emtpy file so
> that overlays directory is consistent with the Raspberry Pi OS
> APT package.
> 
> From
> https://www.raspberrypi.com/documentation/computers/config_txt.html#overlay_prefix
> 
> Unless ${os_prefix}${overlay_prefix}README exists, overlays are shared
> with the main OS (i.e. os_prefix is ignored).
> 
> Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 1 +
>  1 file changed, 1 insertion(+)

I am not entirely sure how useful ${os_prefix} is in the context of a
Buildroot generated system, but I guess having this empty README file
doesn't hurt much, so I've applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
