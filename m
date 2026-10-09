Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC7ACA9EBB
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7552A8148F;
	Fri,  9 Oct 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MkH71O4gJtKM; Fri,  9 Oct 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7C8E581489
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791580460;
	b=YuiA/jIKjttrOib/WlLcELkvaaDKz9EKgUFq+WOgOznRz9UwwiihgYyOPLbq1CCvoQj3
	 j9AfNqqwT0eoqdQIWD4sTxoCoBtOUERSDz5yRQ8KOaY/YW++AMKxKQhGYr6aIAtqUZic8
	 XBq09Xo9p3mi10cFnmidYXt/fU4OZRWdiZbDdUTw0PVeNimEi386/ze2srSxTN812K4mQ
	 orzSjJY9nvCAbE/HrKfIcpzSe1AAgbFtf/dqXy1A/UkMKRtp2pWipDqh1uzbCtU1ik/Dm
	 jY9O4rjARoMZ1XwnrrPt3Z28ChwpzncUSHNs4DTK+mZX80UaUDvlBNdA9PRZu980Z5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791580460;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=s43oUYp5C21ReT93yFMROnELTVESulUBioE4vDvTTss=;
	b=rzIAnP0OaumYSSm7vRDR9UT4VZF1U6q0hQWYj/8QmBoasNB8zJG9lAcbvNG250YY/EvB
	 49A8wiX4P6PKphZcA6GpvPrx/7aKL4/Am4KeKjNw5r5hdDqhB0aoroZEWCka3pKpZLYjR
	 Z1iIL3vbiaJCqzd+omTXChELHeqMOcHceZkp92vFcOxrQBmJMIZgEy2R10rq8m0VbgRc/
	 vWZOR9g/TX1Sr6VTJ0xM2SkJAQZuGWwqJ5GA6zyo0B3KPKZczYaXG/ODROX+nDMDRzd/v
	 VUI+y0gjkFG6JeLrRb4qxIjTHhm/yIO9Gp/Vz1+SY8ES7J7HiKwM+6gDiNCIHG47wPQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791580460;
	bh=s43oUYp5C21ReT93yFMROnELTVESulUBioE4vDvTTss=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sNjAsSTti5sbZlI7Qy5FVOB2xhuyUqtPh2eRU4hIespqoAoW/Azqq73WnDdDeeaPj
	 YoXElypgYAK+53qxxCB5nBXeFSTL5FyL1emELboKHRJ+dTEQNcrqAA78swrRjjqpGu
	 mDhnrIIFL6rW6/xENZZPk7vCJh51w5we6nRWMAZ+rHnbn24+iN85Q0DoLLcY29pc+0
	 GNb8EbFFTp4ygUgc4Qu4YzEdJG2Ptj7v8av2eBPmr9m1bpoN2VXT+fBhNBXCkTppbl
	 6wbuMttkM3hYj1dX00H14KwHabTPEpymKvwB6bXmF4fpztRVEJfYc9j3xMVVgVurOY
	 zUGOBirVqtTSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C8E581489;
	Fri,  9 Oct 2026 21:14:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D104D317
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C221881489
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWezUwd89Hzw for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 21:14:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 96EBF81327
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791580457;
 b=M5pZtlQ/7Tj6m+PZnk6wqTskY9yuKHrPSHVJtnB2U3T8+hL4C3JkmRKpIaa4lkNDy9tv
 fTnLyrxazQQpX90OFRKWgswMV4YQLQFFXCrU96e/lw+++0Ot6QSWzfu9AtXmsLPbMEwqu
 Z5l6UYpX6wSOkbFGW5hT+GMm6F/qVxpi74a3K/wzGGrbREsuPYeZekYyYS2OfoexLNVkE
 Oz7wc7XUkouyosyA2/w7pW/qND9tEGX31YfZzMSVyKE4m1o4xp4CMpqDvKuGH47GyhY+L
 4nCCaDdzZTk83Dfc2VBH/XOhlrutYZHrC59sU7wncGlgRutCWQXe3FXbmrYIsZW9kwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791580457;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Z9o5B38hADbFsprW0MkhAbVfLq36AXdfhdnm6bwFVec=;
 b=mEmsUcWteM/hNtvKjvpI6zteYMFJmHj8HMJYfcXJCnEGAyjLFFJUneAVABgWvZHgxQP+
 4TgierjxZIJzEDdRMYoCYQdTBra80jCQr871asMKUJ6b+Wik1jXFUd/rGk8GaoP84fYYT
 yyT9q1GvgI8GoTXkc1pzEPvGCzUNhHqsdJfFxMXBcO3ZrD6J4G0iaTrISkkf2W77uN0i0
 UrZ0AC4jAhrWHhcDH2aNu3rEZPK3GK3/4NlEu7xOyf9sNHfasr1LnLuzVNiu7DUC7FtCa
 bThVKdt+EtpiHHJITc+FfUc1GEgZz5+GXEQWPrLRXAnjV81iOd5x+IiEqLQ/Ei41zCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=N7gE+QTD; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96EBF81327
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:14:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 96A5919F576;
 Fri,  9 Oct 2026 23:14:13 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:49272])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Oct 2026 23:14:13 +0200
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 23:14:13 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261008085901.2692162-2-troglobit@gmail.com>
References: <20261008085901.2692162-1-troglobit@gmail.com>
 <20261008085901.2692162-2-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <cf398c2b16cbbfec23273b6f52c0163a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/firewalld: bump to v2.5.2
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

On 08/10/2026 10:58, Joachim Wiberg wrote:
> Bug fix release, following the v2.5.0 feature release and v2.5.1.
> Configure options and license file are unchanged.
> 
> Release notes:
> 
>   https://github.com/firewalld/firewalld/releases/tag/v2.5.0
>   https://github.com/firewalld/firewalld/releases/tag/v2.5.1
>   https://github.com/firewalld/firewalld/releases/tag/v2.5.2
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
