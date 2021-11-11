Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA62C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:28:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE076109D
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DE076109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E43940445;
	Thu, 11 Nov 2021 08:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rT2S3oJJP3D5; Thu, 11 Nov 2021 08:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65EB94043B;
	Thu, 11 Nov 2021 08:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5CE1BF282
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F27280B08
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7JUzkrsUKRJ for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 08:28:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42F8880AFE
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 08:28:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d0bf:367b:1b33:f0cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B2D8D13F7F0;
 Thu, 11 Nov 2021 09:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636619312;
 bh=/jZh5YWy+LSO/2Wbwbh0Rmja1SueFDTg0Cq686WHlNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UdGfra3ftB+uxw1A9ri7u1ePWOs5ORAXRPyCPADnfYgTPHISwtanMj2+jc7ZLYoHc
 XPAw7ufrx4aUgWV1cc7YZpojmom6E9pcsetfhSHjeKi6RRfaEwBs/bhLxutWqadFLI
 H09NUfNP1+DDD6y7Xa0XxRh2X1K9T+YzgZZBcz/eR8ws1L8nusF3zvtwMKfGLvxKSM
 2PnVeBQAhLD3u4LFaswh9L77EYQMvHMbHs1Kpn3UMVWms9N639lG8o9ZRizM3dqB/k
 /lm5RkJl55CqQjxH5r3PKExY/mv16xotimD/rWF2b1w7iAqr0DTjgMEMgj/lIhQVBL
 eAMMvHjGB45dw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 09:28:28 +0100
Date: Thu, 11 Nov 2021 09:28:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jacques Samoun <jacques.samoun33@gmail.com>
Message-ID: <20211111082828.GB2504300@scaer>
References: <CACaKL1yyn2cj68Bdt+S7BRtLDWV5Ja6Pe-rHQj8dsSEK22Bu3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACaKL1yyn2cj68Bdt+S7BRtLDWV5Ja6Pe-rHQj8dsSEK22Bu3A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] building U-Boot fw_printenv
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFjcXVlcywgQWxsLAoKT24gMjAyMS0xMS0xMSAwOTo1NSArMDIwMCwgSmFjcXVlcyBTYW1vdW4g
c3Bha2UgdGh1c2x5Ogo+IGkgYW0gdXNpbmcgQlIgb2ZmIHRhZyAyMDIwLjAxLCBhbmQgdXNpbmcg
VS1Cb290IGFzIGEgYm9vdGxvYWRlciAoQVJNIHBsYXRmb3JtKS4KPiBJIGFtIGp1c3QgdW5hYmxl
IHRvIG1ha2UgVS1Cb290IGJ1aWxkIGVudiB0b29scywgbmFtZWx5IGZ3X3ByaW50ZW52Lgo+IEkg
b2J2aW91c2x5wqB2ZXJpZmllZCB0aGUgZndfcHJpbnRlbnYuYyBhbmQgbWFrZWZpbGUgYXJlIGlu
ZGVlZCBwcmVzZW50IGluIHRvb2xzL2Vudi4KPiBJIHRyaWVkIGEgZmV3IHNldHRpbmdzLCBidXQg
YW0gbW90IGFibGUgdG8gZ2V0IHRoaXMgdG9vbCBidWlsdC4gTm9uZSBvZiB0aGUgc2V0dGluZ3Ms
IGVpdGhlciBmcm9tIEJSIG9yIFVib290IHNlZW0gdG8gYmUgYWJsZSB0byBkbwo+IHRoYXQuCj4g
QW0gaSBtaXNzaW5nwqBzb21ldGhpbmfCoMKgYmFzaWMgaGVyZSA/CgpJZiB5b3UgbmVlZCBmd19w
cmludGVudiBvbiB0aGUgdGFyZ2V0LCB5b3UnbGwgbmVlZCB0byBsb29rIGF0CnVib290LXRvb2xz
IChCUjJfUEFDS0FHRV9VQk9PVF9UT09MUyk7IGlmIHlvdSB3YW50IGl0IGF0IGJ1aWxkIHRpbWUs
CnlvdSdsbCB3YW50IGhvc3QtdWJvb3QtdG9vbHMgKEJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9P
TFMpLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Lgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJC
T04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBE
ZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1
NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUv
ICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8
IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
