Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7C8C27C5F
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 08:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA34605C0;
	Mon, 10 Jun 2024 08:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-n2id4wDiqG; Mon, 10 Jun 2024 08:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D1F0605DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1F0605DA;
	Mon, 10 Jun 2024 08:17:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60B761BF3CA
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 08:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DA83605DA
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 08:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fh9nNJdsDNcF for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 08:17:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 690BE605C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 690BE605C0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 690BE605C0
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 08:16:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E96D4000D
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 08:16:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sGaCz-006scM-1G
 for buildroot@buildroot.org; Mon, 10 Jun 2024 10:16:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jun 2024 10:16:53 +0200
Message-ID: <87plsptdoq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.3 released
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjQuMDIuMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjMudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDI0LjAyLjMgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjQuMDIuMiByZWxlYXNlLgoKLSBGaXhlZCBh
IG51bWJlciBvZiBjb21waWxhdGlvbiBpc3N1ZXMgZm9yIGhvc3RzIHVzaW5nIEdDQyAxNC54LAog
IGluY2x1ZGluZyBmb3Iga2NvbmZpZy4KCi0gRG93bmxvYWQ6CiAgLSBEcm9wIHJlZHVuZGFudCAt
LXBhc3NpdmUtZnRwIGZyb20gZGVmYXVsdCB3Z2V0IG9wdGlvbnMgYW5kIG1pZ3JhdGUgYQogICAg
bnVtYmVyIG9mIHBhY2thZ2VzIHVzaW5nIEZUUCB1cHN0cmVhbXMgdG8gSFRUUChTKSBmb3IgY29t
cGF0aWJpbGl0eQogICAgd2l0aCB3Z2V0MiB3aGljaCBkb2VzIG5vdCBoYXZlIEZUUCBzdXBwb3J0
CgogIC0gRW5zdXJlIGRvd25sb2FkcyBhcmUgY29ycmVjdGx5IHNoYXJlZCBmb3IgaG9zdCBwYWNr
YWdlcyB0aGF0IHRyeSB0bwogICAgZG8gc28gdXNpbmcgPHBrZz5fRExfU1VCRElSIGFuZCBlbnN1
cmUgdGhlIGNvcnJlY3QgdG9wbGV2ZWwKICAgIGRpcmVjdG9yeSBuYW1lIGlzIHVzZWQgaW4gZ2Vu
ZXJhdGVkIHRhcmJhbGxzIHdoZW4gZG93bmxvYWRzIGFyZQogICAgc2hhcmVkLgoKLSBBcmNoOiBF
bmFibGUgU1NFMiBzdXBwb3J0IGZvciB4ODYgUGVudGl1bSBNIHZhcmlhbnQuCgotIERlZmNvbmZp
Z3M6IE9yYW5nZXBpIFBDL1IxLCBSYXNwYmVycnlwaSB6ZXJvMncsIFNpcGVlZCBsaWNoZWVwaSBu
YW5vLAogIFdhbmRib2FyZDogRml4IGNvbXBpbGF0aW9uIGlzc3Vlcy4gUEMgeDg2LTY0IGJpb3Mv
ZWZpOiBhZGQgd2lyZWxlc3MKICByZWdkYiB0byBmaXgga2VybmVsIHdhcm5pbmcgZHVyaW5nIGJv
b3QsIGlNWC44IGJvYXJkczogQWRqdXN0IEZJVAogIGV4dGVybmFsIGRhdGEgcG9zaXRpb24gdG8g
bWF0Y2ggaW14LW1raW1hZ2UgY2hhbmdlcywgZml4aW5nIGJvb3QKICBpc3N1ZXMuCgotIFNlY3Vy
aXR5IGZpeGVzIGZvciBjanNvbiwgZG9ja2VyLWVuZ2luZSwgZnJlZXJkcCwgZ2l0LCBnbywgbGli
YXJjaGl2ZSwKICBsaWJodHAsIGxpYmp3dCwgbGlia3JiNSwgbGlib3BlbnNzbCwgbGlidXJpcGFy
c2VyLCBvcGVuanBlZywgcGhwLAogIHBvc3RncmVzcWwsIHB1dHR5LCBweXRob24tcGlsbG93LCBy
dWJ5LCBzcXVpZCwgc3VyaWNhdGEsIHdwZXdlYmtpdAoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29t
cGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBhcGN1cHNkLAogIGFybS10cnVzdGVk
LWZpcm13YXJlLCBiaW51dGlscy1iYXJlLW1ldGFsLCBicGZ0b29sLCBjYXRjaDIsIGNjYWNoZSwK
ICBjbGFtYXYsIGNtYWtlLCBjb2csIGNvcmV1dGlscywgY3J5cHRvZGV2LWxpbnV4LCBkaGNwY2Qs
IGRtcmFpZCwKICBkbnNtYXNxLCBkb2NrZXItY2xpLCBkb2NrZXItY29tcG9zZSwgZG9vbS13YWQs
IGR1bWEsIGVidGFibGVzLAogIGVsZjJmbHQsIGVsZnV0aWxzLCBldmVtdSwgZ2NjLCBnY2MtYmFy
ZS1tZXRhbCwgZ251cGxvdCwgZ3Itb3Ntb3NkciwKICBmaWxlLCBmcmVlcmFkaXVzLWNsaWVudCwg
ZnJlZXJhZGl1cy1zZXJ2ZXIsIGZsdWlkc3ludGgsCiAgZ3N0MS1wbHVnaW5zLWdvb2QsIGltYWdl
bWFnaWNrLCBpbnRlbC1nbW1saWIsIGl2aS1ob21lc2NyZWVuLAogIGphbnVzLWdhdGV3YXksIGtl
eGVjLCBrbW9kLCBrb2RpLCBsaWJkcm0sIGxpYmVkaXQsIGxpYmZmaSwgbGliZ2xpYjIsCiAgbGli
bWFuZXR0ZSwgbGlibWRieCwgbGlibW5sLCBsaWJuZXRmaWx0ZXJfYWNjdCwgbGlibmV0ZmlsZXJf
bG9nLAogIGxpYm5wdGgsIGxpYnBuZywgbGlidWh0dHBkLCBsaWJ1dGVtcHRlciwgbGlidm5jc2Vy
dmVyLCBsaWJ3cGUsCiAgbGlnaHRuaW5nLCBsaW51eC1maXJtd2FyZSwgbGludXgtcGFtLCBsdWEt
Y2ZmaSwgbHVhaml0LCBsdm0yLCBseW54LAogIG1hcmlhZGIsIG1lc2EzZCwgbWljcm9weXRob24s
IG1pbmlzaWduLCBtdXNsLCBtdXR0LCBuY2Z0cCwKICBuZXR3b3JrLW1hbmFnZXIsIG5ld2xpYi1i
YXJlLW1ldGFsLCBuZmFjY3QsIG5mcy11dGlscywgb2N0YXZlLAogIG9wZW5vY2QsIG9wcm9maWxl
LCBwZXJsLWRiZC1teXNxbCwgcHBwZCwgcHJpdm94eSwgcHJvY3BzLW5nLCBwcm9mdHBkLAogIHBy
b2osIHB5dGhvbi1tbC1kdHlwZXMsIHB5dGhvbi1yZHMtcHksIHFlbXUsIHF0NWJhc2UsIHJlZGlz
LXBsdXMtcGx1cywKICBydGw4MTg5ZnMsIHJ1YnksIHNhbWJhNCwgc2hhZG93LCBzbWNyb3V0ZSwg
c3BlZWNoZCwgc3NjZXAsIHN3dXBkYXRlLAogIHN5c3RlbWQsIHRpLXNneC1rbSwgdGlueWNib3Is
IHRpbnlwcm94eSwgdG9yLCB0cG0yLXRzcywgdHR5ZCwKICB1Ym9vdC10b29scywgdWxvZ2QsIHZh
bGEsIHdlc3RvbiwgeDExdm5jLCB6YmFyLCB6ZXJvbXEsIHpmcywgemlwLAogIHp4aW5nLWNwcAoK
Rm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWls
ZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjQuMDIuMwoKVXNlcnMgb2Yg
dGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUu
CgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxl
YXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDI0LjAyLjIuLgoKICAgIDQ5ICBGYWJyaWNlIEZvbnRh
aW5lCiAgICA0MSAgUGV0ZXIgS29yc2dhYXJkCiAgICAyMiAgSnVsaWVuIE9saXZhaW4KICAgIDE0
ICBCZXJuZCBLdWhscwogICAgIDkgIFBldGVyIFNlaWRlcmVyCiAgICAgOSAgUm9tYWluIE5hb3Vy
CiAgICAgOCAgQnJhbmRvbiBNYWllcgogICAgIDUgIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8KICAg
ICA1ICBKYW1lcyBIaWxsaWFyZAogICAgIDUgIFlhbm4gRS4gTU9SSU4KICAgICA0ICBUaG9tYXMg
UGV0YXp6b25pCiAgICAgMyAgQWxleGFuZGVyIE11a2hpbgogICAgIDMgIERhcmlvIEJpbmFjY2hp
CiAgICAgMyAgR2VybyBTY2h3w6RyaWNrZQogICAgIDMgIEphbiDEjGVybcOhawogICAgIDMgIFdh
bGRlbWFyIEJyb2Rrb3JiCiAgICAgMiAgQW5nZWxvIENvbXBhZ251Y2NpCiAgICAgMiAgRWRnYXIg
Qm9uZXQKICAgICAyICBGaW9uYSBLbHV0ZQogICAgIDIgIE1heGltIEtvY2hldGtvdgogICAgIDIg
IFRob21hcyBEZXZvb2dkdAogICAgIDEgIEFsZXhpcyBMb3Rob3LDqQogICAgIDEgIEFuZHLDqSBa
d2luZwogICAgIDEgIENoYXJsZXMgSGFyZGluCiAgICAgMSAgQ2hlbiBQZWkKICAgICAxICBGbMOh
dmlvIFRhcGFqw7NzCiAgICAgMSAgRnJhbmNvaXMgUGVycmFkCiAgICAgMSAgR2HDq2wgUE9SVEFZ
CiAgICAgMSAgR2l1bGlvIEJlbmV0dGkKICAgICAxICBKLiBOZXVzY2jDpGZlcgogICAgIDEgIEph
cmtrbyBTYWtraW5lbgogICAgIDEgIEpvYWNoaW0gV2liZXJnCiAgICAgMSAgS2lsaWFuIFppbm5l
Y2tlcgogICAgIDEgIEtvbnN0YW50aW4gQWxhZHlzaGV2CiAgICAgMSAgTGVvIFNvYXJlcwogICAg
IDEgIEx1ZG92aWMgRGVzcm9jaGVzCiAgICAgMSAgTWFydGluIELDtmgKICAgICAxICBNYXJ0aW4g
V2hpdGFrZXIKICAgICAxICBNaWNoYWVsIE5vc3Rob2ZmCiAgICAgMSAgUGF1bCBDZXJjdWVpbAog
ICAgIDEgIFJhcGhhw6tsIE3DqWxvdHRlCiAgICAgMSAgUm9iZXJ0IE1hcmtvCiAgICAgMSAgUm95
IEtvbGxlbiBTdmVuZHNlbgogICAgIDEgIFN0ZWZhbiBPdHQKICAgICAxICBTw6liYXN0aWVuIFN6
eW1hbnNraQogICAgIDEgIFRJQU4gWXVhbmhhbwogICAgIDEgIFllZ29yIFllZnJlbW92CiAgICAg
MSAg0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
