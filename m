Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BF6CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 17:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994FD84653;
	Tue, 16 Jun 2026 17:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnHiuhNmUkP4; Tue, 16 Jun 2026 17:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C36D384565
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781630361;
	bh=Vy0mGRZj8mOBYMD7KgEdhFu+ltVV8aA+MshTKQpDoYM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=FmrKL79oWgcK7BNwxZeZC/DSyvJ4TG8zBR0JQF6r09mM+eiVXLajjLo30zsX2ahmU
	 xOgPpW1fKQRpDzIsOg4wPFfR0lm/D8dQqvkf74ItHXJNVZVRJIHE2J/qHKi3pK1mVF
	 78FnnBsVRrynMiNgkKoh4gUVxwj9TR5oh8LL8h1qDyngMipirtKvOcarhGS8ovocNl
	 kgVcXaSXUgmr+mnbmpnIo/TgOiNIUmgtqJfE9iNbx2P7hpvj98jgUY1q488YFlUZ9P
	 nAC2ou1n/2a67FWHqcvFrbuPWcmslUYNOD5TzR2uljG79rLfrFDgB/+nwPPkIfDJsn
	 R+YaTvp8tR2Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C36D384565;
	Tue, 16 Jun 2026 17:19:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B168A2F3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2B4940210
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZkpW0Qvbr0X for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 17:19:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A40A24015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A40A24015A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A40A24015A
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:19:19 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1850C2C89186;
 Tue, 16 Jun 2026 19:19:17 +0200 (CEST)
Message-ID: <dc1571b5-191e-4f05-8986-27f67dbb07b1@bubu1.eu>
Date: Tue, 16 Jun 2026 19:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org,
 Peter Korsgaard <peter@korsgaard.com>
References: <4d0c25b9-6b7d-4104-9b7d-aec6dcf55f73@gmail.com>
Content-Language: en-US
In-Reply-To: <4d0c25b9-6b7d-4104-9b7d-aec6dcf55f73@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781630357; bh=PE6K76eaZjwwkn8yaJHqZVnLmyuo6GltFuuwkLyzk3c=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=LeULBEdU3Qc4FX3QZsULzAyA3UZXTzM9ubeIVdb6X/ReEgpbbluXRPJm6g1w8ODhi
 Ej+yN3dgAxJ9cbROadx9WshQ6bNNcWzmrRiTLCxE7VlAfoGSWhBY8bEixfo+45zvYA
 tCgkLA/lpZ4lBeu/IXHQxZYww9nt5Bi6mc0mAZvJIbD+i+5aAvZyF1L1gA3zleAAla
 JJ5fEw7/WSQsRVZutjD8hLBXjLURflIEMA4wPBtrnwk/0uh4pMD97/SywjCaXtI/NM
 iMUyQ3Q7jPCrXL/gVcZHcp2nYGtwwdgIKiVQAnD115anPRoG8no4Z9IZlV9nVIwsdQ
 9Tg1uhdmRLKdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=LeULBEdU
Subject: Re: [Buildroot] Busybox concerns
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Lance,

On 6/16/26 19:04, Lance Fredrickson wrote:
> Someone just pointed me to this issue on the busybox github mirror that 
> alleges that control of busybox may be compromised. Wondering what your 
> guys' thoughts are and whether you have any other insights. I'm not sure 
> what to make of it all.
> 
> https://github.com/vda-linux/busybox_mirror/issues/12

Peter did looked into that when applying the last busybox update: 
https://lists.busybox.net/pipermail/busybox/2026-May/092326.html

So, if we trust the git history, the release seems fine. But the 
maintainer seems to have far too little time, which is never a good 
state for a project to be in.

> 
> thanks!
> Lance Fredrickson
Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
