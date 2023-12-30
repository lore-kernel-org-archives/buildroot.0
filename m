Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DAFC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 22:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5686B400FE;
	Sat, 30 Dec 2023 22:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5686B400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iV8MpvV_qbjr; Sat, 30 Dec 2023 22:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD29140253;
	Sat, 30 Dec 2023 22:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD29140253
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF211BF487
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 22:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 257D581991
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 22:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 257D581991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W9FiARRwV6kq for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 22:08:58 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A472C81916
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 22:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A472C81916
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7D579B0053D;
 Sat, 30 Dec 2023 23:08:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Dec 2023 23:08:49 +0100
Date: Sat, 30 Dec 2023 23:08:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZZCU8UABqefYpf8n@landeda>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
 <20231228152657.488457-2-antoine.coutant@smile.fr>
 <ZY9Ej76T9DYHuLe3@landeda> <20231230190019.434e1b4b@windsurf>
 <ZZBzIdHGdJufQNWn@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZBzIdHGdJufQNWn@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703974134;
 bh=o7C1pXkdjUTz/JmNd8rDVSxS2q6Azd6JMQqe3qIQu1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rIuTrGXaUK8S9xhdXoH8has1yGL9eLkBNZPDUvYdkwSDK33gG8Fj2xJ6CGqHO1Sla
 9Szjht6+j9WQ4KK3/nMZx7AeOTllpIcW07aGXzNETJQeRdEmDdGt1zWpbNNTEQh2qj
 oGv5xq2cNuDaieG906xEmVV4k0tjTtsf8pUsvMXtJ/LfnEUvo9eF+v/bpoi6gC1R3d
 Ea/abC6kfjiSoXOD5mPEuqkVcAc33ETyOn4OK7bP04w0Tfo4cnKA6IzVg5T6/glzs2
 zzHq/a9prGQh6OGjxymohg5SFwKiNmRAwYhpSYUdBNHrms2k3fmBa9zAWhlDrAtjxO
 dSqfBkbg7jgVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rIuTrGXa
Subject: Re: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version
 14.0.3
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 sebastian.weyer@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbnRvaW5lLCBBbGwsCgpPbiAyMDIzLTEyLTMwIDIwOjQ0ICswMTAwLCBZYW5uIEUu
IE1PUklOIHNwYWtlIHRodXNseToKPiBPbiAyMDIzLTEyLTMwIDE5OjAwICswMTAwLCBUaG9tYXMg
UGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+ID4gT24gRnJpLCAyOSBEZWMg
MjAyMyAyMzoxMzozNSArMDEwMAo+ID4gIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcj4gd3JvdGU6Cj4gPiA+IElmIHRoYXQncyBzbywgdGhlbiB3ZSBoYXZlIGEgYmlnIHBy
b2JsZW06IHRoZSBoYXNoZXMgZm9yIGFsbCB0aGUKPiA+ID4gY2FyZ28tYmFzZWQgcGFja2FnZXMg
d2lsbCBjaGFuZ2UsIGFuZCB0aHVzIGl0IG1lYW5zIHdlIHdpbGwgaGF2ZSB0bwo+ID4gPiBuYW1l
IHRoZSBnZW5lcmF0ZWQgYXJjaGl2ZSBiYXNlZCBvbiB0aGUgY2FyZ28gdmVyc2lvbiB1c2VkIHRv
IGRvIHRoZQo+ID4gPiB2ZW5kb3JpbmcuIFRoYXQgd291bGQgYXBwbHkgdG86Cj4gPiBOb3RlIHRo
YXQgSSBhbHNvIGVuY291bnRlcmVkIHNvbWUgaGFzaCBtaXNtYXRjaCBvbiBzb21lIFJ1c3QvQ2Fy
Z28KPiA+IHBhY2thZ2UgcmVjZW50bHksIGFuZCBCUiB3YXMgZmFsbGluZyBiYWNrIHRvIHNvdXJj
ZXMuYnVpbGRyb290Lm5ldC4gSQo+ID4gZGlkIG5vdCBoYXZlIHRoZSB0aW1lIHRvIGludmVzdGln
YXRlIGF0IHRoZSB0aW1lIChJIHdhcyBsb29raW5nIGludG8KPiA+IGFub3RoZXIgaXNzdWUsIGFu
ZCBkaWRuJ3Qgd2FudCB0byBlbnRlciBhbiBpbmZpbml0ZSByZWN1cnNpb24gb2YKPiA+IHByb2Js
ZW0gc29sdmluZyBxdWVzdCkuIEFuZCBub3csIEkgZG9uJ3QgcmVtZW1iZXIgd2l0aCB3aGljaCBw
YWNrYWdlIEkKPiA+IGVuY291bnRlcmVkIHRoaXMuIEJ1dCB5ZXMsIGl0IHNlZW1zIGxpa2Ugd2Ug
aGF2ZSBhIHJlcHJvZHVjaWJpbGl0eQo+ID4gaXNzdWUuClstLVNOSVAtLV0KPiAgIC0gcmlwZ3Jl
cCBmYWlscyB2ZW5kb3JpbmcsIGFuZCByZXBvcnRzIHRoZSBzYW1lIGhhc2ggZmFpbHVyZQo+ICAg
LSBob3N0LXNlbnRyeS1jbGkgZmFpbHMgdmVuZG9yaW5nLCBhZ2FpbiB3aXRoIHRoZSBzYW1lIHJl
cG9ydGVkIGhhc2gKPiAgICAgZmFpbHVyZQoKZGlmZm9zY29wZSB0byB0aGUgcmVzY3VlOiB0aGUg
b25seSBjaGFuZ2UgaW4gZWl0aGVyIHBhY2thZ2UsIGlzIGEgc2luZ2xlCmZpbGUgdGhhdCBnb3Qg
aXRzIG1vZGUgYml0cyBjaGFuZ2VkIChjb250ZXh0IGVsaWRlZCBmb3IgYnJldml0eSk6CgogICAg
LS0tIHJpcGdyZXAtYWY2YjZjNTQzYjIyNGQzNDhhODg3NmYwYzA2MjQ1ZDllYTc5MjljNS50YXIK
ICAgICsrKyByaXBncmVwLWFmNmI2YzU0M2IyMjRkMzQ4YTg4NzZmMGMwNjI0NWQ5ZWE3OTI5YzUt
Mi50YXIKICAgIOKUnOKUgOKUgCBmaWxlIGxpc3QKICAgIOKUgiBAQCAtMjczMSwxICsyNzMxLDEg
QEAKICAgIOKUgiAtLXJ3eHIteC0tLSAgIDAgICAgICAgIDAgICAgICAgIDAgICAgMTA3MTkgMjAy
MS0wNi0xMiAxMjoxMjoyNC4wMDAwMDAgcmlwZ3JlcC1hZjZiNmM1NDNiMjI0ZDM0OGE4ODc2ZjBj
MDYyNDVkOWVhNzkyOWM1L1ZFTkRPUi91bmljb2RlLXdpZHRoL3NjcmlwdHMvdW5pY29kZS5weQog
ICAg4pSCICstcnd4ci14LS14ICAgMCAgICAgICAgMCAgICAgICAgMCAgICAxMDcxOSAyMDIxLTA2
LTEyIDEyOjEyOjI0LjAwMDAwMCByaXBncmVwLWFmNmI2YzU0M2IyMjRkMzQ4YTg4NzZmMGMwNjI0
NWQ5ZWE3OTI5YzUvVkVORE9SL3VuaWNvZGUtd2lkdGgvc2NyaXB0cy91bmljb2RlLnB5CgogICAg
LS0tIHNlbnRyeS1jbGktMi4yMC4zLnRhcgogICAgKysrIHNlbnRyeS1jbGktMi4yMC4zLTIudGFy
CiAgICDilJzilIDilIAgZmlsZSBsaXN0CiAgICDilIIgQEAgLTE1MjkyLDEgKzE1MjkyLDEgQEAK
ICAgIOKUgiAtLXJ3eC0tLS0tLSAgIDAgICAgICAgIDAgICAgICAgIDAgICAgIDE3OTYgMjAyMy0w
Ny0zMSAwOTo1ODo0Ni4wMDAwMDAgc2VudHJ5LWNsaS0yLjIwLjMvVkVORE9SL3VzZXJuYW1lL3Ny
Yy9saWIucnMKICAgIOKUgiArLXJ3eC0teC0teCAgIDAgICAgICAgIDAgICAgICAgIDAgICAgIDE3
OTYgMjAyMy0wNy0zMSAwOTo1ODo0Ni4wMDAwMDAgc2VudHJ5LWNsaS0yLjIwLjMvVkVORE9SL3Vz
ZXJuYW1lL3NyYy9saWIucnMKCkluIGVpdGhlciBjYXNlLCBhIHNpbmdsZSBmaWxlIGhhZCBpdHMg
bW9kZSBiaXRzIGNoYW5nZWQsIGFuZCBpdCBzbWVsbHMKbGlrZSBnbytYIHdhcyBhcHBsaWVkLgoK
SXQgc2VlbXMgdGhhdCBjYXJnbyBkaWQgY2hhbmdlIGl0cyBiZWhhdmlvdXIgYXQgc29tZSBwb2lu
dCwgYXMgdGhlCmFyY2hpdmUgYXMgbWFudWFsbHkgZG93bmxvYWRlZCBmcm9tIGNyYXRlcy5pbyBk
b2VzIGhhdmUgdGhlIGV4ZWN1dGFibGUKYml0cyBhcyB3ZSBvcmlnaW5hbGx5IGV4cGVjdGVkOgoK
ICAgICQgd2dldCAtTyB1bmljb2RlLXdpZHRoLTAuMS44LnRhci5neiBodHRwczovL2NyYXRlcy5p
by9hcGkvdjEvY3JhdGVzL3VuaWNvZGUtd2lkdGgvMC4xLjgvZG93bmxvYWQKICAgICQgdGFyIHh6
ZiB1bmljb2RlLXdpZHRoLTAuMS44LnRhci5negogICAgJCBscyAtaGwgdW5pY29kZS13aWR0aC0w
LjEuOC9zY3JpcHRzL3VuaWNvZGUucHkKICAgIC1yd3hyLXgtLS0uIDEgeW1vcmluIHltb3JpbiAx
MUsgSnVuIDI5ICAyMDIwIHVuaWNvZGUtd2lkdGgtMC4xLjgvc2NyaXB0cy91bmljb2RlLnB5Kgog
ICAgJCB3Z2V0IC1PIHVzZXJuYW1lLTAuMi4wLnRhci5neiBodHRwczovL2NyYXRlcy5pby9hcGkv
djEvY3JhdGVzL3VzZXJuYW1lLzAuMi4wL2Rvd25sb2FkCiAgICAkIHRhciB4emYgdXNlcm5hbWUt
MC4yLjAudGFyLmd6CiAgICAkIGxzIC1obCB1c2VybmFtZS0wLjIuMC9zcmMvbGliLnJzCiAgICAt
cnd4LS0tLS0tLiAxIHltb3JpbiB5bW9yaW4gMS44SyBBdWcgMTAgIDIwMTcgdXNlcm5hbWUtMC4y
LjAvc3JjL2xpYi5ycwoKSSBjb3VsZCBub3QgZmluZCBhbnl0aGluZyByZWxldmFudCBpbiB0aGUg
Y2FyZ28gYnVnIHRyYWNrZXI6CiAgICBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2Nhcmdv
L2lzc3Vlcz9xPWlzJTNBaXNzdWUrdmVuZG9yK2V4ZWN1dGFibGUrYml0CgpTbywgSSBoYXZlIG5v
IGNsdWUgd2hhdCB0aGUgYmVzdCBjb3Vyc2Ugb2YgYWN0aW9uIHdvdWxkIGJlLiBUaGUKc2hvcnQt
dGVybSB3b3JrYXJvdW5kIGlzIHRvIGNob3Atb2ZmIG9uZSBtb3JlIGRpZ2l0IGZyb20gdGhlIHJp
cGdyZXAKdmVyc2lvbiBhbmQgcmVjYWxjdWxhdGUgYSBuZXcgaGFzaCBmb3IgaXQsIGFuZCBmb3Ig
c2VudHJ5LWNsaSBtYXliZSB3ZQpjYW4gdXBkYXRlIHRoZSB2ZXJzaW9uIChvciBzd2l0Y2ggdG8g
YSBjb21taXQgaGFzaCkuCgpQcm9iYWJseSB3ZSB3aWxsIHdhbnQgYXQgc29tZSBwb2ludCB0byBp
bnRyb2R1Y2UgYSB2ZW5kb3JpbmcgdmVyc2lvbiwKbGlrZSB3ZSBoYXZlIGZvciB0aGUgZ2l0IGFu
ZCBzdm4gbWV0aG9kcy4gc28gdGhhdCB3ZSBjYW4gdXBkYXRlIHJ1c3QKKGFuZCB0aHVzIGNhcmdv
KSB3aXRob3V0IHJlcXVpcmluZyBhIHZlcnNpb24gYnVtcC90d2VhayBmb3IgYWxsIGFmZmVjdGVk
CnBhY2thZ2VzLi4uCgpBcyBhbiBhc2lkZSwgdGhlIHNpdHVhdGlvbiBmb3Igc2VudHJ5LWNsaSBp
cyBhIGJpdCBjb25jZXJuaW5nOiB0aGUKJ3VzZXJuYW1lJyBjcmF0ZSBvbmx5IGV2ZXIgaGFkIG9u
ZSByZWxlYXNlLCAwLjIuMCwgb3ZlciA2IHllYXJzIGFnbwpub3csIGFuZCB0aGUgZG9jdW1lbnRh
dGlvbiBhbmQgcmVwb3NpdG9yeSBsaXN0ZWQgb24gdGhlIGNyYXRlcy5pbwpwYWdlIG5vIGxvbmdl
ciBleGlzdDoKCiAgICBodHRwczovL2NyYXRlcy5pby9jcmF0ZXMvdXNlcm5hbWUKICAgIGh0dHA6
Ly9waWp1bC5vcmcvdXNlci9kb2MvdXNlci9pbmRleC5odG1sICAgPT4gNDA0CiAgICBodHRwczov
L3BpanVsLm9yZy9kYXJjcy91c2VyICAgICAgICAgICAgICAgID0+IDQwNAoKTWVoPy4uLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQy
NyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBp
cyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
