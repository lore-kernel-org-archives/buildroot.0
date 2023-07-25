Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6290C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5370D41902;
	Tue, 25 Jul 2023 21:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5370D41902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAbdC5doop5s; Tue, 25 Jul 2023 21:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6756841916;
	Tue, 25 Jul 2023 21:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6756841916
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87AF01BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E6B0820A2
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E6B0820A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RK3PZ2fphY2E for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:10:51 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CDE18209B
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 21:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CDE18209B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D119A780304;
 Tue, 25 Jul 2023 23:10:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:10:47 +0200
Date: Tue, 25 Jul 2023 23:10:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230725211047.GU3544423@scaer>
References: <20230725103114.941495-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725103114.941495-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690319449;
 bh=MiC1l22qvngdA0OG8lOOGMYt0eBkBsyMnjefe/Ujixo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oSrtP3u03tbGPi1S/Q4xlisc+lbNrAO448tmsGQylt2O8UHxMu5fyvCvPpxU2XTd8
 U62wN9sw/2L++WiKmS/bCS+GhCJQCXCePwtPsNNv6nJhm5tEMORRand3NaL9iwr662
 YPsJoI1jxM4/dW7bxtDHF5OiZvMiE/dQDnL74xFJ37cIwRCKDBaTsjQ+qC/53z3PfR
 e7vMozfcWEN4W6VSFIA/IqsYNUimoIP+ANknacatyG4DevYSXi3N11amhNoFO4i83s
 rA7+U7jozuVN1RxKw7kp72XManSAl8HXDWYuoDD45cMi3Y3Gipc6FyGod1tscFc4tf
 G3OzKPC7TaCDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oSrtP3u0
Subject: Re: [Buildroot] [PATCH] package/libatomic_ops: bump to version 7.8.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA3LTI1IDEyOjMxICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2xpYmF0b21pY19vcHMvbGliYXRvbWlj
X29wcy5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvbGliYXRvbWljX29wcy9saWJhdG9taWNfb3Bz
Lm1rICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliYXRvbWljX29wcy9saWJhdG9t
aWNfb3BzLmhhc2ggYi9wYWNrYWdlL2xpYmF0b21pY19vcHMvbGliYXRvbWljX29wcy5oYXNoCj4g
aW5kZXggMzJhMDc5NWE1Li5jNmRlOTNmYjQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJhdG9t
aWNfb3BzL2xpYmF0b21pY19vcHMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGliYXRvbWljX29wcy9s
aWJhdG9taWNfb3BzLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0
ZWQKPiAtc2hhMjU2ICBiNGIwMDcyYmRiNjc4MGUyMzMxZGI0ZmFkYmE3ZTQyM2ZkZTI1YzcxYjFm
MGViMDQ4NTljYzFlYmE1OWMyYzJjICBsaWJhdG9taWNfb3BzLTcuNi4xNC50YXIuZ3oKPiAtc2hh
MjU2ICA2MzZjMmJmMDc5NzU3NjVhYjlhZmYxN2Y3YzliNmJlYjk1NDAzNzhmNDViNWExYjIxNjkx
ZDE0ZWE4MDRmMGZmICBkb2MvTElDRU5TSU5HLnR4dAo+ICtzaGEyNTYgIDY4YzU5NzBiMTEyOTcw
NTZjOGU1YzYzYTczZjI2NjIxYThlYjhjNjY3YTVmZTlhMmIzZTNmZjZjMGZiYjMxNzcgIGxpYmF0
b21pY19vcHMtNy44LjAudGFyLmd6Cj4gK3NoYTI1NiAgOTY5Mjk0YzkzMjRiMmQzNjBhZTJhMDhl
ZGQ1Y2E2ZjljZDc1NGNiNzFiNzFlNTZiZWUxNWQyZjEwYmIxMDQ5NiAgTElDRU5TRQo+ICBzaGEy
NTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAx
MDUyMWI4ODA2NDMgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJhdG9taWNfb3Bz
L2xpYmF0b21pY19vcHMubWsgYi9wYWNrYWdlL2xpYmF0b21pY19vcHMvbGliYXRvbWljX29wcy5t
awo+IGluZGV4IDFiMzRkM2I3OC4uMGM3MmIxNzI1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGli
YXRvbWljX29wcy9saWJhdG9taWNfb3BzLm1rCj4gKysrIGIvcGFja2FnZS9saWJhdG9taWNfb3Bz
L2xpYmF0b21pY19vcHMubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICAKPiAtTElCQVRPTUlDX09QU19WRVJTSU9OID0gNy42LjE0Cj4gK0xJQkFU
T01JQ19PUFNfVkVSU0lPTiA9IDcuOC4wCj4gIExJQkFUT01JQ19PUFNfU0lURSA9ICQoY2FsbCBn
aXRodWIsaXZtYWksbGliYXRvbWljX29wcyx2JChMSUJBVE9NSUNfT1BTX1ZFUlNJT04pKQo+ICBM
SUJBVE9NSUNfT1BTX0FVVE9SRUNPTkYgPSBZRVMKPiAgCj4gQEAgLTE1LDcgKzE1LDcgQEAgTElC
QVRPTUlDX09QU19BVVRPUkVDT05GID0gWUVTCj4gICMgYnkgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlLiBUaGVzZSBhcmUgcHV0IGludG8gYSBzZXBhcmF0ZQo+ICAjIGxpYnJhcnksIGxp
YmF0b21pY19vcHNfZ3BsLmEuIgo+ICBMSUJBVE9NSUNfT1BTX0xJQ0VOU0UgPSBNSVQgKG1haW4g
bGlicmFyeSkgLyBHUEwtMi4wKyAoZ3BsIGV4dGVuc2lvbikKPiAtTElCQVRPTUlDX09QU19MSUNF
TlNFX0ZJTEVTID0gZG9jL0xJQ0VOU0lORy50eHQgQ09QWUlORwo+ICtMSUJBVE9NSUNfT1BTX0xJ
Q0VOU0VfRklMRVMgPSBDT1BZSU5HIExJQ0VOU0UKPiAgTElCQVRPTUlDX09QU19DUEVfSURfVkVO
RE9SID0gbGliYXRvbWljX29wc19wcm9qZWN0Cj4gIAo+ICBMSUJBVE9NSUNfT1BTX0lOU1RBTExf
U1RBR0lORyA9IFlFUwo+IC0tIAo+IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
