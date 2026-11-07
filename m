Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A89606A339
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P28/ZjZH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D347811CB;
	Sat,  7 Nov 2026 10:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qn_HfEPxHyRn; Sat,  7 Nov 2026 10:30:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C92238119E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047458;
	b=Re2LN263NQlDnlgzsd6gSWjL5muwp4D03l9mozn9YQwA5PYqtW8YtHG3qeuf7TbUXQy3
	 R15TP7a8vfggcs304682SU/bE9f2+ZBlC3jSYUuhd49KzctfVT81YYtD76xbfvD6USCLQ
	 pOLnt7jIG78XN+N0868v1XPYtcoFgv1MnDaFf2NsDL/LWLPvamINwQH+6+1vaj7XmcnCl
	 Sc9/LvGu5iyj6dwkUS/C05RJOrC2x/XSObz9ILLWukB5iVAtck6ZoeCYjEbscAU8ey3g5
	 xUVpOtHOzH/GYY3HaW0g/iIcdojHOx0FYBbX9LQhCCE/U5eXnbZFzqqMm4XqZoatsyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047458;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6BRyS7SRdpvvuBby1z9K9bNjXQYIp4Nx26bTxCCTe2U=;
	b=G5JTqElHTMA0Q1cehAAPXQs4u5wmbgDpxUWxpZAwZs+Wl0XjtDml5HVMNhbHfODmQGAq
	 OAwHtMh9SKKnOVZdKSGTsqB3HXxfcLFUsTkd1830dbUpEp8Mt9XenfG6d/y8m56tY9fJE
	 YVdBoTNJeht0hA8rUbPV8rML6NQqJhn1vmT0frJWRPWH4nbt9PoendorjYfU+NhcsSDfY
	 IppLPg7RFC1b9OsqmvoJRn6OhwA153UvFllaWYHVJhXeW2r1comy6cISjDU8Gc+w8Yy53
	 4X0iuuMpOy6QYaBQD+ubQqWiyLo6cSxSDRAOs3RXiHAzkIMcVJ8krFr+T/3ki3DxP4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047458;
	bh=6BRyS7SRdpvvuBby1z9K9bNjXQYIp4Nx26bTxCCTe2U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P28/ZjZHbALrAhkunWo01p8rlxNqrYUePnmc3cG06TAsUnl2VMLy65TWaIWLE/OM9
	 GjmSCwStsS3rclrU6tnB5F3Y3oTLq6+5bRM8x7i9Wpclsu6ORPhhzFyaEc8GWMDNhd
	 qjUa2ksvMaZIFtmkuB4NYrCwd08nZUqf83pZgzdog0wUR36ZbY5l8akj5fzMkkhC0a
	 SD4vYnbLyFUPgIXaGrEC/GyMfDTA9R20Zh4VLaJQicBv32RyiwMpoLy4GpVDxnMvn1
	 Ifzw9xSySQ9LNnzOHVzn8IbfUPs1QTPjvFcAZ5blmPDnkEQqCZ6xrA7l7a9jx54xT5
	 nn/HrUDFBToDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C92238119E;
	Sat,  7 Nov 2026 10:30:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 327341C6
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 240FF4009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqlifo69RQ_2 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:30:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 618974008C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 618974008C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 78F342003D0;
 Sat,  7 Nov 2026 11:30:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 11:30:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 11:30:52 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106211918.2606369-3-james.hilliard1@gmail.com>
References: <20261106211918.2606369-3-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <fc15e037839973f767ce4224486ff858@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-selenium: bump to version
 4.52.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 22:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
