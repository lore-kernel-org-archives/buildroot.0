Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93763CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 22:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A42C60831;
	Thu, 14 Aug 2025 22:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDU7C1LGMLhh; Thu, 14 Aug 2025 22:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB7960829
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FB7960829;
	Thu, 14 Aug 2025 22:40:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D3D0228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E63A80A98
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajhjNAbiM7XV for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 22:40:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C48780EBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C48780EBD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C48780EBD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:40:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5E7F35FFBA;
 Fri, 15 Aug 2025 00:40:40 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 Aug 2025 00:40:40 +0200
MIME-Version: 1.0
Date: Fri, 15 Aug 2025 00:40:40 +0200
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250814-python-numpy-fix-build-cyhton-v1-1-849f0bb9524d@armadeus.com>
References: <20250814-python-numpy-fix-build-cyhton-v1-1-849f0bb9524d@armadeus.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ac6b87bdc508aab98a2d884de83e7f8b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755211242;
 bh=Tgxj5+n9BRNDLjYYvaqB/55F5KZXIBSCwxeW2pBbOeI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EP9nh0r4utV8azZVcTv6dn8XeKtgsPcpGfQQbSTFcLA0SUYuTGFD/p1t37LIAReTt
 vaekcEaPNL8BrPeVcGJK0HsAZ3XYc3Kg1G5DPZA+lQTG8fWJX5MGYG+LZ2eawrJCgE
 5NMVOhMJygv3k6NuYneYIngUMFy5pIhVhtSE0goNEoQxGLIbnjWlnlo7TWi1cZOxvi
 4xwAp+1wEsB2qoWlSVAtUu1O5P2AFUIVV0H7mxZs7kXl9oaLUN4+AJVHy9zCIeAp5M
 jXZiL6FWK/+9MNagjQhfINanUF+vRBe9QtVgIkkAhdysLZaTJaRMXoguVu6jVIqw2Y
 tI2+v1oCecQcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EP9nh0r4
Subject: Re: [Buildroot] [PATCH] package/python-numpy: fix build with
 python-cython >= 3.1
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

T24gMTQvMDgvMjAyNSAxNDoxNiwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gU2luY2Ug
Y29tbWl0IGI1MzZjYWFlYzBkOCAoInBhY2thZ2UvcHl0aG9uLWN5dGhvbjogYnVtcCB0byB2ZXJz
aW9uCj4gMy4xLjIiKSwgcHl0aG9uLW51bXB5IGZhaWxzIHRvIGJ1aWxkOgo+IAo+IEVycm9yIGNv
bXBpbGluZyBDeXRob24gZmlsZToKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAuLi4KPiAgICAgICAgICAgICAgICAgbnAuaXNz
dWJkdHlwZShjb3YuZHR5cGUsIG5wLmNvbXBsZXhmbG9hdGluZykpOgo+ICAgICAgICAgICAgIHJh
aXNlIFR5cGVFcnJvcigibWVhbiBhbmQgY292IG11c3Qgbm90IGJlIGNvbXBsZXgiKQo+ICAgICAg
ICAgaWYgc2l6ZSBpcyBOb25lOgo+ICAgICAgICAgICAgIHNoYXBlID0gW10KPiAgICAgICAgIGVs
aWYgaXNpbnN0YW5jZShzaXplLCAoaW50LCBsb25nLCBucC5pbnRlZ2VyKSk6Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IG51bXB5L3JhbmRvbS9fZ2VuZXJh
dG9yLnB5eDozNzYwOjM2OiB1bmRlY2xhcmVkIG5hbWUgbm90IGJ1aWx0aW46IGxvbmcKPiAKPiBC
YWNrcG9ydCB1cHN0cmVhbSBwYXRjaCB0byBmaXggdGhhdCBidWlsZCBmYWlsdXJlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFy
bWFkZXVzLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
