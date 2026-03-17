Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCD6FEDA1A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 20:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61DF6414A1;
	Tue, 17 Mar 2026 20:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDZoOLd4ZmGz; Tue, 17 Mar 2026 20:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6156941516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773777752;
	bh=qeROrpWYsZGSWAI0OnUd/9IaiqVVEkxUekes0AR7hcw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GabsYXGfqzVMLV8FVeckPwpCnHCNb7WrYW3STKssY2UdF7Mn4xXyFcCnaEpv5h9tN
	 T0p+eTlPf0NztvbuVyKn3Uca1cWv1Tv+3jE38dxzxYj9j28v3s8AazRc8FGyM5WE/E
	 cnuhjMf1szbFLZCFuNyCKiNeUDbr+RIeOUDTnfWVM1JeMvmDTU2l/sS+ZCrspT+nTe
	 rraBJxTuspDwMRLhowjgiH/0l3RUv5uGU1U+9jSqU1QM9gey+MdP2LplHjc6u4LJ8r
	 OHFZiiXE2d1304L6ZEAXxolftVFNWobOCUlaDLcyypWKnusUnGoxJ8RKXtzkKeo9AL
	 QtdFOyhNfKE9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6156941516;
	Tue, 17 Mar 2026 20:02:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0927E3BE;
 Tue, 17 Mar 2026 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E363383DC6;
 Tue, 17 Mar 2026 20:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGJ8CZr5JJax; Tue, 17 Mar 2026 20:02:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B363383DC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B363383DC5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B363383DC5;
 Tue, 17 Mar 2026 20:02:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB169B97B8DD; Tue, 17 Mar 2026 21:02:25 +0100 (CET)
To: buildroot-lts-sponsors@buildroot.org, buildroot-users@buildroot.org,
 buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>
Date: Tue, 17 Mar 2026 21:02:23 +0100
Message-ID: <20260317200223.774600-1-arnout@rnout.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1773777746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=QoKWRtK+/mbQQ7XZI2gpbPXV8aP/jFGsRX95jvCtjVo=;
 b=E4qpco7tNFg4KSXmVYh4OOKJHBsLDVwBM3SpVOzII4ugZu+2m647D7ExkO4NiBuHT2fB3H
 +pfrPadFx87M4vUjOHVTjE6PYeDWWoEjlqNZxMYpt34Y7Lm20Gj6dD/MDUMlxBeDL+KCbz
 Zxb4kEPEOYvdpR7kEj/LALU2Zdt0JOOlSneSY/LtNSFcAFE3ol7vp/zb7+j4HqFXF2iMOi
 HqEGTr1+LpGoPvF/aN2z8uE/M7e1HPeReDMy8fgImeS0Yd148F9B1Th5LfRjXekedaIimY
 S9n00cuACXgEYsvpiX/mplg9Z70L4kxTojZQAbMTjuB6IfB6lrqEW/zEemifEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=E4qpco7t
Subject: [Buildroot] Buildroot 2025.02.12 released
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpFeGFjdGx5IDEgeWVhciBhZnRlciB0aGUgcmVsZWFzZSBvZiAyMDI1LjAyLCB3ZSBicmlu
ZyB5b3UgdGhlIDEydGggbW9udGhseQpMVFMgcmVsZWFzZS4gTm9ybWFsbHkgdGhpcyB3b3VsZCBi
ZSB0aGUgbGFzdCBvbmUgb2YgdGhlIHNlcmllcywgYnV0IHRoYW5rcwp0byB0aGUgTFRTIHNwb25z
b3JzaGlwIHByb2dyYW0gd2UgY2FuIGNvbnRpbnVlIHN1cHBvcnRpbmcgMjAyNS4wMiBmb3IgdHdv
Cm1vcmUgeWVhcnMhCgoKQnVpbGRyb290IGlzIGEgc2ltcGxlIHRvb2wgZm9yIGNyZWF0aW5nIGNv
bXBsZXRlIGVtYmVkZGVkIExpbnV4IHN5c3RlbXMKKGh0dHBzOi8vYnVpbGRyb290Lm9yZykuCgpC
dWlsZHJvb3QgMjAyNS4wMi4xMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0
cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyNS4wMi4xMi50YXIuZ3oK
Cm9yCgpodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI1LjAyLjEy
LnRhci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290LmdpdCAoMjAyNS4wMi4xMiB0YWcpCgpCdWlsZHJvb3QgMjAyNS4wMi4x
MiBpcyBhIGJ1Z2ZpeCByZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2Vj
dXJpdHkgcmVsYXRlZCBpc3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNS4wMi4xMSByZWxl
YXNlLgoKCkltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQgZml4ZXM6Cgpib3RhbjogQ1ZFLTIw
MjQtNTAzODIsIENWRS0yMDI0LTUwMzgzCmMtYXJlczogQ1ZFLTIwMjUtNjI0MDgKY29udGFpbmVy
ZDogQ1ZFLTIwMjQtMjU2MjEsIENWRS0yMDI0LTQwNjM1LCBDVkUtMjAyNS00NzI5MSwKICBDVkUt
MjAyNS02NDMyOQpjdXBzOiBDVkUtMjAyNS01ODQzNiwgQ1ZFLTIwMjUtNjE5MTUKZXhpdjI6IENW
RS0yMDI2LTI1ODg0LCBDVkUtMjAyNi0yNzU5NiwgQ1ZFLTIwMjYtMjc2MzEKZmx1aWRzeW50aDog
Q1ZFLTIwMjUtNTYyMjUKZnJlZXJkcDogQ1ZFLTIwMjQtMzI2NjEsIENWRS0yMDI2LTIzNTMwLCBD
VkUtMjAyNi0yMzUzMSwKICBDVkUtMjAyNi0yMzUzMiwgQ1ZFLTIwMjYtMjM1MzMsIENWRS0yMDI2
LTIzNTM0LCBDVkUtMjAyNi0yMzk0OCwKICBDVkUtMjAyNi0yNDY3NSwgQ1ZFLTIwMjYtMjQ2NzYs
IENWRS0yMDI2LTI0Njc5LCBDVkUtMjAyNi0yNDY4MSwKICBDVkUtMjAyNi0yNDY4MiwgQ1ZFLTIw
MjYtMjQ2ODMKZ3JhcGhpY3NtYWdpY2ssIENWRS0yMDI1LTI3Nzk2CmlnbXBwcm94eTogQ1ZFLTIw
MjUtNTA2ODEKaW1hZ2VtYWdpY2s6IENWRS0yMDI2LTIyNzcwLCBDVkUtMjAyNi0yMzg3NCwgQ1ZF
LTIwMjYtMjM4NzYsCiAgQ1ZFLTIwMjYtMjQ0ODEsIENWRS0yMDI2LTI1NjM4LCBDVkUtMjAyNi0y
NTc5NCwgQ1ZFLTIwMjYtMjU3OTUsCiAgQ1ZFLTIwMjYtMjU3OTYsIENWRS0yMDI2LTI1Nzk4LCBD
VkUtMjAyNi0yNTc5OSwgQ1ZFLTIwMjYtMjU4OTcsCiAgQ1ZFLTIwMjYtMjU5ODksIENWRS0yMDI2
LTI2MDY2LCBDVkUtMjAyNi0yNjI4MywgQ1ZFLTIwMjYtMjYyODQsCiAgQ1ZFLTIwMjYtMjY5ODMK
amFzcGVyOiBDVkUtMjAyNS04ODM2LCBDVkUtMjAyNS04ODM3CmxpYnNvdXAzOiBDVkUtMjAyNS0x
NDUyMwpsaWJzc2g6IENWRS0yMDI1LTE0ODIxLCBDVkUtMjAyNi0wOTY0LCBDVkUtMjAyNi0wOTY1
LCBDVkUtMjAyNi0wOTY2LAogIENWRS0yMDI2LTA5NjcsIENWRS0yMDI2LTA5NjgKbGlidHBtczog
Q1ZFLTIwMjYtMjE0NDQKbXVwZGY6IENWRS0yMDI2LTI1NTU2Cm5ldHNubXA6IENWRS0yMDI1LTY4
NjE1CnBhdGNoOiBDVkUtMjAxOC02OTUyLCBDVkUtMjAxOS0yMDYzMwpwb3N0Z3Jlc3FsOiBDVkUt
MjAyNi0yMDAzLCBDVkUtMjAyNi0yMDA0LCBDVkUtMjAyNi0yMDA1LCBDVkUtMjAyNi0yMDA2CnJ0
bF80MzM6IENWRS0yMDI1LTM0NDUwCnNxdWlkOiBDVkUtMjAyNS02MjE2OAp0aW55cHJveHk6IENW
RS0yMDI1LTYzOTM4CnZpbTogQ1ZFLTIwMjYtMjU3NDksIENWRS0yMDI2LTI2MjY5CndwZXdlYmtp
dDogQ1ZFLTIwMjUtMzEyNzMsIENWRS0yMDI1LTMxMjc4LCBDVkUtMjAyNS00MzIxMSwKICBDVkUt
MjAyNS00MzIxMiwgQ1ZFLTIwMjUtNDMyMTYsIENWRS0yMDI1LTQzMjI3LCBDVkUtMjAyNS00MzIy
OCwKICBDVkUtMjAyNS00MzI0MCwgQ1ZFLTIwMjUtNDMyNjUsIENWRS0yMDI1LTQzMjcyLCBDVkUt
MjAyNS00MzM0MiwKICBDVkUtMjAyNS00MzM0MywgQ1ZFLTIwMjUtNDMzNTYsIENWRS0yMDI1LTQz
MzY4LCBDVkUtMjAyNS02NTU4CgpJbmZyYXN0cnVjdHVyZSB1cGRhdGVzL2ZpeGVzOgoKbGludXg6
IG1ha2UgbGljZW5zZSBvcHRpb24gdmlzaWJsZSBmb3IgX0NVU1RPTV9WRVJTSU9OIGFzIHdlbGwK
c3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0czogZml4IERlYmlhbiB0ZXN0aW5nL3Vuc3RhYmxlCgpV
cGRhdGVkIC8gZml4ZWQgcGFja2FnZXM6IGJvdGFuLCBjLWFyZXMsIGNvbnRhaW5lcmQsIGN1cHMs
IGR0YywgZXhpdjIsCiAgZmFrZXRpbWUsIGZsYXNoYmVuY2gsIGZsdWlkc3ludGgsIGZyZWVyZHAs
IGdyYXBoaWNzbWFnaWNrLCBpZ21wcHJveHksCiAgaW1hZ2VtYWdpY2ssIGphc3BlciwgbGlic291
cDMsIGxpYnNzaCwgbGlidHBtcywgbGlidmlwcywgbGlidmlydCwKICBsaWJ6bGliLCBtdXBkZiwg
bmV0c25tcCwgcGF0Y2gsIHBvY28sIHBvc3RncmVzcWwsIHB5dGhvbi1tdWx0aXBhcnQsCiAgcWVt
dSwgcnRsXzQzMywgc3F1aWQsIHRpbnlwcm94eSwgdXRpbC1saW51eCwgdmltLCB3ZWJraXRndGss
IHdtY3RybCwKICB3cGV3ZWJraXQKClJlbW92ZWQgcGFja2FnZXM6IHFlbXUgKGNyaXMgdGFyZ2V0
KQoKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI1LjAyLjEyL0NIQU5HRVMK
ClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0
byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRv
IHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtcyAtbiAyMDI1LjAyLjExLi4KCiAgICAyNwlU
aG9tYXMgUGVyYWxlCiAgICAxNAlCZXJuZCBLdWhscwogICAgIDUJQWRyaWFuIFBlcmV6IGRlIENh
c3RybwogICAgIDQJUGV0ZXIgS29yc2dhYXJkCiAgICAgMQlBbGV4aXMgTG90aG9yw6kKICAgICAx
CURvd2FuIEd1bGxpZW50CiAgICAgMQlNYXJ0aW4gQmFjaG1hbm4KICAgICAxCU1hcnRpbiBCYWNo
bWFubiB2aWEgYnVpbGRyb290CiAgICAgMQlNYXR0aWFzIFdhbHN0csO2bQoKUmVnYXJkcywKQXJu
b3V0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
