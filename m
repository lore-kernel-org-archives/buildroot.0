Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B1FCA5FCF
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6747881235;
	Thu,  1 Oct 2026 16:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sutJ22HAhX0b; Thu,  1 Oct 2026 16:57:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6A2BC8118B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873828;
	b=BPEnWKFGP4/Sxns9JrAf7/x9u5gxVf0kU9CXkHlQjJHn6+AGw0yG4UsaEojQwJcFlkUx
	 56CfCCmVTrK0YhjXJlJ3g0sb1nqJgRdJEtkAiAll3TUwoMVBF/ykXles+g2/rJMZ9ZS2t
	 PSv7B/jcAK0n1dIfY4eJ+Eb8HYjdQdEAk9e1wMBJ4zkHoAt0646JOpzPe+q9tw5KSUltV
	 eeMd6EMfGwiP6L/z66KpXK5Vo27CLc/yX19duHECgA3nCPgunBNome9amSqIJxMH2RnfS
	 JzI9sDdya6YbdLRbaYTT1wPtG6zl45Sjd8WD0Qk4iANuz/H5PZMhMMzyyhNlrhO0jrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=EvGBfkiBjkH4SNIPB6Sz0h7Yhb7wpwuRr1mnFFFq+xY=;
	b=pSsd216y/IbZ/N6xFLGYD3/4DNADX5Y7f94zP3WCt/AIdOTGA0Bw58MGY5lN6ZmY5MDb
	 qNzm2uVnm1KyMz7mrURbupXALDL5MdrOZMAJmurSILjgaEpBVZ6vaNZoV78I6NkswX2Ng
	 aVh9r2C9IxxfJSjAfH8sAYICJ1vqr1MOfn420/WV6KmkGsx0acJLjIFO7YmXzJ7CZtkP0
	 MxO4ZVmy4gUe1Eqg9zz8LXkT4xJEZmio5KFQsTSWicE9F2I4rN/NVbRn/a9XDWRKO36OL
	 z+7tSA5IuDewuBgT0T6aH+0PpSWj6coP1xHeDFhEorBrzjkRQU8W8gUAO4rUnjMu0AQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873828;
	bh=EvGBfkiBjkH4SNIPB6Sz0h7Yhb7wpwuRr1mnFFFq+xY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XOgIg03ATArRc2Sv+1Ap4zBgx2kGw+dZXhb0YJRv+ZQAuTchLdc/mw96R9OrNhxp0
	 GkYcljW7CIRgQ+x3Eyigno+TTVkVEe9V6lpkt5zy5sMdTrF1EY9yXcEDBU34gGKDaM
	 35ZAjm6FtYDzdbKk7BS4DdS23F2peHMpHxOPK4nTTaTfqq9+ws2SC2d3/GQey8bdh+
	 GAW+ds2mLzjJv5A6Nfu2MTSOH6YXMQhHnu3korDcDkZwlp+Dv5hw20JlKq/pp+cxU8
	 c/keHeRkgZNmt583ANVioiz8w1KeHtexeDpnEZ38UC2GVE2pzXl6N5Htow3Hcq2EnE
	 /IQr6S39pdetw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A2BC8118B;
	Thu,  1 Oct 2026 16:57:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F062282
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10FBF4052A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 178YNgCt97kb for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:57:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6866440098
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873826;
 b=BDehdmdG4OLErlBWWuv0yACcXzkh6RcXy4gaeMVdRVB8nljDqBsp8FUr+vwJHANHnf3E
 LsM8WvNBhsqZHo1GI0ZB5MwX6sHQWrVEGjC7EVtBWaSN7hG7r8nJoBVrj28Vgz4gdXzc+
 Sld9+9mQwn/1AbZkU0ROANMKJBFVMbcx3o5/ZBvJIc2U0btSEBPkfQutILXu+32fwMj7O
 2ocpQNnyIH5LZKYuGmG4pexHpX0xTWo1LuaLQ08D4MraT8x2uX6xmIR4g9RddnhR/Kxm5
 kJsD9WIjpU2VeyKY0EG1R3PHFHgYlDteZ2ukW44j69KnNO/vtKVXxzu/lNVkbPsIhbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873826;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=IAjzrZOcQigOatKA0yp0S9+Y6VioOZuNQWO1SNgXqOQ=;
 b=hMWe+hEbqzJCG2ZPLivmnjZdwZVys9HuVixv05e9di7HyCndC1tjwm3gGwccFflEsPqa
 dnbZl57XNdk53oVXwnWk/n8FvWCnsfGG01CnTMR96v/65nXm5E9deD2gQM11i6OgOFBSe
 yQ6Veq+Dh3mbSqaHswQNlv9F7d4+GkQLagGbQ46x3Sxy+sjZllE0QR4fhl8QNyCXDKgQ5
 +2QlukTy4bPZGVRI6FoQsP9uqFIiAVPfFMHh8ZP7dX3UtDTWlO59L4ZekxCIY3yi5weEW
 r/9slHRwaZ/8pDcAuamyMcYaT4Y0AcYQdrqGJpx/AZvDltHggPmbKslekJw4ZngEuBg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cYBaBa6c; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6866440098
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:57:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8A36819F5A7;
 Thu,  1 Oct 2026 18:57:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Oct 2026 18:57:03 +0200
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 18:57:03 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260930123851.486520-1-raphael.melotte@mind.be>
References: <20260930123851.486520-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <dc994d59ebb8432f3605806d144c6c73@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: harfbuzz: new runtime
 test
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMzAvMDkvMjAyNiAxNDozOCwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
