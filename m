Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BE3CA0FED
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 20:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD9234119E;
	Fri,  5 Sep 2025 20:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLIx-jcwvt9V; Fri,  5 Sep 2025 20:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6962041197
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6962041197;
	Fri,  5 Sep 2025 20:45:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC1F3967
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 20:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8B6480BC5
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 20:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xircl6y58JF for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 20:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD90680B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD90680B93
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD90680B93
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 20:44:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 910D778034D;
 Fri,  5 Sep 2025 22:44:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Sep 2025 22:44:53 +0200
MIME-Version: 1.0
Date: Fri, 05 Sep 2025 22:44:53 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
In-Reply-To: <20250904114108.3169804-2-buildroot@heine.tech>
References: <20250904114108.3169804-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.11
Message-ID: <e4a6753f518821b3aae2f5aa1ca0088b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757105096;
 bh=0Vf+2m1kMMmF5TbPo4Uf2aOigWr9NFNfO7bcKEGq3XY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OBjpp4TfDevOLHYdlswy+m3m3sXtERwlsmPalJyVZAL/IDgxs4syk+f6NAGMvc1v6
 wGmyBvkz/7nwNfTYWAXbbSMnzstBnX7c5kpHhVlaG57vt6kOeGsixPKIz1zTtTatUg
 nG1tbKR341OHsq2mMafvdmjIr75TMX+A0ECrtIZbi3wruibVPYynS0kvFQESszuXXU
 dVznv5DfNOlo1mjvZPXeH9hU0/7fSNbW5Xc+UzmA8AZwfmvQmdzSIe0dL8jXbiRZTz
 VeSISw49b9zkghC/npAhXA6CSKX6zodsMbbSDVPYd6bPntvE30L46BSR2CkuYau9eX
 5kua1ALS/0w5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OBjpp4Tf
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add Intel 7 WiFi
 firmware
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/09/2025 13:41, Michael Nosthoff via buildroot wrote:
> - add firmware to support BE20x devices
> - extend bluetooth helptext as it already includes the required 
> firmwares
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to next, thanks.
For info, I fixed a check-package error. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/4b47f88cb4652c5bdc4700ee058cdf240f7f9064

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
