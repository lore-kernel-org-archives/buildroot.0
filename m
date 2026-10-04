Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82513CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 19:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5165560729;
	Sun,  4 Oct 2026 19:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKKCVBfVbIxs; Sun,  4 Oct 2026 19:40:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EBF3760718
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791142857;
	b=AsuVxJ2HVcc+Ir6zwGXXb3rSoEvYc3pbAudLH4eU0BwelMx0jJIKP7j8phZ3hmDGdEkL
	 SHYWAd2XRyiUsRyov9ymcybMkotO4o0PwR5YTcepwGh8ufPfOy+++vmcD3RGEKqv3zL1s
	 oB3IoIETnCEhxQjVta/sLHZwoATuUE8cMWFkVouIZB4082FOo/xerd2efaKWcuAliCEbG
	 9NMNkki2xk3gO1q510AmP+pXXDdUpTl7vFlfjXPjX8PeaqlnL+alIegPfIX9Q66K4UJ9X
	 D4gCIZsPEQNJzcgdKuu/RxZJAmZ1poksRcZkar9+jo9BTMKj/9CM0m0ZWCHbW1kXb+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791142857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=bq4CX0g+edy30COmB4mm6Ilxa2+Ur6nfjQa7V6ijdmw=;
	b=SQp+QWjr5Z69V66XsFIbYDMG0IEtt8HlxcvdcVetAjCYFlGJmcQl4UzJtif2XuUePzTz
	 1hIdtlJtqWy1QT70u6h7nsCa99UPb4Ob6wLR0ZYW6K03n09i0mn2OZCIxtekgZhyYOD9I
	 LskY1HGaOGaLCpEwU7ZcSRsaZye7614gaVZFzach0B/ZiCNfIM6mvrfeeCU5ZltiyvViy
	 J7SuvBoLfJMuFsJDINd9AWVTNj4fh7zvaSmx4XzzG9i30vZAYAwgWY8C+mumH20eGwjSD
	 0aKmsMEDbPV3qMpY/3kIectJ/x+LGdyL0UiDzjGHC4vhO2B55DTK92X8MM9TRDe1skg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791142857;
	bh=bq4CX0g+edy30COmB4mm6Ilxa2+Ur6nfjQa7V6ijdmw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QknP+9RYg7Zvsct1fvX4D2HHYwne3fc1lVnaO/CMAb9jD6OaQ3Cu7ONWyWN6ZWrWX
	 wrdSgE5fLyiknkhf2zX2UKuEvv1sU1kAGnJz/xLogM4FYD91vbpjT+07wSsuKXmElI
	 7G5Vota9oMNFLi9FoCXGQLXCIJUTBwrJEpcr6q5v43UYIwYYzwVgfCzJpWTyYZDlp+
	 CKrI3DNCgEDOU2NRAghS49lyoW+9BmdsRKneajFHBnX2Y1ck2/pi+MQr5KQvy277aR
	 4YZdmFYhaDNBqsNyU4bipomEJ88qGN4UCBz7vMoIPy7Qh+nyAEzluzPBswBiiTPpXA
	 wCxLnfMWxDDLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF3760718;
	Sun,  4 Oct 2026 19:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 161A02E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 030436070D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOK4RJDcOZxz for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 19:40:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 915BE6060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791142854;
 b=kcOVmqNd7tu2PE6Mwr1paUHy/nOQWpgB/Mx5e7TnptNFUP/RNaqlnp4DPXETHkGbLrL0
 1A/PaIXVk6cut8QoFMozWmrfIyN9Tl/nD+LHLRvgpO41U6RjR0c7iSDWmMYKdQZpZiKvK
 N5bfKqTKyUxjQW58e/t0KQ3FrXFGuaq2h9QQcJq5RqY2gxMPzv7XC3iwcqAlkZQJcCuBF
 tXoMRuFBuib0qJKsRGae1KObgLazQUorH7wT+8vo0RJY3HsjaSaSBx4ftamcw54uXj31J
 xye/3BVyH9CDK2w9sFoZFhD++xXZTaxnjVipWycHJYq2rkNATpnPxpKX/8Z5ROqCnTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791142854;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=vAJNWKmN2g515kH69neZEOqqx1Gv8tD3O7XVkA9CnUc=;
 b=P2TG0lnM57qHt6S4Gaw9PNs4pYACxsZkF5tOYW9yRTFWsFhgmU4jtTBmAZmX/4KXr9mP
 EsQcUm/RkwMP0ADTG1zlYPJ21Tqu3tvzinRTfvTsNkb/Mi3c/5OLqIthTW6Ouzg1TZ62v
 fdWl/aCHOlXhgq1AIeFchIKV5rL1VZpmypQXYpqSypSOUfeaLBhYaHyQ9kzE6P5VJg2fG
 G//LQSat0f+ypiFinswsqeLZOkKU2M47B77tR+4SSijstc1HYIyDZETDjYGNIGguyrKHg
 +Yv/11Z3YsDBdUhNECppTXwVY/EKjD5X83Z30gt8s1xv1+nE9GCuEIuhRj73fXUAKPA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oB7XYt4Y; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 915BE6060D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:40:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3FA2513F86A;
 Sun,  4 Oct 2026 21:40:50 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:40162])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Oct 2026 21:40:50 +0200
MIME-Version: 1.0
Date: Sun, 04 Oct 2026 21:40:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004081040.3067626-1-bernd@kuhls.net>
References: <20261004081040.3067626-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <f50f0d47f665ab781c832c1c8b483662@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump version to 2.5.24
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

On 04/10/2026 10:10, Bernd Kuhls wrote:
> https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000516.html
> "Note that version 2.5.23 was released yesterday but had a regression
>  in the smartcard detection code; which is fixed by this release."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
