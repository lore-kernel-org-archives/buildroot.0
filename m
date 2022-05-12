Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEF9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 429BD60B35;
	Thu, 12 May 2022 20:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9ZNHVn493PZ; Thu, 12 May 2022 20:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F4D260AE9;
	Thu, 12 May 2022 20:17:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2E4E1BF398
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02E5940393
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxgCMh0OhMk8 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:17:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24BB640359
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:17:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6EDF519F59F;
 Thu, 12 May 2022 22:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652386651;
 bh=BPoGP1RlbQTK0TrIteWdTMgZJWTNp1QIp/YVweA3RIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fz7Bdo/1GfvDmesVd/Ww5jcYX/+pPzxg5lJiFyrQAVbcCJ6hSyrTX/+aR0si3/r5q
 9fxoMGjg20RDGQV20X/Gm7DW1HxnebLanPk1Bk5zE3O0Vks+M1H9+KIJKlU47sReFR
 hOkwgorbfFwCETvKdLcen7uUsxWCzLreTIBlJTSV39JLtstvwWixJ9uRZ4PMc0rJcH
 tZGWfRPOLoLW/21TIW4YHg0fMQcfzbL2hrckdGY8QH90IWXS00F/P2BjcRZ0yM30CO
 K4w8IRy+ya3lt8JfojRcCTp5JyrjGy26ahzywsx2YQHPNWmRvO38kboDIRNrcZJa3P
 d7T/oD5Rk4H0A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:17:29 +0200
Date: Thu, 12 May 2022 22:17:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kyle Discher <discher.kyle@gmail.com>
Message-ID: <20220512201729.GG1597494@scaer>
References: <20220509171602.18228-1-discher.kyle@gmail.com>
 <CAPa6QFar5zopEzDpJvz_aO9Q-yK20EZrT=aA+gb=bMrxcELNYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPa6QFar5zopEzDpJvz_aO9Q-yK20EZrT=aA+gb=bMrxcELNYg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump to 16.15.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S3lsZSwgQWxsLAoKT24gMjAyMi0wNS0xMSAwODowMyAtMDcwMCwgS3lsZSBEaXNjaGVyIHNwYWtl
IHRodXNseToKPiBPb3BzLCBJIGZvcmdvdDoKPiBTaWduZWQtb2ZmLWJ5OiBLeWxlIERpc2NoZXIg
PCBbMV1kaXNjaGVyLmt5bGVAZ21haWwuY29tPgoKVGhhbmtzLCBJJ3ZlIGFkZGVkIHRoYXQgd2hl
biBhcHBseWluZyB0byBtYXN0ZXIuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBPbiBNb24s
IE1heSA5LCAyMDIyLCAxMDoxNiBBTSBLeWxlIERpc2NoZXIgPCBbMl1kaXNjaGVyLmt5bGVAZ21h
aWwuY29tPiB3cm90ZToKPiAKPiAgIC0tLQo+ICAgwqBwYWNrYWdlL25vZGVqcy9ub2RlanMuaGFz
aCB8IDQgKystLQo+ICAgwqBwYWNrYWdlL25vZGVqcy8gWzNdbm9kZWpzLm1rwqAgwqB8IDIgKy0K
PiAgIMKgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gICBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ub2RlanMvbm9kZWpzLmhhc2ggYi9wYWNrYWdlL25v
ZGVqcy9ub2RlanMuaGFzaAo+ICAgaW5kZXggNjM2NWVmODUyYi4uOTk4MjI5MzQxZSAxMDA2NDQK
PiAgIC0tLSBhL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy5oYXNoCj4gICArKysgYi9wYWNrYWdlL25v
ZGVqcy9ub2RlanMuaGFzaAo+ICAgQEAgLTEsNSArMSw1IEBACj4gICAtIyBGcm9tIFs0XWh0dHBz
Oi8vbm9kZWpzLm9yZy9kaXN0L3YxNC4xOC4zL1NIQVNVTVMyNTYudHh0Cj4gICAtc2hhMjU2wqAg
NzgzYWM0NDNjZDM0M2RkNmM2OGQyYWJjZjdlNTllN2I5NzhhNmE0MjhmNmE2MDI1ZjliODQ5MThi
NzY5ZDYwOMKgIG5vZGUtdjE0LjE4LjMudGFyLnh6Cj4gICArIyBGcm9tIFs1XWh0dHBzOi8vbm9k
ZWpzLm9yZy9kaXN0L3YxNi4xNS4wL1NIQVNVTVMyNTYudHh0Cj4gICArc2hhMjU2wqAgYTBmODEy
ZWZjNDNmNzgzMjFlY2EwODk1Nzk2MGE0OGY1ZTZiZjk3MDA0ZDUwNThjOGRkM2IwM2M2NDZlYTRm
N8KgIG5vZGUtdjE2LjE1LjAudGFyLnh6Cj4gCj4gICDCoCMgSGFzaCBmb3IgbGljZW5zZSBmaWxl
Cj4gICDCoHNoYTI1NsKgIGIzYTY3ODg1YjVhNmFjMzVlOGJiZTgxOTA1MDllNDFiNzliMGQ5YTJl
M2ZiZDQ3MTg2ZjJhYzQ3MjdmNjNiZTXCoCBMSUNFTlNFCj4gICBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9ub2RlanMvIFs2XW5vZGVqcy5tayBiL3BhY2thZ2Uvbm9kZWpzLyBbN11ub2RlanMubWsKPiAg
IGluZGV4IDRmZTM0ZTBhYWQuLjZkY2FmMzRhYTQgMTAwNjQ0Cj4gICAtLS0gYS9wYWNrYWdlL25v
ZGVqcy8gWzhdbm9kZWpzLm1rCj4gICArKysgYi9wYWNrYWdlL25vZGVqcy8gWzldbm9kZWpzLm1r
Cj4gICBAQCAtNCw3ICs0LDcgQEAKPiAgIMKgIwo+ICAgwqAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+IAo+ICAgLU5PREVKU19WRVJTSU9OID0gMTQuMTguMwo+ICAgK05PREVKU19WRVJTSU9OID0g
MTYuMTUuMAo+ICAgwqBOT0RFSlNfU09VUkNFID0gbm9kZS12JChOT0RFSlNfVkVSU0lPTikudGFy
Lnh6Cj4gICDCoE5PREVKU19TSVRFID0gWzEwXWh0dHA6Ly9ub2RlanMub3JnL2Rpc3QvdiQoTk9E
RUpTX1ZFUlNJT04pCj4gICDCoE5PREVKU19ERVBFTkRFTkNJRVMgPSBob3N0LXFlbXUgaG9zdC1w
a2djb25mIGhvc3QtcHl0aG9uMyBob3N0LW5vZGVqcyBjLWFyZXMgXAo+ICAgLS0KPiAgIDIuMzYu
MQo+IAo+IExpbmtzOgo+IDEuIG1haWx0bzpkaXNjaGVyLmt5bGVAZ21haWwuY29tCj4gMi4gbWFp
bHRvOmRpc2NoZXIua3lsZUBnbWFpbC5jb20KPiAzLiBodHRwOi8vbm9kZWpzLm1rCj4gNC4gaHR0
cHM6Ly9ub2RlanMub3JnL2Rpc3QvdjE0LjE4LjMvU0hBU1VNUzI1Ni50eHQKPiA1LiBodHRwczov
L25vZGVqcy5vcmcvZGlzdC92MTYuMTUuMC9TSEFTVU1TMjU2LnR4dAo+IDYuIGh0dHA6Ly9ub2Rl
anMubWsKPiA3LiBodHRwOi8vbm9kZWpzLm1rCj4gOC4gaHR0cDovL25vZGVqcy5tawo+IDkuIGh0
dHA6Ly9ub2RlanMubWsKPiAxMC4gaHR0cDovL25vZGVqcy5vcmcvZGlzdC92JChOT0RFSlNfVkVS
U0lPTikKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
