Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA0B606C5BD
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hBgYKTio
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CE7040983;
	Wed,  4 Nov 2026 21:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Uw-LT_g6cxm; Wed,  4 Nov 2026 21:25:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 622A44096E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827545;
	b=qobWFywOXrpsnceBxFQKVEj0+hRpz2sF+3d5ONQs3qeho0Lat+D+1UwjZxRgmCSGEZoX
	 ifuVebClqi/0mkool6r/k1v7queev9qZDqN+cahPRNKxzgstffOar0k4pQUfO5butNce8
	 pUPTU8AX+uo3ozddugY7Ry9jM+ErbmIwwxj/gSS01YX6W06y9eGuj5uDXYKpZFEa0hjVR
	 Wq1F60eY+8HDbwQRReOg3P47PAMRJ71P8pSzTjiQ27iql01HEgHgXN8zoUnGoMS3lpSE5
	 CWYsOFQyYJPNWk5fD/WQ3NxHPF22rR6f0T02/bCFZbYdu0/nKeGA7+Ed+rB0EVHrblg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827545;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9pxYZAv+aLlKKeHGSL5vLZF47FTwSPXbXGNhanydV9g=;
	b=gc+1TQUapbBnJ3c1wRpaQu4HCOOLPBXKNlBPawuLyvb18eICHykM3g++itTz5Xy1XnrP
	 TTggCCBdd8bj/30kAGS+M98zfQn7gE73QpWRQ5zc6+vWTK/Y/TTq0LWVtAJ1I1kRLLG54
	 3RglpO0PKVkj2+yYpvBqb6yq53xk3AfEtyoHHLxVROrsEF09FZ4AvIgmDP182P3sXxBQr
	 +N/MZJBqRp4M9gIWZE/C0LPTdpMTFJYQ2Vi2uiAOVnyHodgEgC+T+/+V3B0TcUVpjzJll
	 GcfW5+2kOVOjs6ZiBTOfL7BwRn77LH5MsOZJEfnkHGzu1LNk84ZRIYVyyKXBI8T7iyA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827545;
	bh=9pxYZAv+aLlKKeHGSL5vLZF47FTwSPXbXGNhanydV9g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hBgYKTio2kzTD3qSZq3OP3tUP93iGxhG2GIetKfWKAeFfdngYjRjnXqLkQWsQ+SOQ
	 NyGa2LhO1kgI69yCOM1GsUYJJWEdoeNPxqJPV85IRRYLRNciOhqe9Va6drj7ffRQ4K
	 K4F+YTHYEHtq5uJZOsn9O9aoozO4sK5+lSzOUn1B4O8wMGsl3v40AgA1QL9/NjT0v9
	 3G/bpclBKn/B3mBPo/W1uQfrf6/t2UDXeK79Wyizh7dXMzNuhBaX/fUIIfDL8PN5ko
	 Df9y4g4voe+1phoWXF0Gk6La4k81x6h1yF5QaDLlf4Y6H9PvbnfNE0pTJTWgyvShZk
	 aTU91AnSvxn2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 622A44096E;
	Wed,  4 Nov 2026 21:25:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15BFA177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF181812D9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BY9JdEkib1tH for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:25:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8B5FA81271
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B5FA81271
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:25:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 54E054E40710
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:25:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 610675FAEB;
 Wed,  4 Nov 2026 21:24:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 61F9810329206; Wed,  4 Nov 2026 22:24:42 +0100 (CET)
Date: Wed, 4 Nov 2026 22:24:41 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <auuiaUH0JJ20VZWV@windsurf>
References: <20261103064034.3913314-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103064034.3913314-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/file: bump to version 5.48
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 07:40:34AM +0100, Yegor Yefremov via buildroot wrote:
> https://github.com/file/file/blob/FILE5_48/ChangeLog
> 
> 5.48 adds Landlock sandboxing, which is enabled when the toolchain
> provides linux/landlock.h and skipped at runtime on kernels without
> Landlock support.
> 
> Add two patches fixing the seccomp build, broken by the new syscall
> rules in 5.48:
> 
> - with musl, where pread64 is a macro once seccomp.c includes
>   <unistd.h>;
> - with kernel headers older than 5.9, which lack openat2, faccessat2
>   or close_range.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

I continue to be amazed that key open-software like file has a website
like this: https://astron.com/, no Git repository, no mailing list, no
nothing...

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
