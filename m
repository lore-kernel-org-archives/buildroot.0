Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34CEC433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 13:26:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E9061A57
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 13:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11E9061A57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7CF44159B;
	Fri,  1 Oct 2021 13:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2urN_LvJGHS; Fri,  1 Oct 2021 13:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7DAB41573;
	Fri,  1 Oct 2021 13:26:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76C0B1BF8B4
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 13:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66579607AE
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 13:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9oOgbd6-3zyH for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 13:26:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13626606A8
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 13:26:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 09B9740014;
 Fri,  1 Oct 2021 13:26:10 +0000 (UTC)
Date: Fri, 1 Oct 2021 15:26:10 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211001152610.1ff12e0c@windsurf>
In-Reply-To: <20211001125302.386178-1-herve.codina@bootlin.com>
References: <20211001125302.386178-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lua-augeas: new package
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

SGVsbG8gSGVydsOpLAoKT24gRnJpLCAgMSBPY3QgMjAyMSAxNDo1MzowMSArMDIwMApIZXJ2ZSBD
b2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4gd3JvdGU6Cgo+IFRoZSBsdWEtYXVnZWFz
IHBhY2thZ2UgcHJvdmlkZXMgYSBMdWEgYmluZGluZyBmb3IgYXVnZWFzCj4gCj4gaHR0cHM6Ly9n
aXRodWIuY29tL25jb3BhL2x1YS1hdWdlYXMKPiAKPiBCYXNlZCBvbiBpbml0aWFsIHdvcmsgZnJv
bSBOaWNvbGFzIENhcnJpZXIgPG5pY29sYXMuY2FycmllckBvcm9saWEuY29tPgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgoKVGhhbmtz
IQoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWEtYXVnZWFzL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
bHVhLWF1Z2Vhcy9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLmVkMDdkYTU0MjYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9sdWEtYXVn
ZWFzL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTAgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xV
QV9BVUdFQVMKPiArCWJvb2wgImx1YS1hdWdlYXMiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0FVR0VBUwoKSSB0aGluayBhICJzZWxlY3QiIGhlcmUgd291bGQgYmUgYmV0dGVyLiBJIGxvb2tl
ZCBhdCBzZXZlcmFsIG90aGVyCnBhY2thZ2UvbHVhLSovQ29uZmlnLmluLCBhbmQgbW9zdCBvZiB0
aGUgdGltZSB3ZSBzZWxlY3QgdGhlIGxpYnJhcmllcwp0aGF0IHRoZXkgbmVlZC4KCk9mIGNvdXJz
ZSwgaXQgbWVhbnMgeW91IHdvdWxkIGhhdmUgdG8gcmVwbGljYXRlIHRoZSAiZGVwZW5kcyBvbiIg
b2YKcGFja2FnZS9hdWdlYXMvQ29uZmlnLmluLCBidXQgdGhhdCdzIG5vdCBhIGJpZyBkZWFsLgoK
PiArCWhlbHAKPiArCSAgTHVhIGJpbmRpbmcgZm9yIGF1Z2VhcyBsaWJyYXJ5Cj4gKwo+ICsJICBo
dHRwczovL2dpdGh1Yi5jb20vbmNvcGEvbHVhLWF1Z2Vhcwo+ICsKPiArY29tbWVudCAibHVhLWF1
Z2VhcyBuZWVkcyBhdWdlYXMiCj4gKwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9BVUdFQVMKPiBc
IE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKCkFkZCBhIG5ldyBsaW5lIGF0IHRoZSBlbmQgb2Yg
dGhlIGZpbGUsIGFuZCBvYnZpb3VzbHkgdXBkYXRlIHRoaXMKY29tbWVudC4KCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbHVhLWF1Z2Vhcy9sdWEtYXVnZWFzLmhhc2ggYi9wYWNrYWdlL2x1YS1hdWdl
YXMvbHVhLWF1Z2Vhcy5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi44NDk3YzQ4ZGM2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbHVhLWF1Z2Vh
cy9sdWEtYXVnZWFzLmhhc2gKPiBAQCAtMCwwICsxLDMgQEAKPiArIyBMb2NhbGx5IGNvbXB1dGVk
Ogo+ICtzaGEyNTYgNjk0ZmU4ODdlZWJhYzI3YjU1OGM5Njk1MDQyNDA1ZjcwYTg2MzgyZTkyOTE2
MDk0ZTdiYTVmNDExNjczZmJjMSAgbHVhLWF1Z2Vhcy1hNmVhY2U1MTE2ZDFhNzExMjE4YTdjOTA4
NmE0ZTNjNGRiODhlZTU3LnRhci5nego+ICtzaGEyNTYgMWY1YzVlZTVkYTk4MTMzMmI3ZjczY2M1
YTU5YWY2NjBiMDMxMDQyNzllMmFhMjFiNmI4Njg5MDQzMGMzZWZmMCAgQ09QWVJJR0hUCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbHVhLWF1Z2Vhcy9sdWEtYXVnZWFzLm1rIGIvcGFja2FnZS9sdWEt
YXVnZWFzL2x1YS1hdWdlYXMubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLmUxY2VjZDczNTEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9sdWEtYXVn
ZWFzL2x1YS1hdWdlYXMubWsKPiBAQCAtMCwwICsxLDMwIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gKyMKPiArIyBsdWEtYXVnZWFzCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiArCj4gK0xVQV9BVUdFQVNfVkVSU0lPTiA9IGE2ZWFjZTUxMTZkMWE3MTEyMThhN2M5MDg2
YTRlM2M0ZGI4OGVlNTcKPiArTFVBX0FVR0VBU19MSUNFTlNFID0gTUlUCj4gK0xVQV9BVUdFQVNf
TElDRU5TRV9GSUxFUyA9IENPUFlSSUdIVAo+ICtMVUFfQVVHRUFTX1NJVEUgPSAkKGNhbGwgZ2l0
aHViLG5jb3BhLGx1YS1hdWdlYXMsJChMVUFfQVVHRUFTX1ZFUlNJT04pKQoKUGxlYXNlIHB1dCB0
aGUgU0lURSB2YXJpYWJsZSBiZWxvdyB0aGUgVkVSU0lPTi4gVGhlcmUncyBubyBzdHJpY3QgcnVs
ZSwKYnV0IHdlIHRlbmQgdG8gYWx3YXlzIGhhdmUgVkVSU0lPTi9TSVRFL1NPVVJDRSBmaXJzdCBh
bmQgZ3JvdXBlZAp0b2dldGhlciwgYW5kIExJQ0VOU0UvTElDRU5TRV9GSUxFUyBhZnRlcndhcmRz
LgoKPiArTFVBX0FVR0VBU19ERVBFTkRFTkNJRVMgPSBsdWFpbnRlcnByZXRlciBhdWdlYXMgaG9z
dC1wa2djb25mCj4gKwo+ICtMVUFfQVVHRUFTX0NPTkZfT1BUUz0gXAo+ICsJUEtHQ09ORklHPSIk
KFBLR19DT05GSUdfSE9TVF9CSU5BUlkpIiBcCj4gKwlMREZMQUdTPSIkKExERkxBR1MpIiBcCgok
KExERkxBR1MpIGRvZXNuJ3QgZXhpc3QgaW4gQnVpbGRyb290LiBBbmQgTERGTEFHUyBpcyBhbHJl
YWR5IHBhc3NlZCBhcwpwYXJ0IG9mICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKS4KCj4gKwlMVUFf
VkVSU0lPTj0iJChMVUFJTlRFUlBSRVRFUl9BQklWRVIpIiBcCj4gKwlJTlNUQUxMX0NNT0Q9Ii91
c3IvbGliL2x1YS8kKExVQUlOVEVSUFJFVEVSX0FCSVZFUikiIFwKPiArCUxVQV9DRkxBR1M9IiIK
CkxVQV9DRkxBR1MgaXMgbmVlZGVkID8KCj4gK2RlZmluZSBMVUFfQVVHRUFTX0JVSUxEX0NNRFMK
PiArCSQoVEFSR0VUX01BS0VfRU5WKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChNQUtFMSkg
LUMgJChARCkgXAoKaXMgJChNQUtFMSkgbmVlZGVkPyBUaGlzIHByb2plY3QgaGFzIGEgc2luZ2xl
IEMgc291cmNlIGZpbGUsIGl0IHdvdWxkCmJlIGNoYWxsZW5naW5nIHRvIGhhdmUgcGFyYWxsZWwg
YnVpbGQgaXNzdWVzLCBubz8KCj4gKwkJJChMVUFfQVVHRUFTX0NPTkZfT1BUUykgYWxsCj4gK2Vu
ZGVmCj4gKwo+ICtkZWZpbmUgTFVBX0FVR0VBU19JTlNUQUxMX1RBUkdFVF9DTURTCj4gKwkkKFRB
UkdFVF9NQUtFX0VOVikgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoTUFLRTEpIC1DICQoQEQp
IFwKClNhbWUgcXVlc3Rpb24gaGVyZS4KCj4gKwkJJChMVUFfQVVHRUFTX0NPTkZfT1BUUykgREVT
VERJUj0iJChUQVJHRVRfRElSKSIgaW5zdGFsbAo+ICtlbmRlZgo+ICsKPiArJChldmFsICQoZ2Vu
ZXJpYy1wYWNrYWdlKSkKClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
