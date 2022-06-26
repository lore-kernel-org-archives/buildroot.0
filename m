Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB2DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 10:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC5C40BA3;
	Sun, 26 Jun 2022 10:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC5C40BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pwhs_3GjPnvc; Sun, 26 Jun 2022 10:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBAEE40B9D;
	Sun, 26 Jun 2022 10:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBAEE40B9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5CD11BF25B
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 10:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC8640B9D
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 10:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDC8640B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7VL-WYtXMp9 for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 10:43:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 531D540B97
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 531D540B97
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 10:43:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 9AA6FB00533;
 Sun, 26 Jun 2022 12:43:36 +0200 (CEST)
Received: from 37-167-88-30.coucou-networks.fr ([37.167.88.30])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 26 Jun 2022 12:43:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
In-Reply-To: <20220625141223.26460-1-vincent.stehle@laposte.net>
References: <20220625141223.26460-1-vincent.stehle@laposte.net>
Message-ID: <a69e3cfd616ea2a5c06d0914534d03a1@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656240216;
 bh=90EIuQFc6aYLSzXIbVCYw8p/hnm91T15NrWD+bAQXtc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J7reWoGok5E/J6G4z2U1HoHSqkQLtkNls6M13Fp7BndFQl9E/WZrX3fngKK/BPwVT
 FE6qA7dDQZrcjb6f+0l4YdWC0QLt1Y/b2g61/VmmriOrblccZlyLNXIJvVAMfI3m9w
 gKmzBK4L3oarZTR9UynB/VLPVFWaT7uHx54+88K9tRUToXFqDAppOVNKcGzJRzkuuH
 ubDJWJJ+Okq6niD5e3Uv11NloQ6r+9w6+kyfuGNnHfs2bm97qznp7/lSBeysIGEUEF
 5Bg3bEtgQ0abvvaoI98RK3MNxgsLhNW4ve3lWyLh0J43NWvqVdIZ6EuPGhWtT8cjl7
 U/+C6CIe6yHwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J7reWoGo
Subject: Re: [Buildroot] [PATCH v2] package/zerofree: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwgQWxsLAoKSSBzdWNjZXNzZnVsbHkgdGVzdGVkIHlvdXIgcGFja2FnZS4KCkZv
ciBpbmZvLCBJIHRlc3RlZCBvbiBtYXN0ZXIgYXQgYTBiZjg3Nywgd2l0aCBjb21tYW5kczoKCiAg
ICAgbWFrZSBjaGVjay1wYWNrYWdlCiAgICAgLi4uCiAgICAgMCB3YXJuaW5ncyBnZW5lcmF0ZWQK
CiAgICAgLi91dGlscy90ZXN0LXBrZyAtYSAtcCB6ZXJvZnJlZQogICAgIC4uLgogICAgIDQ0IGJ1
aWxkcywgMyBza2lwcGVkLCAwIGJ1aWxkIGZhaWxlZCwgMCBsZWdhbC1pbmZvIGZhaWxlZCwgMCAK
c2hvdy1pbmZvIGZhaWxlZAoKQW5kIGFsc28gdGVzdGVkIHRoZSBwYWNrYWdlIGluIHFlbXVfYWFy
Y2g2NF92aXJ0X2RlZmNvbmZpZy4KCk9uIDI1LzA2LzIwMjIgMTY6MTIsIFZpbmNlbnQgU3RlaGzD
qSB2aWEgYnVpbGRyb290IHdyb3RlOgo+IHplcm9mcmVlIGlzIGEgdXRpbGl0eSB3aGljaCBzY2Fu
cyB0aGUgZnJlZSBibG9ja3MgaW4gYW4gZXh0MiBmaWxlc3lzdGVtIAo+IGFuZAo+IGZpbGxzIGFu
eSBub24temVybyBibG9ja3Mgd2l0aCB6ZXJvZXMuCj4gCj4gaHR0cHM6Ly9mcmlwcGVyeS5vcmcv
dW1sLwo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVA
bGFwb3N0ZS5uZXQ+CgpUZXN0ZWQtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cgo+
IENjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IC0t
LQo+IAo+IAo+IEhpLAo+IAo+IFRoaXMgaXMgYSBmb2xsb3ctdXAgdG8gbXkgZmlyc3QgYXR0ZW1w
dFsxXSBhdCBwYWNrYWdpbmcgemVyb2ZyZWUuCj4gVGhlIGdvb2QgbmV3cyBpcyB0aGF0IGl0IG5v
dyBidWlsZHMgd2l0aCBhbGwgbGliYyBmbGF2b3VycywgaW5jbHVkaW5nIAo+IG11c2wuCj4gRG8g
bm90IGhlc2l0YXRlIHRvIHNlbmQgYW55IGZlZWRiYWNrLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBW
aW5jZW50Lgo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBVc2UgYSB3b3JrYXJvdW5kIHRvIGFsbG93
IGJ1aWxkaW5nIHdpdGggbXVzbC4KPiAKPiBbMV06IAo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjItTWFyY2gvNjM5Nzk0Lmh0bWwKPiAKPiAKPiAg
REVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL0NvbmZpZy5p
biAgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2UvemVyb2ZyZWUvQ29uZmlnLmluICAgICB8
IDEzICsrKysrKysrKysrKysKPiAgcGFja2FnZS96ZXJvZnJlZS96ZXJvZnJlZS5oYXNoIHwgIDMg
KysrCj4gIHBhY2thZ2UvemVyb2ZyZWUvemVyb2ZyZWUubWsgICB8IDI3ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvemVyb2ZyZWUvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3plcm9mcmVlL3plcm9mcmVlLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvemVyb2ZyZWUvemVyb2ZyZWUubWsKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxP
UEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCBmYzMyOWZlYzI3Li5lNzRlMDJiODIxIDEwMDY0NAo+
IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTI5MTgsNiArMjkxOCw3
IEBAIEY6CWNvbmZpZ3MvdWV2bTU0MzJfZGVmY29uZmlnCj4gIEY6CXBhY2thZ2UvaTd6Lwo+ICBG
OglwYWNrYWdlL21zci10b29scy8KPiAgRjoJcGFja2FnZS9waXh6Lwo+ICtGOglwYWNrYWdlL3pl
cm9mcmVlLwo+IAo+ICBOOglWaW5pY2l1cyBUaW50aSA8dmluaWNpdXN0aW50aUBnbWFpbC5jb20+
Cj4gIEY6CXBhY2thZ2UvcHl0aG9uLXRocmlmdC8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25m
aWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IGYwOWRhMDViZTAuLjVhYjAzMDE2ZTgg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5p
bgo+IEBAIC0yMzcsNiArMjM3LDcgQEAgbWVudSAiRmlsZXN5c3RlbSBhbmQgZmxhc2ggdXRpbGl0
aWVzIgo+ICAJc291cmNlICJwYWNrYWdlL3VkZnRvb2xzL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAi
cGFja2FnZS91bmlvbmZzL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS94ZnNwcm9ncy9D
b25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvemVyb2ZyZWUvQ29uZmlnLmluIgo+ICAJc291
cmNlICJwYWNrYWdlL3pmcy9Db25maWcuaW4iCj4gIGVuZG1lbnUKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS96ZXJvZnJlZS9Db25maWcuaW4gYi9wYWNrYWdlL3plcm9mcmVlL0NvbmZpZy5pbgo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMmNlMjkwMWEyNwo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3plcm9mcmVlL0NvbmZpZy5pbgo+IEBAIC0wLDAg
KzEsMTMgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1pFUk9GUkVFCj4gKwlib29sICJ6ZXJvZnJl
ZSIKPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBlMmZzcHJvZ3MKPiArCWRlcGVuZHMgb24g
IUJSMl9TVEFUSUNfTElCUwo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0UyRlNQUk9HUwo+ICsJaGVs
cAo+ICsJICB6ZXJvZnJlZSBpcyBhIHV0aWxpdHkgd2hpY2ggc2NhbnMgdGhlIGZyZWUgYmxvY2tz
IGluIGFuIGV4dDIKPiArCSAgZmlsZXN5c3RlbSBhbmQgZmlsbHMgYW55IG5vbi16ZXJvIGJsb2Nr
cyB3aXRoIHplcm9lcy4KPiArCj4gKwkgIGh0dHBzOi8vZnJpcHBlcnkub3JnL3VtbC8KPiArCj4g
K2NvbW1lbnQgInplcm9mcmVlIG5lZWRzIE1NVSBhbmQgZHluYW1pYyBsaWJyYXJ5Igo+ICsJZGVw
ZW5kcyBvbiAhQlIyX1VTRV9NTVUgfHwgQlIyX1NUQVRJQ19MSUJTCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvemVyb2ZyZWUvemVyb2ZyZWUuaGFzaCAKPiBiL3BhY2thZ2UvemVyb2ZyZWUvemVyb2Zy
ZWUuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMzM5OTYx
MTc4Nwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3plcm9mcmVlL3plcm9mcmVlLmhh
c2gKPiBAQCAtMCwwICsxLDMgQEAKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2Cj4g
OTU2YmM4NjFiNTViYTBhMmI3NTkzYzU4ZDMyMzM5ZGFiMWEwZTdkYTZlYTJiODEzZDI3YzgwZjA4
YjcyMzg2Nwo+IHplcm9mcmVlLTEuMS4xLnRnego+ICtzaGEyNTYKPiA5MGRhYWUwMDQ3NWE5OTJh
MzY3ZGE1YjA2NTg0NjlhNWQxYzQ0NDlkYmJlOTY0YzViNzI0NmUxYWVjOTJmNDkxCj4gQ09QWUlO
Rwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3plcm9mcmVlL3plcm9mcmVlLm1rIAo+IGIvcGFja2Fn
ZS96ZXJvZnJlZS96ZXJvZnJlZS5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uY2E1YTAxOWRlNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3plcm9m
cmVlL3plcm9mcmVlLm1rCj4gQEAgLTAsMCArMSwyNyBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICsjCj4gKyMgemVyb2ZyZWUKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ICsKPiArWkVST0ZSRUVfVkVSU0lPTiA9IDEuMS4xCj4gK1pFUk9GUkVFX1NPVVJDRSA9IHplcm9m
cmVlLSQoWkVST0ZSRUVfVkVSU0lPTikudGd6Cj4gK1pFUk9GUkVFX1NJVEUgPSBodHRwczovL2Zy
aXBwZXJ5Lm9yZy91bWwKPiArWkVST0ZSRUVfTElDRU5TRSA9IEdQTC0yLjAKPiArWkVST0ZSRUVf
TElDRU5TRV9GSUxFID0gQ09QWUlORwo+ICtaRVJPRlJFRV9ERVBFTkRFTkNJRVMgPSBlMmZzcHJv
Z3MKPiArCj4gKyMgV2UgdXNlIHRoZSBzYW1lIHdvcmthcm91bmQgYXMgaW4gaHR0cHM6Ly9idWdz
LmdlbnRvby5vcmcvNzE2MTM2Cj4gKyMgdG8gYnVpbGQgd2l0aCBtdXNsLgo+ICtaRVJPRlJFRV9D
RkxBR1MgPSAkKFRBUkdFVF9DRkxBR1MpIFwKPiArCSQoaWYgJChCUjJfVE9PTENIQUlOX1VTRVNf
TVVTTCksLURIQVZFX1NZU19UWVBFU19IKSAjIGRldl90Cj4gKwo+ICtkZWZpbmUgWkVST0ZSRUVf
QlVJTERfQ01EUwo+ICsJJChNQUtFKSBDQz0iJChUQVJHRVRfQ0MpIiBDRkxBR1M9IiQoWkVST0ZS
RUVfQ0ZMQUdTKSIgLUMgJChARCkgYWxsCj4gK2VuZGVmCj4gKwo+ICtkZWZpbmUgWkVST0ZSRUVf
SU5TVEFMTF9UQVJHRVRfQ01EUwo+ICsJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQpL3plcm9m
cmVlICQoVEFSR0VUX0RJUikvdXNyL2Jpbgo+ICtlbmRlZgo+ICsKPiArJChldmFsICQoZ2VuZXJp
Yy1wYWNrYWdlKSkKPiAtLQo+IDIuMzUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgpUaGFua3MhCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
