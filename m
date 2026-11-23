Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4558A606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VUbZk/KK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B33F580D01;
	Mon, 23 Nov 2026 20:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NwujKXApYAf; Mon, 23 Nov 2026 20:48:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 66F6780AAB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795466923;
	b=O1OdUdDbeg+FZXexsGP8oy4hXH6D2Z4ovotpY6+eVlaUXini5r3vD2kVgP+usJmTDWhz
	 7SyXJTtWhG86a2HRv+kATicaD+q/gPdrhbxFdrwdUCOjzfLTe1kTgyQNKH11DwYOBiefI
	 i4sgps1MBcH4FVWjFXA4Q5Zy6NjrPQ7J12wpvjh6ZhZSLpa6JVMM/z9D5A8lQj31lc1s1
	 Yqtj0dLSj7IHNocjiG1H/8cB1yU2fVmkl1oAcNPmUDxzNi6orLVYs7Imeok9/4PNGvX7r
	 TKJpi900mVimg1fveFEAct2V7QMtDTh56FlVq/TNGqvr9mf4tG1XEIVEx1lMrx5CK7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795466923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=LXs/gjLGlcfiGGR9ESVUh78IdyYQzBBcNceja446vo4=;
	b=faf8scpHFTxldRI4abEMNXyTCHhEo0q10AUbrJa3XaQMvpLinMzyH5vR0LPrZGECZgPw
	 WN8eqvvHbrUqT30133UuBG1+tXIV9UP2NXrm2VbSMgIboW8VsV40ztt04fn2fvxihVemh
	 czmnNaZYAuIJglLSQoZODrbDmPdbe/Hf/kk+sFa6CNRkDmahs7nEj0Jc78kHIxh24944u
	 BLDPbzkQOMvUEHWaSU++DKg635ZVdN272LX4qspb5qIUSi6oUFo7hMokIqtAUt7Ejq0pt
	 HkhGIz28aKtMnjP68IzGSOiSTTixqttvlDH4UYWij/klFnovQZAuxWjJHsgcyIRNyAA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795466923;
	bh=LXs/gjLGlcfiGGR9ESVUh78IdyYQzBBcNceja446vo4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VUbZk/KKN4YMEPe4xZcXIlFPF3D3+GE5q7q1YQLIaXNEYXBYOyDY7eORd1zK/aTba
	 6HszM/Zuknuy9HhrfJnXw9S7U+riL3HQZpdjrboByS12rCReBOuL1LQY+/0D4bUOMQ
	 yjTlCOpeYQt4HaF2Zp+BI/cG8jtFP402kdwScaKUP/9GgEeUN4eq0fwPOXTDcPJa+U
	 GA3XStFqZxS3iHyhHIIswMEFkb61RXpAmDrxOE1KJd/IF8skMICOcLVkUknbtC5srP
	 M4a8RqbTSOpKaV33HObvBgQAvURSTXxpM9JsZaV16N8f26xI/XalEIXaSApF2/zuZs
	 PgdrZXotmIMww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F6780AAB;
	Mon, 23 Nov 2026 20:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD3AF311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9C0A40728
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcUPRAHx1GAz for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:48:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AAFCD4071F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAFCD4071F
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:48:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 48CEE19F59C;
 Mon, 23 Nov 2026 21:48:36 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Mon, 23 Nov 2026 21:48:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 21:48:36 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20261123170954.1060745-1-dario.binacchi@amarulasolutions.com>
References: <20261123170954.1060745-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <1a7f1dc05e3043aa6ce917adce10283a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.8.0
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

On 23/11/2026 18:09, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
