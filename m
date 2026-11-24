Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B42C606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PhyJnDTC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA6DE405B8;
	Tue, 24 Nov 2026 11:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_oviLTMO0Sp; Tue, 24 Nov 2026 11:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A6CD405AD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795520711;
	b=UJiyzda2dbyomP+dINPWMZrwhBZp+ASNowtVz+ozYaOqaGq0V3P0yIjewedbhbsQ0xUw
	 9oBeuLcNODcKd8gnCflual6yTU1v0Gd9Pu7qA1VkzEjEZYPEgxgLutjyzmNve70q80gce
	 GhQfcOXU5hEWWM90ElZqNiUpY8ba/tmWRpr+osTvSqw/KN9BdSmCp+1RQ0BiWj1VfkZTl
	 9Dc3b3JR9mUXojS7uPg3Y57jGr8/2go9umpBoCQqQND/kGop6IB5o51/PqJZVWKydpeHe
	 NsTw5rrn42uPDtnksWr+yKa1jKg9f2EQq2R3btPUSfx2mKBDj0Q/fxYfFoSkz5zPKtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=X2tVMVHGDfcwDWyo5QQHD5ikO4s/QWbynPUKemZ+HTY=;
	b=bnXaYQSxni1WQkKLfz+dmVAUsWJy0PyAb5QZ6J+UKVwAIvNLPP6ZM4C+dC5FWtTEcmsg
	 dSuDOm/b5gh1NZ5DvtUiT01SzduvU4Kd5HbZDAkckaH2v3HcaH65lwMv1jzJF8EDXrzFO
	 bTGZNpt1LkPzNK5SP16T+qMspoGLQNuCsgkw2dV8xRWVe+a4JT5BtIe63aszcec8C7fUL
	 zdueeHYtyT1rgSWZGQ/nU7JzUZQ64LiJSfuKdGx9zI6mZp44S39xmdbutcu+Gp6RsXLCE
	 41pr9P3KY8l3S81KZ1pZu135rORAldbESrnnA0Xb0H9AmOstRoaXuJFoh9FwCdGbfJA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795520711;
	bh=X2tVMVHGDfcwDWyo5QQHD5ikO4s/QWbynPUKemZ+HTY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PhyJnDTCoj9k2+dLxBYmWuaCIaLbNtOI+6V9wA1JVddz6oh8xWGKb6qYaWhxXWId3
	 XmOusK/YomlcZLTnv51jnTuRLWJs6mbUO1VQpzgdKs6Q1e8jIl26w61LtWEeyL03KV
	 qE7OrogoVpiZQ+FBTNSiSyXSV3krCb46AyE1+FNitsUyxJbg3FntGtCGKU1XwWMQx3
	 smotipRvFM8BDFKjzUyTRD3gr3laLr1VuB9rPl2TjmVdSN1kD6mYkBqZr3PcXzPMd6
	 qap4EYtcdI0yh11bS5sKaVvloMgxs/JZ3uRs65VTaGBdYjdtn4mQg+xrmLSu2Zu+8+
	 DyqXyowUgydCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A6CD405AD;
	Tue, 24 Nov 2026 11:45:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E31D91C9
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C99AB405AD
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UN8_vHL1MPeD for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 11:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CB381405AA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB381405AA
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:45:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 346112003D3;
 Tue, 24 Nov 2026 12:45:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Tue, 24 Nov 2026 12:45:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 12:45:00 +0100
To: Frank Vanbever <fvb@funkworks.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20261124103554.696850-1-fvb@funkworks.be>
References: <20261124103554.696850-1-fvb@funkworks.be>
User-Agent: Webmail Free/1.6.21
Message-ID: <ca6a547aaab7dde50bb7f71e2690b45a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/libmodsecurity: needs gcc >= 7
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

On 24/11/2026 11:35, Frank Vanbever wrote:
> Since version 3.0.13, libmodsecurity requires a C++17 compiler [1].
> With older compilers it fails with:
> 
>   configure: error: *** A compiler with support for C++17 language 
> features is required.
> 
> gcc 7 is the first version providing C++17 support, so a dependency
> on BR2_TOOLCHAIN_GCC_AT_LEAST_7 is required.
> 
> [1] https://github.com/owasp-modsecurity/ModSecurity/pull/3079
> 
> Signed-off-by: Frank Vanbever <fvb@funkworks.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
