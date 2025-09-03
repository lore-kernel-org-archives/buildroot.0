Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9029FCA1010
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 22:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 620C442340;
	Wed,  3 Sep 2025 22:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gexfC0fvtVFz; Wed,  3 Sep 2025 22:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9815242343
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9815242343;
	Wed,  3 Sep 2025 22:15:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E5F6930
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 22:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 402DB41756
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 22:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBjpQF0kzmNs for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 22:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 674AD4171C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 674AD4171C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 674AD4171C
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 22:15:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D977A780372;
 Thu,  4 Sep 2025 00:15:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 00:15:32 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 00:15:32 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250903110048.441164-3-titouan.christophe@mind.be>
References: <20250903110048.441164-1-titouan.christophe@mind.be>
 <20250903110048.441164-3-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <36762b2db77a79ce9d44a32a947f72a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756937734;
 bh=ztJPOYo+WGqA+Jiiyt/Ipb3yJRFwZ1Vx26zo3t4QNn8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nL+2wUQCnaPdy7umLEnUiJmqQcYFklnW4kyqYFIy0POrYuPwtZDy2wOeadLEE0KwF
 VhedmRJTie49MU3BXXqDy+NITuL38oonFpGJSuN7gn7LnFU7hymW42oWgCmmnt8nFV
 eFu/3IR8iGIOQapZUGeNWU7rLWe9pT/UokE3D39bpQ1oty3ncyeYjUvoaTYYWa7gaM
 BHxvbeMKvs+Py5X715moUFcfuGifI34rQWbKfFvzF/tOdvB5SSb1CX69XIw8iLaiyP
 hO6aBeIp61WpfKFZnJrfPf+4UGongKT6a5WIiw3AUU24ZIcsLcSENy0sl9w8/+u6Z1
 Vmhu4823g0CvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nL+2wUQC
Subject: Re: [Buildroot] [PATCH 2/2] package/wireshark: bump to latest
 upstream stable v4.4.9
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

On 03/09/2025 13:00, Titouan Christophe via buildroot wrote:
> See the release notes:
> - https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html
> - https://www.wireshark.org/docs/relnotes/wireshark-4.4.9.html
> - (and all patch versions inbetween)
> 
> Also update the README hash, as it has been updated in Wireshark commit
> 1832f2bc3948248bf21acab5dd16fca8d5477a1a
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to next (after cherry-picking patch 1/2 from master),
thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
