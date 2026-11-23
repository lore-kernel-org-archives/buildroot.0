Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6083B606A32A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 22:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XXf7s65v
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DE5940777;
	Mon, 23 Nov 2026 22:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWpVV6-yEj7P; Mon, 23 Nov 2026 22:01:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 706074075C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795471288;
	b=cxPbxLIo7+Uqo3gqYkVysJ5+32Jzrv7ZFyOB3LnJQ16lGxlH5cVJd06OmLwbLQBfPo5Y
	 Z7xLWpGfX63CPXxUfmHgb+O14UPqqt5FagtGbZ5qW0W/aORL4bjPm4TQXdwXeBvXrZfUL
	 LpHvjtv+7T1hsLMTt+T1SaMe9zH+TyYm9lOTzL5Spclv6BQ8R6EQc2v2FYS3Zw0JOHHUx
	 DljUSDquxVWGHTt8yygHe3BswT17csZz+ritEtl7rcmxsPFgpif+ArTe0t1C+8MYKO3Rf
	 PlnA+YYbmN0Z1MH/5y0yrbaqNf3XwiDr0ThUYNHQLGmtDNDOjpkiz0CD7OWH9nBWF5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795471288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5HUtdxmlbyqC3p8kr/lTDSgWhBdBTjh65FZpZZ/Ju3g=;
	b=KO0UVfQ4dh5DpLGHAcHO53AjcePc9QyZ3ts7IiCQJlJPfkWIUHyUJtMjs2OVh7vgE9cx
	 POZSP7tqR3VF7M+VtbCyU8OvSNQW9ELSQuQ45ZwYYCi1LJ9QuaunF2Lxb6BV8BRmlThrY
	 TCVkwb1gT+5Vv63JziJ/TCpjJQX+b0DzgYKrBpNYvJ1/VFGG1NXHeKABGf0ZRul6EfqN1
	 qj6Oiar0VDvxIPBhJByNHXIJlpuXQG2RTlv2XHtXioStE/LnZ12cJLaSItY/mXKLNw40F
	 AApWHNno6n1AEAK+5U52D2wzFJBxnEs9hjE8UlauJfMRV1Au/4LAbjT1ZqWaC+fmhpQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795471288;
	bh=5HUtdxmlbyqC3p8kr/lTDSgWhBdBTjh65FZpZZ/Ju3g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XXf7s65vMAtMcXi5a/gD0I2maZN1cpFzM871pD9GCj82zODjhPBVnO0SNJ3y8b7qE
	 Ye+wzVG3N2nHeBmrTl9KFoSbeXufhFkVT6E7w7WT4g80fpYz6Q8aDfk4J4RcJRoV+4
	 VmRmC0LOjU8fcImvFDLriHn0a0ixPw5skP6iBjx8xf66eFzQ3f7+mzhUG7D8If7tOF
	 0cQ2L6IMM4SNnMdMRFzCV9ub7vwKJ2O70KLTu7ybkn3lW6WCUZoDUsbwAL9FeOiJLB
	 bOae/kmYju2Km49WZfa7yxQhv926nGT2PngY7/jOsLJl5d/zv9eZEHMEF54gdwAGR3
	 N/ikXtXUBh8Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 706074075C;
	Mon, 23 Nov 2026 22:01:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AD89260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60DA880F3D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7EwfdbQlaxu for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 22:01:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1DC9380EBE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DC9380EBE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:01:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4D38CC4EFD8;
 Mon, 23 Nov 2026 22:01:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 27D5060480;
 Mon, 23 Nov 2026 22:01:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 112B011E6A6FC; Mon, 23 Nov 2026 23:01:20 +0100 (CET)
Date: Mon, 23 Nov 2026 23:01:19 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <awS3nP2LeLKp2YZW@windsurf>
References: <20261123205520.3702760-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123205520.3702760-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/libp11: bump to version 0.4.21
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

On Mon, Nov 23, 2026 at 09:55:18PM +0100, Angelo Compagnucci wrote:
> Release notes:
> https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.21
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Series applied to next, thanks!

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
