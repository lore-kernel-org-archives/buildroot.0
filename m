Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F5DD69103
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 12:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72B44848DA;
	Thu, 28 Nov 2024 12:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 978kH3R79qRr; Thu, 28 Nov 2024 12:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78592848DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78592848DD;
	Thu, 28 Nov 2024 12:16:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E04B11167
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 12:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDB2B402D8
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 12:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UD1DzftrNV4Y for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 12:16:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF37A41998
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF37A41998
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF37A41998
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 12:16:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.106] ([85.22.122.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MStCe-1t7Ejh3gr8-00PXhn; Thu, 28
 Nov 2024 13:16:16 +0100
Message-ID: <ccaa9a31-78f8-4c31-a8e7-e4c75b70030e@gmx.de>
Date: Thu, 28 Nov 2024 13:16:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
 <2577e174-dcce-4da0-b95b-1a391339557b@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <2577e174-dcce-4da0-b95b-1a391339557b@gmx.de>
X-Provags-ID: V03:K1:05pnJf+CMtaS5cUatdXucdSU5LWR6IWo5ZoZN4iGixHI8qGtkBN
 9J06b8MDzsiIIhsAWjzTyI0dTu1CVzqtcre0bkvV0xtbdW+vdnvhKO0gbaGDD912Bn8BRr9
 By2El7LmSzqHRXClC6f8QjeHx8p3gnkibUar8GPuWX8FwXzIuaVeQgHhk57dK1fN9NdoE77
 sdid0gURNX3FzulXAnbZg==
UI-OutboundReport: notjunk:1;M01:P0:iFuS9x4blvM=;L8Aw5VnoSE0Bppf38qID1PhU3qW
 MgavvwkckTj6ZECJ+4ero+Ffhm3+ZO96VRP8OdGiv291r8JIb0Y15KZiylokv4or0s8CJCucf
 Bh1zk0IqRtAnbMTPpRU/A4XpYlT0QPYZgSxkIkQ4Qv4KadPp2ek1o7UbKwHXxpUi3qC/9vTol
 l7qLVu4x9ICkolZO9QLnT770GvpOc4MKeolRZFa9BTvV90sKePqP0yoyMQP2Hq2Jes+XkOQl7
 mvELWjdRKnyQNGRcBn2DQuS4P292WIbtswQXz5bI8rvCUy0qhGruo+IRmztRcTkpURnwICh/o
 3aQ9/WeIwZzVEYeeVXvua3qVlV5ESKeA4mF25khl59NxB/b/RaQuFX7SnnX6JIuAMFORcQs0P
 lh/rwt7kX8BaDoSDYiQsxD+77TKr9qih/a3+c2nFT6A0IMMzBf3vqAgL40FeplOIU1+7LXiwk
 TlhqlbAJXQ/v+6PNXLnFpT10ie4768HwnmAtEMEC4qxFc03iQqJ9tWffVt4gNjw3usK77aaFc
 yKQbhtHsnaXcgnYAFvLIPnAOJwmOxtesy7oYM7wNpDLJxAIsHYH/7NqO9t9FXhRLnTCaG8AAt
 LQ+tJa6udlMreOlE9xF8nz4d5mTQHxT3BSF4/kpEPQ/Oemi1ZEEoM5gXpnGgxIheH9basauTk
 LBBim7WHtgTauBBP00PeR22Y3zJ/lZ6HSytAMZEpXf+ibV+lWVjE/gnTagNLn334dutwu2ATe
 yGe4AbKrIchBe+QbJFiemIpPOZFLeCItO2TejzKj67HHgiqaZjg3YHdu1GiEsIW4CCNeKqT+p
 Ladn7xyldaPcSUkS1utV/EQivZv6Nbxp2rU7FrAeE4zi1Zi/dT47yFmH9UAi2Prr3c/nUjNkv
 XTIksvmxoE60sExRdb+386NQYAoihEoi7qESziypYA3TbsTyFWMbOHTVckyNrFJDWRqDc0GSu
 l5bRz6th3ANZIdJSEt4fxp6nuvPVUww2lTVseI+FODbFROKHlYkB/LSTALJU0bzhkGQduj2wW
 fwazhyxXWMWFaGnpzLRcDiSgpPcCgrZViUeu2bpj4Qbg2JPRrUIoRKYd7IUvT9wa5lB9FCM5e
 uryQveAQCN8sQnSPJd6lgaT+JyRZ1G
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1732796176; x=1733400976; i=fiona.klute@gmx.de;
 bh=KZbcnj9ghou/kACGCX1gq5r+jDdvuRxgMIVuJ/w9xxc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SYW46SYwOW4ErxGscM8NVtSZ/GOx6W1lyRoR87DfOwS/s/fFksJKykyZD6VBQB8e
 /2dEAlmxquc++sS0gQ93mu07elLKOcrV00EAmEz3nKSBl+xUUtqw2oYs5w5eVk0lg
 djZfRCtPiTVxVP9NyQmMo8U8lUYnQf6np0O3p4LQObqdT+H5+UBAhy8kNx0PjQpaU
 5k5pBlbRtwr200HXHpbsybW7Dg9NzwozqJhd60wCH2ocMHXX1qyNTuUb2JtgooN2k
 6y/ux7gEbC5VdDOsSQtDIUudUp2flfqIguATiCzeac2rMdNSxbyKssweGxlwI6SvL
 quzSCdw9iB9BALq9Ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SYW46SYw
Subject: Re: [Buildroot] [PATCH v4 0/6] Improved nftables firewall support
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJIGhvcGUgaXQncyBub3QgdG9vIG11Y2ggdG8gYXNrIGFib3V0IHRoaXMgc2VyaWVzIGFn
YWluLCBoYXZpbmcgbmZ0YWJsZXMKZmlyZXdhbGwgc3VwcG9ydCBpcyBraW5kIG9mIGltcG9ydGFu
dC4gQXNpZGUgZnJvbSBiZWluZyBlc3NlbnRpYWxseQpkZXByZWNhdGVkLCB0aGUgZXhpc3Rpbmcg
aXB0YWJsZXMgaW5mcmFzdHJ1Y3R1cmUgZG9lc24ndCBoYW5kbGUgSVB2NiBhdCBhbGwuCmh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTQx
NjgxMAoKQ291bGQgdGhpcyBnZXQgbWVyZ2VkIHBsZWFzZSwgb3IgYSByZXZpZXcgdGhhdCB0ZWxs
cyBtZSB3aGF0IEkgbmVlZCB0bwpjaGFuZ2UgdG8gZ2V0IHRvIHRoYXQgcG9pbnQ/CgpCZXN0IHJl
Z2FyZHMsCkZpb25hCgpBbSAxNC4wOC4yNCB1bSAxMzoxMSBzY2hyaWViIEZpb25hIEtsdXRlIHZp
YSBidWlsZHJvb3Q6Cj4gSGkgZXZlcnlvbmUsCj4KPiBpcyB0aGVyZSBhbnl0aGluZyBJIGNhbiBk
byB0byBnZXQgdGhpcyBzZXJpZXMgaW50byBuZXh0PyBQYXRjaGVzIDEgYW5kIDIKPiAoaW5pdCBz
Y3JpcHQgZm9yIG5mdGFibGVzIGFuZCBkZWZhdWx0aW5nIHRvIGlwdGFibGVzLW5mdCkgYXJlIHRo
ZQo+IGNyaXRpY2FsIG9uZXMgZm9yIG15IHByb2plY3QsIHRoZSBvdGhlcnMgd291bGQgaW1wcm92
ZSBsb25nIHRlcm0KPiBtYWludGFpbmFiaWxpdHkgaW4gbXkgb3Bpbmlvbi4KPgo+IEJlc3QgcmVn
YXJkcywKPiBGaW9uYQo+Cj4gQW0gMjYuMDcuMjQgdW0gMTg6MjAgc2NocmllYiBGaW9uYSBLbHV0
ZToKPj4gRnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KPj4K
Pj4gVGhpcyBzZXJpZXMgYnVpbGRzIG9uIHR3byBwYXRjaGVzIEkndmUgc2VudCBwcmV2aW91c2x5
IGJlZm9yZSwgd2l0aAo+PiB0aGUgbWFpbiBnb2FsIG9mIHN1cHBvcnRpbmcgZmlyZXdhbGwgY29u
ZmlndXJhdGlvbiB0aHJvdWdoIGFuIG5mdGFibGVzCj4+IHJ1bGVzIGZpbGUuIE9mZmVyaW5nIHRo
ZSBjaG9pY2Ugb2YgaXB0YWJsZXMtbmZ0IGFzIHRoZSBkZWZhdWx0Cj4+IGlwdGFibGVzIGltcGxl
bWVudGF0aW9uIChzbWlsYXIgdG8gZS5nLiB1cGRhdGUtYWx0ZXJuYXRpdmVzIG9uIERlYmlhbikK
Pj4gbWFrZXMgaXQgZWFzaWVyIHRvIGludGVncmF0ZSB0aGF0IHdpdGggbGVnYWN5IGFwcGxpY2F0
aW9ucyB0aGF0IHJlbHkKPj4gb24gdGhlIGlwdGFibGVzIGNvbW1hbmQgKGUuZy4gRG9ja2VyKS4K
Pj4KPj4gQ2hhbmdlcyB2MyAtPiB2NDoKPj4gKiBzZXQgaXA2dGFibGVzIHN5bWxpbmtzIHdoZW4g
c2VsZWN0aW5nIG5mdGFibGVzIGNvbXBhdAo+Pgo+PiBDaGFuZ2VzIHYyIC0+IHYzOgo+PiAqIG1v
dmUgY2hhbmdlIGZyb20gImlwdGFibGVzIC1GIiB0byAiaXB0YWJsZXMgLS1mbHVzaCIgdG8gdGhl
IGNvcnJlY3QKPj4gwqDCoCBwYXRjaCAoMy82KQo+Pgo+PiBDaGFuZ2VzIHYxIC0+IHYyOgo+PiAq
IGFkZCBwYXRjaGVzIDMtNgo+PiAqIGNsYXJpZnkgY29tbWVudHMgJiBjb21taXQgbWVzc2FnZXMK
Pj4gKiBuZnRhYmxlcyBpbml0IHNjcmlwdDogV2FybmluZyBhYm91dCBtaXNzaW5nIGZsdXNoIGlu
IHJ1bGVzZXQgb24gcmVsb2FkCj4+ICogbmZ0YWJsZXMgaW5pdCBzY3JpcHQ6IGNoZWNrIGZvciBy
dWxlcyBmaWxlIG9ubHkgb24gc3RhcnQKPj4gKiBuZnRhYmxlcyBpbml0IHNjcmlwdDogcmV0dXJu
IG5mdCByZXR1cm4gY29kZSBmcm9tIHN0YXJ0L3N0b3AgZnVuY3Rpb25zCj4+ICogaXB0YWJsZXMg
aW5pdCBzY3JpcHQ6IHN0YXJ0IG9ubHkgaWYgcnVsZXMgZmlsZSBleGlzdHMKPj4gKiBhZGQgdGVz
dHMgZm9yIGluaXQgc2NyaXB0cwo+PiAqIHVzZSBsb25nIGZvcm0gb3B0aW9ucyBpbiBpbml0IHNj
cmlwdHMKPj4gKiBmaXggdHlwZWNoZWNrIHdhcm5pbmdzCj4+Cj4+IEZpb25hIEtsdXRlIChXSVdB
KSAoNik6Cj4+IMKgwqAgcGFja2FnZS9uZnRhYmxlczogYWRkIGluaXQgc2NyaXB0Cj4+IMKgwqAg
cGFja2FnZS9pcHRhYmxlczogb3B0aW9uYWxseSBkZWZhdWx0IHRvIG5mdGFibGVzIGNvbXBhdAo+
PiDCoMKgIHBhY2thZ2UvaXB0YWJsZXM6IGNoZWNrIGZvciBydWxlcyBpbiBpbml0IHNjcmlwdAo+
PiDCoMKgIHN1cHBvcnQvdGVzdGluZzogdGVzdCBmb3IgbmZ0YWJsZXMgaW5pdCBzY3JpcHQKPj4g
wqDCoCBzdXBwb3J0L3Rlc3Rpbmc6IGluY2x1ZGUgaW5pdCBzY3JpcHQgaW4gaXB0YWJsZXMgdGVz
dAo+PiDCoMKgIHN1cHBvcnQvdGVzdGluZzogZml4IE15UHkgd2FybmluZ3MgYWJvdXQgQlJDb25m
aWdUZXN0Cj4+Cj4+IMKgIC5jaGVja3BhY2thZ2VpZ25vcmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxIC0KPj4gwqAgREVWRUxPUEVSU8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDEgKwo+PiDCoCBwYWNrYWdlL2lwdGFibGVzL0NvbmZpZy5pbsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTIgKysrKwo+PiDCoCBwYWNrYWdl
L2lwdGFibGVzL1MzNWlwdGFibGVzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDE0ICsrLS0KPj4gwqAgcGFja2FnZS9pcHRhYmxlcy9pcHRhYmxlcy5ta8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMyArKystCj4+IMKgIHBhY2thZ2UvbmZ0YWJsZXMvUzM1
bmZ0YWJsZXPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNjYgKysrKysrKysr
KysrKysrKysrKwo+PiDCoCBwYWNrYWdlL25mdGFibGVzL25mdGFibGVzLm1rwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNSArKwo+PiDCoCBzdXBwb3J0L3Rlc3RpbmcvaW5m
cmEvYmFzZXRlc3QucHnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKy0KPj4gwqAgLi4u
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2lwdGFibGVzLnB5wqDCoMKgIHwgMTggKysrKysK
Pj4gwqAgLi4uL3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzLnB5wqDCoMKgIHwg
MzcgKysrKysrKysrKy0KPj4gwqAgLi4uL3Jvb3Rmcy1vdmVybGF5L2V0Yy9uZnRhYmxlcy5jb25m
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4ICsrKwo+PiDCoCAxMSBmaWxlcyBjaGFuZ2VkLCAxNjkg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL25mdGFibGVzL1MzNW5mdGFibGVzCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzLwo+PiByb290ZnMtb3Zlcmxh
eS9ldGMvbmZ0YWJsZXMuY29uZgo+Pgo+PiAtLQo+PiAyLjQ1LjIKPj4KPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
