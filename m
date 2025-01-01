Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55B7E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 18:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B278812AE;
	Wed,  1 Jan 2025 18:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6ivzEh8eI6a; Wed,  1 Jan 2025 18:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37E7D812D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37E7D812D3;
	Wed,  1 Jan 2025 18:53:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57112E0F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 18:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F0BA812D1
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 18:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8RFUzrEbYNz for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 18:53:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D21D812D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D21D812D3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D21D812D3
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 18:53:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8E462780511;
 Wed,  1 Jan 2025 19:53:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36664])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 01 Jan 2025 19:53:30 +0100
MIME-Version: 1.0
Date: Wed, 01 Jan 2025 19:53:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <1941eb80908.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
References: <20241231185346.180096-1-ju.o@free.fr>
 <1941eb80908.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <0a1ce2781e9d66b112c7b87366e921df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735757611;
 bh=/RMG6JeRnbAWVjJktwTagk6y28DAh5XepenOe0fqpNc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BqZ3pKmQ4Z8B5/F1PE27UmCI8SnCzZv4JgJtMEpYb2MpgXSM4lG9tMi4k8WaNnO69
 M7pti3ydaErwDOH8mVo1t82FVVSfjPpFoT+SDVsSthIW5pluvtk7no9jkb+ztSTCsX
 n5CPFNfkdeEGuuKwgdq9KxD2O7wdF9iOOEU0bLbbjib7o3m61ylnAXx8OTGoRAuEyF
 T8nieZtL/f9yfwVqNylF1DwxojOGa/SlelN6deyq4BvW7UNuAiInuJDVms+FVptvYz
 p5nMRIZ6VJ4GsaM96fz874zrz5MVwgtBw98Qu5W5uzVTgvCNT4Lb8w4t/uzaR3p3B2
 HdSO8qLFP6O/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BqZ3pKmQ
Subject: Re: [Buildroot] [PATCH 1/1] configs/nvidia_bf3: set BR2_cortex_a78
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwgYW5kIGhhcHB5IG5ldyB5ZWFyIQoKT24gMzEvMTIvMjAyNCAyMjo1NiwgVmlu
Y2VudCBKYXJkaW4gd3JvdGU6Cj4gTGUgMzEgZMOpY2VtYnJlIDIwMjQgMTk6NTM6NTYgSnVsaWVu
IE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gYSDDqWNyaXQgOgo+IAo+IAo+PiBUaGUgbnZpZGlhIEJs
dWVGaWVsZC0zIERQVSBpbmNsdWRlcyBBcm0gQ29ydGV4LUE3OCBIZXJjdWxlcwo+PiBwcm9jZXNz
b3JzLiBTZWUgWzFdLgo+PiAKPj4gVGhlIENvcnRleC1BNzggc3VwcG9ydCB3YXMgYWRkZWQgaW4g
QnVpbGRyb290IGluIGNvbW1pdCBbMl0uCj4+IAo+PiBUaGlzIGNvbW1pdCBhZGRzIEJSMl9jb3J0
ZXhfYTc4PXkgaW4gbnZpZGlhX2JmM19kZWZjb25maWcgdG8gZW5hYmxlCj4+IG9wdGltaXNhdGlv
bnMgZm9yIHRoaXMgcHJvY2Vzc29yLgo+PiAKPj4gWzFdCj4+IAo+IGh0dHBzOi8vd3d3Lm52aWRp
YS5jb20vZW4tdXMvbmV0d29ya2luZy9wcm9kdWN0cy9kYXRhLXByb2Nlc3NpbmctdW5pdC8KPj4g
Cj4+IFsyXQo+PiAKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9jb21taXQvZjQ2OTBjMmJmZDdkNTFjNjE0ZDA5ZmY0NzBlNzI1Yzc5NWJhYjk4MAo+PiAKPj4g
Cj4+IENjOiBWaW5jZW50IEphcmRpbiA8dmphcmRpbkBmcmVlLmZyPgo+PiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+PiAtLS0KPj4gUGF0Y2ggdGVzdGVkIChj
b21waWxhdGlvbiBvbmx5KSBpbjoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxk
cm9vdC8tL2pvYnMvODc0ODQwMDY1MQo+PiAKPj4gVmluY2VudDogaWYgeW91IGhhdmUgYWNjZXNz
IHRvIHRoaXMgYm9hcmQsIGNvdWxkIHlvdSBkbyBhbiBhY3R1YWwKPj4gcnVudGltZSB0ZXN0IGFu
ZCBhZGQgYSAiVGVzdGVkLWJ5OiIsIHBsZWFzZT8KPiAKPiBPSy4gSSdsbCBzaGFyZSBzb21lIGZl
ZWRiYWNrcyBlYXJseSBuZXh0IHdlZWsuIEJlc2lkZSBqdXN0IGJvb3Rpbmcgb24KPiB0aGUgYm9h
cmQsIGRvIHlvdSBoYXZlIGFueSBzcGVjaWZpYyB0ZXN0cyB5b3VyIHdvdWxkIGxpa2UgbWUgdG8g
cnVuID8KCk9uIG15IHNpZGUsIGp1c3QgYm9vdGluZyB0aGUgYm9hcmQgaXMgc3VmZmljaWVudCwg
dG8gbWFrZSBzdXJlCnRoaXMgcGF0Y2ggaXMgbm90IGJyZWFraW5nIGFueXRoaW5nIHNvIGl0IGNh
biBiZSBtZXJnZWQuCgpGZWVsIGZyZWUgdG8gZG8gZXh0cmEgdGVzdHMuIERlY2xhcmluZyB0aGlz
IENvcnRleC1BNzggQ1BVIGlzIHBhc3NlZAp0byBnY2MuIFNvIGl0IGlzIHN1cHBvc2VkIHRvIGVu
YWJsZSBBNzggb3B0aW1pemF0aW9ucy4gSSBkb24ndCBleHBlY3QKYSBtYWpvciBwZXJmb3JtYW5j
ZSBpbXByb3ZlbWVudCBvbiB0aGUgZGVmY29uZmlnIGFsb25lIChLZXJuZWwgYW5kCkJ1c3lCb3gp
LiBCdXQgeW91IGNvdWxkIG9ic2VydmUgc29tZSBpbXByb3ZlbWVudCBvbiBzb21lIHNwZWNpZmlj
CmJlbmNobWFya3MuLi4gU2VlOgpodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjL0FS
TS1PcHRpb25zLmh0bWwjaW5kZXgtbWNwdS0yCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
