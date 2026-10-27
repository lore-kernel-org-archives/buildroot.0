Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D89606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B2D405F3;
	Tue, 27 Oct 2026 16:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4hijHoiQ3u5; Tue, 27 Oct 2026 16:04:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BEE0B4055E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117053;
	b=XVMS7GTaGZVldCAPwNgq0SswGo7rxaHmUXzJB6WUPTQlY8MkljSl5DcOB3BR9YQmIrtQ
	 LTHsArgI8Bk13ugD4DSBktqQa4/2ucvo+7LKs9BWsdspEA4M75O7A1Eq2OdnXIKzODe+4
	 Z3q/im5LJPPFrkSfjrWwGDJVKg/D0XYPZ++NgxwJOyofXT/aJJggxfclvINJdh7xEevv2
	 7JoeA4f1qCB8abIsynuOvWpyx24fqnUqq8qH4J+MqnPGYHaJdPc/UWcPab08FS4+7QAR9
	 pfrVuY3idtzJKhhV9JUmYzzzUgxmHmX5AdH/d/GI/rV62KFeManpG/5B3O64iU1/LsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=g4A496Ex5CQFWympr8cm0F2Z9a21GEaugATFiu/nme0=;
	b=K2g2vCVcwpoQQJ4Cn5OVvgN7Gkjrl81t//ORbVL++uJbfnaWMHxG3lR+iMiMOq3G6HF5
	 /Y+pd6L4EgBPOjesFMsGjnQ9Q2udCnZ+8Wce/QlAGzFkJ7X/KSg7fowe3/lTD3+hcgifq
	 RdGVOqPOIpzMTR9XlW/AxNQj/Ydg575qb2v/dmkC/5busEkZitzTB0Sq931vVHGx41K8p
	 iR2G944RknvCe67h0PPvh/AukoJ+pGtI6N2lxgT9rdOzwr9Txkll+Y06bRqghRsLK11Dj
	 GzMr+M6k9Yza25ijFQMw0LrWxk7gW/zXMJzXdRLWRBxCzmjW2ydaMIKUquJYLyFD3xg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117053;
	bh=g4A496Ex5CQFWympr8cm0F2Z9a21GEaugATFiu/nme0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IJPK/QpXj0qj7bfRI7bkOg10yQL1CL21LYQBGGTbE4bUSKgusxjLIkiydEdSuA8+y
	 I7x8XJwuTMtf+eECVcWi9+RofkL9hLSzB3SeNgOMXNzLPcb0g6yQrweuQA0BUBBWH2
	 Hsx6gBKjylsGr7jkHWUQ7YJOUFf5v8wEXaNr+v/D4gRQZ4o0R2yLvHbUG0E23yWZzK
	 LHaOdYcDpYZ1AQd0pTgmpu6wGlVDbhqMav1M9kMoQEIuX4JTvjZiFdDiNbhc5iz3Ja
	 UOyK5rdLbkz9Yu1H0qQVDEN6J7B7ZlUpO3EbFiGuCuAllXIUTn4I1WFpvNng6PhcNW
	 UsqFt322Ycb+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE0B4055E;
	Tue, 27 Oct 2026 16:04:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 393B2279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ABD880EC7
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZhKxKct0rWz for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:04:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 81E8280DC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117050;
 b=NkdZRhVdosCzOwCy13agM51FKSFl01aMbaNP6Gfw0S6Ypnn41eZBYHsb76en4siQbswh
 YJjJN0F7MNDUKQzAt7E9Hi1GyENxIYoWnY3kRvKgs274tNfhrHFmMCdRSynUYIAtJacXB
 djC2+g8orfgcGOF4KN6fm4eLhLtDnEvUPLqszdshauisIi3mQ3W39MCMy+nsYntxcvl8g
 P0lXTZccGYYkfh6IOMdETjnU7AEPWv89/TvlHjv/XeDcDrM7k4NTG3Moal1jNv+WKQ+uz
 nVOzLaYOA+FN496Sj3jQzDscAGYAMpXVClBHf+ZPVtHDj6JJk8eF3YiBd5bdxisV8Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117050;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=S3eCHPICzGw78ijej9z9G1y+r0ZzjsoGNuEMKxL8QN4=;
 b=ADPjbSIM3ZTzO/Ibm/ygxCRL24GTHZdRz1zLXOwZQj+WVMsiqOJTNH48GTQVJ/ewR5GF
 C8E07pOGqzsc+FDklFLi1qtgCCVtOWlnGswa8DclQjQaSeAGXc3pi1MNoMWCzrnrm0vyT
 gBCF45jGJNXM1ZvNzZE/GDvlOO6kqq2ej/3gugAm3fCD/7/6LlIETgMyhUqxvBrj+UJHp
 3lU76GQqkUK33JD5bAD4qjJjBOchmv0fVzHrNjz0wQau0xf4raJfaq6G9rCGpN6ENfsl4
 OpUJ6Wv7uSxse3xnGi5i5liBH6mxaVaWv1zdiYg34DwDlK8rySeZASpQa4mhGETxVTw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BCILNJMR; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81E8280DC4
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:04:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1ADFF1A1350
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:04:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DC46C603BD;
 Tue, 27 Oct 2026 16:04:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D670610328D57; Tue, 27 Oct 2026 17:04:02 +0100 (CET)
Date: Tue, 27 Oct 2026 17:04:01 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <auDLalEcVXAWhtpJ@windsurf>
References: <20261027145351.1527631-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027145351.1527631-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/rtl8723bu: bump to 2026-10-27
 version
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 03:53:49PM +0100, Giulio Benetti wrote:
> This version allows to build up to Linux version 7.2 if -Wno-error is
> passed to USER_EXTRA_CFLAGS. This is done because starting with gcc 14,
> several C diagnostics which were previously warnings are errors by
> default. In particular, -Wincompatible-pointer-types was changed to a
> permanent error by GCC commit:
> r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
> ("c: Turn -Wincompatible-pointer-types into a permerror").
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks!

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
