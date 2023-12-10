Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F246C10DCE
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 13:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D4D96059C;
	Sun, 10 Dec 2023 13:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D4D96059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxhzpuExVFaV; Sun, 10 Dec 2023 13:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A1B060AB2;
	Sun, 10 Dec 2023 13:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1B060AB2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB92E1BF2E4
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 13:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B479A60AB2
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 13:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B479A60AB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSYKqshM62VD for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 13:48:20 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B83360A93
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 13:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B83360A93
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6980413F880;
 Sun, 10 Dec 2023 14:48:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Dec 2023 14:48:14 +0100
Date: Sun, 10 Dec 2023 14:48:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZXXBnuTeg_LcSWgZ@landeda>
References: <5969347.lOV4Wx5bFT@kilian-aisec>
 <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
 <20230902094244.0251e004@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230902094244.0251e004@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702216097;
 bh=6SohA4+YSvxKXDM11U+eN4TghLvS02jaxACMxiNFmv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DocxKLxOAdKoB2Wlk5VdxOTShRCwIw98k38eIDAhWRPhmvLIwQUeqg5WmYD5GJNCD
 PRGJkLkH9UzcS6gkflNkMSmGBI0PruyHRCpipvAAURZbD92/hT9K/mNcYcsUOUeAcQ
 fz8nLJmCZ9xcUNictwoWn9dnZF9XsOzhnxGr7ut9UT/DxR+ZWKDFc/Jmkl6G8SYVys
 OczZDMtGaxMVRSrCQ0rQ2shKbq2rvNt67jer7qMCfBBiWcYWuZNicdmJ+R/TgEJHjO
 pYjcgx3+VyD/zRpuHDSIFYZWwAae7UK4HVDuCEnLMelBZviOW6xS8jeXeO0Zx7rTaV
 APTNGdRuWGF2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DocxKLxO
Subject: Re: [Buildroot] Buildroot docker image
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIzLTA5LTAyIDA5OjQyICswMjAwLCBUaG9tYXMgUGV0YXp6b25p
IHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IE9uIEZyaSwgMSBTZXAgMjAyMyAwOToxOTow
MiArMDIwMAo+IEFybm91dCBWYW5kZWNhcHBlbGxlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnPiB3cm90ZToKPiA+ICAgRmlyc3Qgb2YgYWxsLCB0aGUgb25lIG9uIGRvY2tl
cmh1YiBpcyBubyBsb25nZXIgdXBkYXRlZC4gVGhlIGltYWdlcyB3ZSAKPiA+IGFjdHVhbGx5IHVz
ZSBhcmUgb24gcmVnaXN0cnkuZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9iYXNl
Cj4gPiAKPiA+ICAgQnV0IGV2ZW4gdGhvc2UgaW1hZ2VzIGFyZSBub3QgcmVhbGx5ICJmb3IgdXNl
ciBjb25zdW1wdGlvbiIuIFRoZXkgYXJlIHRoZSAKPiA+IGltYWdlcyB3ZSB1c2UgZm9yIENJLCBh
bmQgdGhleSB0aGVyZWZvcmUgaGF2ZSBhIGJpdCBtb3JlIHN0dWZmIGluIHRoZW0gdGhhbiAKPiA+
IHJlYWxseSBuZWVkZWQsIGUuZy4gcWVtdS4gVGhleSBhcmUgYWxzbyBub3QgdXBkYXRlZCAob24g
dGhlIE9TIGxldmVsKSAtIG5vIAo+ID4gc2VjdXJpdHkgdXBkYXRlcyBvciBhbnl0aGluZyBhcmUg
YXBwbGllZCBvbiBpdC4KPiA+IAo+ID4gICBJdCB3b3VsZCBwcm9iYWJseSBiZSBiZXR0ZXIgaWYg
d2Ugd291bGQgYWxzbyBjcmVhdGUgYSBzbWFsbCBpbWFnZSB0aGF0IHBlb3BsZSAKPiA+IGNhbiB1
c2UgZm9yIGp1c3QgYnVpbGRpbmcgaW4gdGhlaXIgQ0kuIEEgc21hbGwgaW1hZ2UgYmFzZWQgb24g
ZS5nLiBBbHBpbmUgb3IgCj4gPiBBcmNoLCBhbmQgdGhhdCBpcyB1cGRhdGVkIGUuZy4gZGFpbHkg
b24gZG9ja2VyaHViLiBIb3dldmVyLCBub2JvZHkgZXZlciAKPiA+IGNvbnRyaWJ1dGVkIHN1Y2gg
YW4gaW1hZ2Ugc28gd2UgZG9uJ3QgaGF2ZSBpdC4KPiAKPiBZYW5uIGhhcyBiZWVuIHdvcmtpbmcg
b24gYW5kIG9mZiBvbiBhIHNldCBvZiBEb2NrZXIgaW1hZ2VzIGZvcgo+IEJ1aWxkcm9vdC4gU2Vl
IGhpcyBicmFuY2ggYXQKPiBodHRwczovL2dpdGxhYi5jb20veW1vcmluL2J1aWxkcm9vdC8tL2Nv
bW1pdHMveWVtL2RvY2tlcnMvLiBJIGluZGVlZAo+IHNoYXJlZCB3aXRoIGhpbSByZWNlbnRseSBv
biBJUkMgdGhhdCBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSByZWFsbHkKPiBtaW5pbWFsIGlt
YWdlLCBzZXBhcmF0ZSBmcm9tIHRoZSBpbWFnZSB1c2VkIGluIENJICh3aGljaCBoYXMgbW9yZSBz
dHVmZgo+IGVuYWJsZWQsIG1vc3Qgbm90YWJseSBweXRob24zKS4KCkkgd2FzIGxvb2tpbmcgYXQg
dGhpcyByaWdodCBub3csIGFuZCBpbiBmYWN0IEkgYmVsaWV2ZSB0aGUgZXhpc3RpbmcKaW1hZ2Ug
aXMgdGhlIHBlcmZlY3QgZmlyIGFzIHRoZSBtaW5pbWFsIGltYWdlIHRvIHVzZS4KCkluZGVlZCwg
bGV0J3MgdGFrZSBhIGxvb2sgYXQgd2hhdCB3ZSBoYXZlIHRoZXJlLCBhbmQgd2h5IHdlIGRvOgoK
ICBNVFNDUgogIMOXICAgICBiYwogIMOXICAgICBidWlsZC1lc3NlbnRpYWwKICAgICAgICBienIK
ICDDlyAgICAgY2EtY2VydGlmaWNhdGVzCiAgIMOXICAgIGNtYWtlCiAgw5cgICAgIGNwaW8KICDD
lyAgICAgY3ZzCiAgw5cgICAgIGZpbGUKICDDlyAgICAgZysrLW11bHRpbGliCiAgw5cgICAgIGdp
dAogICDDlyAgICBsaWJjNjppMzg2CiAgw5cgICAgIGxpYm5jdXJzZXM1LWRldgogIMOXICAgICBs
b2NhbGVzCiAgICAgICAgbWVyY3VyaWFsCiAgICAgIMOXIG9wZW5zc2gtc2VydmVyCiAgICAgw5fD
lyBweXRob24zCiAgICAgw5cgIHB5dGhvbjMtZmxha2U4CiAgICAgw5cgIHB5dGhvbjMtbWFnaWMK
ICAgICAgw5cgcHl0aG9uMy1ub3NlMgogICAgICDDlyBweXRob24zLXBleHBlY3QKICAgICAgw5cg
cHl0aG9uMy1weXRlc3QKICAgICAgw5cgcWVtdS1zeXN0ZW0tYXJtCiAgICAgIMOXIHFlbXUtc3lz
dGVtLW1pc2MKICAgICAgw5cgcWVtdS1zeXN0ZW0teDg2CiAgw5cgICAgIHJzeW5jCiAgICAgw5cg
IHNoZWxsY2hlY2sKICAgICAgICBzdWJ2ZXJzaW9uCiAgw5cgICAgIHVuemlwCiAgw5cgICAgIHdn
ZXQKCk06IHN0cmljdGx5IG1hbmRhdG9yeQpUOiBvcHRpb25hbCwgYnV0IGhlbHBzIHVzZSBwcmUt
YnVpbHQgdG9vbGNoYWlucwpTOiBvcHRpb25hbCwgc3BlZWRzIHVwIHRoZSBidWlsZApDOiBuZWVk
ZWQgdG8gcnVuIGNoZWNrLXBhY2thZ2UgZXQgYWwuClI6IG5lZWRlZCB0byBydW4gdGhlIHJ1bnRp
bWUgdGVzdC1zdWl0ZQoKQmF6YWFyLCBtZXJjdXJpYWwgYW5kIHN1YnZlcnNpb24gYXJlIG9wdGlv
bmFsLCBhbmQgb25seSByZXF1aXJlZCB3aGVuIGEKcGFja2FnZSBpcyBienItLCBoZy0sIG9yIHN2
bi1ob3N0ZWQsIGJ1dCBpZiB3ZSB3YW50IHRoaXMgaW1hZ2UgdG8gYmUKdXNhYmxlIGdlbmVyYWxs
eSwgaXQgc2hvdWxkIGhhdmUgYWxsIHRocmVlLgoKU2luY2UgbWVyY3VyaWFsIGlzIGEgcHl0aG9u
IHBhY2thZ2UsIHdlIGNhbid0IGRyb3AgcHl0aG9uMywgYW5kIHRoZQpyZW1haW5pbmcgbW9kdWxl
cyBhcmUgcmVsYXRpdmVseSBzbWFsbCBpbiBjb21wYXJpc29uIHRvIHRoZSByZXN0LgoKR2V0dGlu
ZyBhIG1vcmUgbWluaW1hbCBpbWFnZSB3b3VsZCBiZSBqdXN0IGFib3V0IGRyb3BwaW5nIHFlbXUu
IFRoYXQKd291bGQgbWFrZSBmb3IgYW4gaW1hZ2UgdGhhdCB3ZSBjb3VsZCBub3QgdXNlIGluIHRo
ZSBDSSwgYW5kIHRoYXQgd291bGQKbm90IGJlIHVzYWJsZSB0byB0ZXN0IHRoZSBjaGFuZ2VzIGRv
bmUgdG8gQnVpbGRyb290LiBJIGRvbid0IHRoaW5rIHRoYXQKd291bGQgbWthZSBmb3IgYSBnb29k
IGltYWdlLgoKVGhlIHNpemUgb2YgdGhpcyBpbWFnZSBpcyBjdXJyZW50bHkgfjMzME1pQiB0byBk
b3dubG9hZCwgYW5kIH45NzVNaUIgb2YKc3RvcmFnZTsgYnVpbGRpbmcgYW4gaW1hZ2Ugd2l0aG91
dCBxZW11IHdvdWxkIG5vdCBtYWtlIG11Y2ggb2YgYQpkaWZmZXJlbmNlLgoKU28sIEkgdGhpbmsg
dGhpcyBpcyB0aGUgYmVzdCBtaW5pbWFsIHdlIGNhbiBnZXQgdG8sIGFzIGl0IGNvbnRhaW5zCmV2
ZXJ5dGhpbmcgdGhhdCBwZW9wbGUgc2hvdWxkIG5lZWQgdG8gYnVpbGQgYW5kIHRvIHJ1biB0aGUg
dG9vbGluZy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
