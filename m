Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB002C8303B
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 07:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A15614E1;
	Tue,  1 Jul 2025 07:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Uhnej_QZBga; Tue,  1 Jul 2025 07:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BDAF60ED5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BDAF60ED5;
	Tue,  1 Jul 2025 07:17:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52D76179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44DC060E4B
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XLi_Gf2m5XC for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 07:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88F4F60740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88F4F60740
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88F4F60740
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:17:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 65F7DB970068; Tue,  1 Jul 2025 09:17:19 +0200 (CEST)
Message-ID: <52ffd15a-2c33-461f-ac45-92f2b5030349@rnout.be>
Date: Tue, 1 Jul 2025 09:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20250623151447.59002-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250623151447.59002-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] utils/check-package: set the default
 ignore_filename
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8wNi8yMDI1IDE3OjE0LCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEN1cnJlbnRseSwgcGtnLXN0YXRzIGRvZXMgbm90IHVzZSB0aGUgLmNoZWNrcGFja2Fn
ZWlnbm9yZSBmaWxlIHdoZW4gaXQKPiBjaGVja3MgZm9yIHBhY2thZ2Ugd2FybmluZ3MuCj4gQXMg
YSBjb25zZXF1ZW5jZSwgaXQgcmVwb3J0cyBtYW55IHdhcm5pbmdzIHRoYXQgaW4gQnVpbGRyb290
IHdlCj4gYWxyZWFkeSBkZWNpZGVkIHRvIGlnbm9yZSBvbiBhIGNhc2UtYnktY2FzZSBiYXNpcy4g
SW4gdHVybiwgdGhpcyBsZWFkcwo+IHRvIHBvbGx1dGlvbiBvZiB0aGUgcGtnLXN0YXRzIHJlc3Vs
dHMgYW5kIGRpc3RyYWN0cyB1cyBmcm9tIHRoZSByZWFsCj4gd2FybmluZ3MuCgogIFRoYXQgaXMg
ZnVsbHkgaW50ZW50aW9uYWwgdGhvdWdoLiAuY2hlY2twYWNrYWdlaWdub3JlIGV4aXN0cyBmb3Ig
d2hlbiB3ZSAKaW50cm9kdWNlIG5ldyAicnVsZXMiIHRoYXQgY2FuIGJlIGNoZWNrZWQgYXV0b21h
dGljYWxseSwgYnV0IHdoZXJlIHRoZXJlJ3Mgc3RpbGwgCmEgbG90IG9mIGxlZ2FjeSBzdHVmZiB0
aGF0IGlzIHRvbyBtdWNoIHdvcmsgdG8gZml4IChvciB3aGVyZSBpdCdzIGFsbW9zdCAKaW1wb3Nz
aWJsZSB0byBmaXgsIGxpa2UgZmluZGluZyB0aGUgVXBzdHJlYW0gZm9yIHBhdGNoZXMpLgoKICBG
b3IgYWN0dWFsIGV4Y2x1c2lvbiBvZiBmYWxzZS1wb3NpdGl2ZXMsIHdlIGhhdmUgdGhlICJkaXNh
YmxlIiBjb21tZW50IChhIGxpbmUgCnByZWNlZGluZyB0aGUgZXJyb3IgbGluZSB0aGF0IGNvbnRh
aW5zICIjIGNoZWNrLXBhY2thZ2UgLi4uPGNoZWNrPiIpLgoKICBJZiB5b3UgZG8gdGFrZSBpbnRv
IGFjY291bnQgLmNoZWNrcGFja2FnZWlnbm9yZSwgdGhlbiB6ZXJvIHdhcm5pbmdzIHNob3VsZCBi
ZSAKcmVwb3J0ZWQgLSB3ZSAoc3VwcG9zZWRseSkgZG9uJ3QgY29tbWl0IGFueXRoaW5nIHRoYXQg
dHJpZ2dlcnMgYSBjaGVjay1wYWNrYWdlIAp3YXJuaW5nLgoKICBBIGJldHRlciBmaXggd291bGQg
YmUgdG8gY2hhbmdlIHRoZSB0aXRsZSBpbiB0aGUgSFRNTCBvdXRwdXQgdG8gImlnbm9yZWQgCndh
cm5pbmdzIi4KCgo+IFRoZXJlIGFyZSB0d28gcG9zc2liaWxpdGllczogZWl0aGVyIHdlIGhhdmUg
dG8gdGVsbCBwa2ctc3RhdHMgd2hpY2gKPiBmaWxlIHRvIHVzZSwgb3Igd2UgaGF2ZSB0byBjaGFu
Z2UgdGhlIGNoZWNrLXBhY2thZ2UgZGVmYXVsdC4KPiAKPiBVcG9uIHJlYWRpbmcgInV0aWxzL3Jl
YWRtZS50eHQiLCBpdCB0dXJucyBvdXQgaXQgaXMgYWxyZWFkeSBzdXBwb3NlZAo+IHRvIHVzZSBh
IGRlZmF1bHQgZmlsZSBhcyB0aGUgZm9sbG93aW5nIGlzIHNhaWQgYWJvdXQgY2hlY2stcGFja2Fn
ZToKPiBJdCBjaGVja3MgdGhlIC5jaGVja3BhY2thZ2VpZ25vcmUgZmlsZSBpZiBlcnJvcnMgc2hv
dWxkIGJlIGlnbm9yZWQgYW5kCj4gZXJyb3JzIGlmIHRoZXJlJ3MgYSBmaWxlIGxpc3RlZCB0aGF0
IGRvZXNuJ3QgcHJvZHVjZSBhbiBlcnJvci4KPiAKPiBUaGUgaGVscCB0ZXh0IGZvciAnLS1pZ25v
cmUtbGlzdCcgaW4gY2hlY2stcGFja2FnZSBhbHNvIGNvbmZpcm1zIGl0Ogo+ICdvdmVycmlkZSB0
aGUgZGVmYXVsdCBsaXN0IG9mIGlnbm9yZWQgd2FybmluZ3MnLiBUaGlzIGluY29oZXJlbmNlIGhh
cwo+IGJlZW4gcHJlc2VudCBzaW5jZSB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBvcHRpb24gaW4g
Y29tbWl0Cj4gZGRmNDU4NmIwMGE5N2M0MWM0YWQ0ZDUwZGE0MjgyYzYyOTQwYzA1YiAoInV0aWxz
L2NoZWNrLXBhY2thZ2U6Cj4gZGVjb3VwbGUgYWRkaW5nIHJ1bGVzIGZyb20gZml4aW5nIGFsbCBp
bnRyZWUgZmlsZXMiKQoKICBJIGFncmVlIHRoYXQgdGhpcyBpcyBpbmNvbnNpc3RlbnQgaW5kZWVk
ISBCdXQgSSB0aGluayB0aGUgZG9jdW1lbnRhdGlvbiBzaG91bGQgCmJlIGNoYW5nZWQgaW5zdGVh
ZC4gUGVvcGxlIChlLmcuIHRoZSBtYWludGFpbmVycyA6LSkgKSBoYXZlIHNjcmlwdHMgdGhhdCB1
c2UgdGhlIApjdXJyZW50IGludGVyZmFjZSB0byBtYWtlIHN1cmUgLmNoZWNrcGFja2FnZWlnbm9y
ZSBpcyBfbm90XyB1c2VkLiBBbHNvLCBpZiAKcGVvcGxlIHVzZSBjaGVjay1wYWNrYWdlIG1hbnVh
bGx5IHRvIGNoZWNrIGEgZmlsZSB0aGV5IGNoYW5nZWQsIHRoZW4gd2Ugd2FudCAKdGhlbSB0byBu
b3QgdXNlIHRoZSBjaGVja3BhY2thZ2VpZ25vcmUgZmlsZS4gV2VsbCwgVEJILCBpZGVhbGx5IHdl
IHdvdWxkIHdhbnQgdG8gCnVzZSB0aGUgLmNoZWNrcGFja2FnZWlnbm9yZSBmaWxlIG9ubHkgdG8g
cmVwb3J0IHRoYXQgYSBmaWxlIGlzIG1lbnRpb25lZCBpbiAKdGhlcmUgd2hpbGUgaXQgZG9lc24n
dCB0cmlnZ2VyIGFueSB3YXJuaW5nICh3ZSBzb21ldGltZXMgc3RpbGwgYWNjaWRlbnRhbGx5IApj
b21taXQgc29tZXRoaW5nIHRoYXQgZm9yZ2V0cyB0byB1cGRhdGUgLmNoZWNrcGFja2FnZWlnbm9y
ZSkuCgogIEFsdGVybmF0aXZlbHksIHdlIGNhbiBkZWZhdWx0IHRvIGEgd2FybmluZyB3aGVuIHNv
bWV0aGluZyBpcyBtZW50aW9uZWQgaW4gCi5jaGVja3BhY2thZ2VpZ25vcmUuIEJ1dCB0aGVuIHRo
ZXJlIHNob3VsZCBhbHNvIGJlIGFuIG9wdGlvbiB0byB0dXJuIHdhcm5pbmdzIAppbnRvIGVycm9y
cyAoYW5kIHdlIGhhdmUgdG8gY2hhbmdlIG91ciBtYWludGFpbmVyIHNjcmlwdHMgdG8gdHVybiB0
aGF0IG9wdGlvbiAKb24pLiBJJ20gbm90IHN1cmUgaWYgaW4gdGhhdCBjYXNlIHBrZy1zdGF0cyBu
ZWVkcyB0byBiZSB1cGRhdGVkIGFzIHdlbGwgdG8gbWFrZSAKc3VyZSBpdCBjb250aW51ZXMgcmVw
b3J0aW5nIHRoZSBpZ25vcmVkIHdhcm5pbmdzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiBUbyBm
aXggaXQsIHNldCB0aGUgZGVmYXVsdCBmaWxlbmFtZSBpbiBjaGVjay1wYWNrYWdlIHNvIHRoYXQg
aXQKPiBtYXRjaGVzIHRoZSBoZWxwIHRleHQuCj4gVGhlIE1ha2VmaWxlIGlzIGFsc28gdXBkYXRl
ZCBhY2NvcmRpbmdseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4gICBNYWtlZmlsZSAgICAgICAgICAgIHwgMyAr
LS0KPiAgIHV0aWxzL2NoZWNrLXBhY2thZ2UgfCAzICsrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL01ha2VmaWxl
IGIvTWFrZWZpbGUKPiBpbmRleCAyNmRiMTc2Njc0Li40YmMwZTQ2NjBkIDEwMDY0NAo+IC0tLSBh
L01ha2VmaWxlCj4gKysrIGIvTWFrZWZpbGUKPiBAQCAtMTI2MCw4ICsxMjYwLDcgQEAgcHJpbnQt
dmVyc2lvbjoKPiAgIAlAZWNobyAkKEJSMl9WRVJTSU9OX0ZVTEwpCj4gICAKPiAgIGNoZWNrLXBh
Y2thZ2U6Cj4gLQkkKFEpLi91dGlscy9jaGVjay1wYWNrYWdlIGBnaXQgbHMtdHJlZSAtciAtLW5h
bWUtb25seSBIRUFEYCBcCj4gLQkJLS1pZ25vcmUtbGlzdD0kKFRPUERJUikvLmNoZWNrcGFja2Fn
ZWlnbm9yZQo+ICsJJChRKS4vdXRpbHMvY2hlY2stcGFja2FnZSBgZ2l0IGxzLXRyZWUgLXIgLS1u
YW1lLW9ubHkgSEVBRGAKPiAgIAo+ICAgLlBIT05ZOiAuY2hlY2twYWNrYWdlaWdub3JlCj4gICAu
Y2hlY2twYWNrYWdlaWdub3JlOgo+IGRpZmYgLS1naXQgYS91dGlscy9jaGVjay1wYWNrYWdlIGIv
dXRpbHMvY2hlY2stcGFja2FnZQo+IGluZGV4IGE1ZWNjMmVlZDguLjIxNmI0NzEzMzEgMTAwNzU1
Cj4gLS0tIGEvdXRpbHMvY2hlY2stcGFja2FnZQo+ICsrKyBiL3V0aWxzL2NoZWNrLXBhY2thZ2UK
PiBAQCAtMTAxLDYgKzEwMSw5IEBAIGRlZiBwYXJzZV9hcmdzKCk6Cj4gICAKPiAgICAgICBmbGFn
cyA9IHBhcnNlci5wYXJzZV9hcmdzKCkKPiAgIAo+ICsgICAgaWYgbm90IGZsYWdzLmlnbm9yZV9m
aWxlbmFtZToKPiArICAgICAgICBmbGFncy5pZ25vcmVfZmlsZW5hbWUgPSBvcy5wYXRoLmFic3Bh
dGgob3MucGF0aC5qb2luKF9fZmlsZV9fLCAiLi4vLi4vLmNoZWNrcGFja2FnZWlnbm9yZSIpKQo+
ICsKPiAgICAgICBmbGFncy5pZ25vcmVfbGlzdCA9IGdldF9pZ25vcmVkX3BhcnNlcnNfcGVyX2Zp
bGUoZmxhZ3MuaW50cmVlX29ubHksIGZsYWdzLmlnbm9yZV9maWxlbmFtZSkKPiAgIAo+ICAgICAg
IGlmIGZsYWdzLmZhaWxlZF9vbmx5OgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
