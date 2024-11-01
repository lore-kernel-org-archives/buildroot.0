Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7998DE6F063
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 14:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F97760662;
	Fri,  1 Nov 2024 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v20Ssnz5eF_b; Fri,  1 Nov 2024 14:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1382F6068B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1382F6068B;
	Fri,  1 Nov 2024 14:57:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6FAB3B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 805176068B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvIUSBsKdoG3 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 14:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 671D660662
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 671D660662
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 671D660662
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:57:20 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C46B82C801F3
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 15:57:17 +0100 (CET)
Message-ID: <8f75498b-483d-497c-90aa-d81efda6ba4e@bubu1.eu>
Date: Fri, 1 Nov 2024 15:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241101144117.3083087-1-buildroot@bubu1.eu>
 <CADvTj4rdufnps5Ag7S0NNGVJ_QU8KBCh_BHatDJMw9MKiYvJMQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADvTj4rdufnps5Ag7S0NNGVJ_QU8KBCh_BHatDJMw9MKiYvJMQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1730473037; bh=P0MyGmgRk8ws8yp8s2VfMdjxSuV59umrWcbIYLl5h+4=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=HPxmSWzm83c7opNXGxqHSwagf7HdG46smgMGo8jkovGjwmHDmn4et8yLG+ReXNsyH
 IFvAuRqsorJEfpLD4Jlfpuy5NKg14X5wNSepRRSgzrX3NWQyTX4j6VU+ZsGXuOtVZA
 Ze52B9WCN9P+QXee+DGON/sf5coq4H6r3+hl6meNTHBhdpIJBeiue02TGzhxGM4dvD
 nILjj57fWu7VD/e8WfiQ/gHKoPSCrmeNho2iQ3l5lLgcC5UCB+EfFnVr8n0mrt/Fsx
 Fur1nxJpU/MbFxIxkNKfl8uOc+KxGGvZUyrHwIUegggQP5IbzK2oZQ3+ojaZUzIaLq
 qQ+/coSo3Va1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=HPxmSWzm
Subject: Re: [Buildroot] [PATCH] package/python-flit-core: bump to 3.10.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiAwMS4xMS4yNCAxNTo1MSwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gT24g
RnJpLCBOb3YgMSwgMjAyNCBhdCA4OjQx4oCvQU0gTWFyY3VzIEhvZmZtYW5uIDxidWlsZHJvb3RA
YnVidTEuZXU+IHdyb3RlOgo+Pgo+PiBGcm9tOiBNYXJjdXMgSG9mZm1hbm4gPG1hcmN1cy5ob2Zm
bWFubkBvdGhlcm1vLmRlPgo+Pgo+PiBDaGFuZ2Vsb2c6IGh0dHBzOi8vZmxpdC5weXBhLmlvL2Vu
L3N0YWJsZS9oaXN0b3J5Lmh0bWwjdmVyc2lvbi0zLTEwCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1h
cmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1Pgo+PiAtLS0KPj4gICBwYWNrYWdlL3B5
dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5oYXNoIHwgNCArKy0tCj4+ICAgcGFja2Fn
ZS9weXRob24tZmxpdC1jb3JlL3B5dGhvbi1mbGl0LWNvcmUubWsgICB8IDYgKystLS0tCj4+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5oYXNo
IGIvcGFja2FnZS9weXRob24tZmxpdC1jb3JlL3B5dGhvbi1mbGl0LWNvcmUuaGFzaAo+PiBpbmRl
eCA0ZDQ5MDdmNWRjLi4yY2M4MDMyMTk0IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1m
bGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5oYXNoCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWZs
aXQtY29yZS9weXRob24tZmxpdC1jb3JlLmhhc2gKPj4gQEAgLTEsNSArMSw1IEBACj4+ICAgIyBt
ZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9mbGl0X2NvcmUvanNvbgo+PiAt
bWQ1ICAzYmM1MmYxOTUyYjlhNzgzNjExMTQxNDdkYTYzYzM1YiAgZmxpdF9jb3JlLTMuOS4wLnRh
ci5nego+PiAtc2hhMjU2ICA3MmFkMjY2MTc2YzRhM2ZjZmFiNWYyOTMwZDc2ODk2MDU5ODUxMjQw
NTcwY2U5YTk4NzMzYjY1OGNiNzg2ZWJhICBmbGl0X2NvcmUtMy45LjAudGFyLmd6Cj4+ICttZDUg
IDM4ZmQzNjVkYzk4MGQ5OTEwN2RmY2NhZGM5NmQwYzRmICBmbGl0X2NvcmUtMy4xMC4wLnRhci5n
ego+PiArc2hhMjU2ICA2ZDkwNDIzMzE3OGIzYzkyNGY2NjU5NDdhYzdkMjg2ZjJhYzc5OWZiNjkw
ODdlMzllNTZjZWI0MDg0NzI0YTk3ICBmbGl0X2NvcmUtMy4xMC4wLnRhci5nego+PiAgICMgTG9j
YWxseSBjb21wdXRlZAo+PiAgIHNoYTI1NiAgMzViNGYxZGVjNTEyZTYxNzA3N2ZkNjk4MGRiYjQz
ZWY4YzI4ODdhZGM1ZDAxODVlZGI0YzA0ZGExNzVkZDgxNiAgTElDRU5TRQo+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9weXRob24tZmxpdC1jb3JlL3B5dGhvbi1mbGl0LWNvcmUubWsgYi9wYWNrYWdl
L3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5tawo+PiBpbmRleCAzNGU1OGQwM2Nh
Li5lNTdkNzk1YTYzIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0
aG9uLWZsaXQtY29yZS5tawo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9u
LWZsaXQtY29yZS5tawo+PiBAQCAtNCwxMSArNCw5IEBACj4+ICAgIwo+PiAgICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4+Cj4+IC1QWVRIT05fRkxJVF9DT1JFX1ZFUlNJT04gPSAzLjkuMAo+PiAr
UFlUSE9OX0ZMSVRfQ09SRV9WRVJTSU9OID0gMy4xMC4wCj4+ICAgUFlUSE9OX0ZMSVRfQ09SRV9T
T1VSQ0UgPSBmbGl0X2NvcmUtJChQWVRIT05fRkxJVF9DT1JFX1ZFUlNJT04pLnRhci5nego+PiAt
UFlUSE9OX0ZMSVRfQ09SRV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3Bh
Y2thZ2VzL2M0L2U2L2MxYWM1MGZlM2VlYmIzOGExNTUxNTU3MTFlNmU4NjRlMjU0Y2U0YjZlMTdm
ZTI0MjliNGM0ZDViOWU4MAo+PiAtUFlUSE9OX0ZMSVRfQ09SRV9MSUNFTlNFID0gQlNELTMtQ2xh
dXNlCj4+IC1QWVRIT05fRkxJVF9DT1JFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gCj4gV2h5
IGFyZSB0aGUgbGljZW5zZSBhbmQgbGljZW5zZSBmaWxlcyBiZWluZyByZW1vdmVkIGhlcmU/Cgou
L3V0aWxzL3NjYW5weXBpIGtlZXBzIHJlcGxhY2luZyB0aGVtIHdpdGggdW5rbm93biBsaWNlbnNl
IG9uIGV2ZXJ5IAp1cGRhdGUgYW5kIEkgZGlkbid0IGNvcnJlY3RseSBtYW5hZ2UgdG8gZ2l0IHJl
c2V0IHRoYXQgaHVuayB0aGlzIHRpbWUuLi4KClRoYW5rcyBmb3Igbm90aWNpbmchIHYyIG9uIHRo
ZSB3YXkuCgo+IAo+PiArUFlUSE9OX0ZMSVRfQ09SRV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRo
b25ob3N0ZWQub3JnL3BhY2thZ2VzLzUyLzkyLzg5Y2NlYjljNDlmM2U2YzcyMDkxMzA0NjM2YzVl
YmMyZmM0OGM1NDY3NDJiYmY4YTZhNDc0ZTQ4ZTY2Ngo+PiAgIFBZVEhPTl9GTElUX0NPUkVfU0VU
VVBfVFlQRSA9IGZsaXQtYm9vdHN0cmFwCj4+Cj4+ICAgIyBVc2UgZmxpdCBidWlsdCBpbiBib290
c3RyYXBfaW5zdGFsbCBmb3IgaW5zdGFsbGluZyBob3N0LXB5dGhvbi1mbGl0LWNvcmUuCj4+IC0t
Cj4+IDIuNDMuMAo+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
