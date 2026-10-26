Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90F606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=foo8Z7Wz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7520B80BF3;
	Mon, 26 Oct 2026 19:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAbQQM5_bFOX; Mon, 26 Oct 2026 19:50:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B67D880BDD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793044248;
	b=mk9VSu+msMNXaWWO3EnF8VcuKJxX2u94ccP+dE3BPwWyRg949u7qcYZm8Z3Y0uet1pUv
	 7L/Sgl3QzISaKKZNRHo41P6c7Ss2Ui9oOkluyKVHCGrOdb+y3QpHLv2X7gHrGKoh3JJfi
	 s+dHQQg2OA5YCgRqMGPmBtAG+A1qjDtALbzv9/RD8myzCOO3kkYGBwJmlpdD6HWKAbTOo
	 IWMbI/KNmZtYK5DWAG1zQBWjKQbfdFrDcjrCJzfbTeoOvqiVkezKMw7jM/8l60MBuVEpC
	 p3ETtvF5D6/Co6QsP2iAv3MWHEDQmxyKkZ616nt4N6nd3zNjnB7M2A2fIDmUB2w8Tbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793044248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xVIeBUaiT1Uj/afWoeuF3YoCxsRZZdQPeY6HFhfYNH4=;
	b=MoeW01vRdRmGxfeW4IybGW7P4/yt+hrEPcJaqkTam759Cu4NyyDjH0w/5i1bx81ADzST
	 KDaWbz3J1loiNWrAazg3GGf7YV6ngUb0Szq1UQFSfMuQqzuKUpeUFfMA3KnRMDUlaEWX+
	 fEJVOrP/m7eJaQcrZUwBq5gmPHRmjqBOYiVckhmKhP9VqYzxbJePSMO6arlw6obQoaIpa
	 ytm+5VI81pP5HeU5teMJojy8CmSK5Zv6gtYlNX1vqhuUh7cJOCU8S+JOzkz8vOjQKbtIo
	 r0vBBkGXiAPdpznQQjKVfiBWt0fNkInfxWI/biDzdjfDnsWW7yKJ2jw35LMix1FmM/A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793044248;
	bh=xVIeBUaiT1Uj/afWoeuF3YoCxsRZZdQPeY6HFhfYNH4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=foo8Z7WzBSW2KGpujRa+NyghLSE+BurEeRuIKz18+Otn16QmwUqpLsxVbTbZuKkPX
	 fZcUaaKwhiHHxLnsk13OM9hzFYm0+PIBt/OhqilU9SMzr+9CFoSCggNwJhQhOpBemW
	 E/ktfQSHLh3bExLwCWSoEch+ILk8ts5xMDADallWgiy3gxhZRtFSNU8fVqIVY9TeTn
	 koY7F3tDi23rO/ZpBEp54Z/yZKrMoEWzoL0qvOLu6bNoRkJJ+r4WAXmsFBsXBl71Nv
	 mXYptr8XS8amerbMNhNwc8stTjxr5+hK5hin4eGCJznJq5+YSGXjBDTyvBDx+EYawF
	 up6NQIBXVEXbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B67D880BDD;
	Mon, 26 Oct 2026 19:50:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5677A4BC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4813780BD6
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLr3vNuaxqxp for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A098E80BCA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793044246;
 b=imPlJOFTsvMZabLicAXSMhTTU/TEPK2BuKmPHt5/uKPFp3Jh+I5Jg5Pqp8kY095nTkoV
 YcO2+BW0udIIBQR1qV9mrBrT254FhlOG/qZGS21GQkkn6FfMEqFE1s7cVJXqXzc73CITs
 PMRzZSZ3oMFew1cmi4/Cy9ioc5L5cUZg1SpviXkLL/QI7cjjbHtDb/ni8dJaLOKyNcn4p
 g9Sq45PxCsbCuMdSguGJG35PiNgzTyFt+eJv/0za1CPn13v2SsECw3N5hOiWtXFsD/KgC
 zPwDtVSpKnZ5ln1eFwFA+HnyrsnPf1VjJi/1w49NT67MErk5+wFJmyp50Aikytj6AuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793044246;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=IlCtfj+BXu5xJDRBEJxyChPHVkgJgEjsOX/RUD4mIXI=;
 b=RXCNO2+OuYTSRC/yXhgbVZTKQtmt3VIdYKoUE5VZebDGHkThpRcjv49OWhoU48P7EbdD
 LxUnXw577/csEguq8DT1Tr5dtAIFaaJgiUSTj5F6oN3ZhOJ+4L/QwdB7lEu7cq0XI51/6
 grynoLud6ToN9IbcwOcQnBcs+6lsjQ/xu9r4GbibIdNF5Mtkxcn/+c1paSfaZFOzd8ikM
 26dMKb91w1hb8U2Vkb7rWqnE2rm/VOzC9loyvRyMtgZWeaEDMWd3OdhCduMjLPWYdvPOA
 AbYvEY0dlW5E+koyy1LGF2eZBpYPuk9quTUwuqbYXWW1tqiJ+TLA/9UjhBLOvbABJcg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fXYGLGWJ; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A098E80BCA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:50:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 59A6FB00535;
 Mon, 26 Oct 2026 20:50:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 26 Oct 2026 20:50:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 20:50:40 +0100
To: Joseph Telaak <joseph@telaak.dev>
Cc: buildroot@buildroot.org, Trammell Hudson <hudson@trmm.net>
In-Reply-To: <20261026182904.39575-1-joseph@telaak.dev>
References: <20261026182904.39575-1-joseph@telaak.dev>
User-Agent: Webmail Free/1.6.20
Message-ID: <6868cf8982b7dbbb6e20a2ef9e11ea81@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/nqptp: bump to version 1.2.9
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 19:29, Joseph Telaak wrote:
> Commit 48e8a1f041 ("package/shairport-sync: bump to version 5.6")
> moved shairport-sync to version 11 of the nqptp shared memory
> interface, but nqptp 1.2.4 provides version 10. With the versions
> mismatched, shairport-sync gets no clock data from nqptp and AirPlay 2
> playback does not work. nqptp 1.2.9 provides version 11.
> 
> Release notes:
> https://github.com/mikebrady/nqptp/releases/tag/1.2.9
> 
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
