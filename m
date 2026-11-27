Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60F4606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ls60YiBL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0977812C6;
	Fri, 27 Nov 2026 17:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eM51Wrpc9aoe; Fri, 27 Nov 2026 17:30:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F0203812BF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795800659;
	b=UEGx8bo2w7T4KY6rlAKWF27NpzlkZAErEQbc7WtbXvLc3AnG14BKDSHteuG6tMIBJLG8
	 q7yy5rHUctjCi+nmT6f0PXb0szCO3tVcZrIakDPkyA2WjIGrlgZ0fVErnenN13yd0WvU9
	 oyYgoLGJPCFwYCu2DPL9B60BKqAi/Nw+x4PDYUvZCz05zghuu5cSYLAlA0AEmUgK3qDP+
	 38Vbts8dvp/qGKQ45dWusjkw1MFwW/8eZzuzqAzwCe3XiCmG3gy6+0gxm3gwiIqygYFBK
	 L1vZJ6R6C227aJHbWazS4ZHCZfTUrf27RlgKWxJ4qaiy6tKhJcW/wqL/eajfr5C4maw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795800659;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=1FVUlnnBJJAFtn4ONsUOXJhXfYMyS5dSF8cHab3FhhA=;
	b=VhalMOdJRt44tc350YR6K1EyQm85yqYx+tDXDfNDm9/kYflVX2aiqhzo7VXauOcfBdFv
	 5qpRvOIvu6Set1KIk2sirrj+PYAFQaZMNgzERQ8dE9Qz5+yKxJ06hXdrr5uIZlmfDbcH0
	 gk/tfgQJ22xul2GhwyQIFOgUrNsTpXkNqkoa/Kn3mcBjRb7G0N71j1/74COCGf8KQgXrP
	 lCsCsqVADT4YVWE5PakBP93QhMr+D9G6dtery8jtOiesO8JfLj+d7OV4pltpxbYTxMIaM
	 PmP8Cbh/zuXN9KeSm5OIh8Qozpy0UY4l/JlLHnhIW68lXdIRzB8cUZq2c528lzIwEdw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795800659;
	bh=1FVUlnnBJJAFtn4ONsUOXJhXfYMyS5dSF8cHab3FhhA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ls60YiBLBcdp9mOmlxr31u7pc3+iX57VwEYnRKlpgw5VSm4Y0f8FdVjQYcst4I/Uh
	 GskdQsbKQZtJl1Atq4kJVwmH/BIBb4tTziVyDrBcBuRKkWam1HDLlEztACW6snYz3F
	 Abn9ECoBbhXTHuUq/5deYgEDriOxFVechDBHC/+tgYO9GlrLp131NzcV3+Rig68InF
	 qY5km55pUIXL8hNZjwbWB9VmrnWNIgEdkPVrO5ZRNV5R9R6YmZBqumlj/7yWxRcDv1
	 aNnKHAYiQ4D2tesek7ZC2sqY9uqS7yvWpgirvFD36c31m1VWiQ6j0NA24Wd9PWA+8M
	 dQxxkkkkebE8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0203812BF;
	Fri, 27 Nov 2026 17:30:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 356BD373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32B33812BF
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwxjnRWH8eUe for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 17:30:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F0AD3812BB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0AD3812BB
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:30:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 327E72003DD;
 Fri, 27 Nov 2026 18:30:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 27 Nov 2026 18:30:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 18:30:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20261127164638.3676415-1-bernd@kuhls.net>
References: <20261127164638.3676415-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.22
Message-ID: <8315aa332018c555c2a9ffde42e82051@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.100.2
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/2026 17:46, Bernd Kuhls wrote:
> https://lists.exim.org/lurker/message/20261125.130455.f06c6601.en.html
> 
> Fixes GCVE-25-2026-11-82-1.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
