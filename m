Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3EBCFA441
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 21:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D0E60A74;
	Thu, 20 Nov 2025 21:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwDA1_7KW5Oe; Thu, 20 Nov 2025 21:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC1B160EA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC1B160EA9;
	Thu, 20 Nov 2025 21:38:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53510122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5084340F5A
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPlqzYVYliCo for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 21:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32D1240E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32D1240E2D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32D1240E2D
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:38:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA7F9B979A4B; Thu, 20 Nov 2025 22:38:05 +0100 (CET)
Message-ID: <f35f9987-0ba1-4a4c-904e-85f8552f00a3@rnout.be>
Date: Thu, 20 Nov 2025 22:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr-BE
To: Buildroot Mailing List <buildroot@buildroot.org>,
 ML_BuildrootUsers <buildroot-users@buildroot.org>,
 buildroot-lts-sponsors@buildroot.org
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763674686; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language;
 bh=Wu20uZcwKKtyiQaVk6DSrYUXME48V4qon0XxoGgrqSo=;
 b=md+pCA/BxLv9vox9NM8mp0TxrKAWeH9Shk/lqBR+O7GyEAO4OcLvcR8ITyCrvoYNzkJvnq
 dxGd8RclBZR9Lymp1i42KljpSAHJguyJfiJOLPf9Iw+J3IRjm1gBaw9ZI8S2BXpOXiEt8l
 CDQ8D7blEzJb+xoY2Jzw0SgongrkFODbuy7SI4lWdAU/U7maOP7OTCVB+vg1mr3+GqPMNV
 lVIubSVWoCFsberSSfJ3YiPXq1bipMWDdPk8ut18ChywlVRrWufEV0TXSn3bIMabuC2q/m
 cEB+HK0SxAk9YNZJXFXSeOULZeR24YXxjElnm9q1icxX6IMDtOAnx4zK2OKWPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=md+pCA/B
Subject: [Buildroot] Buildroot 2025.02.8 released
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cHM6Ly9idWlsZHJvb3Qub3JnKS4KCkJ1aWxkcm9vdCAy
MDI1LjAyLjggaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMDIuOC50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI1LjAyLjgudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI1LjAyLjggdGFnKQoKQnVpbGRyb290IDIwMjUuMDIuOCBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNS4wMi43IHJlbGVhc2UuCgoKSW1wb3J0YW50
IC8gc2VjdXJpdHkgcmVsYXRlZCBmaXhlczoKCi0gYmluZDogQ1ZFLTIwMjUtODY3NywgQ1ZFLTIw
MjUtNDA3NzgsIENWRS0yMDI1LTQwNzgwCi0gZGFudGU6IENWRS0yMDI0LTU0NjYyCi0gZXJsYW5n
OiBDVkUtMjAyNC01Mzg0NiwgQ1ZFLTIwMjUtNDc0OCwgQ1ZFLTIwMjUtMjY2MTgsIENWRS0yMDI1
LTMwMjExLAogICAgICAgICAgIENWRS0yMDI1LTMyNDMzLCBDVkUtMjAyNS00NjcxMiwgQ1ZFLTIw
MjUtNDgwMzgsCiAgICAgICAgICAgQ1ZFLTIwMjUtNDgwMzksIENWRS0yMDI1LTQ4MDQwLCBDVkUt
MjAyNS00ODA0MQotIGhvc3RhcGQ6IENWRS0yMDI1LTI0OTEyCi0gaW1hZ2VtYWdpY2s6IENWRS0y
MDI1LTYyMTcxCi0gaXB0cmFmLW5nOiBDVkUtMjAyNC01Mjk0OQotIGxpYmFyY2hpdmU6IENWRS0y
MDI1LTI1NzI0Ci0gbGliZ2xpYjI6IENWRS0yMDI0LTU0NjYyCi0gbGlidmlwczogQ1ZFLTIwMjUt
Mjk3NjksIENWRS0yMDI1LTU5OTMzCi0gbGlidnB4OiBDVkUtMjAyNS01MjgzCi0gbGlieHNsdDog
Q1ZFLTIwMjUtMjQ4NTUsIENWRS0yMDI0LTU1NTQ5Ci0gbWJlZHRsczogQ1ZFLTIwMjUtNTQ3NjQs
IENWRS0yMDI1LTU5NDM4Ci0gbW9kc2VjdXJpdHkyOiBDVkUtMjAyNS01Mjg5MSwgQ1ZFLTIwMjUt
NTQ1NzEKLSBuZXRkYXRhOiBDVkUtMjAyMy0yMjQ5NiwgQ1ZFLTIwMjMtMjI0OTcKLSBwb3BwbGVy
OiBDVkUtMjAyNC02MjM5LCBDVkUtMjAyNC01NjM3OCwgQ1ZFLTIwMjUtMzIzNjQsCiAgICAgICAg
ICAgIENWRS0yMDI1LTMyMzY1LCBDVkUtMjAyNS00MzkwMywgQ1ZFLTIwMjUtNTA0MjAsCiAgICAg
ICAgICAgIENWRS0yMDI1LTUyODg2Ci0gcHl0aG9uMzogZ2gtMTM5MzEyLCBnaC0xMzk3MDAsIGdo
LTEzOTQwMCwgZ2gtMTM1NjYxLCBnaC0xMzU2NjEsCiAgICAgICAgICAgIGdoLTEwMjU1NSwgZ2gt
MTM1NDYyLCBnaC0xMTgzNTAsIGdoLTg2MTU1Ci0gcHl0aG9uLXdlYnB5OiBDVkUtMjAyNS0zODE4
Ci0gcmVkaXM6IENWRS0yMDI1LTQ2ODE3LCBDVkUtMjAyNS00NjgxOCwgQ1ZFLTIwMjUtNDY4MTks
IENWRS0yMDI1LTQ5ODQ0Ci0gc2FtYmE6IENWRS0yMDI1LTM4MTgsIENWRS0yMDI1LTEwMjMwCi0g
c2hhaXJwb3J0LXN5bmM6IFVwc3RyZWFtIHNlY3VyaXR5IGZpeGVzIHdpdGhvdXQgQ1ZFCi0gc3F1
aWQ6IENWRS0yMDI1LTU5MzYyCi0gc3VyaWNhdGE6IENWRS0yMDI0LTM3MTUxLCBDVkUtMjAyNC0z
ODUzNQotIHRwbTItdHNzOiBDVkUtMjAyNC0yOTA0MAotIHhlcmNlczogQ1ZFLTIwMjQtMjM4MDcK
LSB6YWJiaXg6IENWRS0yMDI1LTI3MjMxLCBDVkUtMjAyNS0yNzIzNiwgQ1ZFLTIwMjUtMjcyMzgs
IENWRS0yMDI1LTQ5NjQxCi0gemlwOiBDVkUtMjAxOC0xMzQxMAoKSW5mcmFzdHJ1Y3R1cmUgdXBk
YXRlcy9maXhlczoKCi0gSW1wcm92ZWQgbWF0Y2hpbmcgb2YgQ1BFIElEIHdpdGggTlZEIGRhdGFi
YXNlLCByZXN1bHRpbmcgaW4gbW9yZQogICBhY2N1cmF0ZSBpZGVudGlmaWNhdGlvbiBvZiBDVkVz
LgotIGJybWFrZTogYXZvaWQgZ2FyYmxlZCBvdXRwdXQgd2l0aCB0b3AtbGV2ZWwgcGFyYWxsZWwg
YnVpbGQKClVwZGF0ZWQgLyBmaXhlZCBwYWNrYWdlczogNHRoLCBhdWRpdCwgYmluZCwgY21ha2Us
IGNydW4sIGRhbnRlLAplYnRhYmxlcywgZXJsYW5nLCBmcmVlcmFkaXVzLXNlcnZlciwgZ3BzZCwg
Z3N0ZCwgaG9zdGFwZCwgaW1hZ2VtYWdpY2ssCmlwdHJhZi1uZywgaW96b25lLCBsZWRtb24sIGxp
YmFyY2hpdmUsIGxpYmN1cmwsIGxpYmRiaS1kcml2ZXJzLApsaWJkaXNwbGF5LWluZm8sIGxpYmds
aWIyLCBsaWJncGhvdG8yLCBsaWJndGszLCBsaWJoZWlmLCBsaWJzZW1hbmFnZSwKbGlic2hvdXQs
IGxpYnNvbHYsIGxpYnRwbXMsIGxpYnZpcHMsIGxpYnZweCwgbGlid3BlLCBsaWJ4c2x0LCBsaW51
eCwKbGludXgtaGVhZGVycywgbGl2ZTU1NSwgbWJlZHRscywgbWljcm9weXRob24sIG1qcGctc3Ry
ZWFtZXIsCm1vZHNlY3VyaXR5MiwgbmV0ZGF0YSwgbmV0c25tcCwgcG9wcGxlciwgcHl0aG9uMywg
cHl0aG9uLWZsYXNrLWNvcnMsCnB5dGhvbi13ZWJweSwgcXVvdGEsIHF0Nm11bHRpbWVkaWEsIHJl
ZGlzLCByZWZwb2xpY3ksIHNhbWJhNCwKc2VsaW51eC1weXRob24sIHNleHBlY3QsIHNoYWlycG9y
dC1zeW5jLCBzaXByb3hkLCBzcWxpdGUsIHNxdWlkLApzdXJpY2F0YSwgdG9yLCB0cG0yLXRzcywg
d2FmZmxlLCB3ZWJraXRndGssIHdpcmVsZXNzLXJlZ2RiLCB3cGV3ZWJraXQsCnhlcmNlcywgemFi
Yml4LCB6aXAKClJlbW92ZWQgcGFja2FnZTogcmFtc3BlZWQKCkJvYXJkcyB1cGRhdGVkIC8gZml4
ZWQ6IGJlYWdsZWJvbmVhaSwgY3ViaWVib2FyZDEsIGN1YmllYm9hcmQyLApzdG0zMmY0MjlfZGlz
Y29feGlwLCBzdG0zMmY3NDZfZGlzY29fc2QsIHN0bTMyZjc2OV9kaXNjb19zZCwKClRlc3QgSW1w
cm92ZW1lbnRzOgoKLSBDYXB0dXJlIG91dHB1dCBvZiBmYWlsaW5nIGNvbW1hbmRzIG9uIGhvc3Qu
CgoKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI1LjAyLjgvQ0hBTkdFUwoK
VXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRv
IHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8g
dGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zIC1uIDIwMjUuMDIuNy4uCgogICAgIDI4ICBC
ZXJuZCBLdWhscwogICAgIDIwICBUaXRvdWFuIENocmlzdG9waGUKICAgICAxMiAgVGhvbWFzIFBl
cmFsZQogICAgIDEwICBEYXJpbyBCaW5hY2NoaQogICAgICA2ICBGaW9uYSBLbHV0ZQogICAgICA0
ICBQZXRlciBLb3JzZ2FhcmQKICAgICAgMiAgQXJub3V0IFZhbmRlY2FwcGVsbGUKICAgICAgMiAg
QmFydWNoIFNpYWNoCiAgICAgIDIgIEZyYW5jb2lzIFBlcnJhZAogICAgICAyICBSb21haW4gTmFv
dXIKICAgICAgMiAgU2NvdHQgRmFuCiAgICAgIDIgIFRob21hcyBEZXZvb2dkdAogICAgICAyICBU
aG9tYXMgUGV0YXp6b25pCiAgICAgIDIgIFlhbm4gRS4gTU9SSU4KICAgICAgMSAgQWRyaWFuIFBl
cmV6IGRlIENhc3RybwogICAgICAxICBHb25nIFpoaWxlCiAgICAgIDEgIEphcmtrbyBTYWtraW5l
bgogICAgICAxICBMZW8gWXUtQ2hpIExpYW5nCiAgICAgIDEgIFJhcGhhZWwgR2FsbGFpcy1Qb3UK
ICAgICAgMSAgVHJhbW1lbGwgSHVkc29uCiAgICAgIDEgIFZpbmNlbnQgU3RlaGzDqQoKUmVnYXJk
cywKQXJub3V0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
