Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE909606A68D
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hEVO/ncP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB9F812C2;
	Fri, 27 Nov 2026 17:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3LB_Jk1nq1q; Fri, 27 Nov 2026 17:36:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CAD668128E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795800963;
	b=lrwEXn7K5pOWAHbwm1k6XI1HfMPQbOghsMoqwbMvN7KnL6nWcB4fX2OOd7ZNSSYAmTtc
	 MzWITXxG2yp0oqpUFpHBEwJz19f3YgTmaABjrQhvNJpm3IStO4Aj1FILF84PA7Oc2QM24
	 F4ScruQ35TWo3L8NRLuRMRFajV6hMEQklLHCm36eHjn1WLIERjOXjYd121kqAmclpljb/
	 y1oLjziCDnyDYb/Th/Wco3tJZrBknd/WJhTYVMOX1fjfN59XDak5/3Lu6BunQCOpGoOoB
	 CFp3IDCFGrnMJBUJ/hJvrsD4kwbW8fTc/XlpauLmfLOLCozqcnlbWXUZALIw1oR58GQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795800963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=i0L5Rw45ifNi/Lo94WEB8388QhRBO4JqiuftIsBvmOw=;
	b=bhFV8Vq2rZcES8eBeXo4rI2uO6e7uURdO6iadA9heN+aENW8P95NdMWpqX/NjH+ZNUTA
	 68sBZbcEuBcRJPLGa71nJoFkDPTYZH3ZZEmf6CFvqZ6YcSJhdcUg3kXpgwO2uCm3XaK6T
	 r7MTBsdlBmnVCX2fS74uhSUuW32Phd/xjtELVbaXIEyU7HPdrC3vpyrZgsBpWZUF/Dyy/
	 r/fnA6u0150k0L+O6sWJrcyundiWcL1/OGLzHUVsvnAiycukhBHPogn/f1PXawKwq0EAU
	 xNoSDCn+5SLuATkmXIsoVrFZHd4MlqwdfX09945yx3Yhsu4sXNbSiV0Hi7Q6BhJtFJg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795800963;
	bh=i0L5Rw45ifNi/Lo94WEB8388QhRBO4JqiuftIsBvmOw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hEVO/ncPJNL4RK4KCnDakOV7XfFQJ0bVUEBuXMNeRRkz7uiWU6EW7mxNuU3Kw1hSF
	 U/uYh3cZycePZVcbMRR+kNvbKxsOW/4VGSW4n7mPBGGc5s/aV4Sv9tzACH+qC9S1TD
	 FJiDT+Qnxcrw7H5nj88QywdiBjtEA41LjojGRKfdol4k5lcUxRPeuT7iLeeioFzy27
	 vr0VEqXzfZmaJJpCWdVc/BZqp5tAfo6WKREOZuuxBV89VPDuajE43ipRz5zdiZ3Oia
	 7FjRBd34/MX/GdDE0SKVwtExlEVwqwPATpTyGF3OhEpJTfROy6EjVPKP+0a/bdYway
	 QGetCgvYqhDUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD668128E;
	Fri, 27 Nov 2026 17:36:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14C71311
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE9AD40B12
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99c8wViQVn2y for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 17:36:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 46AA54055A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46AA54055A
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:35:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1BF6B2003CA;
 Fri, 27 Nov 2026 18:35:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 27 Nov 2026 18:35:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 18:35:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261127164551.3676196-1-bernd@kuhls.net>
References: <20261127164551.3676196-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.22
Message-ID: <8a60a8f6d0b2f1e9c5cf8f9b215c6c96@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to
 6.6.10
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

On 27/11/2026 17:45, Bernd Kuhls wrote:
> Release notes of this bugfix release:
> https://sourceforge.net/p/fetchmail/mailman/message/59438762/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
