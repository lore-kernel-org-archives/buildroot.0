Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97114C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 695BF80E7F;
	Tue,  1 Jul 2025 20:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGjRfghKfxO7; Tue,  1 Jul 2025 20:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B25ED80E83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B25ED80E83;
	Tue,  1 Jul 2025 20:48:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4076D196
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30E3380E7F
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTfC7iHJJktO for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 697FC80F10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 697FC80F10
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 697FC80F10
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:48:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 358C578034D;
 Tue,  1 Jul 2025 22:48:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Jul 2025 22:48:25 +0200
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 22:48:25 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250701160635.1271205-1-titouan.christophe@mind.be>
References: <20250701160635.1271205-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <fcd24cf00f5599ff172298d0cadde3f9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751402906;
 bh=x0EnotqWNRwCG++ApTjuLuSFbJFZAVMXlQUMrSRmLe4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jmef5dlKlK3PMIMJHhdz2bda4dS1CLuei5TKUze2UDEFYatQcOdyZIwJ7GwKGpBXL
 XRti3ob+pVHBxJx3fKXjiXwAWvHfP5SJ9zt2ceeVMVQmwK55oy5rBrmqCUnvbVT4Ci
 UFhCI9iDjVZpTQabDrgbeyEVSvdZhszAi+jphUP37GpPmQ8nJaX6RRL3dyTgIKTmmB
 RtArqJVMFXanlyO6U1zVMpg/sY4QiBPnTtmWrE7DTQL1N9BknvsV/kRtTVT4YH4zw/
 w+2ltNkrjJTfnvROoofB1QzlVYcSxdaDWQA3PuFYtoPyE87t2e6Zf5IXTRu9mawbsc
 qvmhInWCCUQUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Jmef5dlK
Subject: Re: [Buildroot] [PATCH] package/tinyxml: add patch for
 CVE-2023-34194
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

On 01/07/2025 18:06, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerability:
> - CVE-2023-34194:
>     StringEqual in TiXmlDeclaration::Parse in tinyxmlparser.cpp in 
> TinyXML
>     through 2.6.2 has a reachable assertion (and application exit) via 
> a
>     crafted XML document with a '\0' located after whitespace.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
