Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5494C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 14:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B0618224A;
	Fri, 24 Jan 2025 14:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VN71ymyjtk3A; Fri, 24 Jan 2025 14:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 522BC82251
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 522BC82251;
	Fri, 24 Jan 2025 14:26:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA4D7941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 14:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B63CE42576
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 14:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIZh78SS0Ph5 for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 14:26:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29F4242581
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F4242581
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29F4242581
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 14:26:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.19]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQe5k-1tpAYf0lde-00WPWI; Fri, 24
 Jan 2025 15:26:27 +0100
Message-ID: <691753d5-f1dc-45a3-a221-26691cfc8d11@gmx.de>
Date: Fri, 24 Jan 2025 15:26:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Andrey Yurovsky <yurovsky@gmail.com>, Heiko Thiery <heiko.thiery@gmail.com>
References: <20250124091308.1425248-1-gael.portay+rtone@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250124091308.1425248-1-gael.portay+rtone@gmail.com>
X-Provags-ID: V03:K1:kZkltJwjn0OSCnVxfPp0VWRDMxyF7OoEu5WRMLEKQHADX8MyUpr
 9lowPLoA32rLKPsiRrOZaUe7Kp6lc8lUkfloj1L2Vd3RJziAQp2cdNbWTD34DNqktAI2sBW
 t6IjLZYqp0Sa7bJaQOJEalNgAt66Jutz8aDxMUqAzKdmDPAc40hUqGa3qwXJrYs6Q1Z55KS
 XnjTi/njjOtxsZZMea2+w==
UI-OutboundReport: notjunk:1;M01:P0:HXfL+dA2LRE=;LTbWnkxEQTrAehbdMgoaWnAySW6
 +Ywq3n7t8lqq/L69EjF0mPyColAw2ocyNy42JkNSDf1kMClsnzRfTApIND2tn+b8uswh3IO32
 GsEnlHhUciQtdD3yaaMX2cL9GSFz8+bKHaCUpDxYEs1fJyOrd8eIAhQXA0WrfZayUElfKCiLK
 SJyN6H78eGVfSeh+wE4CNBH1sV7ZnPAK7vY1CyV22pN4T7WN9ec1pdoUXnjsJRE+Gze6U3lqP
 V57N5mSGORhJ3GhaD7AA0McOxNyU9KPj4ftCV0uGC4U6Gau2vxVRU5Hj//XKJekZPx0/rHFlZ
 g+T2pn9Dy2dZ9LMIRSblmslGq8jsWb0SaUn7BXGRGdbfhM3Yp7xK/dGtzMxeJSRcnof/tn+no
 P8giamulM6cfRMMequAYcMXnZmd4hwRY8+9S0oaqYUER5Jc1xWwB1Imrdy1w+rkL+2VJQNh+h
 5nhUjZPba22WgNJY1oLJBPreoCfKL2L8WzMXkG80ywgcM0HJhk6zQ7QyKIwzL6ZDZjQbFmNe6
 allojtDs1BAaUYFsit/W2ZUrvDajCXlWFOgtKJOeZt9M3VhzyCgjmZuYtDyf33REFYnAuyRLf
 kkhGAJ1pSsiprTjAxVI9sjyP173MamB9Br83QNN/GZxfDZcinqS6PyEifM8hY3DDsbZuJAyNg
 l//it6i4sd8gb0iF64YA04cNs8n5IPQqch/eI0k7rFGWaRctRDJmPRgHC9tgAQ+mY5G17IkNt
 kNH724v8IYQZlTIKJOdM4aYbE+pQFfO6H9sv8sna/C0aIfGClxxdmcoxiahTSGz9iLm/yW8yv
 SqX7K2ZkV6Bv6qlBHmGvRkwOjoVtVoPoUkFikg0G/iAHfbuCAm9i1VYIxMTljAOFGltLOTouq
 zUQaJMIXLvRxvmBWUBilKvcV6rSNfdQVagOsEe6OE2wOs0QDcZOs84QdsjFivltD3GCeaAJ3r
 SO3IKIC606iiu+y6at+4O6jE6oz0BQm0kyzcVgOrTIeH46x5codBF89Hi+vLtucghlywwI/Hu
 z7h1ZgNwJ90AwtMGvfmYPijt/cwuzhBuBKzS73DdWJBSE4ZP1FriAa5GMuV6gDkqX9g9lV2wS
 EezLuXdRxSU5FNvBd7JHbheY46czjO62zPFNL8xXCYBBJBtouXd29eig3hpLVvz61lC3IuC8K
 P5Vh93W/6LkTUZ9AjPbm7N/kWMdT3zxem9R+d82fTvlLyuoWXT9G9Dj7JLIWaUF4KmpzypbAZ
 rvyNe5TMdvYyxdRKenB/2HvJQUx9NXccXmpnx0XV/VqGny+0pqqqCtSsoS8Dd0hlikWZJ0hsF
 B3gMS8ALRjK0AiEiK1/LUzljZS91cG+pMjyvd/OD/VTiiWNSpHYVDtgqyJoLWyfbt9MgB7b13
 8thmVC0ILz6e+z3g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737728787; x=1738333587; i=fiona.klute@gmx.de;
 bh=sXN4s+NZNFV3SNX1QoiOUp4cqKUOqrYSr73AEE+18AY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=CSZ9sx6H6ZcacsGsxhrD2bt4XQLrJE++oAbSvH5HaXmarH28YSys3JpRBEnLjRmY
 +nu2nzWHrdwtqSSPzoHyUue4pUkQ36gR5Kks5BjFeDDowk1eOytzbLl/hy6KFhfXP
 JsQHI/R73nbQc38Ukm1lU2tC+2EdALBcEuYZo3fX3NW/5jbeNGjNY0Qv/8MGcGh5F
 6fycMWSsOo1et1GlUNGmwt2d9wHspj0A44LV5PX2+p7bI/+4isUP7lNYZGGvFyZN/
 1r66R95L0cR4yxUf3pG4RVgIrQINe7wu70TOCK2dA5FBz8Jf143DFQ0OrXPmdiMxB
 ksiw5yHBP3d8+oLGdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CSZ9sx6H
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc: bump to 1.13
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMjQuMDEuMjUgdW0gMTA6MTMgc2NocmllYiBHYcOrbCBQT1JUQVk6Cj4gQ2hhbmdlbG9nOiBo
dHRwczovL2dpdGh1Yi5jb20vcmF1Yy9yYXVjL3JlbGVhc2VzL3RhZy92MS4xMwo+Cj4gU2lnbmVk
LW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+CgpUZXN0
ZWQtYnk6IEZpb25hIEtsdXRlIChXSVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgoKPiAtLS0KPiAg
IHBhY2thZ2UvcmF1Yy9yYXVjLmhhc2ggfCAyICstCj4gICBwYWNrYWdlL3JhdWMvcmF1Yy5tayAg
IHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yYXVjL3JhdWMuaGFzaCBiL3BhY2thZ2UvcmF1
Yy9yYXVjLmhhc2gKPiBpbmRleCBmM2FiMGEwYmU5Li5mZjNlMGU3MmU0IDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvcmF1Yy9yYXVjLmhhc2gKPiArKysgYi9wYWNrYWdlL3JhdWMvcmF1Yy5oYXNoCj4g
QEAgLTEsMyArMSwzIEBACj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBw
Z3Agc2lnbmF0dXJlCj4gLXNoYTI1NiAgOTY2ODFlMTE5YWY4YjZiOWJiMzBlODU2YTgzMWU1YTVi
MzI5MmU5YTU5NTlkMjZmZmEyNzRiNTEzNWJjNTAzMSAgcmF1Yy0xLjEyLnRhci54ego+ICtzaGEy
NTYgIDFkZGIyMThhNWQ3MTNjOGRiZDZlMDRkNTUwMWQ5NjYyOWYxYzhlMjUyMTU3NmZiZDllNzc1
MWVkYjdkYTExM2UgIHJhdWMtMS4xMy50YXIueHoKPiAgIHNoYTI1NiAgZGM2MjY1MjBkY2Q1M2Ey
MmY3MjdhZjNlZTQyYzc3MGU1NmM5N2E2NGZlM2FkYjA2Mzc5OWQ4YWIwMzJmZTU1MSAgQ09QWUlO
Rwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JhdWMvcmF1Yy5tayBiL3BhY2thZ2UvcmF1Yy9yYXVj
Lm1rCj4gaW5kZXggNDc1YWVlNWQ4OS4uOTJmNThjNjEzOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L3JhdWMvcmF1Yy5tawo+ICsrKyBiL3BhY2thZ2UvcmF1Yy9yYXVjLm1rCj4gQEAgLTQsNyArNCw3
IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVJBVUNfVkVSU0lPTiA9
IDEuMTIKPiArUkFVQ19WRVJTSU9OID0gMS4xMwo+ICAgUkFVQ19TSVRFID0gaHR0cHM6Ly9naXRo
dWIuY29tL3JhdWMvcmF1Yy9yZWxlYXNlcy9kb3dubG9hZC92JChSQVVDX1ZFUlNJT04pCj4gICBS
QVVDX1NPVVJDRSA9IHJhdWMtJChSQVVDX1ZFUlNJT04pLnRhci54ego+ICAgUkFVQ19MSUNFTlNF
ID0gTEdQTC0yLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
