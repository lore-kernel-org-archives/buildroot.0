Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F97C606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lAwdcyDw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 723FD4054A;
	Sun,  1 Nov 2026 21:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkAKmW7pJync; Sun,  1 Nov 2026 21:26:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 34D2B40556
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793568365;
	b=TvksoN6m6YkSq81D7qU7o/tdyZWZNGR+kAtVFxUTsamtJ/h1vHTLEIVf5xicQMv18xfX
	 r156Bxh7SBOYo8/zIIt+4IAvrvvy6Rf01akGhBoMRLbxwXGHCJW2/eB8dyiCymjG/CatS
	 6mUBp7VbsoV/xWFFuJlwtW0eCHVJBw5xO6M7GTEt9lEZZeCkO6oCSAiPbhKOGq3piSDaT
	 7aO8FMKdNjJAd7luJK9HvXZOY5V22jrQu1NCPNQVjoTqHGl4lY30lsg7xjPpQq4SQJfGa
	 df1Grq8/bWrltXsmTC/birbB4u49Ysv73BTUQq7N/BkQa4h3rMdSExksV4r7reewFbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793568365;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BFeilQTRDZt71YjzRG/6bJhWQxRYZfhdfHonT5LBigo=;
	b=Hy83k6wa0B198wADlgdo2ZiZlgPUL9HPTJdSersLwyL3gQwGNDGsWjm2UQn8vLL6UXUG
	 tT6dCZrjoGeYXjla/p7pYMviuQBpEWHRDLBs41x+RUouEeGMGvG6DGfPsKYY+JfTFQzq6
	 LZITPGF3N34OLXuH2wEHfXQ8eyCgkyWfBjc1tD9GkA9bZi5ot9ToajV90cT7TWN0bXRRL
	 sXb59neKBon/LFCQkf7fpOwIdqvspg8q1PopcuwNMbIlzkv/tsITkhhQEDOdoghLVB2xt
	 uPUwpkLQrJBx2SOabhRDH684BP2T1PUh4dndDkaOwSp7SCpr5MXO4bPJN+O/J/Owt0w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793568365;
	bh=BFeilQTRDZt71YjzRG/6bJhWQxRYZfhdfHonT5LBigo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lAwdcyDwaXruAip4S8e3q3XK9XQsQkO9vUMbGrQETSK90LSuo1BW59FdbV4VTP7p2
	 vQtbVkyMTf3PG9GJkaTjc1Uju4KubWFYBQgfE2vuMY2KD6+AD+9s7To1GUafpAQTpV
	 IGuSyAsYWiOxptkQbRaz5klzr3bxX4rMvGQVzCCLiIYSXY11wiHCct0wCipNKHT7yt
	 Jqr/a/ffCzXtbqwPUmCckYe2xV99bhs1ShnFFmqbS6KSFgWYtYa/0w0ZfkPGtZdC6n
	 d/zDMDzGV+v1pSVEm6q2QtNECdtS6uih74BzBD+KNTuckW87JYSU9oOtmj2RgBRYGL
	 TUpJEuVPlqpOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34D2B40556;
	Sun,  1 Nov 2026 21:26:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C0C4156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D5C74004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxP5xtUdyo8R for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:26:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B6AD140042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793568363;
 b=dW/c1i8zwyF7E0RwMMsoYcAmPIAmLtHKtwhqlfhPxYpuvwVVUkZ6ZyU/V7SPlWkWqgPy
 JrDWaRIE6qo7m7QZWnXPvKzCU1lmPIHscQJ1RfqdDAG+g+usvvbvZPqNtnQ//XmBMpp4x
 nTnHBdlIOqlj4cU5Qa4J34gEnvrKJjYhzr8KA0NW/Hif8o8K7DCwJnpQYW1TEZktmbb5B
 bRzsq/jJAXKJTq/ZiuRWqfQFnwiho4QZ+GvYu0bVITNVdeIuq2qF2qJNwf83EOrSCjdOC
 ZOEe/+e4oqinEtqVIKX0SxapFhLQE468EOI58xQ1FGAhYbNqiLABtHTZQUuT26V/ZDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793568363;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=UJS8Ut9gV0Meu0EwntpDKUuOoZaaZsKhzbQXmL3JMyc=;
 b=F+zVkHvkOym4kKUcWh78OPfk2Qjqnu/1GHW9vT1Qo+6cCmPyAPP/jteAXDiLAc6Zoewz
 4eFJdGvsHffFI1Lq3Lpd/Rj+T/8ZtNiNjPJ+IxSA1pD4dLHBmLupFcf6nKoa13zGKB2VU
 6kUs+vW2V+9nDf+mWro9aSSLrvUDxFbDXeAVbMtZ44U1OvXDMRu5Og25E0XGa7vd/uMFM
 xZnBsg+x2nf8EhEg4shO3lOJKndZOx0kqxLy9r2U6tqn/Avkynv0A/hWpOKnd5lotF2AI
 3oP8U3MUSgVOChQPsikTW/wxN0MCqlRr7cGsMJS+9nIDjF5v9gfFFzEAJl3IUPHxw4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=u137mabx; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6AD140042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:25:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2F0054E41378
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:25:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E718C60750;
 Sun,  1 Nov 2026 21:25:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CAD6310328C5E; Sun,  1 Nov 2026 22:25:55 +0100 (CET)
Date: Sun, 1 Nov 2026 22:25:55 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <aueuThCy_draJ1e_@windsurf>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/9] package/uthash: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:24:26PM +0100, Angelo Compagnucci wrote:
> uthash is a set of C macros implementing hash tables, linked lists,
> dynamic arrays and other data structures, provided as headers only.
> 
> It is needed by falcosecurity-libs, which otherwise downloads uthash.h
> at build time.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/sysdig/Config.in   |  2 +-

This change was not related to this patch, so I removed it.

>  package/uthash/Config.in   |  8 ++++++++
>  package/uthash/uthash.hash |  3 +++
>  package/uthash/uthash.mk   | 19 +++++++++++++++++++
>  6 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 package/uthash/Config.in
>  create mode 100644 package/uthash/uthash.hash
>  create mode 100644 package/uthash/uthash.mk

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
