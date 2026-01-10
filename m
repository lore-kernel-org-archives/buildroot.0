Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7178D277E8
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 13:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8631A408AD;
	Sat, 10 Jan 2026 13:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 562DVmN4cDqZ; Sat, 10 Jan 2026 13:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 236A740896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768053557;
	bh=yMClR8qq37HDlzFoBdKtK0FAXRhr8XOKQ6ZtwTAmK6A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dDE7iUPFcx0W9MOQ1GgmxnuP/ldW7yxMOTz3+vZvZwC5Y0ITraJY62a9GTHNYe+Mo
	 AuI38towjfmckElSXrR1WluaZLwe7YMYsayWuFw+f2MF4RGTS7SdUJQokskCcrJSFT
	 Ff46VDKx/wxC0vDFelxmMs1P5sOwwrtPkP1PMjckr7wQiPsDrIXr899M7UYF2xooKX
	 VhIe5A2ZgNPzEhE9aUqC/dVOL00ECZwheQSCwiMYKwTrQ+JWElUOSYSlu2r1WRlL5W
	 qWvjCIBO4ub170bjdV6CWdv9axG3A3nV2+l286fAc0usmSHcWdCxR/jExHNP8ncd0y
	 +jtCtSQa5P0HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 236A740896;
	Sat, 10 Jan 2026 13:59:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4FCA18D
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC0EF83578
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_TJk1131HvG for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 13:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F321183563
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F321183563
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F321183563
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 13:59:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 317A519F5A7;
 Sat, 10 Jan 2026 14:59:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Jan 2026 14:59:09 +0100
MIME-Version: 1.0
Date: Sat, 10 Jan 2026 14:59:09 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260110103021.2630877-1-dario.binacchi@amarulasolutions.com>
References: <20260110103021.2630877-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <28b47b94e63fe2aed1819aba4cdc4a74@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768053552;
 bh=7Cve/u48f402MKkV1PFN36XQgo1hwVxz7+w2krZ7YWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZYieo9zt6+oSWiPZ6ueWiQ4DlzS1uAhuA5q+tpmC9SNU1qhpN3px/1FDRnsDtbSDl
 ROHbDXckuQ1n5/olvQoL/Sff4GVHg+wAmU3YeMy8QoYgTbiLOMvYvZ6emGpyDHDBJJ
 /3CUtbt8lrEdZyS+G4XSkyJ2VRw5SxY5Y9o0gKZY2YzRE8bUxs80W8YMgZa5a7QY8l
 1Bo1YCePb6KwhsbrH+nchU6n8kQudbWF3MsW7zATErtYXh7nqIUILmbM+/7w0gg7sO
 w+FsLmuUz1Le5dWLJb4asOVgI3oq2UPQErhIaifH3YwDBvjhqSPv6hPtspBMNYXOih
 FwQ1U0+i96byg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZYieo9zt
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux
 to 6.1.159
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

On 10/01/2026 11:30, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.1.159. The size of
> xipImage has increased by only 181 bytes (1673625 bytes compared to
> 1673444 in version 6.1.155).
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
