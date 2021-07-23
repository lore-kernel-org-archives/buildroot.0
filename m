Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3120C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 14:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1181F60EB5
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 14:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1181F60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA11560A62;
	Fri, 23 Jul 2021 14:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28gMdUCKgD_m; Fri, 23 Jul 2021 14:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 089B060A5C;
	Fri, 23 Jul 2021 14:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB5FA1BF46A
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 14:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E806083A4B
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 14:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YaEj2mbAUnrr for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 14:42:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 763BE83A41
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 14:42:52 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 32488440DBB;
 Fri, 23 Jul 2021 17:42:35 +0300 (IDT)
References: <20210723124754.46568-1-jose.pekkarinen@unikie.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>
In-reply-to: <20210723124754.46568-1-jose.pekkarinen@unikie.com>
Date: Fri, 23 Jul 2021 17:42:44 +0300
Message-ID: <874kclytuj.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Fix restorecond startup for sysvinit builds
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgSm9zw6ksCgpPbiBGcmksIEp1bCAyMyAyMDIxLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+
IEN1cnJlbnRseSByZXN0b3JlY29uZCBpbml0IHNjcmlwdCBzb3VyY2VzIHRoZQo+IGZpbGUgL2V0
Yy9yYy5kL2luaXQuZC9mdW5jdGlvbnMsIHRoYXQgaW4gc29tZQo+IGluaXQgc3lzdGVtcywgbGlr
ZSBzeXN2aW5pdCwgbWF5IG5vdCBiZSBhdmFpbGFibGUsCj4gaG93ZXZlciwgaXQgZG9lc24ndCBh
Y3R1YWxseSB1c2VzIGFueSBmdW5jdGlvbgo+IGZyb20gaXQuCj4KPiBBbHNvLCB0aGUgaW5pdCBz
Y3JpcHQgdXNlcyBkYWVtb24sIHRoYXQgaXMgbm90Cj4gbWFya2VkIGFzIGEgZGVwZW5kZW5jeS4g
U28gdGhpcyBwYXRjaGVzIGFkZHMgaXRzCj4gZGVwZW5kZW5jeSB0byBndWFyYW50ZWUgaXQncyBw
cmVzZW50IGluIHRoZSBidWlsZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4g
PGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3Jlc3RvcmVjb25k
L0NvbmZpZy5pbiAgICAgIHwgIDIgKwo+ICBwYWNrYWdlL3Jlc3RvcmVjb25kL1MyMHJlc3RvcmVj
b25kIHwgODYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvcmVzdG9y
ZWNvbmQvcmVzdG9yZWNvbmQubWsgfCAgNCArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDkwIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Jl
c3RvcmVjb25kL1MyMHJlc3RvcmVjb25kCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yZXN0b3Jl
Y29uZC9Db25maWcuaW4gYi9wYWNrYWdlL3Jlc3RvcmVjb25kL0NvbmZpZy5pbgo+IGluZGV4IDMx
Zjg1ZjI4ODIuLmMyZTc3M2VhY2UgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9yZXN0b3JlY29uZC9D
b25maWcuaW4KPiArKysgYi9wYWNrYWdlL3Jlc3RvcmVjb25kL0NvbmZpZy5pbgo+IEBAIC00LDEx
ICs0LDEzIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9SRVNUT1JFQ09ORAo+ICAJZGVwZW5kcyBvbiBC
UjJfVVNFX1dDSEFSICMgbGliZ2xpYjIKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNf
VEhSRUFEUyAjIGxpYmdsaWIyCj4gIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBsaWJz
ZWxpbnV4Cj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0RBRU1PTiAjIGRhZW1vbgoKTm8gbmVl
ZCB0byBkZXBlbmQgb24gcGFja2FnZSB5b3Ugc2VsZWN0LgoKPiAgCXNlbGVjdCBCUjJfUEFDS0FH
RV9EQlVTCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfREJVU19HTElCCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfTElCR0xJQjIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJTRUxJTlVYCj4gIAlzZWxl
Y3QgQlIyX1BBQ0tBR0VfTElCU0VQT0wKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9EQUVNT04KClNp
bmNlIEJSMl9QQUNLQUdFX1JFU1RPUkVDT05EIGRlcGVuZHMgb24gTU1VIGFuZCBUSFJFQURTIGFs
cmVhZHksIHRoZXJlCmlzIG5vIG5lZWQgdG8gYWRkIGRlcGVuZGVuY2llcy4gQnV0IGl0IHdvdWxk
IGJlIG5pY2UgdG8gYWRkICJkYWVtb24iCmluIHRoZSBjb21tZW50IG5leHQgdG8gdGhlc2UgZGVw
ZW5kZW5jaWVzIGFib3ZlLgoKPiAgCWhlbHAKPiAgCSAgcmVzdG9yZWNvbmQgaXMgYSBkYWVtb24g
dGhhdCB3YXRjaGVzIGZvciBmaWxlIGNyZWF0aW9uIGFuZAo+ICAJICB0aGVuIHNldHMgdGhlIGRl
ZmF1bHQgU0VMaW51eCBmaWxlIGNvbnRleHQgZm9yIHRoYXQgZmlsZS4KClsuLi5dCgo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3Jlc3RvcmVjb25kL3Jlc3RvcmVjb25kLm1rIGIvcGFja2FnZS9yZXN0
b3JlY29uZC9yZXN0b3JlY29uZC5tawo+IGluZGV4IDdhYjdlOTc4ZGQuLjE1NDY2NjFiYWYgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9yZXN0b3JlY29uZC9yZXN0b3JlY29uZC5tawo+ICsrKyBiL3Bh
Y2thZ2UvcmVzdG9yZWNvbmQvcmVzdG9yZWNvbmQubWsKPiBAQCAtOSw3ICs5LDcgQEAgUkVTVE9S
RUNPTkRfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9TRUxpbnV4UHJvamVjdC9zZWxpbnV4L3Jl
bGVhc2VzL2Rvd25sb2FkLzIKPiAgUkVTVE9SRUNPTkRfTElDRU5TRSA9IEdQTC0yLjAKPiAgUkVT
VE9SRUNPTkRfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAgCj4gLVJFU1RPUkVDT05EX0RFUEVO
REVOQ0lFUyA9IGxpYmdsaWIyIGxpYnNlcG9sIGxpYnNlbGludXggZGJ1cy1nbGliCj4gK1JFU1RP
UkVDT05EX0RFUEVOREVOQ0lFUyA9IGxpYmdsaWIyIGxpYnNlcG9sIGxpYnNlbGludXggZGJ1cy1n
bGliIGRhZW1vbgoKVGhpcyBpcyBhIHJ1bi10aW1lIGRlcGVuZGVuY3ksIHJpZ2h0PyBJZiBzbyB0
aGVyZSBpcyBubyBuZWVkIGZvciBkYWVtb24KdG8gYnVpbGQgYmVmb3JlIHJlc3RvcmVjb25kLiBC
dXQgYWRkIGEgInJ1bnRpbWUiIGNvbW1lbnQgbmV4dCB0bwpzZWxlY3QgQlIyX1BBQ0tBR0VfREFF
TU9OLgoKYmFydWNoCgo+ICAKPiAgIyBVbmRlZmluaW5nIF9GSUxFX09GRlNFVF9CSVRTIGhlcmUg
YmVjYXVzZSBvZiBhICJidWciIHdpdGggZ2xpYmMgZnRzLmgKPiAgIyBsYXJnZSBmaWxlIHN1cHBv
cnQuCj4gQEAgLTI3LDcgKzI3LDcgQEAgZGVmaW5lIFJFU1RPUkVDT05EX0JVSUxEX0NNRFMKPiAg
ZW5kZWYKPiAgCj4gIGRlZmluZSBSRVNUT1JFQ09ORF9JTlNUQUxMX0lOSVRfU1lTVgo+IC0JJChJ
TlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3Jlc3RvcmVjb25kLmluaXQgXAo+ICsJJChJTlNUQUxM
KSAtbSAwNzU1IC1EIHBhY2thZ2UvcmVzdG9yZWNvbmQvUzIwcmVzdG9yZWNvbmQgXAo+ICAJCSQo
VEFSR0VUX0RJUikvZXRjL2luaXQuZC9TMjByZXN0b3JlY29uZAo+ICBlbmRlZgoKCi0tIAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAg
VGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQogICAtIGJhcnVjaEB0a29zLmNvLmls
IC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
