Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F96AC19F28
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7FD8275A;
	Wed, 27 Jul 2022 15:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB7FD8275A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQcAQXbw0w49; Wed, 27 Jul 2022 15:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A50D823C0;
	Wed, 27 Jul 2022 15:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A50D823C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2011BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6EC74061D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6EC74061D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYzfXCBbsSWz for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:57:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD2BB40608
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD2BB40608
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:57:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EDDD6B00725;
 Wed, 27 Jul 2022 17:57:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 17:57:11 +0200
Date: Wed, 27 Jul 2022 17:57:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20220727155711.GD1134587@scaer>
References: <20220620115510.33792-1-paul@crapouillou.net>
 <efe0cf31-54a7-6abc-8034-c440327e644f@smile.fr>
 <NNROFR.FBROLJPFYDGX1@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NNROFR.FBROLJPFYDGX1@crapouillou.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658937435;
 bh=+I6hu8kAalrH2reP+yA15c7cVS8MhH+WqCrBOgPEH4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C7tVWvnGHi84xPeSRf35fcL6Zi1BeoPQZz11uv19T4NPbxKsUyJ6GBKIdrBQr2I7W
 m7H4JF8vQl9H9T62yAvVuLBcOlF+Mor4M50q+C0RiUrofK3qHIhfnBYdo8YSf8CHDW
 hV+dAUQoFkiePByR/ocjqc2PhZYOekQlwJbOQlaQ6UB+TleEthpN0xB7JF9k2U746F
 BCcSiSJHB6h4mRdEgOpmsjTCsNoqA5c9ZCukOGnc5vFmAOfcnK/HmMIDaZaM15l7Es
 03fkO5hCm6ARdOwZ2nx4QIB7EQxmosoN5XS0+93mL6+ighy+1YBd/lrnmHOTP3qyLN
 wFf3oO6iZxTKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C7tVWvnG
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: add option to force
 static build
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGF1bCwgQWxsLAoKT24gMjAyMi0wNy0yNyAxNjo0MiArMDEwMCwgUGF1bCBDZXJjdWVpbCBzcGFr
ZSB0aHVzbHk6Cj4gTGUgbWVyLiwganVpbC4gMjcgMjAyMiBhdCAxNzowNjo1MiArMDIwMCwgUm9t
YWluIE5hb3VyCj4gPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gYSDDqWNyaXQgOgo+ID5MZSAyMC8w
Ni8yMDIyIMOgIDEzOjU1LCBQYXVsIENlcmN1ZWlsIGEgw6ljcml0IDoKPiA+PiBUaGlzIG9wdGlv
biBjYW4gYmUgdXNlZnVsIHdoZW4gYnVpbGRpbmcgZm9yIGEgc3lzdGVtIHRoYXQKPiA+PiBuZWVk
cyB0byBzb21ld2hhdCBtYWludGFpbiBjb21wYXRpYmlsaXR5IHdpdGggcHJldmlvdXNseSBidWls
dAo+ID4+IHNvZnR3YXJlLCBhcyBCb29zdCBpcyBub3RvcmlvdXMgZm9yIGJyZWFraW5nIEFCSSBh
dCBldmVyeQo+ID4+IHNpbmdsZSByZWxlYXNlLgoKSWYgeW91IG5lZWQgdG8gbGluayB3aXRoIGJv
b3N0IGxpYnMsIGl0IG1lYW5zIHlvdXIgcHJvZ3JhbSBhbHJlYWR5IGtub3cKdGhlIGNvcnJlY3Qg
QUJJPwoKSSBtZWFuLCB5b3UgaGF2ZSB0d28gc2l0dWF0aW9uczoKICAtIHlvdSBoYXZlIHNvdXJj
ZXMgZm9yIHlvdXIgcHJvZ3JhbTogeW91IGRvbid0IGNhcmUgYWJvdXQgQUJJCiAgICBicmVha2Fn
ZSwgYmVjYXVzZSB5b3Ugd2lsbCBidWlsZCBmcm9tIHNvdXJjZSwgc28gdGhlIGNvbXBpbGVyIGFu
ZAogICAgbGlua2VyIGtub3dzIHdoYXQgdG8gZG8sIHNvIHlvdSBkb24ndCBuZWVkIHRvIGZvcmNl
IHN0YXRpYyBsaWJzPwoKICAtIHlvdSBoYXZlIGEgLm8gZmlsZSBmb3IgeW91ciBwYWNrYWdlJ3Ms
IGFuZCB5b3UgY2FuIGFjdHVhbGx5IGxpbmsKICAgIHdpdGggdGhlIHN0YXRpYyBsaWJzLCBzbyBp
dCBtZWFucyB5b3UgaGF2ZSB0aGUgcHJvcGVyIEFCSSwgc28gd2h5CiAgICBjYW4ndCB5b3UgbGlu
ayB3aXRoIHRoZSBzaGFyZWQgb25lcz8KCk5vdywgaWYgeW91IGhhdmUgYSBiaW5hcnktb25seSBl
eGVjdXRhYmxlLCB0aGVuIHlvdSBkb24ndCBuZWVkIHRvIGxpbmsKaXQgYXQgYWxsLgoKU28sIEkg
YW0gbm90IHN1cmUgSSBzZWUgd2hhdCB0aGUgYWN0dWFsIGlzc3VlIGlzLi4uCgpBbHNvLCBJIGRv
bid0IHRoaW5rIGl0IGlzIHNhbmUsIGFzIFJvbWFpbiBwb2ludGVkIG91dCwgdGhhdCB0aGUgd2hv
bGUKQm9vc3QgaXMgYmlsdCBzdGF0aWNhbGx5IGZvciB0aGUgd2hvbGUgc3lzdGVtOyB0aGF0IGRv
ZXMgbm90IGZseSB3aXRoCm1lLi4uCgo+ID5BZnRlciBkaXNjdXNzaW5nIHdpdGggVGhvbWFzIGFu
ZCBBcm5vdXQsIHdlIGFyZSBub3QgY29udmluY2VkIGJ5IHRoaXMKPiA+cGF0Y2guCgpOZWl0aGVy
IGFtIEkuLi4KCj4gWWVzLCBJIGtub3cgdGhhdCBhIHNpbWlsYXIgcGVyLXBhY2thZ2Ugb3B0aW9u
IGNvdWxkIGJlIGFkZGVkIHRvIGFsbAo+IHBhY2thZ2VzLCBhbmQgSSBrbm93IHRoYXQgd2UgKGJv
dGggeW91IGFuZCBtZSkgZG9uJ3Qgd2FudCB0aGF0LiBNeSBhcmd1bWVudAo+IGlzIHRoYXQgbm9u
ZSBvZiB0aGUgb3RoZXIgcGFja2FnZXMgKHRoYXQgSSBrbm93IG9mKSBicmVhayBBQkkgYXQgZXZl
cnkKPiBzaW5nbGUgbWlub3IgdmVyc2lvbi4gT25seSBCb29zdCBkb2VzIHRoYXQsIGFuZCBpdCBt
YWtlcyBpdCBjb21wbGV0ZWx5Cj4gaW1wb3NzaWJsZSB0byBzdXBwb3J0IG9sZCBwcm9ncmFtcy4K
PiAKPiBJJ3ZlIGJlZW4gZG9pbmcgdGhpcyB0cmljayBvZiBjb21waWxpbmcgc3RhdGljIGJ1aWxk
cyBvZiBCb29zdCBzaW5jZQo+IEJ1aWxkcm9vdCAyMDE0LjA1IGFuZCB0aGUgbWFqb3JpdHkgb2Yg
YmluYXJpZXMgYnVpbHQgYmFjayB0aGVuIHN0aWxsIHJ1bgo+IHdpdGggbXkgY3VycmVudCBkaXN0
cmlidXRpb24gYmFzZWQgb24gQnVpbGRyb290IDIwMjEuMDguIFByb2dyYW1zIGJ1aWx0Cj4gYWdh
aW5zdCBzaGFyZWQgQm9vc3Qgd291bGQgYnJlYWsgZXZlcnkgMyBtb250aHMuCgpJIGRvbid0IHVu
ZGVyc3RhbmQgd2hhdCB5b3UgYXJlIHNheWluZyBoZXJlLiBEbyB5b3UgbWVhbiB0aGF0IHlvdSBi
dWlsdApiaW5hcmllcyBiYWNrIGluIDIwMTQsIGFuZCBkcm9wIHRoZW0gaW4geW91ciBzaGlubnkg
bmV3IHN5c3RlbSwgYW5kIHRoZXkKc3RpbGwgcnVuPyBUaGF0J3MgZmluZSwgZG8gdGhhdDogaW5z
dGFsbCBwcmUtYnVpbHQgYmluYXJpZXMgb2YgeW91cgphcHBsaWNhdGlvbjogeW91IGRvbid0IG5l
ZWQgdG8gYnVpbGQgYSBzdGF0aWMgYm9vc3Qgb24gdGhlIHdob2xlIHN5c3RlbQpmb3IgdGhhdC4K
Ck5vdywgaWYgd2hhdCB5b3UgbmVlZCBpcyBhIHdheSB0byBpbml0aWFsbHkgYmUgYWJsZSB0byBi
dWlsZCB0aG9zZQpwcm9ncmFtcyB0byBzdGFydCB3aXRoLCBhbmQgbGluayB0aGVtIHN0YXRpY2Fs
bHksIHNvIHRoYXQgeW91IGNhbgppbnN0YWxsIHRoZW0gYXMgYmluYXJ5IHByZWJ1aWx0LCB0aGVu
IGJ1aWxkIGEgc3RhdGljLW9ubHkgU0RLLCBidWlsZAp5b3VyIHByb2dyYW1zLCBhbmQgZHJvcCB0
aGVtIGluIHlvdXIgb3RoZXIgY29uZmlndXJhdGlvbiB0aGF0IGhhcyBCb29zdAphdmFpbGFibGUg
YXMgc2hhcmVkIGZvciB0aGUgcmVzdCBvZiB0aGUgc3lzdGVtLgoKT2YgY291cnNlLCB1bmxlc3Mg
dGhlcmUgaXMgc29tZXRoaW5nIGVsc2UgSSBtaXNzZWQgKGVudGlyZWx5IHBvc3NpYmxlCmFzIEkg
YW0gaGF2aW5nIGEgdmVyeSBiYWQgZGF5IHRvZGF5IGFuZCBjYW4ndCB0aGluayB0b3RhbGx5IHJp
Z2h0KS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
