Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661D7606A330
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n2ri6LH1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D18980F86;
	Sat, 21 Nov 2026 16:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pJg65wwfpbV; Sat, 21 Nov 2026 16:16:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 696BF80FAB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795277772;
	b=IJAoI6j92roa75MMOjjNu1deyPxzqtnNJ51zC5oZzCSfoQ8rgZavtXIPZXETzR/DC9Iq
	 B6uFQLKLwpCLIDFdOckGf+JKiDgYaXCqTtln7hRyv8cJzYLMYG0dhQUzhRV0KVwgOY995
	 ShaDTi8SYAJruVdHktbwN0Je9uAiZMcOVM/wiwG9zk08ffCW0BzjzXePDYe3RzmS5Vh8a
	 iPMsQklmaHihJaSl0TjVswtyXBIr0/gqPxEusSgZUkql4fFkYVS+LHMSaKBCnufl8DqWb
	 eFU5ISVaFLyMOnaic929/CtD7YTPb8oENu9A/5A1o6nHQ9czGDu+hzj/reKnTr0X6Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795277772;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RgdazmFYQCJq/BtYun/LMbpA8WfPqUsjsEP8u6BtjJo=;
	b=Xt731H3/LzYTbjnJfWy2g7nWPpszz0gU7f5exxX+1xATULsxlbj2PgcV1EzFBuV0mUsF
	 5EynNqKPA/OLTFjvhdJlI8Nt20ZKvn90cfqrCr+S64sgAa8U+2rEhbVdkMNIIK0OURsuy
	 Kk5mUioxw8ZBtKGB1x63cFbM/QsciV9uYlMJPMu1AJxb+uUZKh8C6rlPKAh9UTVw8/MUo
	 cOAjwP+6UCEzhdhSbkDJr+iZWGlJmNWGtKPIHjYvp0x9GIkKlTlhQM+TN3NxP96wcx8/u
	 XNymraaW8kFC6hbIXhYUsOjGMrYfpJrYTBLq3cyI3E/rfmWRl7eDdy2yEyu4n2mS3Fg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795277772;
	bh=RgdazmFYQCJq/BtYun/LMbpA8WfPqUsjsEP8u6BtjJo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n2ri6LH1iwyHSAG8RrtOboo5PYAOs5e31p2JubgajaIDcIYuDByVOa/gaYelzpF0Y
	 3lpkkT2d21ETh+bdB6mUOKaQUBsWMpEnuTji4N/llPNhJiQcdW/UK4mu74A+FHiNJ6
	 3EnX/H/cuosLzsYHvqnv+IW/byTFtpQeZMdyBfrpdjSk5dWzWo+FpHm8WK8ppCebw/
	 1zdolTgORK9qcKXW/d1xMDSTqrAgWtdpgiDwLc7Ke9h8S2H93cuQgyY6AAJdVUgOYF
	 ZoDmAgJ4/eANWtjQcDzsNs0hwqWIZBq1CEB2UvuuGJ9+hdq3VBdNYOQ1CrIiBdNpiO
	 xT/wfICIyF3Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 696BF80FAB;
	Sat, 21 Nov 2026 16:16:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87CE19C1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79C4B40012
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQwMXJlN9AiT for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 16:16:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 69FC44009D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69FC44009D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:16:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2FCE15FFAA;
 Sat, 21 Nov 2026 17:16:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sat, 21 Nov 2026 17:16:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 17:16:05 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20261120205006.4022078-1-angelo.compagnucci@gmail.com>
References: <20261120205006.4022078-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <cf1b951fdefb6a1ea9821aed3cd08ca2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/httpdate: bump to version 1.0.2
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 21:50, Angelo Compagnucci wrote:
> Upstream now installs the binary to /usr/sbin instead of /usr/bin:
> update the paths in the SysV init script and in the systemd unit.
> 
> httpdate does not use libm anymore, so stop linking with -lm.
> 
> Release notes:
> https://github.com/twekkel/httpdate/releases/tag/v1.0.2
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
