Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891D1C001DF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 17:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC7F410C0;
	Sun, 23 Jul 2023 17:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DC7F410C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqfGQAbbYHaq; Sun, 23 Jul 2023 17:33:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9F0D410C1;
	Sun, 23 Jul 2023 17:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F0D410C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6980E1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 505CA60AEE
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 505CA60AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqMd2tzdWpaZ for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 17:33:37 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39B0F60A8D
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 17:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B0F60A8D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:22c7:ca40:1a2e:1362])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5CFFE5FFAB;
 Sun, 23 Jul 2023 19:33:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 19:33:30 +0200
Date: Sun, 23 Jul 2023 19:33:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
Message-ID: <20230723173330.GN2503916@scaer>
References: <20230721130959.899919-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721130959.899919-1-vincent.stehle@arm.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690133614;
 bh=9ZeI10T9VTGM/3lnzzbrDfhGwZAVsc+pfnXp6vpv31c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uu10QS4cKtEwJEDeSQ2wC9Vsgvmj+EsnhlhBpQYiFfAG3v+cvpdPAFuQDNrBip60X
 bUXx2hrYOzyh82lW+OWZ1MJaXbiQlgHl9firB3/9q+7I5z7w8dEP/rTInQ+SckGpPe
 hTP/of0XJi9+yLOJeuMw1N5T+AeeSQ1f7v/o3VlWE4t8tWrCJMhA8n6p++fgBIhXMQ
 AtSgjo+aCPm7fEzN3xd1S+DK9+++KPk4xFcF7bmZnZBHZ7pU7g0MpzV3VmeQ5pmIBg
 jCSfLdFYW++QcOIj4BIf53IObnBoHDh0V4MUDWGn+vm0LdA1sxpCSnYt3YnmKCaMT3
 eGI7+lerAbkSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uu10QS4c
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: add patch to
 fix fiptool link
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VmluY2VudCwgQWxsLAoKT24gMjAyMy0wNy0yMSAxNTowOSArMDIwMCwgVmluY2VudCBTdGVobMOp
IHNwYWtlIHRodXNseToKPiBXaGVuIGJ1aWxkaW5nIGEgZmlwIGZpcm13YXJlIChCUjJfVEFSR0VU
X0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0ZJUD15KSwgdGhlCj4gVEYtQSBidWlsZCByZWNpcGUgc3Rh
cnRzIGJ5IGJ1aWxkaW5nIHRoZSBob3N0IHByb2dyYW0gZmlwdG9vbCB3aXRoIHRoZQo+IHByb3Bl
ciBidWlsZCBlbnZpcm9ubWVudCB2YXJpYWJsZXMuIFRoZW4gdGhlIG1haW4gVEYtQSB0YXJnZXQg
ZmlybXdhcmUKPiBidWlsZCBzdGVwIHRha2VzIHBsYWNlLCB3aXRoIHRoZSBleHBlY3RhdGlvbiB0
aGF0IHRoZSBmaXB0b29sIHByb2dyYW0gd2lsbAo+IGJlIHVzZWQgdW5kZXIgdGhlIGhvb2QgaWYg
bmVjZXNzYXJ5Lgo+IAo+IEluIFRGLUEsIHRoZSBidWlsZCByZWNpcGUgZm9yIHRoZSBob3N0IHBy
b2dyYW0gZmlwdG9vbCBoYXMgc3VidGx5IGNoYW5nZWQKPiBhZnRlciB2Mi43LCBpbiBjb21taXQg
Y2YyZGQxN2RkZGEyICgicmVmYWN0b3Ioc2VjdXJpdHkpOiBhZGQgT3BlblNTTCAxLngKPiBjb21w
YXRpYmlsaXR5IikuIFRoaXMgY2hhbmdlIGhhcyB0aGUgZWZmZWN0IHRvIGZvcmNlIHJlLWxpbmtp
bmcgZmlwdG9vbAo+IGVhY2ggdGltZS4KPiAKPiBJZiB3ZSB0cnkgdG8gYnVpbGQgd2l0aCBCdWls
ZHJvb3QgYSBmaXAgZmlybXdhcmUgd2l0aCBhIFRGLUEgdmVyc2lvbiBhZnRlcgo+IHYyLjcgY29t
cHJpc2luZyB0aGUgYWZvcmVtZW50aW9uZWQgY2hhbmdlLCB0aGUgZmlwdG9vbCBwcm9ncmFtIGlz
IGZvcmNpYmx5Cj4gcmUtbGlua2VkIGR1cmluZyB0aGUgbWFpbiBmaXJtd2FyZSBidWlsZCBzdGVw
LiBUaGlzIGhhcHBlbnMgd2l0aG91dCB0aGUKPiBwcm9wZXIgYnVpbGQgZW52aXJvbm1lbnQgdmFy
aWFibGVzIGFuZCBjb25zZXF1ZW50bHksIGlmIG9wZW5zc2wgaXMgbm90Cj4gaW5zdGFsbGVkIG9u
IHRoZSBob3N0LCB0aGUgbGliY3J5cHRvIHNoYXJlZCBsaWJyYXJ5IHdpbGwgbm90IGJlIGZvdW5k
IGJ5Cj4gdGhlIGxpbmtlciBhbmQgdGhlIGxpbmsgd2lsbCBmYWlsIHdpdGggdGhlIGZvbGxvd2lu
ZyBlcnJvcjoKPiAKPiAgIC91c3IvYmluL2xkOiBjYW5ub3QgZmluZCAtbGNyeXB0bzogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQo+IAo+IEEgcGF0Y2ggaGFzIGJlZW4gaW50ZWdyYXRlZCBpbnRv
IFRGLUEgdG8gYXZvaWQgcmUtbGlua2luZyBmaXB0b29sIHdoZW4gbm90Cj4gbmVjZXNzYXJ5LCB3
aGljaCBzaG91bGQgc29sdmUgdGhlIHByb2JsZW0gc3RhcnRpbmcgd2l0aCB2ZXJzaW9uIHYyLjEw
LiBBZGQKPiB0aGF0IHBhdGNoIGluIEJ1aWxkcm9vdCBmb3IgdmVyc2lvbnMgdjIuOCBhbmQgdjIu
OSwgdG8gcmVwYWlyIHRoZSBidWlsZCBpbgo+IHRoZSBjYXNlcyBkZXNjcmliZWQgYWJvdmUuCj4g
Cj4gRml4ZXM6Cj4gCj4gICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9qb2JzLzQ2NjQ4NDU3NjcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kg
PHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5p
bz4KPiBDYzogU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+Cj4gLS0tClst
LVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS92Mi44LzAw
MDEtYnVpbGQtdG9vbHMtYXZvaWQtdW5uZWNlc3NhcnktbGluay5wYXRjaCBiL2Jvb3QvYXJtLXRy
dXN0ZWQtZmlybXdhcmUvdjIuOC8wMDAxLWJ1aWxkLXRvb2xzLWF2b2lkLXVubmVjZXNzYXJ5LWxp
bmsucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjllMGVh
NzQyNDgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS92
Mi44LzAwMDEtYnVpbGQtdG9vbHMtYXZvaWQtdW5uZWNlc3NhcnktbGluay5wYXRjaAoKU28gbm93
IHRoZXJlIGFyZSB0d28gZmlsZXMgd2l0aCB0aGUgc2FtZSBudW1iZXJlZCBwcmVmaXgsIHdoaWNo
IGRlZmVhdHMKdGhlIHZlcnkgcHVycG9zZSBvZiBoYXZpbmcgbnVtYmVyZWQgcHJlZml4ZXMuIFNv
IEkgcmVudW1iZXJlZCB0aGlzIG5ldwpwYXRjaCBhcyAwMDAyLgoKWy0tU05JUC0tXQo+IGRpZmYg
LS1naXQgYS9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL3YyLjkvMDAwMS1idWlsZC10b29scy1h
dm9pZC11bm5lY2Vzc2FyeS1saW5rLnBhdGNoIGIvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS92
Mi45LzAwMDEtYnVpbGQtdG9vbHMtYXZvaWQtdW5uZWNlc3NhcnktbGluay5wYXRjaAo+IG5ldyBm
aWxlIG1vZGUgMTIwMDAwCj4gaW5kZXggMDAwMDAwMDAwMC4uZTQxNGI0NmUwZgo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL3YyLjkvMDAwMS1idWlsZC10
b29scy1hdm9pZC11bm5lY2Vzc2FyeS1saW5rLnBhdGNoCj4gQEAgLTAsMCArMSBAQAo+ICsuLi92
Mi44LzAwMDEtYnVpbGQtdG9vbHMtYXZvaWQtdW5uZWNlc3NhcnktbGluay5wYXRjaAo+IFwgTm8g
bmV3bGluZSBhdCBlbmQgb2YgZmlsZQoKSSBjYW4gdW5kZXJzdGFuZCB0aGUgcmF0aW9uYWxlIGZv
ciBoYXZpbmcgYSBzeW1saW5rLCBidXQgaW4gcHJhY3RpY2UgaXQKZmFpbHM6IGlmIHdlIGV2ZXIg
cmVtb3ZlL3VwZGF0ZS9yZW51bWJlciB0aGUgcGF0Y2ggZm9yIHYyLjgsIHRoZW4gdGhlCnN5bWxp
bmsgaW4gdjIuOSBpcyBkYW5nbGluZy4gV2hpY2ggaGFwcGVuZWQgd2hlbiBJIHJlbnVtYmVyZWQg
dGhlIHBhdGNoCmluIHYyLjguCgpJbnN0ZWFkLCBJIGp1c3QgZHVwbGljYXRlZCB0aGUgcGF0Y2gg
aW4gdjIuOQoKQXBwbGllZCB0byBtYXN0ZXIgd2l0aCB0aGVzZSBjaGFuZ2VzLCB0aGFua3MuCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
