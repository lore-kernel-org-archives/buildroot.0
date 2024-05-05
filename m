Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B42C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 20:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B33B140361;
	Sun,  5 May 2024 20:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kdYqPp3CbCT; Sun,  5 May 2024 20:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5672740542
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5672740542;
	Sun,  5 May 2024 20:14:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0F01BF38A
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 20:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 352AF80D2B
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 20:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiZiCgbxUgg6 for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 20:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.33.109;
 helo=10.mo584.mail-out.ovh.net; envelope-from=julien.boibessot@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C30080D18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C30080D18
Received: from 10.mo584.mail-out.ovh.net (10.mo584.mail-out.ovh.net
 [188.165.33.109])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C30080D18
 for <buildroot@buildroot.org>; Sun,  5 May 2024 20:14:03 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.148.126])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4VXbDn6Qrnz1CxQ
 for <buildroot@buildroot.org>; Sun,  5 May 2024 20:07:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-c6rz6 (unknown [10.110.96.7])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3422A1FD18;
 Sun,  5 May 2024 20:07:37 +0000 (UTC)
Received: from armadeus.com ([37.59.142.108])
 by ghost-submission-6684bf9d7b-c6rz6 with ESMTPSA
 id U+0JCwnnN2a6oBsAzPAUhQ
 (envelope-from <julien.boibessot@armadeus.com>);
 Sun, 05 May 2024 20:07:37 +0000
X-OVh-ClientIp: 151.80.29.22
MIME-Version: 1.0
Date: Sun, 05 May 2024 22:07:36 +0200
From: julien.boibessot@armadeus.com
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <ZjdFdee2PdlJ22gq@landeda>
References: <20240503154856.763551-1-julien.boibessot@armadeus.com>
 <ZjdFdee2PdlJ22gq@landeda>
Message-ID: <dc60d28929a40047698d678e756c2dd4@armadeus.com>
X-Sender: julien.boibessot@armadeus.com
X-Originating-IP: 91.172.110.41
X-Webmail-UserID: julien.boibessot@armadeus.com
X-Ovh-Tracer-Id: 16647837500068843973
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvddvgedgudegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhfkgihitgfgsehtkehjtddttdejnecuhfhrohhmpehjuhhlihgvnhdrsghoihgsvghsshhothesrghrmhgruggvuhhsrdgtohhmnecuggftrfgrthhtvghrnhepgeelueehveeiudejjefhtddvuefffeegfeeigedtvdejteeggeduuedtudfhffefnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppeduvdejrddtrddtrddupdeluddrudejvddruddutddrgedupdduhedurdektddrvdelrddvvddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002eaa99deb-78ac-46ef-a402-819896ce1837,
 621CCD4FFA72EB23253A47E5D7DD32B0947645F1)
 smtp.auth=julien.boibessot@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/3] configs/armadeus_apf27: add hashes for
 Linux/U-Boot
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIDIwMjQtMDUtMDUgMTA6MzgsIFlhbm4gRS4gTU9SSU4gYSDDqWNyaXTCoDoKPiBK
dWxpZW4sIEFsbCwKPiAKPiBPbiAyMDI0LTA1LTAzIDE3OjQ4ICswMjAwLCBKdWxpZW4gQk9JQkVT
U09UIHNwYWtlIHRodXNseToKPj4gQW5kIGVuYWJsZSBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tf
SEFTSEVTLiBBcyBhc2tlZCBCeSBSb21haW4uCj4gCj4gICAgICQgLi91dGlscy9kb2NrZXItcnVu
IG1ha2UgY2hlY2stcGFja2FnZQo+ICAgICBjb25maWdzL2FybWFkZXVzX2FwZjI3X2RlZmNvbmZp
ZzowOiBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCj4gd2FzIGV4cGVjdGVkIHRvIGZhaWws
IGRpZCB5b3UgZml4IHRoZSBmaWxlIGFuZCBmb3JnZXQgdG8gdXBkYXRlCj4gLmNoZWNrcGFja2Fn
ZWlnbm9yZT8KPiAgICAgY29uZmlncy9hcm1hZGV1c19hcGYyOF9kZWZjb25maWc6MDogbGliX2Rl
ZmNvbmZpZy5Gb3JjZUNoZWNrSGFzaAo+IHdhcyBleHBlY3RlZCB0byBmYWlsLCBkaWQgeW91IGZp
eCB0aGUgZmlsZSBhbmQgZm9yZ2V0IHRvIHVwZGF0ZQo+IC5jaGVja3BhY2thZ2VpZ25vcmU/Cj4g
ICAgIGNvbmZpZ3MvYXJtYWRldXNfYXBmNTFfZGVmY29uZmlnOjA6IGxpYl9kZWZjb25maWcuRm9y
Y2VDaGVja0hhc2gKPiB3YXMgZXhwZWN0ZWQgdG8gZmFpbCwgZGlkIHlvdSBmaXggdGhlIGZpbGUg
YW5kIGZvcmdldCB0byB1cGRhdGUKPiAuY2hlY2twYWNrYWdlaWdub3JlPwo+IAo+IEkndmUgZml4
ZWQgdGhhdCBpbiBlYWNoIGNvcnJlc3BvbmRpbmcgcGF0Y2guCj4gCgpUaGFua3MgZm9yIHRoZSBm
aXggISBJIGFsc28gc2F3IHRoZSBtZXNzYWdlcyB3aGVuIHJ1bm5pbmcgIm1ha2UgCmNoZWNrLXBh
Y2thZ2UiIGJ1dCBkaWRuJ3Qga25vdyBpZiBpdCB3YXMgbXkgam9iIG9yIG5vdCB0byBmaXggCi5j
aGVja3BhY2thZ2VpZ25vcmUgZmlsZS4KSXMgdGhlcmUgYW55IGRvY3VtZW50YXRpb24gb24gd2hh
dCBJIHdhcyBzdXBwb3NlZCB0byBkbyA/CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4KCj4gU2VyaWVz
IGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklO
Lgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gQk9JQkVTU09UIDxqdWxpZW4uYm9pYmVzc290
QGFybWFkZXVzLmNvbT4KPj4gLS0tCj4+ICBib2FyZC9hcm1hZGV1cy9wYXRjaGVzL2xpbnV4LWhl
YWRlcnMvbGludXgtaGVhZGVycy5oYXNoIHwgMSArCj4+ICBib2FyZC9hcm1hZGV1cy9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2ggICAgICAgICAgICAgICAgIHwgMiArKwo+PiAgYm9hcmQvYXJtYWRl
dXMvcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoICAgICAgICAgICAgICAgICB8IDIgKysKPj4gIGNv
bmZpZ3MvYXJtYWRldXNfYXBmMjdfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCA0
ICsrKysKPj4gIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9k
ZSAxMjAwMDAgCj4+IGJvYXJkL2FybWFkZXVzL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1o
ZWFkZXJzLmhhc2gKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hcm1hZGV1cy9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2gKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hcm1hZGV1cy9w
YXRjaGVzL3Vib290L3Vib290Lmhhc2gKPj4gCj4+IGRpZmYgLS1naXQgYS9ib2FyZC9hcm1hZGV1
cy9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXgtaGVhZGVycy5oYXNoIAo+PiBiL2JvYXJkL2Fy
bWFkZXVzL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gKPj4gbmV3IGZp
bGUgbW9kZSAxMjAwMDAKPj4gaW5kZXggMDAwMDAwMDAwMC4uNTgwOGQ5MmFmZQo+PiAtLS0gL2Rl
di9udWxsCj4+ICsrKyBiL2JvYXJkL2FybWFkZXVzL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51
eC1oZWFkZXJzLmhhc2gKPj4gQEAgLTAsMCArMSBAQAo+PiArLi4vbGludXgvbGludXguaGFzaAo+
PiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKPj4gZGlmZiAtLWdpdCBhL2JvYXJkL2FybWFk
ZXVzL3BhdGNoZXMvbGludXgvbGludXguaGFzaCAKPj4gYi9ib2FyZC9hcm1hZGV1cy9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2gKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAw
MDAwMC4uODA0OTIwYzEwZAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2JvYXJkL2FybWFkZXVz
L3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+PiBAQCAtMCwwICsxLDIgQEAKPj4gKyMgTG9jYWxs
eSBjYWxjdWxhdGVkCj4+ICtzaGEyNTYgIAo+PiA4NzljYTE1OWMzNGVhOWQzYTY3NzVmMjkyY2M1
OWMyZDM5MzFkNTdkY2EwMGYwYmViZTI2NzVlYTBjODJjNmE5ICAKPj4gbGludXgtNS4xMC4yMTUu
dGFyLnh6Cj4+IGRpZmYgLS1naXQgYS9ib2FyZC9hcm1hZGV1cy9wYXRjaGVzL3Vib290L3Vib290
Lmhhc2ggCj4+IGIvYm9hcmQvYXJtYWRldXMvcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjc3N2UwYWRhYjIKPj4gLS0t
IC9kZXYvbnVsbAo+PiArKysgYi9ib2FyZC9hcm1hZGV1cy9wYXRjaGVzL3Vib290L3Vib290Lmhh
c2gKPj4gQEAgLTAsMCArMSwyIEBACj4+ICsjIExvY2FsbHkgY29tcHV0ZWQKPj4gK3NoYTI1NiAg
Cj4+IDgzOWJmMjNjZmU4Y2U2MTNhNzdlNTgzYTYwMzc1MTc5ZDBhZDMyNGU5MmM4MmZiZGQwN2Jl
YmYwZmQxNDIyNjggIAo+PiB1LWJvb3QtMjAxOC4wOS50YXIuYnoyCj4+IGRpZmYgLS1naXQgYS9j
b25maWdzL2FybWFkZXVzX2FwZjI3X2RlZmNvbmZpZyAKPj4gYi9jb25maWdzL2FybWFkZXVzX2Fw
ZjI3X2RlZmNvbmZpZwo+PiBpbmRleCBhODdkMzE5NzI5Li43ODI1ODdlNDEwIDEwMDY0NAo+PiAt
LS0gYS9jb25maWdzL2FybWFkZXVzX2FwZjI3X2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL2Fy
bWFkZXVzX2FwZjI3X2RlZmNvbmZpZwo+PiBAQCAtNSw2ICs1LDEwIEBAIEJSMl9hcm05MjZ0PXkK
Pj4gICMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA1LjEwIHNlcmllcwo+PiAgQlIy
X1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzEwPXkKPj4gCj4+ICsjIEJ1aWxk
Cj4+ICtCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvYXJtYWRldXMvcGF0Y2hlcyIKPj4gK0JS
Ml9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVM9eQo+PiArCj4+ICAjIFN5c3RlbQo+PiAgQlIy
X1RBUkdFVF9HRU5FUklDX0hPU1ROQU1FPSJhcGYyNyIKPj4gIEJSMl9UQVJHRVRfR0VORVJJQ19J
U1NVRT0iV2VsY29tZSB0byBBcm1hZGV1cyBkZXZlbG9wbWVudCBwbGF0Zm9ybSAhIgo+PiAtLQo+
PiAyLjI1LjEKPj4gCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
