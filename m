Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E3FCA0FE8
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 11:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81FCE60E3E;
	Fri,  1 Sep 2023 11:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81FCE60E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIM_bpqsqby2; Fri,  1 Sep 2023 11:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46EA60D78;
	Fri,  1 Sep 2023 11:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C46EA60D78
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 025121BF31F
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 11:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDBE141800
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 11:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDBE141800
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjpJRlPO3fcs for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 11:09:02 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7EB541917
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 11:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7EB541917
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([213.147.166.144]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0JW-1pw8lW0xJY-00kQ7L; Fri, 01
 Sep 2023 13:08:58 +0200
Message-ID: <8a6656c8-26cb-49fe-a114-59c3a4b0665c@gmx.at>
Date: Fri, 1 Sep 2023 13:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-5-dalang@gmx.at>
 <da055153-9ec6-ade2-46ee-49c2d33ebf36@mind.be>
 <142d199c-ed4d-4574-ba83-ecbff73817ad@gmx.at>
 <f308772c-310e-622a-4e6a-11624f4c0ded@mind.be>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <f308772c-310e-622a-4e6a-11624f4c0ded@mind.be>
X-Provags-ID: V03:K1:PGS7n4jTzwMCeqDRQ94+fL7cbqc5IpXsZ3EGFYqcDHcEf1RsQmt
 F0G/fOeqwc1dc481sDuOYCz7XK94yaiT75G4i3dDyRMm0twUNdICgKM9D4PPX54GZvt+4kv
 XxXodFNA1CCV7iNoEutVzazQixu39+jW6GNdzBGjosmirWpdXgQ4QHjpXOKAYn0lqnpQLAZ
 Z4qvMrz+XPNuSaM4CAY8A==
UI-OutboundReport: notjunk:1;M01:P0:dFShnTuoPys=;axxNbh7HjbCcfySQect/YuW4wAP
 QrqLSZDFBNe/nOvqT9Uc0kQ82K5zOuOYwKfb/DvJq9rOCchu/TD3Icx0yAPvPdtb2wz++y8tx
 hRg9xGF+uFrdB9hQWUDqG4PxIhY+b8uHNSgkceBx338eOc3rmoK7oiMQ7E6/mwr12Cd/sekEL
 9RihMVr5Qzj44EKBk2mLepXZmmuUWbZ/8DvGPsk0PKiUE8wvEsBVZOP59i3XaQqW1slAyJH5y
 FGKkZNZQAGlv0KnleocoGFF+8vE6AuoowQIHa6jy+IINKTFsYeSAaNXRlXqbz2jQ+tgfsuwoz
 qY2i1dJlWvD9kq7anFiMK/Etvpf0tJ3k0Aa6v1Ew5pTpz7KeU0EU88Dzfn1Nw+0k+icZ2dxJw
 w1EX6WtZaUvOTq6moVM7sPojtSh8u1KmzWWO5jQKGrlZC1Ombu559C18sUwV8y7KFX67LFpHv
 7sw+xWqN4W2vOWLxqduCFnZlY5hYAb4KEtDZQ3Sl6qDZU0qM6TI6ZTH4bERuSZ2aZf5ZLAQ5M
 4makuHrGrN5zEqx0bmgaR9wV1ngZR0zUo7bihyd6aJjE4kJ5gW9rCbi2VwlrqwczZYaURN9Sr
 YCQgZz2ye0PY49UuQhMR3x+JM2Ez1KOx7Z5abZqjsQmtkmpO6+T9SUwLiYEZNLhYFkooL7CfO
 rkYtgLh2p/XMAD5Yv+MUiZ8HFdauMXY/O7wSABi26grHa/TG+lWyD195hMYjlCKLly1k8Qywv
 ZGKXFmfMc1kwZwiFC39l6v3cUIslXq9gUxHlxBZiTxpQTHWo1EjJinByIyGaNxUurdejNnWjJ
 LwKGtNRKEdIpLePS0atZlPSPYE8GlcZ3kaLXTZ26iBj8PHtQBQ5x5KNBu/9m4NTJ2vnsRYdH6
 e4oltL2RhirjsWwo1yCfJEpBGuFnhGZ1CbahxMi1stee4+fFFCqp0MdaG3+92kc22y4AglCsV
 3psiL415STNBUQ5f6xwvLzmHsyw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693566538; x=1694171338; i=dalang@gmx.at;
 bh=cX2JRHF2IXI/JuxoajWNZdaLsBC8ZXUjibGeKIOBIE4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GCP9dNhmk0bQ7CLAVM9M1mmzbpFIS9dtJt1o9xA4uTox/7Qiy+Who78O4NIPEtxkEfCsxHa
 JavyuHv+LSokghGG5tgwfQGPwgl/biruWJgtXzHEswAVicSZs5bhgpISvWTqnl/aAX9Gs16ti
 syGxmXtQH+lxmPrYyLHnEod6V4a9CD7sQdxVRAZJRgXgY3pHJtn0+LdP9Crtw6hlIcb0WI9tB
 M7B6A/6KQdfwA5dzTxgeXnmx4jKSTsXU6Kub672EzzfE5lU487CoEB0DuaPt/FshAvu/Wg03V
 LOWR50EqhJHeHAMebRXeBh74yg887sXGbcshgjMwv6Tcs7yrfyNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=GCP9dNhm
Subject: Re: [Buildroot] [PATCH v3 5/8] support/scripts/nvd_api_v2.py: new
 helper class
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDEuMDkuMjMgMDk6MDMsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBPbiAz
MS8wOC8yMDIzIDIyOjE4LCBEYW5pZWwgTGFuZyB3cm90ZToKPj4gSGVsbG8gQXJub3V0LAo+Pgo+
PiB0aGFua3MgZm9yIHRoZSBkZXRhaWxlZCBjb21tZW50cy4KPj4gSSB3aWxsIHRyeSB0byBhZGRy
ZXNzIHRoZW0gYW5kIHNlbmQgYSBuZXcgdmVyc2lvbiBxdWlja2x5Lgo+Pgo+PiBPbiAzMC4wOC4y
MyAyMzozNywgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4+PiDCoMKgSGkgRGFuaWVsLAo+
Pj4KPj4+IMKgwqBTaW5jZSB0aGlzIGlzIG5ldyBjb2RlLCBJJ20gZ29pbmcgdG8gZ2l2ZSBzb21l
IGNvZGluZyBzdHlsZSBjb21tZW50cyB0aGF0IGRpZmZlciBhIGJpdCBmcm9tIGV4aXN0aW5nIGNv
ZGUgeW91IHNlZSBpbiBwa2ctc3RhdHMuCj4+Pgo+Pj4gwqDCoEkgbWF5IGFjdHVhbGx5IGVuZCB1
cCBhcHBseWluZyB0aGUgcGF0Y2ggd2l0aG91dCB0aG9zZSBjb2Rpbmcgc3R5bGUgY2hhbmdlcywg
YmVjYXVzZSB0aGUgbmV3IE5WRCBBUEkgaXMgbW9yZSBpbXBvcnRhbnQgdGhhbiBhbnkgY29kaW5n
IHN0eWxlIGNvbmNlcm5zLi4uIFdlJ2xsIHNlZSBob3cgZmFyIEkgZ2V0Lgo+Pj4KPj4+IMKgwqBU
aGlzIGlzIGFsc28gbm90IGEgY29tcGxldGUgcmV2aWV3IG9mIHRoaXMgcGF0Y2ggYmVjYXVzZSBp
dCdzIGFsbW9zdCB0aW1lIGZvciBtZSB0byBnbyB0byBiZWQuCj4+Pgo+PgoKWy1TTklQLV0KCgo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEZhbHNlCj4+Pj4gKwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuY29ubmVjdGlvbi5jb21taXQoKQo+Pj4+
ICsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBzdGFydF9pbmRleCA+PSB0b3RhbF9y
ZXN1bHRzOgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFRydWUK
Pj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBPdGhlcndpc2UgcmF0ZSBsaW1p
dGluZyB3aWxsIGJlIGhpdC4KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aW1lLnNsZWVw
KDYpCj4+Pgo+Pj4gwqDCoElmIHRoZSByYXRlIGxpbWl0IHJlYWxseSBpcyAiNSByZXF1ZXN0cyBw
ZXIgMzAgc2Vjb25kcyIsIHRoZW4gd2UgY2FuIGFjdHVhbGx5IGRvIDMgcmVxdWVzdHMgYmFjay10
by1iYWNrIHdpdGhvdXQgYW55IHNsZWVwIHdpdGhvdXQgaGl0dGluZyB0aGUgcmF0ZSBsaW1pdCwg
cmlnaHQ/IEFzc3VtaW5nIHlvdSBkbyBjYWxsIHRoZSBzY3JpcHQgcHJldHR5IHJlZ3VsYXJseSAo
bGlrZSwgd2hhdCB3ZSBkbyBvbiBhLmIubyksIHRoZSBuZXcgcmVzdWx0cyBzaG91bGQgYmUganVz
dCBhIGZldyBwYWdlcywgc28gd2UgY2FuIGF2b2lkIHRoZSBzbGVlcCBlbnRpcmVseS4uLgo+Cj4g
wqBJbiB5b3VyIGV4cGVyaWVuY2UsIGlzIGl0IHRydWUgdGhhdCB3ZSBvbmx5IG5lZWQgdG8gZG93
bmxvYWQgYSBmZXcgcGFnZXMgaWYgeW91IHVwZGF0ZSBldmVyeSBkYXk/IE9yIG1heWJlIGl0J3Mg
ZXZlbiBsZXNzIHRoYW4gb25lIHBhZ2UgLSBpbiB0aGF0IGNhc2UgaXQncyBub3QgcmVhbGx5IHJl
bGV2YW50LgoKMjE0IENWRXMgd2hlcmUgdXBkYXRlZCBpbiB0aGUgbGFzdCAyNGguCjk3OCBDVkVz
IHdoZXJlIHVwZGF0ZWQgaW4gdGhlIGxhc3Qgd2Vlay4KTm90IHN1cmUgdGhvc2UgYXJlIHJlcHJl
c2VudGF0aXZlIG51bWJlcnMsIGJ1dCBhdXRvYnVpbGRlcnMKc2hvdWxkIG5ldmVyIGhhdmUgdG8g
ZmV0Y2ggbW9yZSB0aGFuIDEtMiBwYWdlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
