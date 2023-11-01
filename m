Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D101FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 09:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 701B76FC6C;
	Wed,  1 Nov 2023 09:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 701B76FC6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVA4ZhG5rG5N; Wed,  1 Nov 2023 09:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6020A6FC64;
	Wed,  1 Nov 2023 09:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6020A6FC64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 773571BF20D
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 09:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50325848C4
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 09:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50325848C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6tSr-4Pz9-bI for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 09:06:44 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 195A681ED7
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 09:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195A681ED7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 18A0219F734;
 Wed,  1 Nov 2023 10:06:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 Nov 2023 10:06:38 +0100
Date: Wed, 1 Nov 2023 10:06:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?6Zm25rO95a6H?= <i@taozeyu.com>
Message-ID: <20231101090638.GE2568@scaer>
References: <F5BEC5A5-8166-48FA-A7C7-45C4F1250585@taozeyu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F5BEC5A5-8166-48FA-A7C7-45C4F1250585@taozeyu.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698829601;
 bh=zS9FpDA7ZpyRB2ndfPz9vxoUP5wmVgNvvpCQ1UIowgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFmGB8Vyog4TEQZGPHEXmw7Pq63g0G6a0HUMLYemChTyxKLZV4tMHGeN3nZDXyINi
 HGvaidhKJRTqdpSRI/iq7xjPEV+46n6tg9rYaehEfE2nOiupJwYKx9t2GLB8cswo8q
 KAg64vYV2JUIvKl6M8COG55hrLESWah281Cy6aat8voZyIoEj51fZhLB1V346fgm9N
 g6JG5uZPOyoJ6Vwhu7iLfMsw7kalAkJZgyPuHWl4ygC9zijKRr8RX/xzQE99l/Srar
 B/qYeS6ae/ergRzIpz5EX3s6rpND0eEzAo6V3Q+QheoJKJ+43XPNDCe25V8sX7Xf2Q
 UkqG7J443Fmvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MFmGB8Vy
Subject: Re: [Buildroot] Can buildroot support WSL config file
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

6Zm25rO95a6HLCBBbGwsCgpPbiAyMDIzLTExLTAxIDE2OjA0ICswODAwLCDpmbbms73lrocgc3Bh
a2UgdGh1c2x5Ogo+IE1hbnkgTGludXggZGlzdHJpYnV0aW9ucyBydW4gInN5c3RlbWQiIGJ5IGRl
ZmF1bHQuIEJ1dCAgaWYgeW91IHdhbnQgV1NMIHJ1bnMgc3lzdGVtZCBieSBkZWZhdWx0LCB5b3Ug
bmVlZCB0byBwdXQgc29tZXRoaW5nIGluIHRoZQo+IGZpbGUgL2V0Yy93c2wuY29uZi4KPiBbYm9v
dF0KPiBzeXN0ZW1kPXRydWUKPiAoIFRvIHNlZSAgWzFdaHR0cHM6Ly9sZWFybi5taWNyb3NvZnQu
Y29tL2VuLXVzL3dpbmRvd3Mvd3NsL3dzbC1jb25maWcjY29uZmlndXJhdGlvbi1zZXR0aW5ncy1m
b3Itd3NsY29uZiApCj4gQ2FuIGJ1aWxkcm9vdCBzdXBwb3J0cyBpdCBpbiBjb25maWcgcGFuZWw/
IE1heWJlIHN1cHBvcnQgc29tZSBvcHRpb25zIGluICBzeXN0ZW0vQ29uZmlnLmluIHRvIGdlbmVy
YXRlIC9ldGMvd3NsLmNvbmYuIG9ubHkgYSBzaW5nbGUKPiBjaGVja2JveCBvciAgbW9yZSBsaXN0
IG9mIG9wdGlvbnMgbWVudGlvbmVkIGluIE1pY3Jvc29mdCBXU0wgZG9jdW1lbnRzLgoKVGhpcyBm
aWxlIGlzIG5vdCBwYXJ0IG9mIHN5c3RlbWQ7IHN5c3RlbWQgZG9lcyBub3QgZXZlbiBsb29rIGF0
IHRoaXMKZmlsZSBhdCBhbGwuCgpJbnN0ZWFkLCBhcyBJIHVuZGVyc3RhbmQgaXQsIGl0IGlzIGxv
b2tlZCB1cCBieSB0aGUgV1NMMiB2aXJ0dWFsIG1hY2hpbmUKcnVudGltZS4gQXMgc3VjaCwgaXQg
aXMgcGFydCBvZiB0aGUgaW50ZWdyYXRpb24gd2l0aCB5b3VyICJtYWNoaW5lIgoodmlydHVhbCBp
biB0aGlzIGNhc2UpLgoKQnVpbGRyb290IGFscmVhZHkgb2ZmZXJzIGEgd2F5IHRvIGN1c3RvbWlz
ZSB0aGUgZ2VuZXJhdGVkIHJvb3QKZmlsZXN5c3RlbSBpbiB2YXJpb3VzIHdheXMsIGxpa2UgYSBy
b290ZnMgb3ZlcmxheSwgb3IgYSBwb3N0LWJ1aWxkCnNjcmlwdDsgc2VlIHRoZSBtYW51YWwgZm9y
IGZ1cnRoZXIgZGV0YWlsczsKICAgIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFu
dWFsL21hbnVhbC5odG1sI3Jvb3Rmcy1jdXN0b20KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+
IAo+IExpbmtzOgo+IDEuIGh0dHBzOi8vbGVhcm4ubWljcm9zb2Z0LmNvbS9lbi11cy93aW5kb3dz
L3dzbC93c2wtY29uZmlnI2NvbmZpZ3VyYXRpb24tc2V0dGluZ3MtZm9yLXdzbGNvbmYKCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgotLSAKLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwg
QVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBT
b2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAg
IHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAg
ICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
