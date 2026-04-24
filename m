Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ED1FED3FA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 20:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4978F8120F;
	Fri, 24 Apr 2026 20:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RELtD66LP23N; Fri, 24 Apr 2026 20:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7863C80F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777062242;
	bh=l4nl4Zn9M1zDCiu7C9hkCGqGVbUYKYLaN0376WpAfwU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cbWrbnQ5YLKC2WGWpu4LHY5p6O6HsPD1sZNrUC4Y8UuSwcd4S0xZAED88E6yEFHeQ
	 KH0edEBTqtoy4P3TVp9LI9BX5gyXm2TE6gNQ/TZHs28r7P4FcTritPj5tVZrYC9bY3
	 +O4Ng8QYM1/JMowFs2GZSBCXh8ndd6s1X7h4iVgliZBhZRO/7rD0PYXbJ28easFp8O
	 iZUssqAADr1UUyPKdECH6z6340m6Q9Zsw1O8NKzvq03A+yeDZZI9M+w9FC98tfF+Fk
	 RZXBysNbWz0EFoAzQOzk3FR+BvS0uo8JPBdrPEicTydDgk5FvoIjhcGTinNVfPRHgs
	 ZEp0jy6Z2l4Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7863C80F04;
	Fri, 24 Apr 2026 20:24:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C85C524D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA4388120D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzHgKZ5Y7yyR for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 20:24:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0224A80AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0224A80AEF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0224A80AEF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:23:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id F0FE019F576;
 Fri, 24 Apr 2026 22:23:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 22:23:56 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 22:23:56 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260418080649.52087-1-chakrabortyshubham66@gmail.com>
References: <20260418080649.52087-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <0da97183666bda8df313d38b094f0638@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777062238;
 bh=D21NpqqP5VWpeOxNRrfpFKLudPIEkCPjVrh7U5VdZMM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q33xjx1ctxOaxV8lRQtyQfLOTaGDYfP17dOJUhvRCzqYjdH2Np13KLCMb8mDwFqrM
 MsyJpTxSMTWuetmXsM2bgjFD0z7XYPC9omaJne1YB/zlx8gl7J7m40T7z4gS1Hnlqd
 X3COsZPiaYqcJR6F8NoThsKD8A50Vl+WLMJnK9oYiZJramMaWx8u2oO0vB+meu0KMs
 rZU4y29ojFWmmRsYRgTQdPKzN0ToMzNx3FNsvKQzvZG4XbQg+O7uMvqgB/0Li4vetd
 SFtsQ55x2ZnAYAvdh7nxjsGjqgdj4L8LqJ0a49zRPYkRwBAHNxwRDaMwKbdRE/PlkM
 0XOc00c1UM8Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q33xjx1c
Subject: Re: [Buildroot] [PATCH] package/doxygen: bump to version 1.16.1
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

On 18/04/2026 10:06, Shubham Chakraborty wrote:
> - Fix topics navigation regression in HTML
> - Fix sub group documentation generation
> - Fix group name/title handling in @retval
> - Fix Doxyfile documentation and Windows binary naming
> - Improve LaTeX compatibility
> 
> https://www.doxygen.nl/manual/changelog.html#log_1_16_1
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
