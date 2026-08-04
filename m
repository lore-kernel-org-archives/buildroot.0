Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21A1C55ABA
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 21:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB39840755;
	Tue,  4 Aug 2026 21:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bA7x2rcIGFPN; Tue,  4 Aug 2026 21:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D254640742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785877483;
	bh=jpU9SP+KXZNXiAAfEWSdb9/ZLj+GGARE+HqDBTxVzvo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jnoSVhyIbLcamZrjGTCruIC98R7jVi16PrlIPJWJqazbhjx/UQix3FYowQsI1Klyc
	 0Vv4FfFym/AZCK+Je7soOciKBauE7VHXhbzQOju2JmX7OMQ82bhMI5z5TXjxIBqm6R
	 JjteYcH8XR/FD3oD1p6R/s7U6bcRj+Hznm0hgEkN6EbRbn2O3Y/ONaLRZyhrAgz/jL
	 /LLXPLwi+sYB2xmcb9B3zUKMdMSx41Qgrv59XJ/W5uJ2mUcon3k887dV4e1gerEjov
	 eXF1Ai6JmRBZC2M53qliTNfvyUqXigIAppotM1kB9cbNC9QYhOO43ND7WmdvEExA90
	 hmwXf1eP/DNiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D254640742;
	Tue,  4 Aug 2026 21:04:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B189332E
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97BDC80AED
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UY1_JUO7_HAF for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 21:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84DE880AEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84DE880AEC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84DE880AEC
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B52CE780503;
 Tue,  4 Aug 2026 23:04:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 23:04:35 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 23:04:35 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Deividas Puplauskas
 <deividas.puplauskas@gmail.com>
In-Reply-To: <ajACYu7LSI58wafz@waldemar-brodkorb.de>
References: <ajACYu7LSI58wafz@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <211af9d031a4029deb52cc42e79275d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785877477;
 bh=zCM6iLtz1TDQ6FpsC8Sft7OY5WM5pM1MBHjYzOmbBjo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LWPlr2TRfpFoiC1R7wrZJpwqH/l2rEH5/cbkOL99HvmIwhiJFg51IjzwUYcD0ISQs
 ovuVUUzSRFmQLpBv5aDKusfeev3eICjRkW+eduaS13MoIUD0GdTvQq4ETfDRvPcfz3
 a1CjIZT+mWBDGFkOx8tTHbatH2555w5qf8nEqHdoZgG4ZW6gkVhsggD28scyRjnLI7
 Sm0gz4xrb8dGmeqVV3w8tggzfdiXZTfbWLlYaDbHmol7vFfsu2/jI7Bj7aLB0rVmDY
 yKo7rLf4asTi3bKJUNnMzL4YuR4DBJ9l8NdZdacb49fGbtwIi6BoCJdn6w6CmXvmTG
 MHzDvQTMKiPoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LWPlr2TR
Subject: Re: [Buildroot] [PATCH] package/perl-log-message: new package
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

On 15/06/2026 15:47, Waldemar Brodkorb wrote:
> From: Deividas Puplauskas <deividas.puplauskas@gmail.com>
> 
> See here for a description:
> https://metacpan.org/pod/Log::Message
> 
> Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
