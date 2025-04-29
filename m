Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD09C369DC
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 20:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 774B181F51;
	Tue, 29 Apr 2025 20:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pk_IHg7shNcN; Tue, 29 Apr 2025 20:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E22381F59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E22381F59;
	Tue, 29 Apr 2025 20:36:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B62C61C4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A88CD40B33
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4OJzy2s-Yq0 for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 20:36:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F7D340BFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F7D340BFA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F7D340BFA
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:36:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EBB0E19F5C3;
 Tue, 29 Apr 2025 22:35:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Apr 2025 22:35:55 +0200
MIME-Version: 1.0
Date: Tue, 29 Apr 2025 22:35:55 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20250429195337.566859-1-dario.binacchi@amarulasolutions.com>
References: <20250429195337.566859-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4661eeb2a2a5988d914d52ff25d0463d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745958959;
 bh=dl6vBbBPNue/WMIPavYj2fZkp6bdDBbmAZPNXY3UNjs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Mt1/DQqd5keFJ/4SrKCIOt3Y591a1kjtsqFLMT+RQSTuaC8ghU9D6mQ0Coa05hBU3
 icW0Huf7xHv2nhMOq1MGGU36nvCF2BpOc2CQF19O5pb/gWh86AbzrOUdoXuyldflrj
 KTpnkQ2V/pCeN2NeIYgg2oldrfTMuLAJ/tQhY55xwnDz0rmpKYF6TElI7rTN+7Hnpk
 nwMCazK1HVa5N2Ce99RWD9BmkT1iPWB0bYoEJJtRRr4RDA0G3h6ZS2ViHTPLwGTwjS
 bGuXxaamdf7inUVWszW7lucFgSq1fQPvTvzQYVbzqPFS0haTncBwp7k0h6ldZfF+MD
 OK5hJ5QjspEYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Mt1/DQqd
Subject: Re: [Buildroot] [PATCH 1/1] package/mmc-utils: bump version to
 c515ea2e1ceb
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/04/2025 21:53, Dario Binacchi wrote:
> Change log since last version bump:
> 
>   c515ea2e1ceb mmc-utils: Doc: new secure write protect commands
>   3fc7643ac148 mmc-utils: Secure Write Protect Mode Read
>   bd51a271de9d mmc-utils: Enable/Disable write protect
>   5d3a04e70b05 mmc-utils: Add secure write-protect mode enable/disable
>   05051e40351c mmc-utils: Refactor RPMB key handling into a separate 
> function
>   f4247f56085f mmc-utils: Add SECURE_WP_INFO field in ext_csd register
>   50a30df1b74d mmc-utils: Add byte offset comments to rpmb_frame 
> structure
>   88e956459a79 mmc-utils: Pack rpmb_frame structure to avoid padding 
> bytes
>   d4d3eb24f560 mmc-utils: Reduce scope of nargs for RPMB commands
>   437d369cd9d9 mmc-utils: Initialize RPMB frame_out structures to zero
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
