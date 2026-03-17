Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4B5FEDA1A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 20:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E11041685;
	Tue, 17 Mar 2026 20:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lj-q8wr-tJU; Tue, 17 Mar 2026 20:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D8A941688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773778268;
	bh=7otWwMzlXJJoS5GQprxFLvQyg3GV/fJmbW/76tYdCEM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=afqhg1lHkpxhQrjL6/S+czq1Qp8IkFaeiNGW9gdC7F0ZlCkMZgRWcd18J9g5C6Aid
	 ULtqf5ZDC4GSfYdBsUNv/Cba6f/an8vVUuGio22Cw31XWaETmckKcW8epx042Pf465
	 yl7jWAlMb1Gb97WZv4pAOWaIg4kVyDpgePQMf0H5qX8vjxqe9d3QbchmnJCBs2LTxR
	 cKPHR1F5IKExdd5yHTdDuijwGlXRek/PQNdTgzdi8/UwC1w0hYK88YLyjgPqOYBZL9
	 lyM0jDGcC0rqwXR03QAe6h9B/JcYc/i6txIut4FeSMcUzLaRIjsRSFd8VQP7T15/e2
	 AMQWwpw3MV6bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D8A941688;
	Tue, 17 Mar 2026 20:11:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14B2E1B6;
 Tue, 17 Mar 2026 20:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE55740145;
 Tue, 17 Mar 2026 20:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnkQKzfLU1Vr; Tue, 17 Mar 2026 20:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA961400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA961400EA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA961400EA;
 Tue, 17 Mar 2026 20:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23498B97B598; Tue, 17 Mar 2026 21:11:01 +0100 (CET)
To: buildroot-lts-sponsors@buildroot.org, buildroot-users@buildroot.org,
 buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>
Date: Tue, 17 Mar 2026 21:10:59 +0100
Message-ID: <20260317201059.778898-1-arnout@rnout.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1773778262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=qt6ivbj58xoj3br92tZJbjMOIutYdbMCH9fYz4+Q+6U=;
 b=WoclCWcpi9uX2WshwZsDnpY35NMIe1eLaCqQ95ChIHcSMJo70A4XN5kRR1Lo9C+xCVU0st
 HCAx6EXvikTTKA7OMHS42YCd3Tiwt3SdlDOe1eu52lCy3bUGQfkVe7dcVAFxPnK1fdsw3n
 yuTeUUUKksM7UcXfCbqbU2eo3Du/2NuymVzkx5mY2yx8VvgMfpHIgKVPXRvmriS8Mgx+jg
 XKpn29kuqFwSnRLAbrqj6GcosUyL2/muHC3BmzNUSVg87fCFRU7z4xniFabTNKh7D0XvZU
 SAalzaTzneXb2KDC8rsHu65+sebqA0O2ylJTF0gLVkoHn63L5kxeAord3BTuoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=WoclCWcp
Subject: [Buildroot] Buildroot 2025.11.3 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cHM6Ly9idWlsZHJvb3Qub3JnKS4KCkJ1aWxkcm9vdCAy
MDI1LjExLjMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMTEuMy50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI1LjExLjMudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI1LjExLjMgdGFnKQoKQnVpbGRyb290IDIwMjUuMTEuMyBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNS4xMS4yIHJlbGVhc2UuCgoKSW1wb3J0YW50
IC8gc2VjdXJpdHkgcmVsYXRlZCBmaXhlczoKCmJvdGFuOiBDVkUtMjAyNC01MDM4MiwgQ1ZFLTIw
MjQtNTAzODMKYy1hcmVzOiBDVkUtMjAyNS02MjQwOAogICAgICAgIGNsYW1hdjogQ1ZFLTIwMjYt
MjAwMzEKY29udGFpbmVyZDogQ1ZFLTIwMjQtMjU2MjEsIENWRS0yMDI0LTQwNjM1LCBDVkUtMjAy
NS00NzI5MSwKICBDVkUtMjAyNS02NDMyOQpjdXBzOiBDVkUtMjAyNS01ODQzNiwgQ1ZFLTIwMjUt
NjE5MTUKZXhpdjI6IENWRS0yMDI2LTI1ODg0LCBDVkUtMjAyNi0yNzU5NiwgQ1ZFLTIwMjYtMjc2
MzEKZmx1aWRzeW50aDogQ1ZFLTIwMjUtNTYyMjUKZnJlZXJkcDogQ1ZFLTIwMjQtMzI2NjEsIENW
RS0yMDI2LTIzNTMwLCBDVkUtMjAyNi0yMzUzMSwKICBDVkUtMjAyNi0yMzUzMiwgQ1ZFLTIwMjYt
MjM1MzMsIENWRS0yMDI2LTIzNTM0LCBDVkUtMjAyNi0yMzk0OCwKICBDVkUtMjAyNi0yNDY3NSwg
Q1ZFLTIwMjYtMjQ2NzYsIENWRS0yMDI2LTI0Njc5LCBDVkUtMjAyNi0yNDY4MSwKICBDVkUtMjAy
Ni0yNDY4MiwgQ1ZFLTIwMjYtMjQ2ODMKZnJlZXR5cGU6IENWRS0yMDI2LTIzODY1CmdyYXBoaWNz
bWFnaWNrLCBDVkUtMjAyNS0yNzc5NgppZ21wcHJveHk6IENWRS0yMDI1LTUwNjgxCmltYWdlbWFn
aWNrOiBDVkUtMjAyNi0yMjc3MCwgQ1ZFLTIwMjYtMjM4NzQsIENWRS0yMDI2LTIzODc2LAogIENW
RS0yMDI2LTI0NDgxLCBDVkUtMjAyNi0yNTYzOCwgQ1ZFLTIwMjYtMjU3OTQsIENWRS0yMDI2LTI1
Nzk1LAogIENWRS0yMDI2LTI1Nzk2LCBDVkUtMjAyNi0yNTc5OCwgQ1ZFLTIwMjYtMjU3OTksIENW
RS0yMDI2LTI1ODk3LAogIENWRS0yMDI2LTI1OTg5LCBDVkUtMjAyNi0yNjA2NiwgQ1ZFLTIwMjYt
MjYyODMsIENWRS0yMDI2LTI2Mjg0LAogIENWRS0yMDI2LTI2OTgzCmphc3BlcjogQ1ZFLTIwMjUt
ODgzNiwgQ1ZFLTIwMjUtODgzNwpsaWJzb3VwMzogQ1ZFLTIwMjUtMTQ1MjMKbGlic3NoOiBDVkUt
MjAyNS0xNDgyMSwgQ1ZFLTIwMjYtMDk2NCwgQ1ZFLTIwMjYtMDk2NSwgQ1ZFLTIwMjYtMDk2NiwK
ICBDVkUtMjAyNi0wOTY3LCBDVkUtMjAyNi0wOTY4CmxpYnRwbXM6IENWRS0yMDI2LTIxNDQ0Cm11
cGRmOiBDVkUtMjAyNi0yNTU1NgpuZXRzbm1wOiBDVkUtMjAyNS02ODYxNQpwYXRjaDogQ1ZFLTIw
MTgtNjk1MiwgQ1ZFLTIwMTktMjA2MzMKcG9zdGdyZXNxbDogQ1ZFLTIwMjYtMjAwMywgQ1ZFLTIw
MjYtMjAwNCwgQ1ZFLTIwMjYtMjAwNSwgQ1ZFLTIwMjYtMjAwNgpweXRob24tbXVsdGlwYXJ0OiBD
VkUtMjAyNi0yNDQ4NgpydGxfNDMzOiBDVkUtMjAyNS0zNDQ1MApzcXVpZDogQ1ZFLTIwMjUtNjIx
NjgKdGlueXByb3h5OiBDVkUtMjAyNS02MzkzOAp2aW06IENWRS0yMDI2LTI1NzQ5LCBDVkUtMjAy
Ni0yNjI2OQp3cGV3ZWJraXQ6IENWRS0yMDI1LTMxMjczLCBDVkUtMjAyNS0zMTI3OCwgQ1ZFLTIw
MjUtNDMyMTEsCiAgQ1ZFLTIwMjUtNDMyMTIsIENWRS0yMDI1LTQzMjE2LCBDVkUtMjAyNS00MzIy
NywgQ1ZFLTIwMjUtNDMyMjgsCiAgQ1ZFLTIwMjUtNDMyNDAsIENWRS0yMDI1LTQzMjY1LCBDVkUt
MjAyNS00MzI3MiwgQ1ZFLTIwMjUtNDMzNDIsCiAgQ1ZFLTIwMjUtNDMzNDMsIENWRS0yMDI1LTQz
MzU2LCBDVkUtMjAyNS00MzM2OCwgQ1ZFLTIwMjUtNjU1OAoKSW5mcmFzdHJ1Y3R1cmUgdXBkYXRl
cy9maXhlczoKCmxpbnV4OiBtYWtlIGxpY2Vuc2Ugb3B0aW9uIHZpc2libGUgZm9yIF9DVVNUT01f
VkVSU0lPTiBhcyB3ZWxsCnN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHM6IGZpeCBEZWJpYW4gdGVz
dGluZy91bnN0YWJsZQoKVXBkYXRlZCAvIGZpeGVkIHBhY2thZ2VzOiBib3RhbiwgYy1hcmVzLCBj
bGFtYXYsIGNvbnRhaW5lcmQsIGN1cHMsCiAgZG9ja2VyLCBkdGMsIGV4aXYyLCBmYWtldGltZSwg
Zmxhc2hiZW5jaCwgZnJlZXJkcCwgZnJlZXR5cGUsCiAgZ3JhcGhpY3NtYWdpY2ssIGlnbXBwcm94
eSwgaW1hZ2VtYWdpY2ssIGphc3BlciwgbGlic291cDMsIGxpYnNzaCwKICBsaWJ0cG1zLCBsaWJ2
aXBzLCBsaWJ2aXJ0LCBsaWJ6bGliLCBtcGlyLCBtdXBkZiwgbmV0c25tcCwgcGF0Y2gsIHBvY28s
CiAgcG9zdGdyZXNxbCwgcHl0aG9uMywgcHl0aG9uLW11bHRpcGFydCwgcWVtdSwgcnRsXzQzMywg
c2FtYmE0LCBzbm9ydCwKICBzcXVpZCwgdGlueXByb3h5LCB1dGlsLWxpbnV4LCB2aW0sIHdlYmtp
dGd0aywgd2lyZXNoYXJrLCB3bWN0cmwsCiAgd3Bld2Via2l0CgpSZW1vdmVkIHBhY2thZ2VzOiBx
ZW11IChjcmlzIHRhcmdldCksIHB5dGhvbjMgKG9zc2F1ZGlvZGV2KQoKCkZvciBtb3JlIGRldGFp
bHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vYmxvYi8yMDI1LjExLjMvQ0hBTkdFUwoKVXNlcnMgb2YgdGhlIGFmZmVj
dGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRo
YW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0
IHNob3J0bG9nIC1zIC1uIDIwMjUuMTEuMi4uCgogICAgMjUJVGhvbWFzIFBlcmFsZQogICAgMjAJ
QmVybmQgS3VobHMKICAgICA1CUFkcmlhbiBQZXJleiBkZSBDYXN0cm8KICAgICA1CVBldGVyIEtv
cnNnYWFyZAogICAgIDIJSnVsaWVuIE9saXZhaW4KICAgICAxCUFsZXhpcyBMb3Rob3LDqQogICAg
IDEJQXJub3V0IFZhbmRlY2FwcGVsbGUKICAgICAxCURvd2FuIEd1bGxpZW50CiAgICAgMQlNYXJ0
aW4gQmFjaG1hbm4KICAgICAxCU1hcnRpbiBCYWNobWFubiB2aWEgYnVpbGRyb290CiAgICAgMQlN
YXR0aWFzIFdhbHN0csO2bQogICAgIDEJU2h1YmhhbSBDaGFrcmFib3J0eQoKUmVnYXJkcywKQXJu
b3V0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
