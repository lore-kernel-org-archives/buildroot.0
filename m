Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C51C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC59F40C0D;
	Mon, 31 Jul 2023 22:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC59F40C0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKbPOk9FVtlL; Mon, 31 Jul 2023 22:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCE4540BDD;
	Mon, 31 Jul 2023 22:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE4540BDD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A8C11BF2B8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60A63610BA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60A63610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gAn21tN2VrQi for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:29:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A34F60EFC
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A34F60EFC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D4B9240003;
 Mon, 31 Jul 2023 22:29:08 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:29:07 +0200
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230801002907.01f46d94@windsurf>
In-Reply-To: <VI1P190MB0493D233ECC579510F8C0FC69FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493D233ECC579510F8C0FC69FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690842549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8V3iUEu3wEdz/bqdWYcxCaY44Ve3qkXq8ye9Q0UX00=;
 b=LNS9a8sPAsDPKqs9lizTOBRVn9rf6KRSHPY75bdbl0n199BIZRxsGPJDKqU5G3j4IHej2I
 5AYh7sZohLTo1xtfxWY8WOlQW1LsDGGQB7IijCucJuP8KsbhAfq/uFtvrx+EKu/JdHSB8Y
 CkP+rIN0kuoxRhLz8wzFIL9zb1CI/6alSoG56opOWc0cofHEM4DFVCtPV509aMzf2Uz4lJ
 U/WAwmkoHZJhVd9EUVWdbPrXrotKGzyftSOG8+4CsEh1gPcUkHMfdmqO5e7AbMx+W20a5m
 CJn7Hj5bbVM61feNrmA4FoG+fiHdEHn0EpmT2wQcEvtWES2PlP8HCIBujOCkFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LNS9a8sP
Subject: Re: [Buildroot] [PATCH] package/swupdate: fix ipc header include
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Lang Daniel <d.lang@abatec.at>, Andrey Grafin <conquistador@yandex-team.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFuaWVsLAoKKyBBbmRyZXkgR3JhZmluIGluIENjLiBBbmRyZXksIHRoZXJlIGlzIGEg
cXVlc3Rpb24gZm9yIHlvdSBiZWxvdy4KCk9uIFRodSwgMiBNYXIgMjAyMyAwOToyNjowMyArMDAw
MApMYW5nIERhbmllbCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3Jv
dGU6Cgo+IENvbXBpbGF0aW9uIGZvciBvdGhlciBwcm9ncmFtcyB0cnlpbmcgdG8gdXNlIHN3dXBk
YXRlIGhlYWRlcnMgd2lsbCBmYWlsCj4gYmVjYXVzZSB0aGUgaGVhZGVyIGlzIGxvY2F0ZWQgaW4g
JFNUQUdJTkdfRElSL3Vzci9pbmNsdWRlL3N3dXBkYXRlIGFuZAo+IG5vdCAkU1RBR0lOR19ESVIv
dXNyL2luY2x1ZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIExhbmcgPGQubGFuZ0BhYmF0
ZWMuYXQ+Cj4gLS0tCj4gIC4uLi9zd3VwZGF0ZS8wMDAxLXByb2dyZXNzX2lwYy1pbmNsdWRlLnBh
dGNoICB8IDMzICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3d1cGRhdGUvMDAwMS1wcm9n
cmVzc19pcGMtaW5jbHVkZS5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N3dXBkYXRl
LzAwMDEtcHJvZ3Jlc3NfaXBjLWluY2x1ZGUucGF0Y2ggYi9wYWNrYWdlL3N3dXBkYXRlLzAwMDEt
cHJvZ3Jlc3NfaXBjLWluY2x1ZGUucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLmNiNTU1YmM2M2IKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9z
d3VwZGF0ZS8wMDAxLXByb2dyZXNzX2lwYy1pbmNsdWRlLnBhdGNoCj4gQEAgLTAsMCArMSwzMyBA
QAo+ICtGcm9tIGQwNzNiZjIxYzEwMjFkMzEzYWUzZWRjOTJjOGU4OTk5M2UwMWZhZTQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IExhbmcgRGFuaWVsIDxkLmxhbmdAYWJhdGVjLmF0
Pgo+ICtEYXRlOiBUaHUsIDIgTWFyIDIwMjMgMDg6NDM6MzMgKzAxMDAKPiArU3ViamVjdDogW1BB
VENIXSBwcm9jZXNzOiBmaXggaW5jbHVkZQo+ICsKPiArVGhlIGhlYWRlciBtaWdodCBiZSBpbnN0
YWxsZWQgdG8gYSBzdWJkaXJlY3Rvcnkgb2YgL3Vzci9pbmNsdWRlIChsaWtlCj4gK3dpdGggYnVp
bGRyb290IHdoaWNoIHNldHMgL3Vzci9pbmNsdWRlL3N3dXBkYXRlKS4gc3d1cGRhdGVfc3RhdHVz
Lmggd2lsbAo+ICtub3QgYmUgZm91bmQgaW4gdGhpcyBjYXNlLgo+ICsKPiArCj4gK1NpZ25lZC1v
ZmYtYnk6IERhbmllbCBMYW5nIDxkLmxhbmdAYWJhdGVjLmF0Pgo+ICtbVXBzdHJlYW0gc3RhdHVz
Ogo+ICtodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qvc3d1cGRhdGUvcGF0Y2gv
VkkxUDE5ME1CMDQ5M0ExRTM0REMxMDFDRkRENURGQkI1OUZCMjlAVkkxUDE5ME1CMDQ5My5FVVJQ
MTkwLlBST0QuT1VUTE9PSy5DT00vXQoKWW91IGdvdCBzb21lIGZlZWRiYWNrIGZyb20gdXBzdHJl
YW0sIGJ1dCBuZXZlciByZXBsaWVkIHRvIGl0LgoKVGhlIG5leHQgcXVlc3Rpb24gd2FzIGluZGVl
ZCB3aHkgZG8gd2UgaW5zdGFsbCBpbiAvdXNyL2luY2x1ZGUvc3d1cGRhdGUKYW5kIG5vdCAvdXNy
L2luY2x1ZGUgYXMgcmVjb21tZW5kZWQgYnkgdXBzdHJlYW0uCgpBY2NvcmRpbmcgdG8gQnVpbGRy
b290IGNvbW1pdCBlYjJmMjg4NmIyMzY0ZTViNmEwODY3ZjU1MTA2YmY4M2FjYjA2NGU3OgoKY29t
bWl0IGViMmYyODg2YjIzNjRlNWI2YTA4NjdmNTUxMDZiZjgzYWNiMDY0ZTcKQXV0aG9yOiBBbmRy
ZXkgR3JhZmluIDxjb25xdWlzdGFkb3JAeWFuZGV4LXRlYW0ucnU+CkRhdGU6ICAgRnJpIERlYyA5
IDAwOjAzOjI4IDIwMjIgKzAzMDAKCiAgICBwYWNrYWdlL3N3dXBkYXRlOiBhZGQgc3RhZ2luZyBp
bnN0YWxsCiAgICAKICAgIFNXdXBkYXRlIHByb3ZpZGVzIEFQSSBmb3IgZXh0ZXJuYWwgcHJvZ3Jh
bXMsIHNvIHNvbWUgaGVhZGVycyBhbmQKICAgIGxpYnJhcmllcyBtdXN0IGJlIGluc3RhbGwgdG8g
c3RhZ2luZy4KICAgIAogICAgVGhpcyBwYXRjaCBpbnN0YWxscyBoZWFkZXJzIGFuZCBsaWJzIHRv
IFNUQUdJTkdfRElSLCB0byBwcmV2ZW50IGEKICAgIGhlYWRlciBuYW1lIGNvbGxpc2lvbiBhIHN1
YmRpcmVjdG9yeSAvdXNyL2luY2x1ZGUvc3d1cGRhdGUgY3JlYXRlcy4KICAgIAogICAgU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEdyYWZpbiA8Y29ucXVpc3RhZG9yQHlhbmRleC10ZWFtLnJ1PgogICAg
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4KCkJ1dCBpdCBkb2Vzbid0IHNheSB3aGljaCBvbmUgd2FzIGNhdXNpbmcgYSBjb2xsaXNp
b24uIEFuZHJleSwgZG8geW91CnJlbWVtYmVyIHdoaWNoIGhlYWRlciBmaWxlKHMpIHdlcmUgY2F1
c2luZyBhIHByb2JsZW0gaGVyZT8KCnN3dXBkYXRlIGp1c3QgaW5zdGFsbHM6Cgotcnctci0tci0t
LiAxIHRob21hcyB0aG9tYXMgMzgxMyAgMSBhb8O7dCAgMDA6MjYgbmV0d29ya19pcGMuaAotcnct
ci0tci0tLiAxIHRob21hcyB0aG9tYXMgMTU5OSAgMSBhb8O7dCAgMDA6MjYgcHJvZ3Jlc3NfaXBj
LmgKLXJ3LXItLXItLS4gMSB0aG9tYXMgdGhvbWFzICA3NDkgIDEgYW/Du3QgIDAwOjI2IHN3dXBk
YXRlX3N0YXR1cy5oCgpJJ20gbm90IHN1cmUgd2l0aCB3aGF0IGl0IGNsYXNoZXMuIFRoZSBuYW1l
cyBhcmUgaW5kZWVkIHByb2JhYmx5IG5vdAp0aGUgYmVzdCwgaXQgd291bGQgaGF2ZSBiZWVuIGdv
b2QgdG8gcHJlZml4IHRoZW0gd2l0aCBzd3VwZGF0ZV8gb3Igc3d1XwpvciBzb21ldGhpbmcuIEJ1
dCBEZWJpYW4gaW5zdGFsbHMgdGhlbSBpbiAvdXNyL2luY2x1ZGUgYW5kIGl0IGRvZXNuJ3QKY29s
bGlkZSB3aXRoIGFueXRoaW5nLgoKU28gSSB3b3VsZCBiZSBpbmNsaW5lZCB0byBkbyB3aGF0IHVw
c3RyZWFtIHN1Z2dlc3RzIGhlcmUgYW5kIGRyb3AgdGhlCklOQ0xVREVESVI9L3Vzci9pbmNsdWRl
L3N3dXBkYXRlIGZyb20gc3d1cGRhdGUubWsuCgpUaG91Z2h0cz8KClRob21hcwotLSAKVGhvbWFz
IFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
