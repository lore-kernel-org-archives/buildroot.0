Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE27CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 10:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3528419E;
	Fri, 15 May 2026 10:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pn5pKCEecJ95; Fri, 15 May 2026 10:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5455C84185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778841288;
	bh=5IsjuqCYjkXJLqCsQqcqgJKJHJ8M3zw5TEWIFX3ipY4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MxJK/+YLdHIQZnySZE79RT4JACQqsxzYHdPh4ocXXmD+FymkztvDSqGQ+sdmqD3V7
	 deKbFno3hyFLOkbqGEsCsQuhqIEDuA5HLQuonlKZCcDquVgYmEV0i5ywx/tGawYoIC
	 ilFdEp63QkB5ZB1Nzka9M1/k557YlXYNYbDNnyQN7g42dHKAB0kj9h8/3cyxE8PyJC
	 zu5QxSWmnzJG0V5WFhzBBnPkP2G9SDDbSxnSODRMmKAdUNV7+g9CErr6Vs7lCoW6B1
	 Dl1KK+0cKWAACFrq+Dl8rN9r+LSgeDM9prAwcA9ghvXtU7XJz95ovjtWW3nbwYsRNz
	 fAdEN+vRNBdfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5455C84185;
	Fri, 15 May 2026 10:34:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0486736F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 340FA61362
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CLZNgEyJ0kz for <buildroot@buildroot.org>;
 Fri, 15 May 2026 10:34:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1D936151A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1D936151A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1D936151A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:34:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CF1C719F5BA;
 Fri, 15 May 2026 12:34:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 12:34:38 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 12:34:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
In-Reply-To: <20260512145844.440168-1-bernd@kuhls.net>
References: <20260512145844.440168-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <fd4f8acfa1145f0412c30dde38bce853@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778841281;
 bh=OWXfCiyfjNH4GxvEi4beaxiNDKrI1FpVCMGywnCIR0Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sBQg3AQF9UP4IdlfNJHNnywaKC+AZTTXv+9avs6QbjEUrUNobmB6iv2VtnFss7QES
 S1Yr8z6dXBsJZeYQcx412hxIAhvHxiXzPWv+rvnAkQyhUXopR5E1J7M5ClmOgS/feZ
 Z4fBS7aNLJuSySBV63q7tyCYFfGZF2+NPLkvOci0f8Q/SihLVdGZSNJLYR89nyJaKH
 rtaeRL/zCzI83dzGE5nZY+B8yIvxt9VRvm43S9TiuLtQCxWPU2fOJBERu31p44sKdz
 83x1Th1weL9PRT4hMb8fYMKACadeiSpzhEAkxISaOGng7L6PnEyK92dOycycCfWq2B
 Cs1OqwTSVPc3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sBQg3AQF
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libxmlsec1: bump version
 to 1.3.11
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

SGkgQmVybmQsCgpPbiAxMi8wNS8yMDI2IDE2OjU4LCBCZXJuZCBLdWhscyB3cm90ZToKPiBodHRw
czovL2dpdGh1Yi5jb20vbHNoMTIzL3htbHNlYy9yZWxlYXNlcy90YWcvMS4zLjExCj4gaHR0cHM6
Ly9naXRodWIuY29tL2xzaDEyMy94bWxzZWMvcmVsZWFzZXMvdGFnLzEuMy4xMAo+IAo+IFN3aXRj
aGVkIHRvIHRhcmJhbGwgaGFzaCBwcm92aWRlZCBieSB1cHN0cmVhbS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+IC0tLQo+ICBwYWNrYWdlL2xpYnht
bHNlYzEvbGlieG1sc2VjMS5oYXNoIHwgNSArKystLQo+ICBwYWNrYWdlL2xpYnhtbHNlYzEvbGli
eG1sc2VjMS5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiAKWy4uLl0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ4bWxzZWMx
L2xpYnhtbHNlYzEubWsgCj4gYi9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5tawo+IGlu
ZGV4IDI5MjIyYmMxNmYuLjRkYjFhN2FjZTYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJ4bWxz
ZWMxL2xpYnhtbHNlYzEubWsKPiArKysgYi9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5t
awo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gIAo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4g
Cj4gLUxJQlhNTFNFQzFfVkVSU0lPTiA9IDEuMy45Cj4gK0xJQlhNTFNFQzFfVkVSU0lPTiA9IDEu
My4xMQoKVGhpcyBuZXcgdmVyc2lvbiBmYWlsIHRvIGJ1aWxkIGluIGEgc2ltcGxlIGNvbmZpZ3Vy
YXRpb246CgpjYXQgPi5jb25maWcgPDxFT0YKQlIyX2FhcmNoNjQ9eQpCUjJfVE9PTENIQUlOX0VY
VEVSTkFMPXkKQlIyX1BBQ0tBR0VfTElCWE1MU0VDMT15CkVPRgptYWtlIG9sZGRlZmNvbmZpZwpt
YWtlIGxpYnhtbHNlYzEKCkl0IGlzIGZhaWxpbmcgd2l0aCBlcnJvcjoKCnVuaXRfdGVzdHMvdHJh
bnNmb3JtX2hlbHBlcnNfdW5pdF90ZXN0cy5jOjI5MTo5OiBlcnJvcjogaW1wbGljaXQgCmRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHhtbERlYnVnRHVtcERvY3VtZW504oCZIApbLVdpbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KClRoZXJlIGlzIGFsc28gb3RoZXIgZmFpbHVyZXMsIHNl
ZToKaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yNTI3
NTI3MDM0CgpDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgcGxlYXNlPwoKPiAgTElCWE1MU0VDMV9TT1VS
Q0UgPSB4bWxzZWMxLSQoTElCWE1MU0VDMV9WRVJTSU9OKS50YXIuZ3oKPiAgTElCWE1MU0VDMV9T
SVRFID0gCj4gaHR0cHM6Ly9naXRodWIuY29tL2xzaDEyMy94bWxzZWMvcmVsZWFzZXMvZG93bmxv
YWQvJChMSUJYTUxTRUMxX1ZFUlNJT04pCj4gIExJQlhNTFNFQzFfTElDRU5TRSA9IE1JVAo+IC0t
Cj4gMi40Ny4zCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
