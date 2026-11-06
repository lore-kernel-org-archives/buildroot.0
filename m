Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDD9606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V03rc9F6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDFA081285;
	Fri,  6 Nov 2026 17:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVCN3vPPh69M; Fri,  6 Nov 2026 17:27:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 709F78125F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793986020;
	b=bT6Ep8FP9osH46EHnfGu2F1Uw0K8/oIN4GBwWfRacT/hixU3mQEXnGGiek3fHTsggxwT
	 OtncKyX2bm6Vs1bgyfJ3Ou0YDnGjT3nmht4jKNtlgzrlrOJwPdi3kEFTPuTLiBmjAvxL9
	 IJz0yXD/z9S5LVJfEeCtNQIkHKMaoCl8G5GW6tc4aKTTXYrGH2Gq7jAgwv39u+28DeP2F
	 yoibccwyGtuTtjH0ANJhap7YHa2Hb7bqIOZdha9kH000j4UsTMh43EIUAzvT66v5d1HZH
	 MwR1b80m4XluQvqg14401dKqSWuta4+WbK1ZF4nn7T+DjTAeWZNSOi2hYeV4h5WBewQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793986020;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=n7xBpIjxNmi3Tc+ctyf47JQrOWbjoFPo/E8YkidTUsY=;
	b=W9VWQTeFNu1q5dNXwzc2yrr1cWM7kpuVCaVP1ZeN9YYyfxPUF1km1RbwNeJTk009kFvb
	 yPogfpZNT0roOAhvemJmidksENDWVqJ/wCImd+wajVEIm3snI5S9IRun4yg9YRvKrJFtn
	 wdiiz1F7PM/XQ6va2uaDCnHlmAmr2t5ubWQ0R/taajOikbgGSMCpLejG8OaMysQzVL8UO
	 qTcvwTYeGZ/ELnjlJm1YShNcGgTTeDuSRze145wzYi3BWkorhNfQr0a+qqft1126DU6u7
	 0lw+f88zBc0P0C/lYc6bd1givzTr9PkHheW9dMvYYYH/+/UUtd2/FcY+MuIuiE79NAg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793986020;
	bh=n7xBpIjxNmi3Tc+ctyf47JQrOWbjoFPo/E8YkidTUsY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V03rc9F6eNftQ7dG3/SkRViYkXBrwfcdNv7NZBUc+Gxhfr0LLKR10HsZg5OmhkCCl
	 QASrbDUMtJgtp1Mv0IAXArw5V+vEA5/woeAPXeWoHpkzVDdn6vCdYKluO/HxRLNHJ1
	 5mF2xuXTIQF4GwoAbXsxuNYn3mgmnjqTD885uDuuDyKVB+nYp+evzVfXQ6OhLP8OJ1
	 37LMNDBBPa7WMUGjXitHV7vHM6u7MtfemDmzDnhvhMmLWct1DpH7ZJt7HeAeuz82DI
	 En5CFr5KC0N4JwcRdSykN8F2VXoyBdldTVx+/MHfcL+Mp8Oo0qoB38NGRMcruCgzTe
	 5EtYn63SOvwdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 709F78125F;
	Fri,  6 Nov 2026 17:27:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2386034D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0995260771
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDyQS3MfR8rb for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:26:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D008606EB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D008606EB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:26:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D2E75B00548;
 Fri,  6 Nov 2026 18:26:53 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 18:26:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 18:26:53 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Boerge Struempfel <boerge.struempfel@gmail.com>
In-Reply-To: <20261104114543.2526646-1-yegorslists@googlemail.com>
References: <20261104114543.2526646-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <93458575918b2706c2eb0d0e5d63a568@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libgpiod2: bump to version 2.3.2
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

On 04/11/2026 12:45, Yegor Yefremov via buildroot wrote:
> Drop both patches, which are included in this release:
> - 0001 as upstream commit 6276b2514c8f ("build: do not require a C++
>   compiler if it is not needed")
> - 0002 as upstream commit fd67984496dc ("build: honor default_library
>   for the installed libraries")
> 
> Release notes:
> https://web.git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.3.2
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
