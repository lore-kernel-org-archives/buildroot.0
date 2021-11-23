Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7E3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 21:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAED460A7E;
	Tue, 23 Nov 2021 21:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1EIjdiViszbh; Tue, 23 Nov 2021 21:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08C4960A79;
	Tue, 23 Nov 2021 21:01:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8361BF3A8
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 21:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B0BD818A2
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 21:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9eT0Oipsjz0 for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 21:01:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9939A818B5
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 21:01:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (13)
Received: from zm (pub-198.183.29.194.multiplay.pl [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id 3103F13C8D8;
 Tue, 23 Nov 2021 22:01:05 +0100 (CET)
References: <20211123160833.29036-1-b.bilas@grinn-global.com>
 <87ee76mwjn.fsf@grinn-global.com>
 <453b1ace-86a2-224e-0f21-a95bd06be7b9@grinn-global.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 23 Nov 2021 21:59:31 +0100
In-reply-to: <453b1ace-86a2-224e-0f21-a95bd06be7b9@grinn-global.com>
Message-ID: <87a6humvsf.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/chiliboard: bump to u-boot 2020.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkJhcnRvc3ogQmlsYXMgPGIuYmlsYXNAZ3Jpbm4tZ2xvYmFsLmNvbT4gd3JpdGVzOgoKPiBIaSwK
Pgo+IE9uIDIzLjExLjIwMjEgMjE6NDIsIE1hcmNpbiBOaWVzdHLDs2ogd3JvdGU6Cj4+IEJhcnRv
c3ogQmlsYXMgPGIuYmlsYXNAZ3Jpbm4tZ2xvYmFsLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gRml4ZXM6
Cj4+PiAgIC91c3IvYmluL2xkOiBzY3JpcHRzL2R0Yy9kdGMtcGFyc2VyLnRhYi5vOiguYnNzKzB4
MTApOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGB5eWxsb2MnOwo+Pj4gCXNjcmlwdHMvZHRjL2R0
Yy1sZXhlci5sZXgubzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUKPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0b3N6IEJpbGFzIDxiLmJpbGFzQGdyaW5uLWdsb2JhbC5jb20+Cj4+PiAt
LS0KPj4+ICAgMjAyMC4xMCB2ZXJzaW9uIGlzIHRoZSBsYXRlc3Qgb25lIHRoYXQgYm9vdHMgY29y
cmVjdGx5LAo+Pj4gICB0aGUgbmV3ZXIgb25lcyBhcmUgYmVpbmcgc3R1Y2sgZHVyaW5nIGNsb2Nr
cyBpbml0aWFsaXphdGlvbi4KPj4+Cj4+IFRoZXJlIGlzIGFscmVhZHkgYSBmaXggcHVsbGVkIGlu
dG8gbWFzdGVyIGJyYW5jaCBvZiB1LWJvb3QsIHNvIHVwY29taW5nCj4+IHUtYm9vdCByZWxlYXNl
IHNob3VsZCBiZSB3b3JraW5nIGZpbmUuCj4KPiBJIGhhdmVuJ3Qgbm90aWNlZCB0aGF0LCBtYXli
ZSB0aGUgYmV0dGVyIGlkZWEgd291bGQgYmUgdG8gdXNlIHRoZSBsYXRlc3QKPiB2MjAyMS4xMCBy
ZWxlYXNlICsgYXBwbHkgdGhhdCBwYXRjaCBpbnN0ZWFkIG9mIHVzaW5nIHRoZSAyMDIwLjEwIHZl
cnNpb24/Cj4KCkkgYW0gb2theSB3aXRoIHVzaW5nIDIwMjAuMTAgZm9yIG5vdywgYXMgaXQgaXMg
cHJvdmVuIHRvIHdvcmsuCgo+Cj4gQmVzdAo+IEJhcnRlawo+Pgo+Pj4gICBjb25maWdzL2dyaW5u
X2NoaWxpYm9hcmRfZGVmY29uZmlnIHwgMiArLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9ncmlu
bl9jaGlsaWJvYXJkX2RlZmNvbmZpZyBiL2NvbmZpZ3MvZ3Jpbm5fY2hpbGlib2FyZF9kZWZjb25m
aWcKPj4+IGluZGV4IGU3MmE4MmNlZTguLjgwZjMwNzdiNzYgMTAwNjQ0Cj4+PiAtLS0gYS9jb25m
aWdzL2dyaW5uX2NoaWxpYm9hcmRfZGVmY29uZmlnCj4+PiArKysgYi9jb25maWdzL2dyaW5uX2No
aWxpYm9hcmRfZGVmY29uZmlnCj4+PiBAQCAtMTYsNyArMTYsNyBAQCBCUjJfVEFSR0VUX1JPT1RG
U19FWFQyXzQ9eQo+Pj4gICBCUjJfVEFSR0VUX1VCT09UPXkKPj4+ICAgQlIyX1RBUkdFVF9VQk9P
VF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4+PiAgIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZF
UlNJT049eQo+Pj4gLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjAu
MDEiCj4+PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMC4xMCIK
Pj4+ICAgQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImNoaWxpYm9hcmQiCj4+PiAg
IEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0lNRz15Cj4+PiAgIEJSMl9UQVJHRVRfVUJPT1RfRk9S
TUFUX0NVU1RPTT15Cj4+IFJldmlld2VkLWJ5OiBNYXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pA
Z3Jpbm4tZ2xvYmFsLmNvbT4KPj4KPj4gLS0KPj4gTWFyY2luIE5pZXN0csOzago+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgoKLS0KTWFyY2luIE5pZXN0csOzagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
