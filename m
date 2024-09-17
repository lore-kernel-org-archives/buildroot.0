Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA77CAC5A2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8961B6070F;
	Tue, 17 Sep 2024 21:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoVTmK73lW0A; Tue, 17 Sep 2024 21:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A12860782
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A12860782;
	Tue, 17 Sep 2024 21:10:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 820D21BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 701C44026F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvPTBWErHJmO for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C049C4018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C049C4018F
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C049C4018F
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:10:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 408431814B9; Tue, 17 Sep 2024 23:10:42 +0200 (CEST)
In-Reply-To: <20240917202834.4017981-1-james.hilliard1@gmail.com>
References: <20240917202834.4017981-1-james.hilliard1@gmail.com>
Date: Tue, 17 Sep 2024 23:10:42 +0200
To: "James Hilliard" <james.hilliard1@gmail.com>
MIME-Version: 1.0
Message-ID: <3de08-66e9f080-3-120b78e0@82001172>
User-Agent: SOGoMail 5.11.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1726607444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zlduyGokvP9DFRYiLxH06hG/Ya4kkt5FwtgNWJm37K0=;
 b=NZcnK278ZbXM/mW5wIFI9OWOI6rBIWQjoCGaRDPNYvdUjEiB7NPEX/NNmBwjf2ZGann5m9
 N9xkkfUKtjBBx8eSFPHr7h1sfBaQsCdRVNQcWdncDHdWX3U0KbDDheOMKnX6Qz1KBrWFRn
 SUbn47i8Cda2m6Kh8MrjPe13qmN/hI8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=NZcnK278
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/=7Bpython-=7Dproto?=
 =?utf-8?q?buf=3A_bump_to_version_28=2E1?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTcsIDIwMjQgMjI6MjggQ0VTVCwgSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgoKPiBNaWdyYXRl
IHByb3RvYnVmIGJ1aWxkIGZyb20gYXV0b3Rvb2xzIHRvIGNtYWtlLgo+IAoKSSB0aGluayB0aGlz
IGlzIHRoZSByaWdodCBhcHByb2FjaCA6KQoKPiAtLS0gYS9wYWNrYWdlL3Byb3RvYnVmL3Byb3Rv
YnVmLm1rCj4gKysrIGIvcGFja2FnZS9wcm90b2J1Zi9wcm90b2J1Zi5tawo+IEBAIC03LDE2ICs3
LDQwIEBACj4gICMgV2hlbiBidW1waW5nIHRoaXMgcGFja2FnZSwgbWFrZSBzdXJlIHRvIGFsc28g
dmVyaWZ5IGlmIHRoZQo+ICAjIHB5dGhvbi1wcm90b2J1ZiBwYWNrYWdlIHN0aWxsIHdvcmtzIGFu
ZCB0byB1cGRhdGUgaXRzIGhhc2gsCj4gICMgYXMgdGhleSBzaGFyZSB0aGUgc2FtZSB2ZXJzaW9u
L3NpdGUgdmFyaWFibGVzLgoKSSB0aGluayB0aGUgY29tbWVudCBuZWVkcyB1cGRhdGluZyBhcyB3
ZWxsLCB0aGUgc2l0ZSB2YXJpYWJsZXMgYXJlIG5vdyBkaWZmZXJlbnQuCgo+IC1QUk9UT0JVRl9W
RVJTSU9OID0gMjEuMTIKPiAtUFJPVE9CVUZfU09VUkNFID0gcHJvdG9idWYtY3BwLTMuJChQUk9U
T0JVRl9WRVJTSU9OKS50YXIuZ3oKPiArUFJPVE9CVUZfVkVSU0lPTiA9IDI4LjEKPiAgUFJPVE9C
VUZfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9wcm90b2NvbGJ1ZmZlcnMvcHJvdG9idWYvcmVs
ZWFzZXMvZG93bmxvYWQvdiQoUFJPVE9CVUZfVkVSU0lPTikKPiAgUFJPVE9CVUZfTElDRU5TRSA9
IEJTRC0zLUNsYXVzZQo+ICBQUk9UT0JVRl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICBQUk9U
T0JVRl9DUEVfSURfVkVORE9SID0gZ29vZ2xlCj4gIAoKc2FkbHkgSSBjYW4ndCBjb21waWxlICho
b3N0LSlncnBjIGFueW1vcmUgYWZ0ZXIgdGhpcyB2ZXJzaW9uIGJ1bXAuIEkgZmVhciB0aGF0IGlu
IHRoZSBlbmQgd2UgbmVlZCB0byBidW1wIHByb3RvYnVmLCBncnBjIGFuZCBsaWJhYnNlaWwgaW4g
b25lIHBhdGNoc2V0LgpCdXQgbWF5YmUgeW91IGNhbiBwcm9vZiBtZSB3cm9uZy4KCkRlZmNvbmZp
ZyB0byByZXByb2R1Y2U6CgpCUjJfYXJtPXkKQlIyX2NvcnRleF9hMTVfYTc9eQpCUjJfQVJNX0ZQ
VV9ORU9OX1ZGUFY0PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9QQUNLQUdFX0dSUEM9
eQoKRXJyb3I6CgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2J1aWxkL2J1aWxkcm9vdC11cHN0cmVh
bS9vdXRwdXQvYnVpbGQvaG9zdC1ncnBjLTEuNTEuMS9zcmMvY29tcGlsZXIvb2JqZWN0aXZlX2Nf
Z2VuZXJhdG9yLmNjOjI4OgovYnVpbGQvYnVpbGRyb290LXVwc3RyZWFtL291dHB1dC9idWlsZC9o
b3N0LWdycGMtMS41MS4xL3NyYy9jb21waWxlci9vYmplY3RpdmVfY19nZW5lcmF0b3JfaGVscGVy
cy5oOiBJbiBmdW5jdGlvbiDigJhzdGQ6OnN0cmluZyBncnBjX29iamVjdGl2ZV9jX2dlbmVyYXRv
cjo6TWVzc2FnZUhlYWRlck5hbWUoY29uc3QgRmlsZURlc2NyaXB0b3IqKeKAmToKL2J1aWxkL2J1
aWxkcm9vdC11cHN0cmVhbS9vdXRwdXQvYnVpbGQvaG9zdC1ncnBjLTEuNTEuMS9zcmMvY29tcGls
ZXIvb2JqZWN0aXZlX2NfZ2VuZXJhdG9yX2hlbHBlcnMuaDozNzo1MDogZXJyb3I6IOKAmEZpbGVQ
YXRo4oCZIGlzIG5vdCBhIG1lbWJlciBvZiDigJhnb29nbGU6OnByb3RvYnVmOjpjb21waWxlcjo6
b2JqZWN0aXZlY+KAmQogICAzNyB8ICAgcmV0dXJuIGdvb2dsZTo6cHJvdG9idWY6OmNvbXBpbGVy
OjpvYmplY3RpdmVjOjpGaWxlUGF0aChmaWxlKSArICIucGJvYmpjLmgiOwogICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fgovYnVp
bGQvYnVpbGRyb290LXVwc3RyZWFtL291dHB1dC9idWlsZC9ob3N0LWdycGMtMS41MS4xL3NyYy9j
b21waWxlci9vYmplY3RpdmVfY19nZW5lcmF0b3JfaGVscGVycy5oOiBJbiBmdW5jdGlvbiDigJhz
dGQ6OnN0cmluZyBncnBjX29iamVjdGl2ZV9jX2dlbmVyYXRvcjo6U2VydmljZUNsYXNzTmFtZShj
b25zdCBTZXJ2aWNlRGVzY3JpcHRvciop4oCZOgovYnVpbGQvYnVpbGRyb290LXVwc3RyZWFtL291
dHB1dC9idWlsZC9ob3N0LWdycGMtMS41MS4xL3NyYy9jb21waWxlci9vYmplY3RpdmVfY19nZW5l
cmF0b3JfaGVscGVycy5oOjQ1OjQ3OiBlcnJvcjog4oCYRmlsZUNsYXNzUHJlZml44oCZIGlzIG5v
dCBhIG1lbWJlciBvZiDigJhnb29nbGU6OnByb3RvYnVmOjpjb21waWxlcjo6b2JqZWN0aXZlY+KA
mQogICA0NSB8ICAgICAgIGdvb2dsZTo6cHJvdG9idWY6OmNvbXBpbGVyOjpvYmplY3RpdmVjOjpG
aWxlQ2xhc3NQcmVmaXgoZmlsZSk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgovYnVpbGQvYnVpbGRyb290LXVwc3Ry
ZWFtL291dHB1dC9idWlsZC9ob3N0LWdycGMtMS41MS4xL3NyYy9jb21waWxlci9vYmplY3RpdmVf
Y19nZW5lcmF0b3IuY2M6IEF0IGdsb2JhbCBzY29wZToKL2J1aWxkL2J1aWxkcm9vdC11cHN0cmVh
bS9vdXRwdXQvYnVpbGQvaG9zdC1ncnBjLTEuNTEuMS9zcmMvY29tcGlsZXIvb2JqZWN0aXZlX2Nf
Z2VuZXJhdG9yLmNjOjMwOjQ5OiBlcnJvcjog4oCYQ2xhc3NOYW1l4oCZIGhhcyBub3QgYmVlbiBk
ZWNsYXJlZCBpbiDigJhnb29nbGU6OnByb3RvYnVmOjpjb21waWxlcjo6b2JqZWN0aXZlY+KAmQog
ICAzMCB8IHVzaW5nIDo6Z29vZ2xlOjpwcm90b2J1Zjo6Y29tcGlsZXI6Om9iamVjdGl2ZWM6OkNs
YXNzTmFtZTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fn4KL2J1aWxkL2J1aWxkcm9vdC11cHN0cmVhbS9vdXRwdXQvYnVpbGQv
aG9zdC1ncnBjLTEuNTEuMS9zcmMvY29tcGlsZXIvb2JqZWN0aXZlX2NfZ2VuZXJhdG9yLmNjOiBJ
biBmdW5jdGlvbiDigJhzdGQ6Om1hcDxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyPiwg
c3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhcj4gPiBncnBjX29iamVjdGl2ZV9jX2dlbmVy
YXRvcjo6e2Fub255bW91c306OkdldE1ldGhvZFZhcnMoY29uc3QgTWV0aG9kRGVzY3JpcHRvciop
4oCZOgovYnVpbGQvYnVpbGRyb290LXVwc3RyZWFtL291dHB1dC9idWlsZC9ob3N0LWdycGMtMS41
MS4xL3NyYy9jb21waWxlci9vYmplY3RpdmVfY19nZW5lcmF0b3IuY2M6MTUzOjI2OiBlcnJvcjog
4oCYQ2xhc3NOYW1l4oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZQogIDE1MyB8ICAg
cmVzWyJyZXF1ZXN0X2NsYXNzIl0gPSBDbGFzc05hbWUobWV0aG9kLT5pbnB1dF90eXBlKCkpOwog
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4KL2J1aWxkL2J1aWxkcm9v
dC11cHN0cmVhbS9vdXRwdXQvYnVpbGQvaG9zdC1ncnBjLTEuNTEuMS9zcmMvY29tcGlsZXIvb2Jq
ZWN0aXZlX2NfZ2VuZXJhdG9yLmNjOiBJbiBmdW5jdGlvbiDigJhzdGQ6OnN0cmluZyBncnBjX29i
amVjdGl2ZV9jX2dlbmVyYXRvcjo6R2V0QWxsTWVzc2FnZUNsYXNzZXMoY29uc3QgRmlsZURlc2Ny
aXB0b3IqKeKAmToKL2J1aWxkL2J1aWxkcm9vdC11cHN0cmVhbS9vdXRwdXQvYnVpbGQvaG9zdC1n
cnBjLTEuNTEuMS9zcmMvY29tcGlsZXIvb2JqZWN0aXZlX2NfZ2VuZXJhdG9yLmNjOjI3NzoyNDog
ZXJyb3I6IOKAmENsYXNzTmFtZeKAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2NvcGUKICAy
NzcgfCAgICAgICAgIGNsYXNzZXMuaW5zZXJ0KENsYXNzTmFtZShtZXRob2QtPmlucHV0X3R5cGUo
KSkpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+Cm1ha2VbM106ICoq
KiBbQ01ha2VGaWxlcy9ncnBjX3BsdWdpbl9zdXBwb3J0LmRpci9idWlsZC5tYWtlOjc2OiBDTWFr
ZUZpbGVzL2dycGNfcGx1Z2luX3N1cHBvcnQuZGlyL3NyYy9jb21waWxlci9jcHBfZ2VuZXJhdG9y
LmNjLm9dIEVycm9yIDEKbWFrZVszXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4u
Li4KbWFrZVszXTogKioqIFtDTWFrZUZpbGVzL2dycGNfcGx1Z2luX3N1cHBvcnQuZGlyL2J1aWxk
Lm1ha2U6MTMyOiBDTWFrZUZpbGVzL2dycGNfcGx1Z2luX3N1cHBvcnQuZGlyL3NyYy9jb21waWxl
ci9waHBfZ2VuZXJhdG9yLmNjLm9dIEVycm9yIDEKbWFrZVszXTogKioqIFtDTWFrZUZpbGVzL2dy
cGNfcGx1Z2luX3N1cHBvcnQuZGlyL2J1aWxkLm1ha2U6MTE4OiBDTWFrZUZpbGVzL2dycGNfcGx1
Z2luX3N1cHBvcnQuZGlyL3NyYy9jb21waWxlci9vYmplY3RpdmVfY19nZW5lcmF0b3IuY2Mub10g
RXJyb3IgMQptYWtlWzNdOiAqKiogW0NNYWtlRmlsZXMvZ3JwY19wbHVnaW5fc3VwcG9ydC5kaXIv
YnVpbGQubWFrZToxNjA6IENNYWtlRmlsZXMvZ3JwY19wbHVnaW5fc3VwcG9ydC5kaXIvc3JjL2Nv
bXBpbGVyL3J1YnlfZ2VuZXJhdG9yLmNjLm9dIEVycm9yIDEKbWFrZVszXTogKioqIFtDTWFrZUZp
bGVzL2dycGNfcGx1Z2luX3N1cHBvcnQuZGlyL2J1aWxkLm1ha2U6MTA0OiBDTWFrZUZpbGVzL2dy
cGNfcGx1Z2luX3N1cHBvcnQuZGlyL3NyYy9jb21waWxlci9ub2RlX2dlbmVyYXRvci5jYy5vXSBF
cnJvciAxCm1ha2VbM106ICoqKiBbQ01ha2VGaWxlcy9ncnBjX3BsdWdpbl9zdXBwb3J0LmRpci9i
dWlsZC5tYWtlOjE0NjogQ01ha2VGaWxlcy9ncnBjX3BsdWdpbl9zdXBwb3J0LmRpci9zcmMvY29t
cGlsZXIvcHl0aG9uX2dlbmVyYXRvci5jYy5vXSBFcnJvciAxCm1ha2VbM106ICoqKiBbQ01ha2VG
aWxlcy9ncnBjX3BsdWdpbl9zdXBwb3J0LmRpci9idWlsZC5tYWtlOjkwOiBDTWFrZUZpbGVzL2dy
cGNfcGx1Z2luX3N1cHBvcnQuZGlyL3NyYy9jb21waWxlci9jc2hhcnBfZ2VuZXJhdG9yLmNjLm9d
IEVycm9yIDEKCgpSZWdhcmRzLApNaWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
