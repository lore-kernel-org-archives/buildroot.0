Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80C9CA5FE5
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30FDA81354;
	Fri,  2 Oct 2026 20:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuMHvx46gTlz; Fri,  2 Oct 2026 20:01:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CA0F881348
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790971259;
	b=heQ/Kc5/An+4WD+WNADowKvII4f7YhrzJhojMt/VBExY3ziRKvwZovzFEPxrZ8PNBIYH
	 nROlIiLxQfyhrs7B3ZPXx5WczLNyHkeGHtEEdy8FDwbsTfaJmQC6rTWejt2cDcG+pdN5Y
	 shsoTPUrl9Yd5uV71UPxki35k6RnL/0Y7XqnGGINgleTBqemIWpKo5vbUgRlW8u/hpIWD
	 t0PbCM8oH4lHk/ozgnfnBRe2+9hoJ8IGcwAZJH73kcQb7ok9bHYp+u35MZnHXpxC+OpHw
	 fX5upxEnn+FcpvpSW7jb+rJUU9SsZ6rayI8+OG+lWfevxBgoECtyCOVkRQDuAd2/sug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790971259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=HgKwzQJiZBYyFCkjgPM3oMorre6nFb5SdxWSGYjoHgg=;
	b=RTq78KfCHU1ObqLQXItAhgTEFhhXGpK0xgo24Ufv0lnBEU6Gpkf3B/ZXOU/CXtAe7Hya
	 8JJIt+Qmltw7qdM2v3ldy2zwtXzqUqvVuYOT9eRELitltnBIS+KKLhheio4V5DlvRsozO
	 UfKkm0zmFLp88QRXu1XMslN3NKcXKIA10znsLTBKxpufuOjD2flvgiMhgWQ8d2HJ9UySC
	 ExQlPuNk8lv54tACnmVsnhoiYjr8ckJdztoThgJIqQyJE6bQIgkzThQ43vogY8ZhU5WRD
	 LVbMYAB1E+9OMVCVWz+M39J4IHQDUKdN3d6CfJio1gCr7GjEFwkTpySy6u0IeyvSjvA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790971259;
	bh=HgKwzQJiZBYyFCkjgPM3oMorre6nFb5SdxWSGYjoHgg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oisejiRAnE+ewWCBPc0q1MZgBLg9si5XMyiIdLG/wPp0ZDrQ50s14+Ecr/sQVFgLA
	 kaSHfXs5qtE/UgNylG/XA6UIIrKs5cfpoFuMTNOYkuP4X+mwrmMGhTaAQZAUrU9hr0
	 4UXYRhr58Ax9hdcaEnmOabNHmzhw8gx4dBtBXJt4sn1UjBe5rvqpyQfydkk39XahyE
	 VHCYPScfM3GzBRhKdq7DnAfkSLQM7s2j78ZTaNI6iUXY0bgmUu8R63403EVOXLvedk
	 j1i16WCuSc+R4OYIjvxcON9Y6a3U7IKe7x+uwMI6Wxrwvz8FW5FiTfyErfvvvzIxuo
	 7nHw8wAf1QMNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA0F881348;
	Fri,  2 Oct 2026 20:00:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B88D1179
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA3E760D70
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtekoU-6o8xj for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:00:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9FAA96064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790971258;
 b=scn25V/mDVwTXtuci2n+Yx0sasjAv7jMlpAaZTFmGyBJXtEbTV66X3W9rK6Y70ru34I2
 lY3bWAZQhegN5EgJV86JbwUJZbDH06CKjJcZz9p/UT6YJA3mqDfKmzCcIjJbLeQJyf4kW
 KeEOHdaPhil4WiTHQ9RaNobR9Jc8t4V5Nq7uEPocY3eu6Zi7Id0/kfnniZj6wGoiPd+Bs
 XQaCMYAN2eyvGhRHn6WEDqBIGXyO3BqI7TnF0285247DFttRF4iZ6WVQFZbTZ73fQTKQg
 TFayaDjRZy4f0uzIuwSto1jTuemassDi8OqrL2AOgH0yC3MuK+k1xLkaqzbUKWyjLCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790971258;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=gENJaIftAUqzelkdYvfdNmIxTPis5a3G+TIjWbVr3HU=;
 b=ecGGu3zDit9ZJiBdGx/NYOxZac29N1XcoeIoEkFajhqJMfop70F5aITwZZd79hYEMyWA
 esgyJ7aQzUNopkl2e9Y3DeEqliUlj4WOb96k/Hve4ZOoxY1AFgwEtN/iqNG0xbu17TU8z
 RDiVE/y6TsdT0tis5g73RDk0EQoUYvHcaKViu0EiDpRE6RXWgOndvbVgzb+MRmPPAU6OI
 h8ev02EzhFWoYCFbG4kjVJm1/IGkIFDcxvEp+c7BGC861ZkvF65WuIBBtqGy0ltEjPHWv
 trAbK5Y0YKIF5YyX5jYzZqWFf7hKU7Y6z4XHShRuPsdxPjFkAkLi2xw0JppsvZEsTzQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Fbp+G+Sr; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FAA96064B
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:00:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2BE6313F879;
 Fri,  2 Oct 2026 22:00:54 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:49964])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 02 Oct 2026 22:00:54 +0200
MIME-Version: 1.0
Date: Fri, 02 Oct 2026 22:00:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260929185930.1897670-1-bernd@kuhls.net>
References: <20260929185930.1897670-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <10a38e557ee35d4f284b861a9fffb28c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-inputstream-adaptive: bump
 version to 21.5.25-Omega
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

On 29/09/2026 20:59, Bernd Kuhls wrote:
> https://github.com/xbmc/inputstream.adaptive/releases#release-21.5.25-Omega
> https://github.com/xbmc/inputstream.adaptive/releases#release-21.5.24-Omega
> https://github.com/xbmc/inputstream.adaptive/releases#release-21.5.23-Omega
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
