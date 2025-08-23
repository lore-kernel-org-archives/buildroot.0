Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2930CCA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 20:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA054414FE;
	Sat, 23 Aug 2025 20:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRDKKNoXy6kO; Sat, 23 Aug 2025 20:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB41541732
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB41541732;
	Sat, 23 Aug 2025 20:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAF8C19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1B34413BC
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkvpiEDirHwl for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 20:55:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78F30413C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78F30413C2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78F30413C2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:55:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 184627803A2;
 Sat, 23 Aug 2025 22:55:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 Aug 2025 22:55:23 +0200
MIME-Version: 1.0
Date: Sat, 23 Aug 2025 22:55:23 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <1cd43c0e-2839-4f0b-8fbd-b47e44438edb@smile.fr>
References: <20250823105456.28057-1-ju.o@free.fr>
 <1cd43c0e-2839-4f0b-8fbd-b47e44438edb@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <b0952d449db8e520f37d2d6d7cff3709@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755982524;
 bh=pRQZrAdBl1vP69YGUNQy/GcdNtrwnicoEN/EoVdjT58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cc6Ij3RGEIxfn2aURiD3yVwmNx/2pxsMQURMejNfB5zn8JiMrIZrq/NT/+NNjviOG
 iih5vlvVRXGcRfdmakGYWRgHMLyXL+5QPli57gEs1Vuvzsnq5U9yXlzeALqpCdY+3l
 et3Yfvts3MvdFVgx1TTB27sS+mYfx1XRsSMouEj2XfsQaqaMfSWFoAcGdB5KT/HQmK
 dEp1+fyCpJn2fgX0jRuwmCYRbPVuvudMst3zHuLy49qiMoBE2FaXwzBbUKVhngMBBy
 zjNMNEmY7arDGfs73Yqivn0BKojr7Fiicx0TkY5ogbj3q58SvA90ab3jwNx1qFpSrV
 1FdoStdfcEyVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Cc6Ij3RG
Subject: Re: [Buildroot] [PATCH 1/1] support/misc/gitlab-ci.yml.in: check
 legal-info in test-pkg
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gMjMvMDgvMjAyNSAyMjoyNiwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhl
bGxvIEp1bGllbiwgQWxsLAo+IAo+IExlIDIzLzA4LzIwMjUgw6AgMTI6NTQsIEp1bGllbiBPbGl2
YWluIGEgw6ljcml0wqA6Cj4+IFRoZSBzY3JpcHQgInV0aWxzL3Rlc3QtcGtnIiBpcyBzeXN0ZW1h
dGljYWxseSBjaGVja2luZyBsZWdhbC1pbmZvLgo+PiBTZWUgWzFdLiBUaGlzIGlzIHVzZWZ1bCB0
byBjaGVjayBhbGwgbGljZW5zZSBoYXNoZXMgYXJlIHVwIHRvIGRhdGUuCj4+IAo+PiBUaGUgQnVp
bGRyb290IEdpdGxhYiBDSSBpbnRlZ3JhdGlvbiBoYXMgYW4gaWRlbnRpY2FsIHRlc3RpbmcKPj4g
Y2FwYWJpbGl0eS4gSXQgaXMgZmFzdGVyIGJlY2F1c2UgaXQgY2FuIHJ1biBhbGwgc3VwcG9ydGVk
IHRvb2xjaGFpbgo+PiB0ZXN0IGJ1aWxkcyBpbiBwYXJhbGxlbC4gU2VlIFsyXS4KPj4gCj4+IEl0
IHdhcyBvYnNlcnZlZCBpbiBbM10gdGhhdCB0aGUgR2l0bGFiIENJIHRlc3QtcGtnIHZhcmlhbnQg
ZG9lcyBub3QKPj4gY2hlY2sgbGVnYWwtaW5mby4KPj4gCj4+IFRoaXMgY29tbWl0IGFsaWduIHRo
ZSBHaXRsYWIgQ0kgdGVzdC1wa2cgYmVoYXZpb3IgdG8gdGhlCj4+ICJ1dGlscy90ZXN0LXBrZyIg
c2NyaXB0IGJ5IGFkZGluZyBhICJtYWtlIGxlZ2FsLWluZm8iIGNvbW1hbmQuCj4+IAo+PiBbMV0g
Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAy
NS4wNS91dGlscy90ZXN0LXBrZyNMMTk1Cj4+IFsyXSAKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI1LjA1L3N1cHBvcnQvbWlzYy9naXRsYWIt
Y2kueW1sLmluI0wxMjkKPj4gWzNdIAo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJv
b3QvNzVlNjg4ODg3ZDk1OTQ4YzU3YTExNDE2ZGUzMDQ3YjVAZnJlZS5mci8KPiAKPiBZZXMgeW91
J3JlIHJpZ2h0Lgo+IAo+IEluIGFub3RoZXIgaGFuZCwgcHVzaGluZyB0ZXN0LXBrZyB0ZXN0aW5n
IGluIGEgR2l0bGFiIENJIHdpdGhvdXQgaGF2aW5nIAo+IGFscmVhZHkKPiBwcmUtdGVzdGVkIGxv
Y2FsbHkgdGhlIG5ldyBwYWNrYWdlIHdpdGggdGVzdC1wa2cgYW5kIHRoZSBkZWZhdWx0IHN1YnNl
dCAKPiBvZgo+IHRvb2xjaGFpbnMgaXMgcHJvYmFibHkgYSB3YXN0ZSBvZiB0aW1lIGFuZCByZXNz
b3VyY2VzIFsxXSA6KQo+IAo+IFsxXQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL3N1cHBvcnQvc2NyaXB0cy9nZW5lcmF0ZS1naXRsYWIt
Y2kteW1sP3JlZl90eXBlPWhlYWRzI0wxMDAKClllcywgeW91IGFyZSBhbHNvIHJpZ2h0LiBUaGUg
c3BlY2lmaWMgdXNlIGNhc2UgSSBoYWQgaW4gbWluZCB3YXMKd2hhdCBoYXBwZW5lZCBpbjoKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290Lzc1ZTY4ODg4N2Q5NTk0OGM1N2ExMTQxNmRl
MzA0N2I1QGZyZWUuZnIvCgpBcyBhIG1haW50YWluZXIsIHdlIHNvbWV0aW1lcyByZWNlaXZlIGEg
cGF0Y2ggd2l0aCBhIGxpbmsgYXMgYQoicHJvb2Ygb2YgdGVzdCIgcG9pbnRpbmcgdG8gYSBnaXRs
YWIgdXNlciBhY2NvdW50LiBMb29raW5nIGF0IHRoaXMsCkkgd2FzIHRydXN0aW5nIHRoaXMgcmVw
b3J0IGFuZCBJIHdhcyBub3QgcGxhbm5pbmcgdG8gcmV0ZXN0IGFueXdheS4KKEluIHRoYXQgc3Bl
Y2lmaWMgY2FzZSwgSSBkaWQgaXQgZm9yIGFub3RoZXIgcmVhc29uIHdoaWNoIGlzIHdoeQpJIGNh
dWdodCB0aGUgaXNzdWUsIGJ5IGx1Y2spLgoKV2l0aCB0aGF0IHBhdGNoLCBJIHdpbGwgYmUgc3Vy
ZSB0aGF0IGxlZ2FsLWluZm8gd2VyZSBjaGVja2VkLCB3aGVuCkkgcmVjZWl2ZSBhIHBhdGNoIHdp
dGggYSBzdWNjZXNzZnVsIGdpdGxhYiBDSSBsaW5rLgoKPiAKPiBJIGJlbGlldmUgaXQncyBzYWZl
IHRvIG1lcmdlIGl0IGluIG1hc3RlciBidXQgSSdtIGZpbmUgdG9vIGlmIHlvdSAKPiBwcmVmZXIg
bmV4dC4KCkkgd2FzIGluY2xpbmVkIHRvIG1lcmdlIGl0IGluIG1hc3RlciAoYW5kIEkgYW0gYWxz
byBmaW5lIGZvciBuZXh0LCBpZgpzb21lYm9keSBoYXMgYSBjb25jZXJuIGFib3V0IHRoZSBpbXBh
Y3Qgb2YgdGhpcyBwYXRjaCkuCgo+IEFja2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4gCj4+IAo+PiBDYzog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4+IC0tLQo+PiAgc3VwcG9ydC9taXNjL2dpdGxh
Yi1jaS55bWwuaW4gfCAxICsKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+PiAK
Pj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvbWlzYy9naXRsYWItY2kueW1sLmluIAo+PiBiL3N1cHBv
cnQvbWlzYy9naXRsYWItY2kueW1sLmluCj4+IGluZGV4IGRiMjA2NDMyYWEuLjIzNThmNTczYzgg
MTAwNjQ0Cj4+IC0tLSBhL3N1cHBvcnQvbWlzYy9naXRsYWItY2kueW1sLmluCj4+ICsrKyBiL3N1
cHBvcnQvbWlzYy9naXRsYWItY2kueW1sLmluCj4+IEBAIC0xMzUsNiArMTM1LDcgQEAgYmVmb3Jl
X3NjcmlwdDoKPj4gICAgICAgICAgLSBtYWtlIE89JHtPVVRQVVRfRElSfSBzYXZlZGVmY29uZmln
Cj4+ICAgICAgICAgIC0gZWNobyAnQnVpbGQgYnVpbGRyb290Jwo+PiAgICAgICAgICAtICpydW5f
bWFrZQo+PiArICAgICAgICAtIG1ha2UgTz0ke09VVFBVVF9ESVJ9IGxlZ2FsLWluZm8KPj4gICAg
ICBuZWVkczoKPj4gICAgICAgICAgLSBwaXBlbGluZTogJFBBUkVOVF9QSVBFTElORV9JRAo+PiAg
ICAgICAgICAgIGpvYjogZ2VuZXJhdGUtZ2l0bGFiLWNpLXltbAoKQmVzdCByZWdhcmRzLAoKSnVs
aWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
