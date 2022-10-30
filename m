Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E647C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5E24402BA;
	Sun, 30 Oct 2022 21:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5E24402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5x4elzvU1cXE; Sun, 30 Oct 2022 21:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9130740179;
	Sun, 30 Oct 2022 21:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9130740179
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 310C91BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C4C260803
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C4C260803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54LVvDqS8YkB for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:21:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 186AD60017
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 186AD60017
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:21:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ACB90B0054C;
 Sun, 30 Oct 2022 22:21:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 22:21:14 +0100
Date: Sun, 30 Oct 2022 22:21:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221030212114.GH1058960@scaer>
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
 <20221014065900.3311604-4-angelo@amarulasolutions.com>
 <20221030214809.1fa5997c@windsurf>
 <CA+_SqVZvmi+iVGF=ig6ct4fbygRaL63KwJ-AQzCL1piTixgQVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+_SqVZvmi+iVGF=ig6ct4fbygRaL63KwJ-AQzCL1piTixgQVQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667164878;
 bh=202IZIzUc3XTVdJpEJM/WrO/3eH/GC88afMHRwpslGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9ea0Zi2Jr/iP/UlwhfsePm1cEbCSQKX/RV1jpFDSqHhKC7kxj7FUcQ5srgCU39tv
 cmPqxSeHD2KPNlGc6to81JQyTdrqOLbICLoZ1lGgb8H+lumKT2a9M+ippo4WsNXjet
 zOqYbd0jpcFH8OAJ29CZCtnTsHR0gxHBVgTieJ3he92lflbae4tmFOzU08Nm0yLFgR
 +cOpqN+8EHWNUNzSbSseRRMAetbZqPwvII1rZIayAebd9va0yyYNLaY8Ds05rpZco8
 rXVkQnuRwvtVvoDjDfhY+5J4+5ts3yhB7dwOuUsoPe/+2piqGIZ2yl+YTmXFEGAlCT
 3Bo4Ve5OnSGng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I9ea0Zi2
Subject: Re: [Buildroot] [PATCH v2 3/5] ackage/rtl8723ds-bt: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW5nZWxvLCBBbGwsCgpPbiAyMDIyLTEwLTMwIDIxOjU1ICswMTAwLCBBbmdlbG8gQ29tcGFnbnVj
Y2kgc3Bha2UgdGh1c2x5Ogo+IE9uIFN1biwgT2N0IDMwLCAyMDIyIGF0IDk6NDggUE0gVGhvbWFz
IFBldGF6em9uaSA8IFsxXXRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+ICAg
T24gRnJpLCAxNCBPY3QgMjAyMiAwODo1ODo1OCArMDIwMAo+ICAgQW5nZWxvIENvbXBhZ251Y2Np
IDwgWzJdYW5nZWxvQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiAgID4gQEAgLTc4LDcg
Kzc4LDggQEAgTElOVVhfREVQRU5ERU5DSUVTICs9IFwKPiAgID7CoCDCoCDCoCDCoCQoaWYgJChC
UjJfUEFDS0FHRV9JTlRFTF9NSUNST0NPREUpLGludGVsLW1pY3JvY29kZSkgXAo+ICAgPsKgIMKg
IMKgIMKgJChpZiAkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFKSxsaW51eC1maXJtd2FyZSkg
XAo+ICAgPsKgIMKgIMKgIMKgJChpZiAkKEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0lNWCksZmlybXdh
cmUtaW14KSBcCj4gICA+IC3CoCDCoCDCoCQoaWYgJChCUjJfUEFDS0FHRV9XSVJFTEVTU19SRUdE
Qiksd2lyZWxlc3MtcmVnZGIpCj4gICA+ICvCoCDCoCDCoCQoaWYgJChCUjJfUEFDS0FHRV9XSVJF
TEVTU19SRUdEQiksd2lyZWxlc3MtcmVnZGIpIFwKPiAgID4gK8KgIMKgIMKgJChpZiAkKEJSMl9Q
QUNLQUdFX1JUTDg3MjNEU19CVCkscnRsODcyM2RzLWJ0KQo+ICAgPsKgCj4gICA+wqAgIyBTdGFy
dGluZyB3aXRoIDQuMTYsIHRoZSBnZW5lcmF0ZWQga2NvbmZpZyBwYXNlciBjb2RlIGlzIG5vIGxv
bmdlcgo+ICAgPsKgICMgc2hpcHBlZCB3aXRoIHRoZSBrZXJuZWwgc291cmNlcywgc28gd2UgbmVl
ZCBmbGV4IGFuZCBiaXNvbiwgYnV0Cj4gICA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5p
biBiL3BhY2thZ2UvQ29uZmlnLmluCj4gICA+IGluZGV4IGUzYTM0ZDZlOTcuLjRmNmU1MDgxMDYg
MTAwNjQ0Cj4gICA+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gICA+ICsrKyBiL3BhY2thZ2Uv
Q29uZmlnLmluCj4gICA+IEBAIC01NzgsNiArNTc4LDcgQEAgZW5kbWVudQo+ICAgPsKgIMKgIMKg
IMKgc291cmNlICJwYWNrYWdlL3J0bDgxODlmcy9Db25maWcuaW4iCj4gICA+wqAgwqAgwqAgwqBz
b3VyY2UgInBhY2thZ2UvcnRsODcyM2J1L0NvbmZpZy5pbiIKPiAgID7CoCDCoCDCoCDCoHNvdXJj
ZSAicGFja2FnZS9ydGw4NzIzZHMvQ29uZmlnLmluIgo+ICAgPiArwqAgwqAgwqBzb3VyY2UgInBh
Y2thZ2UvcnRsODcyM2RzLWJ0L0NvbmZpZy5pbiIKPiAgID7CoCDCoCDCoCDCoHNvdXJjZSAicGFj
a2FnZS9ydGw4ODEyYXUtYWlyY3JhY2stbmcvQ29uZmlnLmluIgo+ICAgPsKgIMKgIMKgIMKgc291
cmNlICJwYWNrYWdlL3J0bDg4MjFhdS9Db25maWcuaW4iCj4gICA+wqAgwqAgwqAgwqBzb3VyY2Ug
InBhY2thZ2Uvc2FuZS1iYWNrZW5kcy9Db25maWcuaW4iCj4gICA+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3J0bDg3MjNkcy1idC9Db25maWcuaW4gYi9wYWNrYWdlL3J0bDg3MjNkcy1idC9Db25maWcu
aW4KPiAgID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAgID4gaW5kZXggMDAwMDAwMDAwMC4uYWI0
YmEwYmYxMQo+ICAgPiAtLS0gL2Rldi9udWxsCj4gICA+ICsrKyBiL3BhY2thZ2UvcnRsODcyM2Rz
LWJ0L0NvbmZpZy5pbgo+ICAgPiBAQCAtMCwwICsxLDYgQEAKPiAgID4gK2NvbmZpZyBCUjJfUEFD
S0FHRV9SVEw4NzIzRFNfQlQKPiAgID4gK8KgIMKgIMKgYm9vbCAicnRsODcyM2RzLWJ0Igo+ICAg
PiArwqAgwqAgwqBoZWxwCj4gICA+ICvCoCDCoCDCoCDCoHJ0bDg3MjNkcyBVQVJUIGF0dGFjaGVk
IEJsdWV0b290aCBkcml2ZXIKPiAKPiAgIFNvIGhlcmUgeW91J3JlIHNheWluZyB0aGlzIHBhY2th
Z2UgaXMgZm9yIGEgZHJpdmVyLgo+IAo+ICAgPiArZGVmaW5lIFJUTDg3MjNEU19CVF9MSU5VWF9D
T05GSUdfRklYVVBTCj4gICA+ICvCoCDCoCDCoCQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09O
RklHX1NFUklBTF9ERVZfQlVTKQo+ICAgPiArwqAgwqAgwqAkKGNhbGwgS0NPTkZJR19FTkFCTEVf
T1BULENPTkZJR19TRVJJQUxfREVWX0NUUkxfVFRZUE9SVCkKPiAgID4gK8KgIMKgIMKgJChjYWxs
IEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQlQpCj4gICA+ICvCoCDCoCDCoCQoY2FsbCBLQ09O
RklHX0VOQUJMRV9PUFQsQ09ORklHX0JUX0hDSVVBUlQpCj4gICA+ICvCoCDCoCDCoCQoY2FsbCBL
Q09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0JUX0hDSVVBUlRfM1dJUkUpCj4gICA+ICvCoCDCoCDC
oCQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0JUX0hDSVVBUlRfUlRMKQo+ICAgPiAr
wqAgwqAgwqAkKGNhbGwgS0NPTkZJR19BUFBFTkRfT1BULENPTkZJR19FWFRSQV9GSVJNV0FSRSxy
dGxfYnQvcnRsODcyM2RzX2Z3LmJpbiBydGxfYnQvcnRsODcyM2RzX2NvbmZpZy5iaW4pCj4gICA+
ICtlbmRlZgo+ICAgPiArCj4gICA+ICtkZWZpbmUgUlRMODcyM0RTX0JUX0lOU1RBTExfU1RBR0lO
R19DTURTCj4gICA+ICvCoCDCoCDCoG1rZGlyIC1wICQoU1RBR0lOR19ESVIpL2xpYi9maXJtd2Fy
ZS9ydGxfYnQvCj4gICA+ICvCoCDCoCDCoGNwICQoQEQpLzg3MjNEL3J0bDg3MjNkX2Z3ICQoU1RB
R0lOR19ESVIpL2xpYi9maXJtd2FyZS9ydGxfYnQvcnRsODcyM2RzX2Z3LmJpbgo+ICAgPiArwqAg
wqAgwqBjcCAkKEBEKS84NzIzRC9ydGw4NzIzZF9jb25maWcgJChTVEFHSU5HX0RJUikvbGliL2Zp
cm13YXJlL3J0bF9idC9ydGw4NzIzZHNfY29uZmlnLmJpbgo+IAo+ICAgQnV0IGhlcmUgeW91IGFy
ZSBvbmx5IGluc3RhbGxpbmcgdGhlIGZpcm13YXJlIGZpbGUsIGFuZCB5b3UncmUgbm90Cj4gICBi
dWlsZGluZyB0aGUga2VybmVsIG1vZHVsZSB0aGF0IGlzIHByb3ZpZGVkIGluIHRoaXMgR2l0IHJl
cG9zaXRvcnkuCj4gCj4gICBJcyBpdCBiZWNhdXNlIHRoZSBkcml2ZXIgaXMgaW4gdGhlIHVwc3Ry
ZWFtIGtlcm5lbCwgYW5kIHRoZSBvbmx5IHBhcnQKPiAgIHRoYXQgaXQgbGFja3MgaXMgdGhlIGZp
cm13YXJlPwo+IAo+ICAgVGhpcyBpcyBub3QgcmVhbGx5IGNsZWFyIGluIHlvdXIgY29tbWl0IGxv
ZyBub3IgaW4gdGhlIENvbmZpZy5pbiBoZWxwCj4gICB0ZXh0Lgo+IAo+IFRoaSBwYWNrYWdlICJl
bmFibGVzIiAoYXMgaW4gdGhlIGNvbW1pdCBsb2cpIHRoZSBtb2R1bGUsIEkgZGlkbid0IHdhbnQg
dG8gd29yZCBkaWZmZXJlbnRseSwgYmVjYXVzZSB3aGF0IHdlIGFyZSByZWFsbHkgZG9pbmcgaGVy
ZSBpcwo+IHNpbXBseSBlbmFibGluZyBzb21lIGtlcm5lbCBkcml2ZXJzIGFuZCBvZmZlcmluZyBh
IHdheSB0byBkb3dubG9hZCB0aGUgZmlybXdhcmUuIEFueXdheSwgSSB3aWxsIHJld29yZCBpdCBi
ZXR0ZXIuCgpMb29rIGF0IHRoZSBvdGhlciBmaXJtd2FyZSBwYWNrYWdlcyB3ZSBoYXZlOiB0aGV5
IG9ubHkgaW5zdGFsbCB0aGUKZmlybXdhcmUgYmxvYnMgdGhleSBwcm92aWRlLgoKRW5hYmxpbmcg
a2VybmVsIG9wdGlvbnMgdG8gZW5hYmxlIGEga2VybmVsIGRyaXZlciBpcyB3aGF0IHRoZSB1c2Vy
IGRvZXMKd2hlbiB0aGV5IHByb3ZpZGUgdGhlIGNvbmZpZ3VyYXRpb24gZmlsZSBmb3IgdGhlIGtl
cm5lbC4gV2UgZG8gbm90IHdhbnQKdG8gaGF2ZSBhbiBvcHRpb24gaW4gQnVpbGRyb290IGZvciBl
YWNoIGRyaXZlciB0aGF0IGNhbiBiZSBlbmFibGVkIGluCnRoZSBrZXJuZWwuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENB
TVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
