Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8130AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 17:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3502A607C1;
	Sat, 19 Feb 2022 17:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9YuKPzNOLbR; Sat, 19 Feb 2022 17:05:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 602EA60706;
	Sat, 19 Feb 2022 17:05:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EFE71BF363
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D7A881A4E
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6fa3V4lsZRw for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 17:05:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F6C081882
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 17:05:08 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 e19-20020a4ab993000000b0031a98fe3a9dso7637443oop.6
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 09:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2FsxVmf3ijEkh0r9n7NrYnClRXmpLqJkp23Jxo3+VVU=;
 b=QTmXQpIITD93pUz20e9F4qpvItf5/PjZm82vdJ76JSTXWXUEDNrRYy/x2uP30bL8eK
 g1+d9udqOeQMLZNZk1l0m4jSbajlSlRSrNuXemZXmj7DKA0ckDstt5Ay2gilJa3uAfhZ
 1TW/7WIU2BuZIwhnROyJtjNgYYl6bPdxcwnHajNntb+MtdTFEFcYgexwqjRftQRZJQUp
 vvqBGStbGJJTw+xoIqgSOVSXkxStDd93hSfuRFwt3kwigY9BMjSpUHLGJwDTBX2HZqaF
 f8G0AWFk/KvheZNPPnEhIujSvyBgQhFWwORKVaXJdI/q6z16WebKCiFM8hpd8E9CU4Wl
 +dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2FsxVmf3ijEkh0r9n7NrYnClRXmpLqJkp23Jxo3+VVU=;
 b=3UZufbuo2QyUEqO8cZyVe2U3h/s9nzXDuevyOd08t54rKxLkv0LUr5eylxouX2b9VA
 WOPoD8+Ue2BNqU59ufcBhCGTthjHLhXvscmrdCs4wa56JQ5A+9CT+nqpjk+2DmesQygi
 93d82zo1nsXJ6FvYHgoWv1S1XRbCq7d2G8ygaLbf1pD0SW8zqKsU1xXyOyx60RLppEEI
 QjLXdXQOvBVsJ4zAPy038JJ6BLOSVRI08p35EJqx813KvVpEUp4K1csxxeYPf7h011gG
 HjqEp2GRB4lYydp8zEEqURt5NrO7hIBvVSGwYZYWTZ0T/f/b/v5lrpwXV0i4jvAP5/ug
 AnAg==
X-Gm-Message-State: AOAM532MN0Ssx40T+urrM3Elj2J9yXEIImMRJ2UG3s2XyhNDqRxMcheR
 r9ebIN0jsIPOrofroBEmUaOvbGVww0GJeXst7DBWHWGpYjg=
X-Google-Smtp-Source: ABdhPJxTmaOJt0ENPkAWdgEyL8PZoj66Hjydv9kFtNQeukZBmoyQPjZKsF3Nk+zgP4hdaHHbntC1YWkqw6tb9JidUOQ=
X-Received: by 2002:a05:6870:4410:b0:d3:1505:36c8 with SMTP id
 u16-20020a056870441000b000d3150536c8mr6363690oah.300.1645290307581; Sat, 19
 Feb 2022 09:05:07 -0800 (PST)
MIME-Version: 1.0
References: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
 <87bl0t1a9o.fsf@gmail.com> <114f25cd-b392-fbde-ce20-eef87447f1c0@gmail.com>
 <e9fbdbb9-5ba3-cae6-7492-4a287c3ba2fd@gmail.com>
 <CAPi7W83+xLBCC=U2gdtcQW2+LK3kjrxB+6Z-toM+f5qD6grTXQ@mail.gmail.com>
 <4429b2e9-f78b-30e6-849a-c1567ea83e12@gmail.com>
In-Reply-To: <4429b2e9-f78b-30e6-849a-c1567ea83e12@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 19 Feb 2022 18:05:09 +0100
Message-ID: <CAPi7W80o=KRRJoQxZ8J_5xTHJB4Hh0kwvFtdGQpurnWxM-xZUQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.11
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiAxOSBmw6l2ci4gMjAyMiDDoCAxNzo0MywgUm9tYWluIE5hb3VyIDxyb21haW4ubmFv
dXJAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBGYWJyaWNlLAo+Cj4gTGUgMTkvMDIv
MjAyMiDDoCAxNjoyMCwgRmFicmljZSBGb250YWluZSBhIMOpY3JpdCA6Cj4gPiBIZWxsbywKPiA+
Cj4gPiBMZSBzYW0uIDE5IGbDqXZyLiAyMDIyIMOgIDEwOjIwLCBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBnbWFpbC5jb20+IGEgw6ljcml0IDoKPiA+Pgo+ID4+IEhlbGxvLAo+ID4+Cj4gPj4g
TGUgMzAvMDEvMjAyMiDDoCAxNzozNiwgUm9tYWluIE5hb3VyIGEgw6ljcml0IDoKPiA+Pj4gSGVs
bG8gRmFicmljZSwgSm9hY2hpbSwgQWxsLAo+ID4+Pgo+ID4+PiBMZSAwMy8wMS8yMDIyIMOgIDA5
OjQxLCBKb2FjaGltIFdpYmVyZyBhIMOpY3JpdCA6Cj4gPj4+PiBPbiBTYXQsIEphbiAwMSwgMjAy
MiBhdCAyMzo1OSwgRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+
IHdyb3RlOgo+ID4+Pj4+IFRoZSBMWEMgNC4wIGJyYW5jaCBpcyBzdXBwb3J0ZWQgdW50aWwgSnVu
ZSAyMDI1Lgo+ID4+Pj4+IE9ubHkgYnVnZml4ZXMgYW5kIHNlY3VyaXRpeSBpc3N1ZXMgZ2V0IGlu
Y2x1ZGVkIGludG8gdGhlIHN0YWJsZSBidWdmaXgKPiA+Pj4+PiByZWxlYXNlcywgc28gaXQncyBh
bHdheXMgc2FmZSBhbmQgcmVjb21tZW5kZWQgdG8ga2VlcCB1cCBhbmQgcnVuIHRoZQo+ID4+Pj4+
IGxhdGVzdCBidWdmaXggcmVsZWFzZS4KPiA+Pj4KPiA+Pj4gV2VsbCBpdCBhbHNvIGluY2x1ZGVz
IG5ldyBmZWF0dXJlcyBzaW5jZSB0aGlzIHZlcnNpb24gYnVtcCBicmVhayBseGMgd2l0aCBhbGwK
PiA+Pj4ga2VybmVsIDwgNS42IGR1ZSB0byB0aGUgYnJva2VuIGZhbGwgYmFjayB3aGVuIHRoZSBu
ZXcgbW91bnQgQVBJIGlzIG5vdCBzdXBwb3J0ZWQuCj4gPj4+Cj4gPj4+IFdlIGhhdmUgYSB0ZXN0
IGZvciBseGMgdXNpbmcgYSBrZXJuZWwgNC4xOSB0aGF0IHRyaWdnZXIgdGhpcyBpc3N1ZSBbMV0u
Cj4gPj4+Cj4gPj4+IFNlZSBseGMubG9nOgo+ID4+Pgo+ID4+PiAoa2VybmVsIDUuNSkKPiA+Pj4g
REVCVUcgY29uZiAtIGNvbmYuYzpseGNfc2V0dXBfZGV2cHRzX2NoaWxkOjE2ODIgLSBObyBuZXcg
ZGV2cHRzIGluc3RhbmNlIHdpbGwgYmUKPiA+Pj4gbW91bnRlZCBzaW5jZSBubyBwdHMgZGV2aWNl
cyBhcmUgcmVxdWlyZWQKPiA+Pj4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMgIERFQlVHIGNvbmYgLSBj
b25mLmM6bHhjX3NldHVwX2Rldl9jb25zb2xlOjE5NjYgLSBDbGVhcmVkCj4gPj4+IGFsbCAoMCkg
bW91bnRzIGZyb20gIi9kZXYvY29uc29sZSIKPiA+Pj4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMgIEVS
Uk9SIG1vdW50X3V0aWxzIC0gbW91bnRfdXRpbHMuYzptb3VudF9hdDo2NjEgLSBObyBzdWNoCj4g
Pj4+IGZpbGUgb3IgZGlyZWN0b3J5IC0gRmFpbGVkIHRvIG1vdW50ICIvcHJvYy9zZWxmL2ZkLzQ0
IiB0byAiL3Byb2Mvc2VsZi9mZC80MyIKPiA+Pj4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMgIEVSUk9S
IGNvbmYgLSBjb25mLmM6bHhjX3NldHVwX2Rldl9jb25zb2xlOjE5ODggLSBObyBzdWNoCj4gPj4+
IGZpbGUgb3IgZGlyZWN0b3J5IC0gRmFpbGVkIHRvIG1vdW50ICIxMCgvZGV2L3B0cy8wKSIgb24g
IjQzIgo+ID4+PiBseGMtc3RhcnQgbHhjX2lwZXJmMyAgRVJST1IgY29uZiAtIGNvbmYuYzpseGNf
c2V0dXBfY29uc29sZToyMTQzIC0gTm8gc3VjaCBmaWxlCj4gPj4+IG9yIGRpcmVjdG9yeSAtIEZh
aWxlZCB0byBzZXR1cCBjb25zb2xlCj4gPj4+Cj4gPj4+IChrZXJuZWwgNS42KQo+ID4+PiBseGMt
c3RhcnQgbHhjX2lwZXJmMyAgVFJBQ0UgbW91bnRfdXRpbHMgLSBtb3VudF91dGlscy5jOmNhbl91
c2VfbW91bnRfYXBpOjU4MiAtCj4gPj4+IEtlcm5lbCBzdXBwb3J0cyBtb3VudCBhcGkKPiA+Pj4g
bHhjLXN0YXJ0IGx4Y19pcGVyZjMgIFRSQUNFIG1vdW50X3V0aWxzIC0gbW91bnRfdXRpbHMuYzpt
b3ZlX2RldGFjaGVkX21vdW50OjMyOAo+ID4+PiAtIEF0dGFjaCBkZXRhY2hlZCBtb3VudCA0NSB0
byBmaWxlc3lzdGVtIGF0IDQzCj4gPj4+IGx4Yy1zdGFydCBseGNfaXBlcmYzICBUUkFDRSBjb25m
IC0gY29uZi5jOmx4Y19zZXR1cF9kZXZfY29uc29sZToxOTkwIC0gU2V0dXAKPiA+Pj4gY29uc29s
ZSAiL2Rldi9wdHMvMCIKPiA+Pj4KPiA+Pj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMjAwNjc5ODk5OAo+ID4+Pgo+ID4+PiBUaGlzIGlzc3Vl
IGlzIG5vdCB5ZXQgZml4ZWQgaW4gbHhjIHN0YWJsZS00LjAgYnJhbmNoLgo+ID4+Pgo+ID4+PiBD
YW4geW91IGhhdmUgYSBsb29rPwo+ID4+Cj4gPj4gcGluZy4KPiA+IEhvdyBjYW4gSSByZXByb2R1
Y2UgdGhlIHByb2JsZW0gbG9jYWxseSBzbyBJIGNhbiBvcGVuIGEgYnVnIG9uCj4gPiBodHRwczov
L2dpdGh1Yi5jb20vbHhjL2x4Yy9pc3N1ZXM/Cj4gPiBJIHRyaWVkIHRvIGxhdW5jaCBydW4tdGVz
dHMgZnJvbSBjdXJyZW50IG1hc3RlciBidXQgaXQgaXMgInN0dWNrIiBpbgo+ID4gIkJ1aWxkaW5n
IGRvbmUiOgo+ID4KPiA+IC4vc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyAtbyB0ZXN0LW91dHB1
dC8gLWQgdGVzdC1kbC8gLWsKPiA+IC0tdGltZW91dC1tdWx0aXBsaWVyIDEwIHRlc3RzLnBhY2th
Z2UudGVzdF9seGMuVGVzdEx4Ywo+ID4gMTU6MzY6MzUgVGVzdEx4YyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBTdGFydGluZwo+ID4gMTU6MzY6MzUgVGVzdEx4YyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBCdWlsZGluZwo+ID4gMTU6NTE6MDQgVGVzdEx4YyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCdWlsZGluZyBkb25lCj4gPgo+ID4gU28gSSBv
cGVuZWQgdGVzdC1vdXRwdXQvVGVzdEx4Yy1ydW4ubG9nIGFuZCBmb3VuZCBvdXQgYSBrZXJuZWwg
cGFuaWM6Cj4gPgo+ID4gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IE5vIHdvcmtpbmcgaW5p
dCBmb3VuZC4gIFRyeSBwYXNzaW5nIGluaXQ9Cj4gPiBvcHRpb24gdG8ga2VybmVsLiBTZWUgTGlu
dXggRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9pbml0LnJzdCBmb3IKPiA+IGd1aWRhbmNlCj4g
Pgo+ID4gSSBhc3N1bWUgdGhhdCBxZW11IGlzIG5vdCBhYmxlIHRvIHN0YXJ0IHRoZSBrZXJuZWwu
Cj4gPiBEbyB5b3UgaGF2ZSBzb21lIGFkdmljZSBvbiB3aGF0IGNvdWxkIGdvIHdyb25nPwo+Cj4g
V2VpcmQsIGNhbiB5b3UgY2hlY2sgeW91ciBxZW11IHZlcnNpb24gPwoKSSdtIG9uIHFlbXUgNi4y
LjAuCgo+Cj4gSSdtIHVzaW5nIHFlbXUgNi4xLjAgZnJvbSBGZWRvcmEgMzUgYW5kIGFsc28gdGVz
dGVkIHFlbXUgNS4yLjAgZnJvbSBEZWJpYW4gMTEuCj4KPiBJZiBpdCBzdGlsbCBub3Qgd29ya2lu
ZywgeW91IHNob3VsZCBiZSBhYmxlIHRvIHJlcHJvZHVjZSB1c2luZyB0aGUgRG9ja2VyIGltYWdl
Cj4gdXNlZCBpbiBnaXRsYWItY2kuIFNlZSB1dGlscy9kb2NrZXItcnVuLgoKT0ssIEknbGwgdHJ5
IGl0LgoKPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgo+Cj4gPj4KPiA+PiBCZXN0IHJlZ2Fy
ZHMsCj4gPj4gUm9tYWluCj4gPj4KPiA+Pj4KPiA+Pj4gQmVzdCByZWdhcmRzLAo+ID4+PiBSb21h
aW4KPiA+Pj4KPiA+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IGh0dHBzOi8vZGlzY3Vzcy5saW51eGNvbnRh
aW5lcnMub3JnL3QvbHhjLTQtMC0xMS1oYXMtYmVlbi1yZWxlYXNlZC8xMjQyNwo+ID4+Pj4+Cj4g
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Cj4gPj4+Pgo+ID4+Pj4gUmV2aWV3ZWQtYnk6IEpvYWNoaW0gV2liZXJnIDx0cm9n
bG9iaXRAZ21haWwuY29tPgo+ID4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+Pj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+Pj4+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gPj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+Pj4+Cj4gPj4+Cj4gPj4KPiA+IEJlc3QgUmVnYXJk
cywKPiA+Cj4gPiBGYWJyaWNlCj4KQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
