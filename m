Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271ED60A2613
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kVxBIwyZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F16518139F;
	Thu, 19 Nov 2026 15:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b77VHjw_Z0OJ; Thu, 19 Nov 2026 15:35:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 170D581123
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795102541;
	b=IDVc1re+eg7XDFNg71LysQ4g4KF/cE8Vo8EHGxquIteya+6JhgdSQRW1Bx0dQTigTGcp
	 I9iYrpDe3fGVCC8euogXIapF19XuI3DI+buVeijYgMNw0ZlyuC2SXd1i9JttmUCsvGpin
	 jo9wHi5FT2NBqX25f2U+SLFfvVhQHK3ocF8C4tzfKswA/gn6Ti7mamvfMGuXnqxhbyolA
	 5RJaoUGsMsahST2X+I7IoL7jTKVirGUE+rpdHBe4ezRu4Z51GE/v3+IxzpocO4Vq4PJSh
	 qpWQbAqq+b7X4Eb0Y52196hGMDLu76jqwsxUXgW4RTHsjdNkwFcj3qWcFog+QP8K5mQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795102541;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kHhRdz2u0PtvKf1L5bdEuCqgHU3CP+ZljyqlIrAJC6c=;
	b=mrgFiS/8HUASGJ8kDSxU8BUMN3G6wia4vJMTUT0qoCGCGNr79+D4kReO+Yo2Nb7ne1iu
	 pHRBMvabB3BeSCprG87WN8kiCowdFE3tbLTlRNZ/KzIrp1olJyo8YWzDLjwO2Ms9EXf79
	 INwfOyN7nLwvrgFe81VD9LNh8BDwd+yp4Nen3qogBTqRhFN5Wt/svia8/BS9MQufVcZTt
	 l2AXTisWSLJUXRxeFjrXlQ5DmKoZ/351PgiLuZP2CBZmIcgdG30aiWmyjZe+SIto6vYN8
	 9ldH+PeOuylsEvK5VW7/DitYPhO/La8Ii5/oSMOt6PWVNoZlylbUlRiIU+8QCs6xt5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795102541;
	bh=kHhRdz2u0PtvKf1L5bdEuCqgHU3CP+ZljyqlIrAJC6c=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kVxBIwyZtAh06l3rAoAEjbacj+zb3lslGRLJl0fdDALQUDKsijRpPK+8LnFvUgqdG
	 JOS41ZYxsXpMS0Ka0yaDXJAwq7N3DI6/VwZgqIvuKboaM3+nuFkMyB7kzCxw7U8Ppq
	 Tam6vj6ppWDDPtJYorNv8EUAcyBBeE3ncox+cl3ZCijezVFW0OMCelEeS1AXOizwBx
	 oMUuPbOzL9qq8vedcyv64Y/uRrK7/WPRSzWSabmdRW7KOv6xCOoQ6WZhDtgVgR3zIT
	 8kW/O70aJ4WC9kOUw+cEpgYwWE3cTA1G2LEpF+aqp3mEYUSpB4ksaw+lyzvmBW1Evf
	 R1UAGu0DA3OSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 170D581123;
	Thu, 19 Nov 2026 15:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 829381E7
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7125240A1D
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgmSCleZpvVx for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 15:35:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6709A40A11
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6709A40A11
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:35:37 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3B37F2C81C92;
 Thu, 19 Nov 2026 16:35:36 +0100 (CET)
Message-ID: <5092fad6-0ade-466a-86ff-58aaa27cf2e8@bubu1.eu>
Date: Thu, 19 Nov 2026 16:35:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20261119152208.246924-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20261119152208.246924-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/cgroupfs-v2-mount: allow
 setting mount options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/26 16:22, Fiona Klute via buildroot wrote:
> Certain cgroup v2 features can be tweaked via mount options [1], so
> those should be configurable. Implement this following the common
> pattern for init scripts: Source /etc/default/cgroupfs2 if it exists,
> and pass MOUNT_OPTS to the mount command as options if defined.
> 
> [1] https://www.kernel.org/doc/html/v7.3/admin-guide/cgroup-v2.html#mounting
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
