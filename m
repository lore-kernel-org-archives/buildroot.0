Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381BDC282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B1AF84B24;
	Fri, 28 Feb 2025 23:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRawj_OlXEVK; Fri, 28 Feb 2025 23:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ECDF84B30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ECDF84B30;
	Fri, 28 Feb 2025 23:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 745531CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6449F42F79
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCaHwa5E9nkn for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:08:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 950BF42F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950BF42F74
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 950BF42F74
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:08:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EFE6719F576;
 Sat,  1 Mar 2025 00:08:23 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 00:08:23 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 00:08:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250217111744.1851201-1-james.hilliard1@gmail.com>
References: <20250217111744.1851201-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <1e4bcf6c741146041b84ea4b217cbf70@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740784106;
 bh=VGl4PcVmXoqyirLlEckmhqFh/TkizDO7x2vffCQkWnU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ki/HYerTwG6mueaE6DC7/nUmfUVvy3WlAOrlNK68qV+bcSCGhiKwd5sHC4Kb04GIQ
 GKtsjet6GFVcbkE3n0LYSqYAMPC6kS5x0rxgj0J5eyGOGE4nuygvQpX4+vUdov3sI1
 yNvz8IZc+4x7qOCPbHUuZza4eyZ46DimAeyq7Am3m6dGBHazzWhhFRHXxaRX9G6V6I
 nh5HAagdXEIo3h91YobzbV0c+N6zd0ggACdNVaigFCsMWmqhRfwDNXDfOX7ihgAHY+
 JGLSMFsJxmP9f/oRXxZ9Lyze0q4nyBl/nV+R6hHkPDaihRwz8UX4IoD758yhcGs4IR
 PKNhx2W8EBkCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ki/HYerT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-websockets: bump to
 version 15.0
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

On 17/02/2025 12:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
