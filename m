Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E1AC3ABA3
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 19:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1D6540918;
	Thu,  1 May 2025 19:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tZlFmRsmhlG; Thu,  1 May 2025 19:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2541D41600
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2541D41600;
	Thu,  1 May 2025 19:40:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75AB3113
 for <buildroot@buildroot.org>; Thu,  1 May 2025 19:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72BA741561
 for <buildroot@buildroot.org>; Thu,  1 May 2025 19:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Il0JSDHUc4U6 for <buildroot@buildroot.org>;
 Thu,  1 May 2025 19:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A11A041600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A11A041600
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A11A041600
 for <buildroot@buildroot.org>; Thu,  1 May 2025 19:40:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 897C613F8AE;
 Thu,  1 May 2025 21:40:25 +0200 (CEST)
Received: from 2a01:cb1d:9279:be00:c208:5c5d:a534:6e05
 via 2a01:cb1d:9279:be00:c208:5c5d:a534:6e05 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 May 2025 21:40:25 +0200
MIME-Version: 1.0
Date: Thu, 01 May 2025 21:40:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250430095312.104032-1-titouan.christophe@mind.be>
References: <20250430091523.96309-1-titouan.christophe@mind.be>
 <20250430095312.104032-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <79e7677818a3ae23ad972a5dd3545888@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746128426;
 bh=CwCjQxsNiBsmQcEvTmNjLT5BFTs5O+WUK4kxYX7Jlv8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EyD9lHdn78AjxRSi8YNlfC4UL8PbLCY9OuSsaJSCc4LdSWUGFxJpJslungFH3sTHD
 amjj61rA2VHN2Y1PKxVGYZ82BZrlyRwP9bqGMX4G8ieu80MpVQR5R10JcSO4XYZOov
 Jv9xrAFxZ1ABTjF1WMhfwTa3a4kALD2aRBSH6vDk2qyky202aITNkpwTmSTHLA15ne
 u3O3jP5TOvEZuU4bSY4l3nhXxNDrcBetf1DsTPOvHj0Gp1/JvRKjgNzJSQxUi8ZzrG
 kSAiFKBjTbGq4j51uGP7iZS3vynP5tYdS++qeAG9jaUGF9TM/KKKka7bWHjdXtatan
 HLjSefAtzkfuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EyD9lHdn
Subject: Re: [Buildroot] [PATCH v2] package/yasm: add patch for
 CVE-2021-33454
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

On 30/04/2025 11:53, Titouan Christophe via buildroot wrote:
> This fixes a potential NULL pointer dereference
> 
> As a side note, this package has many opened CVEs, but upstream doesn't 
> seem
> to really consider them as security issues, see their disclaimer here:
> https://github.com/yasm/yasm/blob/master/SECURITY.md
> 
> We could speculate that this disclaimer has been written as a 
> consequence of
> the many small CVEs opened in a short time, that don't have a 
> substantial
> security impact (besides the command line tool crashing). All of these 
> small
> CVEs have been opened for bug reports issued by a third party who used 
> a
> fuzzy tester to manipulate the assembler input
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
