Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7DEC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 20:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6C264092C;
	Sun, 19 Mar 2023 20:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C264092C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcu4KYkg9dEv; Sun, 19 Mar 2023 20:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9542140985;
	Sun, 19 Mar 2023 20:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9542140985
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A02E1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 031F28175F
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 031F28175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFzehj1bw14h for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 20:10:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3064281446
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3064281446
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 20:10:25 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.96.213])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dzMFpmNgO7jrRdzMFp4a2U; Sun, 19 Mar 2023 21:10:23 +0100
Message-ID: <2e06e0e2-2344-b1b2-accb-57fe5d29804d@benettiengineering.com>
Date: Sun, 19 Mar 2023 21:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Peter Seiderer <ps.report@gmx.net>
References: <20230319192915.264584-1-giulio.benetti@benettiengineering.com>
 <CA+fTLhhVYuSq+ygavwF5wg2SonW55Mg0_ZM2CyOc=jhFUVsOzw@mail.gmail.com>
 <6f57dc7b-ed61-7218-13a1-34f1456478c8@benettiengineering.com>
 <20230319210525.4188a98b@gmx.net>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230319210525.4188a98b@gmx.net>
X-CMAE-Envelope: MS4xfHPaXkZ0kLifvxmt75ARMNhGSyPxkvR7S9VU2w2BA9U+1AUi6aE/Fb13fVHrKX51MEDbkCeuiobNyrJ5bJuirbHdGuTqPgYZAyYdtQoBFgJSiAboXqfj
 LyyqeLl4E7v4zO2K6tGR8V6pabgK8QHCJiEHrKdGzPpMy45Xem+iqee5OyEyWANQQlm6CouUE03QssK61RVhatg30/kIwrY7riNdUQBVLdnbn2TWgs56NQZl
 92KWOq2FCv4SrzHNnXEIoktGerN+VESVtKcmbF4dBVlitQivIauE5uUTOt/j7vJi
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679256623; bh=CRlC8PAlciIdLHUq+GExCti9ibNvRF63cdBO+2/ecko=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=biy3U2gAz6B8MU8DxncjbMWq6oUHauFLgCeKZqGlHWeuAH9w5ooyDSMtaS1SgZDKg
 O1lj+BY8rBJag4LXp+/gEFXnlWnCzL+XZdXtqPCnP0H+myXw8bmr75sReLf69Om9+Z
 NsGhvGcrBwh8zS64bUvt6XhSQg1aDID/Im/iOgxXcmQJLMdvESjjQVVurHD1m9oMOU
 Sowzh+Vvr+BXCGTijjo6EU5L/K3XS3M+avCTngi92Tt0qqYC058sJBehU1NVKrPKjc
 qw9A4LOj/ifeXtpIITrTQPLNMrtVmWtL/wpkxKe+hsRKp7hHLNGv/V5AWmU30GRX+g
 ZmjhCQqRo7lzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=biy3U2gA
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiAxOS8wMy8yMyAyMTowNSwgUGV0ZXIgU2VpZGVyZXIgd3JvdGU6Cj4gSGVs
bG8gKiwKPiAKPiBPbiBTdW4sIDE5IE1hciAyMDIzIDIwOjU2OjE5ICswMTAwLCBHaXVsaW8gQmVu
ZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4gCj4+
IEhpIEluZHJlaywKPj4KPj4gcGxlYXNlIHVzZSBwbGFpbi10ZXh0IGUtbWFpbCBhbmQgbm90IEhU
TUwgb25lLAo+Pgo+PiBPbiAxOS8wMy8yMyAyMDo0MiwgSW5kcmVrIEtydXVzYSB3cm90ZToKPj4+
IEtvbnRha3QgR2l1bGlvIEJlbmV0dGkgKDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tCj4+PiA8bWFpbHRvOmdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+
Pikga2lyanV0YXMga3V1cMOkZXZhbCBQLAo+Pj4gMTkuIG3DpHJ0cyAyMDIzIGtlbGwgMjE6Mjk6
Cj4+Pgo+Pj4gICAgICBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0
dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbQo+Pj4gICAgICA8bWFpbHRvOmdpdWxpby5iZW5ldHRp
QGJlbmV0dGllbmdpbmVlcmluZy5jb20+Pgo+Pj4gICAgICAtLS0KPj4+ICAgICAgIMKgcGFja2Fn
ZS9tbWMtdXRpbHMvbW1jLXV0aWxzLmhhc2ggfCA0ICsrLS0KPj4+ICAgICAgIMKgcGFja2FnZS9t
bWMtdXRpbHMvbW1jLXV0aWxzLm1rIDxodHRwOi8vbW1jLXV0aWxzLm1rPsKgIMKgfCAyICstCj4+
PiAgICAgICDCoDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Pj4KPj4+ICAgICAgZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5o
YXNoCj4+PiAgICAgIGIvcGFja2FnZS9tbWMtdXRpbHMvbW1jLXV0aWxzLmhhc2gKPj4+ICAgICAg
aW5kZXggMTI1NmY2MzQ4Ny4uMjJkMzRjM2Q0MCAxMDA2NDQKPj4+ICAgICAgLS0tIGEvcGFja2Fn
ZS9tbWMtdXRpbHMvbW1jLXV0aWxzLmhhc2gKPj4+ICAgICAgKysrIGIvcGFja2FnZS9tbWMtdXRp
bHMvbW1jLXV0aWxzLmhhc2gKPj4+ICAgICAgQEAgLTEsMyArMSwzIEBACj4+PiAgICAgICDCoCMg
TG9jYWxseSBjb21wdXRlZAo+Pj4gICAgICAtc2hhMjU2Cj4+PiAgICAgIGY2ZWQxY2IyZjAyZDQ5
ZGY0MjQ0Zjg4NzJiNDdiMjI3ODBkZDYzNGZhMTlkODU3Mjk4Y2UxYjc5Mzc1Mjc3NmYKPj4+ICAg
ICAgbW1jLXV0aWxzLWRmYzNiNmVjZGE4NGQyMTQxOGZiNDQwOGIzOWM1YzcxZGI0YzY0NTgtYnIx
LnRhci5nego+Pj4gICAgICAtc2hhMjU2Cj4+PiAgICAgIGY1N2UzYzYxNjkxMTZhYTlmZjA2ZWVj
OTU3MzRjYTAwMGU0ZDAxOTY0NjdiYjIyMWU4MGU1MDUzMGM3NjgwODHCoCBtbWMuaAo+Pj4gICAg
ICArc2hhMjU2Cj4+PiAgICAgIGU1YThkYWNmMjZhMTc4MDEwMjAyYzhmYTdjYjI4YjAxZjUwZmU5
NjdkYTk4Y2RiZGYzMjBiMmYxMTA5MjAxMDYKPj4+ICAgICAgbW1jLXV0aWxzLWQ0YzI5MTA5ODFm
Zjk5Yjk4MzczNDQyNmRmYTk5NjMyZmI4MWFjNmItYnIxLnRhci5nego+Pj4gICAgICArc2hhMjU2
Cj4+PiAgICAgIGYwYjUzYjlkNThlZTI0ZThiZDliYjY5YmY0YjMxZjhkMWQwMzFjZjRmNWQ1MDc4
ODQyMTk4YmJjNmE3NzljYTXCoCBtbWMuaAo+Pj4gICAgICBkaWZmIC0tZ2l0IGEvcGFja2FnZS9t
bWMtdXRpbHMvbW1jLXV0aWxzLm1rIDxodHRwOi8vbW1jLXV0aWxzLm1rPgo+Pj4gICAgICBiL3Bh
Y2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5tayA8aHR0cDovL21tYy11dGlscy5taz4KPj4+ICAg
ICAgaW5kZXggNDM1ZTZhZTdmMS4uYmMwZmM3YWFmMiAxMDA2NDQKPj4+ICAgICAgLS0tIGEvcGFj
a2FnZS9tbWMtdXRpbHMvbW1jLXV0aWxzLm1rIDxodHRwOi8vbW1jLXV0aWxzLm1rPgo+Pj4gICAg
ICArKysgYi9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMubWsgPGh0dHA6Ly9tbWMtdXRpbHMu
bWs+Cj4+PiAgICAgIEBAIC00LDcgKzQsNyBAQAo+Pj4gICAgICAgwqAjCj4+PiAgICAgICDCoCMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+Pgo+Pj4gICAgICAtTU1DX1VUSUxTX1ZFUlNJT04gPSBk
ZmMzYjZlY2RhODRkMjE0MThmYjQ0MDhiMzljNWM3MWRiNGM2NDU4Cj4+PiAgICAgICtNTUNfVVRJ
TFNfVkVSU0lPTiA9IGQ0YzI5MTA5ODFmZjk5Yjk4MzczNDQyNmRmYTk5NjMyZmI4MWFjNmIKPj4+
ICAgICAgIMKgTU1DX1VUSUxTX1NJVEUgPQo+Pj4gICAgICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jamIvbW1jLXV0aWxzLmdpdAo+Pj4gICAgICA8aHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2piL21tYy11dGls
cy5naXQ+Cj4+Pgo+Pj4KPj4+IEkgaGFwcGVuZWQgdG8gY2xpY2sgb24gdGhhdCBnaXQua2VybmVs
Lm9yZwo+Pj4gPGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2NqYi9tbWMtdXRpbHMuZ2l0PsKgbGluawo+Pj4gYW5kIGl0IGRvZXNuJ3TCoHdvcmsuIEJ1dCB0
aGVuIHdoZXJlIGRvZXMgdGhpcyB2ZXJzaW9uIGNvbWUgZnJvbT8KPj4KPj4gdGhhdCBpcyB0aGUg
Z2l0IHJlcG9zaXRvcnkgYWRkcmVzcywgaXQncyBub3QgdGhlIHNhbWUgYWRkcmVzcyBvZiB0aGUK
Pj4gZ2l0LXdlYiBmcm9udGVuZC4gSWYgZG9lc24ndCBzaG93IHVwIG9uIHRoZSBicm93c2VyIGl0
IGRvZXNuJ3QgbWVhbiBnaXQKPj4gZG9lc24ndCB3b3JrLiBUcnkgdG86Cj4+ICQgZ2l0IGNsb25l
Cj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NqYi9t
bWMtdXRpbHMuZ2l0Cj4+Cj4+IGFuZCB5b3Ugd2lsbCBzZWUgdGhhdCBpdCB3aWxsIGNsb25lIHRo
ZSByZXBvc2l0b3J5Lgo+IAo+IEEgYmV0dGVyIG9uZSAoYm90aCB3ZWIgYW5kIGdpdCkgd291bGQg
YmU6Cj4gCj4gCWh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9tbWMvbW1jLXV0
aWxzLmdpdAoKdGhhbmsgeW91LCBJIHNlbmQgYSBWMiB1c2luZyB0aGF0IFVSTCB0aGVuLgoKQmVz
dCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPiBS
ZWdhcmRzLAo+IFBldGVyCj4gCj4+Cj4+IEJlc3QgcmVnYXJkcwo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
