Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7258CF887F
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 21:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A53C8848E9;
	Thu, 20 Nov 2025 21:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vI_5Xynm8C4w; Thu, 20 Nov 2025 21:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C63848EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C63848EB;
	Thu, 20 Nov 2025 21:49:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AA60158;
 Thu, 20 Nov 2025 21:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6128141004;
 Thu, 20 Nov 2025 21:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOPC5bcKLkKz; Thu, 20 Nov 2025 21:49:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55AFA40FC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55AFA40FC6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55AFA40FC6;
 Thu, 20 Nov 2025 21:49:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34276B9799EC; Thu, 20 Nov 2025 22:49:25 +0100 (CET)
Message-ID: <4ec5e145-5c9e-4934-9074-32ddcfa8fbbc@rnout.be>
Date: Thu, 20 Nov 2025 22:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr-BE
To: Buildroot Mailing List <buildroot@buildroot.org>,
 ML_BuildrootUsers <buildroot-users@buildroot.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763675365; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language;
 bh=7Qxp2D+AmkxcRUOs0UZQr9pTJx/NUq+Y0keuQ7Ki0Pk=;
 b=TS8W4WbVrr7LvHysrbKySS6yV3UN0hN/svOQinI1C/rH5rSZ1TpgJzvoseAE4ujtvFjJPo
 Q77g0CAfhiY3R/O8OZjc0xvfumTkWPAlc/DrHIFkZAh+mfI25aviGgNeJZ7ZDoYP75ITeZ
 rDVMRZTZy95o0ciB6c+cL/QRpc1COMsNd4OG2adiH/pkhaxQ7ELOK65z+qpQ9ne7Gjc3zn
 xi60Ku1H5ubF4w2xQys++rH070psIZZYvRLrhpE8VXIsq3iOBiqmoy2V1t//mnnR6O63Ia
 wT7lKZjAEF1ODa74Fztik47nUnFd3LxYNXC2VqtK/HmBPMDgi2ouFO/yHq7vvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=TS8W4WbV
Subject: [Buildroot] Buildroot 2025.08.2 released
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
MDI1LjA4LjIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMDguMi50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI1LjA4LjIudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI1LjA4LjIgdGFnKQoKQnVpbGRyb290IDIwMjUuMDguMiBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNS4wOC4xIHJlbGVhc2UuCgoKSW1wb3J0YW50
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
NTQ1NzEKLSBuZXRkYXRhOiBDVkUtMjAyMy0yMjQ5NiwgQ1ZFLTIwMjMtMjI0OTcKLSBwb2RtYW46
IENWRS0yMDI1LTk1NjYKLSBwb3BwbGVyOiBDVkUtMjAyNC02MjM5LCBDVkUtMjAyNC01NjM3OCwg
Q1ZFLTIwMjUtMzIzNjQsCiAgICAgICAgICAgIENWRS0yMDI1LTMyMzY1LCBDVkUtMjAyNS00Mzkw
MywgQ1ZFLTIwMjUtNTA0MjAsCiAgICAgICAgICAgIENWRS0yMDI1LTUyODg2Ci0gcHl0aG9uMzog
Z2gtMTM5MzEyLCBnaC0xMzk3MDAsIGdoLTEzOTQwMCwgZ2gtMTM1NjYxLCBnaC0xMzU2NjEsCiAg
ICAgICAgICAgIGdoLTEwMjU1NSwgZ2gtMTM1NDYyLCBnaC0xMTgzNTAsIGdoLTg2MTU1Ci0gcHl0
aG9uLXdlYnB5OiBDVkUtMjAyNS0zODE4Ci0gcmVkaXM6IENWRS0yMDI1LTQ2ODE3LCBDVkUtMjAy
NS00NjgxOCwgQ1ZFLTIwMjUtNDY4MTksIENWRS0yMDI1LTQ5ODQ0Ci0gc2FtYmE6IENWRS0yMDI1
LTM4MTgsIENWRS0yMDI1LTEwMjMwCi0gc2hhaXJwb3J0LXN5bmM6IFVwc3RyZWFtIHNlY3VyaXR5
IGZpeGVzIHdpdGhvdXQgQ1ZFCi0gc3F1aWQ6IENWRS0yMDI1LTU5MzYyCi0gc3VyaWNhdGE6IENW
RS0yMDI0LTM3MTUxLCBDVkUtMjAyNC0zODUzNQotIHRwbTItdHNzOiBDVkUtMjAyNC0yOTA0MAot
IHhlcmNlczogQ1ZFLTIwMjQtMjM4MDcKLSB6YWJiaXg6IENWRS0yMDI1LTI3MjMxLCBDVkUtMjAy
NS0yNzIzNiwgQ1ZFLTIwMjUtMjcyMzgsIENWRS0yMDI1LTQ5NjQxCi0gemlwOiBDVkUtMjAxOC0x
MzQxMAoKSW5mcmFzdHJ1Y3R1cmUgdXBkYXRlcy9maXhlczoKCi0gSW1wcm92ZWQgbWF0Y2hpbmcg
b2YgQ1BFIElEIHdpdGggTlZEIGRhdGFiYXNlLCByZXN1bHRpbmcgaW4gbW9yZSBhY2N1cmF0ZQog
ICBpZGVudGlmaWNhdGlvbiBvZiBDVkVzLgotIGJybWFrZTogYXZvaWQgZ2FyYmxlZCBvdXRwdXQg
d2l0aCB0b3AtbGV2ZWwgcGFyYWxsZWwgYnVpbGQKClVwZGF0ZWQgLyBmaXhlZCBwYWNrYWdlczog
NHRoLCBhdWRpdCwgYmluZCwgY21ha2UsIGNydW4sIGRhbnRlLAplYnRhYmxlcywgZXJsYW5nLCBm
cmVlcmFkaXVzLXNlcnZlciwgZnJlZXJkcCwgZ3BzZCwgZ3N0ZCwgaG9zdGFwZCwKaW1hZ2VtYWdp
Y2ssIGlwdHJhZi1uZywgbGVkbW9uLCBsaWJhcmNoaXZlLCBsaWJjdXJsLCBsaWJkYmktZHJpdmVy
cywKbGliZGlzcGxheS1pbmZvLCBsaWJnbGliMiwgbGliZ3Bob3RvMiwgbGliZ3RrMywgbGliaGVp
ZiwgbGliaWNvbnYsCmxpYnNlbWFuYWdlLCBsaWJzaG91dCwgbGlic29sdiwgbGlidHBtcywgbGli
dmlwcywgbGlidnB4LCBsaWJ3cGUsCmxpYnhzbHQsIGxpbnV4LCBsaW51eC1oZWFkZXJzLCBsaXZl
NTU1LCBtYmVkdGxzLCBtaWNyb3B5dGhvbiwKbWpwZy1zdHJlYW1lciwgbW9kc2VjdXJpdHkyLCBu
ZXRkYXRhLCBwb2RtYW4sIHBvcHBsZXIsIHB5dGhvbjMsCnB5dGhvbi1mbGFzay1jb3JzLCBweXRo
b24td2VicHksIHF1b3RhLCBxdDZtdWx0aW1lZGlhLCByZWRpcywgcmVmcG9saWN5LApzYW1iYTQs
IHNoYWlycG9ydC1zeW5jLCBzZWxpbnV4LXB5dGhvbiwgc2V4cGVjdCwgc2lwcm94ZCwgc3FsaXRl
LCBzcXVpZCwKc3VyaWNhdGEsIHRvciwgdHBtMi10c3MsIHdhZmZsZSwgd2Via2l0Z3RrLCB3aXJl
bGVzcy1yZWdkYiwgd3Bld2Via2l0LAp4ZXJjZXMsIHphYmJpeCwgemlwCgpSZW1vdmVkIHBhY2th
Z2U6IHJhbXNwZWVkCgpCb2FyZHMgdXBkYXRlZCAvIGZpeGVkOiBhbmRlc19hZTM1MF80NSwgYmVh
Z2xlYm9uZSwgYmVhZ2xlYm9uZWFpLApjdWJpZWJvYXJkMSwgY3ViaWVib2FyZDIsIGlteDZ1bHpf
YnNoX3NtbV9tMiwgaW14OG1uX2JzaF9zbW1fczIsCmlteDhtbl9ic2hfc21tX3MyX3Bybywgb2xp
bWV4X2EyMF9vbGludXhpbm9fbGltZSosIHN0bTMyZjQyOV9kaXNjb194aXAsCnN0bTMyZjc0Nl9k
aXNjb19zZCwgc3RtMzJmNzY5X2Rpc2NvX3NkLCBzdG0zMm1wMSpfZGsqLCB0aV9hbTYyeF9zawoK
VGVzdCBJbXByb3ZlbWVudHM6CgotIENhcHR1cmUgb3V0cHV0IG9mIGZhaWxpbmcgY29tbWFuZHMg
b24gaG9zdC4KCgoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6CgpodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjUuMDguMi9D
SEFOR0VTCgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291
cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1
dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXMgLW4gMjAyNS4wOC4xLi4KCiAg
ICAgMzIgIEJlcm5kIEt1aGxzCiAgICAgMTcgIFRpdG91YW4gQ2hyaXN0b3BoZQogICAgIDE1ICBE
YXJpbyBCaW5hY2NoaQogICAgIDEwICBUaG9tYXMgUGVyYWxlCiAgICAgIDcgIEZpb25hIEtsdXRl
CiAgICAgIDQgIFBldGVyIEtvcnNnYWFyZAogICAgICAzICBGcmFuY29pcyBQZXJyYWQKICAgICAg
MyAgU2NvdHQgRmFuCiAgICAgIDIgIEFybm91dCBWYW5kZWNhcHBlbGxlCiAgICAgIDIgIEJhcnVj
aCBTaWFjaAogICAgICAyICBUaG9tYXMgRGV2b29nZHQKICAgICAgMiAgWWFubiBFLiBNT1JJTgog
ICAgICAxICBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvCiAgICAgIDEgIEdvbmcgWmhpbGUKICAgICAg
MSAgSmFya2tvIFNha2tpbmVuCiAgICAgIDEgIExlbyBZdS1DaGkgTGlhbmcKICAgICAgMSAgUmFw
aGFlbCBHYWxsYWlzLVBvdQogICAgICAxICBSYXBoYWVsIFBhdmxpZGlzCiAgICAgIDEgIFRob21h
cyBQZXRhenpvbmkKICAgICAgMSAgVHJhbW1lbGwgSHVkc29uCiAgICAgIDEgIFZpbmNlbnQgU3Rl
aGzDqQoKUmVnYXJkcywKQXJub3V0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
