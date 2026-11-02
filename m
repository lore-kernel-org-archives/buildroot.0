Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CAD606A327
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cqvcA+AO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9255A4070B;
	Mon,  2 Nov 2026 12:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmeeC6X36v-W; Mon,  2 Nov 2026 12:31:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C0304074F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793622684;
	b=gfms5Emx0rJaQHxf+Q6uRVXMdCqrvcuy/IY+ugfnkZCzL3k/77BCooR6cpcc6RXdVEeK
	 uAQJ0JuIt5oLWfoiWSxJOyEqDPZy2VBO/+PVYywK/WprZaidMKFEQW5LGpxLFAfj57YeY
	 g2KZqzok8hwuTuLwFPW2sIxHS2ygmljnFDQ8OAyvnEIqe8TIgRONUnaNNx3l6wr5QhuQn
	 eYBBEgMawrSsUltsovZciM2XTSs5L7/SY/mHraPotCAtj3pGqckwBasffqNjdwHZB8BI+
	 Yl9CefDLj1H9h9K7ErBOktlZtbvn8MOX+jLbRh8VhEn2GL4TDsGOrOyzYGoU+V66YxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793622684;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vgr/7ZNMjV4BrzrPnXCu1+azfuPtcBIOpMzQDDU5AYw=;
	b=ExaU+GQYpeIs4g7XWHrZK4U4/4V7o7FxeyifLpNZFdKBDqQc7ItjDIC+dMYPIhftzB1E
	 MnoXCsEUwVWc77XcNqirJsm+qFCaw3cHnSVcWrd10V3pGxHscNizgb+6UqmpV5PEGCp+Z
	 KIByW9iDf5QoQyiUOUbnlFFNa2RMYVcbEGpiAmZ7fdHpphR6SD/Av0xcEaX3rZVpEAqGw
	 EtYYIRcwq3A8ABVKZOmvMZaielTZmwYjCfDATc3rO35JFHG7YWvFuxuFvSuS5XBhV4I40
	 wuSoNPkEsrSyu+JccQqY0QMfmE0OSVQPkObHRGA1ZtP5/h3j/jBHsIUvfygbmdJpRWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793622684;
	bh=Vgr/7ZNMjV4BrzrPnXCu1+azfuPtcBIOpMzQDDU5AYw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cqvcA+AOMXzk0MqQduuxM1Pcsva03ztFB/BXCAFjgNN65RT3DPAnoZ3Z9AWPJ1jcP
	 ZqMbRBWh8ZaGdmy5Vtrv1WU/TrpgzfVfXKCreiTTzy6QqF+lTTbBW/a9MAeoj8CPUs
	 8QQ8oxpmmPvgpHA6ahPcmElWDgpcGPnz405lK3u15rEu3JU3Cl/ieA2Y0l8d4sAcTE
	 0Q2OD5k5RD2pe+62D88VQ4BDV5XdgHDtaat4FeX6nXDqi7HDzKzeo0wKjaaAiyGtbF
	 4qD92kjx8ozttAdHIJwqZlP31enOsis/4j3XAmFamFGCXYTdApdIS9Jn7A4s6Upm4X
	 nrexTtrVKfT8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0304074F;
	Mon,  2 Nov 2026 12:31:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5549ED3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 12:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52CD280E47
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 12:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9Iqb4AirrYL for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 12:31:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C36DB80DCA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793622681;
 b=gJ4zfN2PtZcgT+gRZaqB+dIpkfu+YM0DSNIOYpgi0+6sIx/1DJAHNkZX5c1DR2yxwOo6
 qJz2AE286l4TJ4yRBc6mN/TsqcfEfz4TnJMzqe283Kqc7jB+2HTWaSs13bFgYX9ld/FdH
 gAZJRaYgB+tvU6TxNB/nvh3iTwMSbZmXwxnd0FADJMbj89AY2cD6k/16uGA1H2HE5Q2C5
 GjPXpcEWwYiO/h/gfoNMJIe85/TRgs2E/8pPIDf1ELeiLMc9A0ORDVlbUn35L9wul6FYG
 1RHk8iSXW/p1wUiwmx5D+L9MdxpP2l3jXY+RWgPJgxhweSHqBtl88Sml2vQWYwvyJuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793622681;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Yr29letv5XTatX6ML1ync9Vr+k6dCTGtku8RXH9mfHE=;
 b=OVUBB2tKMGiXlqc+vz8oBBt1oZttUfSEfvHdXbkS2uVfLp1WAT778D0n3WWHcgkRyKcQ
 lCBWfVIb8L6dAxJelWetilO5+PYcjf/Gx82KPCXcvEoO4hBxV/a87voUM9z2VvBQAH6RT
 ye4+QnbSJWRJLEgaYnY2A3M/7bc8BCzxktRrHpCzY2F/XryiojxnAczYE6vO6XHX6GdjL
 /Z6/c7irQNFwbq6U1dVozk+HrM9ivHGuSN8R0ZQ8S6PAcmVLuHPzsMl3iUQNFonHb8yOM
 qKfjbXKGfZoRHod1I9yEdxlK6Y0bmQfSiBzux4ZaRR5b93dNYdSAIyOHPIdPg9WWvSA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NkaT2ElY; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C36DB80DCA
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 12:31:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E79B3C4FECD
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 12:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D367F60750;
 Mon,  2 Nov 2026 12:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C1835103290ED; Mon,  2 Nov 2026 13:31:10 +0100 (CET)
Date: Mon, 2 Nov 2026 13:31:10 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
Message-ID: <auiCUtpF7guRYwIz@windsurf>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
 <20261029144400.2972217-5-angelo.compagnucci@gmail.com>
 <aufBUAf26C3d42n7@windsurf>
 <CA+TH9VkQEmYE4mNPyJVxxY509kpJv923Rr8KykKz10yiZpcPKA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+TH9VkQEmYE4mNPyJVxxY509kpJv923Rr8KykKz10yiZpcPKA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 5/9] website: bump jQuery to version 4.0.0
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 08:09:56AM +0100, Angelo Compagnucci wrote:

> This should be applied after patch 4 in the series, which requires a manual
> intervention from the mailing list administrator to go through the mailing list
> because it's too big and hot the limit.
> 
> It happened already in the past when I sent the new website originally.

Ah indeed! I just approved the e-mail.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
