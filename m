Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC1BC54E65
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E6583A4F;
	Thu, 22 May 2025 19:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dh0XDLc63i7; Thu, 22 May 2025 19:39:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D771383A79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D771383A79;
	Thu, 22 May 2025 19:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBEA0BC
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D245140204
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3rBykvpScCd for <buildroot@buildroot.org>;
 Thu, 22 May 2025 19:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E31340284
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E31340284
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E31340284
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:39:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E9B9060132;
 Thu, 22 May 2025 21:39:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 May 2025 21:39:08 +0200
MIME-Version: 1.0
Date: Thu, 22 May 2025 21:39:08 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 thomas.perale@mind.be
In-Reply-To: <20250521221047.1297537-1-titouan.christophe@mind.be>
References: <20250519150314.4117224-1-titouan.christophe@mind.be>
 <20250521221047.1297537-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <4bffc235bde770cb3bc308cad1fa365b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747942752;
 bh=D4eT0hXmpvQls8RPssw1f3NdrBojD8dywD6APlGgW4Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q8efRZD3Tmhjj14+UoYib5Jk4xQquZaV/2r3afvf/AmlJrUFTMkIXz3jHWTponmdx
 NDcC0QtBiUge9mmiHUoPe5RlxfJ01lOp8RReI+G8LXUwDQRLC/fhbDyQuMmcnQH66k
 Ys1QymQA/F8h+xsXWtAxGHjijnO5FUmgpkChwDikOvSnIr0QjV5L7L2WY/YMu9HRF9
 Q2NTtsH0MNmuQKj0z7Qlq1XDX/EZno4BjnC/La+2XzGRxIAqyWSwzXiwjCarAT6ftp
 ZDZ3fJSzaiqBeVDEaJS377OxAyVbG+jHsUUo0f4R6BInSxoj6CkufhqlE986G0AOoC
 XljVDk+SQKQzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Q8efRZD3
Subject: Re: [Buildroot] [PATCH v2 for 2025.02.x] package/python-tornado:
 apply security patch for CVE-2025-47287
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

Hi Titouan,

On 22/05/2025 00:10, Titouan Christophe via buildroot wrote:
> This fixes the following CVE:
> - CVE-2025-47287: When Tornado's ``multipart/form-data`` parser 
> encounters
>                   certain errors, it logs a warning but continues 
> trying to
>                   parse the remainder of the data. This allows remote
>                   attackers to generate an extremely high volume of 
> logs,
>                   constituting a DoS attack.
> 
> This is an alternative to the version bump (6.4.2 -> 6.5), if we don't 
> want
> to include a minor version bump into Buildroot LTS 2025.02.x.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Even if this patch was marked "for 2025.02.x", I applied it to master,
since we are in a -rc cycle. The LTS maintainers will cherry-pick it
from here. Thanks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
