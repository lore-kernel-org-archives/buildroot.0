Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532B2C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 09:26:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF38660FED
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 09:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF38660FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D0C681762;
	Thu,  4 Nov 2021 09:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zjsLXQdav7D; Thu,  4 Nov 2021 09:26:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A428175B;
	Thu,  4 Nov 2021 09:26:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D29521BF2FA
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 09:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C108860658
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 09:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Opm4JEbQBHpI for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 09:26:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 314C5605E0
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 09:26:16 +0000 (UTC)
Received: from [77.244.183.192] (port=62512 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1miZ0g-000kit-7m; Thu, 04 Nov 2021 10:26:14 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
 <20211104063807.139604-3-giulio.benetti@benettiengineering.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <2b0b7bbb-850c-98ce-1544-14f7f6968d7e@lucaceresoli.net>
Date: Thu, 4 Nov 2021 10:26:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104063807.139604-3-giulio.benetti@benettiengineering.com>
Content-Language: it-IT
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 2/2] package/sunxi-mali-utgard-driver:
 rename from sunxi-mali-mainline-driver
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 04/11/21 07:38, Giulio Benetti wrote:
> From: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> This package provides a Mali kernel driver for Sunxi Mali Utgard GPUs. The
> trailing -mainline is historical and was used at a time when there was
> two packages providing this driver. The "non-upstream" package has
> been removed some time ago so before adding new packages bringing
> support for other ARM Mali GPU versions or implementations, rename
> sunxi-mali-mainline-driver into sunxi-mali-utgard-driver.
> 
> Add a legacy entry.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Giulio: rebase on master. Add legacy entry instead of substituting the
> blob's one]

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
