Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67A9D2629A
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 19:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B986080B;
	Tue, 20 Jan 2026 19:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7f6Q-c1wM6L; Tue, 20 Jan 2026 19:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6EC460844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768938818;
	bh=n2trfO4kZq4L4rlwSsU4EOxmnA86GP7pFlKk6B3p7Fo=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oP6vXz8pDmAJOKZsr8e8N3+qjRW/qdPxSIiU8+3fpfssnpnY4aXs4+UbkerMdMcYI
	 jkGDfd0lIKJZhO/EyEzd4OCV96EoO5yXRq8NgTzKWWyXjI1xeky7+Qnn6BteX8KUOQ
	 /NAVlQo/j9z1l0l8OPJ4Y6vPZiAV9CgAwuE1QfDtRZxeuGumB2jnzOTAKYX4suTJOe
	 ZR1gWwZiT4Z9rPiH74gEn6azrLshdvgf/do/AP96Wk8sx28qRlaBcDSpHMTrQLdTbq
	 O5PCKVKDGbeX6KWePEF4CZf9Td/ROxHmzToDELQpH01YstDdAHpBTKsvVlFWlKy5jj
	 +CGZzFNZzGgWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6EC460844;
	Tue, 20 Jan 2026 19:53:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 969BC169
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C0D160844
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Oilzg20aXYb for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 19:53:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FD0B6080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD0B6080B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FD0B6080B
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:53:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D45AFB9775A2; Tue, 20 Jan 2026 20:53:32 +0100 (CET)
Message-ID: <9b9654f8-6cdd-4108-b932-79509e455148@rnout.be>
Date: Tue, 20 Jan 2026 20:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr-BE
To: Buildroot Mailing List <buildroot@buildroot.org>,
 buildroot-lts-sponsors@buildroot.org,
 ML_BuildrootUsers <buildroot-users@buildroot.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768938813; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language;
 bh=xJ6Br2eP2nC6lzqo9l3gwVWnX8cKT8ueOT7VLDoTAW0=;
 b=gyM1IrCaKbRh/LrFFxtUb/ll13nqc6Of8b8Ms6VVTI23DDqpaOn41kCKkNjcAP53ucumVg
 0XDmBdgy3cQz4WFxuzXIIGJ69ASTYULgY3cIf5DxgqhPj0qUtmE0DYvdwEru9nrwRYf5A5
 iU3Q0JCSaEik4XR2znr+7oJylefXd2KDjpUHI09tY0nzKWbEwA9rPp0jONVLZTZkd1KnrV
 dqdRfjQvnuVDsWZQEBYd4DNXWVYRJ/W8UhApHB/Z/4A+05zZGr1EfhLJpoT5w9XnYNlPWL
 VHTCF4KWld4JGMYBP8dmFbvaEiHK+pYUopipRZWgc79I0IYLMAbjGxXDnoy5Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=gyM1IrCa
Subject: [Buildroot] Buildroot 2025.02.10 released
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
MDI1LjAyLjEwIGlzIHJlbGVhc2VkIC0gR28gZG93bmxvYWQgaXQgYXQ6CgpodHRwczovL2J1aWxk
cm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI1LjAyLjEwLnRhci5negoKb3IKCmh0dHBz
Oi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMDIuMTAudGFyLnh6CgpP
ciBnZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QuZ2l0ICgyMDI1LjAyLjEwIHRhZykKCkJ1aWxkcm9vdCAyMDI1LjAyLjEwIGlzIGEgYnVn
Zml4IHJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLwpzZWN1cml0eSByZWxh
dGVkIGlzc3VlcyBkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDI1LjAyLjkgcmVsZWFzZS4KCgpJbXBv
cnRhbnQgLyBzZWN1cml0eSByZWxhdGVkIGZpeGVzOgoKYXBhY2hlOiBDVkUtMjAyNS01NTc1Mywg
Q1ZFLTIwMjUtNTgwOTgsIENWRS0yMDI1LTU5Nzc1LCBDVkUtMjAyNS02NTA4MiwKICAgQ1ZFLTIw
MjUtNjYyMDAKY3J5cHRzZXR1cApkcm9wYmVhcjogQ1ZFLTIwMjUtMTQyODIsIENWRS0yMDE5LTYx
MTEKZXhpbTogQ1ZFLTIwMjUtNjc4OTYKZ251cGcyCmltYWdlbWFnaWNrOiBDVkUtMjAyNS02NjYy
OApsaWJhcmNoaXZlCmxpYmNvYXA6IENWRS0yMDI1LTU5MzkxLCBDVkUtMjAyNS02NTQ5MywgQ1ZF
LTIwMjUtNjU0OTQKICAgQ1ZFLTIwMjUtNjU0OTUsIENWRS0yMDI1LTY1NDk2LCBDVkUtMjAyNS02
NTQ5NywgQ1ZFLTIwMjUtNjU0OTgsCiAgIENWRS0yMDI1LTY1NDk5LCBDVkUtMjAyNS02NTUwMCwg
Q1ZFLTIwMjUtNjU1MDEKbGliY3VybDogQ1ZFLTIwMjUtMTMwMzQsIENWRS0yMDI1LTE0MDE3LCBD
VkUtMjAyNS0xNDUyNCwKICAgQ1ZFLTIwMjUtMTQ4MTksIENWRS0yMDI1LTE1MDc5LCBDVkUtMjAy
NS0xNTIyNApsaWJmY2dpOiBDVkUtMjAyNS0yMzAxNi4KbGliZnJlZWltYWdlOiBDVkUtMjAxOS0x
MjIxMSwgQ1ZFLTIwMTktMTIyMTMsIENWRS0yMDIwLTI0MjkyLAogICBDVkUtMjAyMC0yNDI5Mywg
Q1ZFLTIwMjAtMjQyOTUsIENWRS0yMDIxLTMzMzY3LCBDVkUtMjAyMS00MDI2MywKICAgQ1ZFLTIw
MjEtNDAyNjYsIENWRS0yMDIzLTQ3OTk1LCBDVkUtMjAyMy00Nzk5NwpsaWJwbmc6IENWRS0yMDI1
LTY2MjkzCmxpYnVyaXBhcnNlcjogQ1ZFLTIwMjUtNjc4OTkKbGlieHNsdDogQ1ZFLTIwMjUtNzQy
NCwgQ1ZFLTIwMjUtOTcxNCwgQ1ZFLTIwMjUtMTE3MzEKbGluZW5vaXNlOiBDVkUtMjAyNS05ODEw
CnBlcmw6IENWRS0yMDI1LTQwOTA5CnBocDogQ1ZFLTIwMjUtMTQxNzcsIENWRS0yMDI1LTE0MTc4
LCBDVkUtMjAyNS0xNDE4MApweXRob24tZGphbmdvOiBDVkUtMjAyNS0xMzM3MiwgQ1ZFLTIwMjUt
NjQ0NjAKcHl0aG9uLWZpbGVsb2NrOiBDVkUtMjAyNS02ODE0NgpweXRob24tZm9udHRvb2xzOiBD
VkUtMjAyNS02NjAzNApweXRob24tdXJsbGliMzogQ1ZFLTIwMjUtNjY0NzEsIENWRS0yMDI1LTY2
NDE4CnVuYm91bmQ6IENWRS0yMDI1LTExNDExCnZsYwp4c2VydmVyX3hvcmctc2VydmVyOiBDVkUt
MjAyNS02MjIyOSwgQ1ZFLTIwMjUtNjIyMzAsCiAgIENWRS0yMDI1LTYyMjMxCnh3YXlsYW5kOiBD
VkUtMjAyNS02MjIyOSwgQ1ZFLTIwMjUtNjIyMzAsIENWRS0yMDI1LTYyMjMxCgpJbmZyYXN0cnVj
dHVyZSB1cGRhdGVzL2ZpeGVzOgoKLSBwa2ctc3RhdHMgdXNlIEhFQUQgcmVxdWVzdCAmIHVuaXF1
ZSBIVFRQIHVzZXItYWdlbnQKLSBjdmUtY2hlY2s6IGRvbid0IGZhaWwgd2l0aCB1bmtub3duIENW
RQotIGdlbmVyYXRlLWN5Y2xvbmVkeDogc3VwcG9ydCAncmVzb2x2ZWRfd2l0aF9wZWRpZ3JlZScK
LSB0ZXN0aW5nOiBhZGQgaG9zdCBiaW4gZGlyIHRvIFBBVEgKLSB0ZXN0aW5nOiBhZGQgbGliaWlv
IHB5dGhvbiBiaW5kaW5ncyBydW50aW1lIHRlc3QKLSB0ZXN0aW5nOiBkZHJlc2N1ZTogdXNlIGRt
c2V0dXAgZnJvbSBsdm0yCi0gdGVzdGluZzogZGRyZXNjdWU6IHVzZSBmLXN0cmluZyBmb3IgdGVz
dCBjb25maWcKLSB0ZXN0aW5nOiBhZGQgdGlvIHJ1bnRpbWUgdGVzdAotIGFkZCAnQ1ZFOicgdHJh
aWxlciBpbiB2YXJpb3VzIHBhdGNoZXMKLSBhZGQgbWQ1IGhhc2ggYW5kIHVwZGF0ZSB0YXJiYWxs
IHVybCB0byB2YXJpb3VzIHB5dGhvbiBwYWNrYWdlcwotIHRlc3Rpbmc6IGx0cC10ZXN0c3VpdGU6
IHJlcGxhY2UgcnVubHRwIGJ5IGtpcmsKLSB0ZXN0aW5nOiBuZXcga3ZtdG9vbCBydW50aW1lIHRl
c3QKLSBnaXRpZ25vcmU6IGlnbm9yZSB1dGlscy9icm1ha2UgbG9nIG91dHB1dCBuYW1lZCBgYnIu
bG9nYAotIHRlc3Rpbmc6IGFkZCBvcHVzLXRvb2xzIHJ1bnRpbWUgdGVzdAotIHRlc3Rpbmc6IGFk
ZCBmbGFjIHJ1bnRpbWUgdGVzdAoKVXBkYXRlZCAvIGZpeGVkIHBhY2thZ2VzOiBhcGFjaGUsIGFy
bS10cnVzdGVkLWZpcm13YXJlLCBhdGYsIGF1ZGl0LApiaXRjb2luLCBib29zdCwgYnVzeWJveCwg
Y2FnZSwgY21ha2UsIGNvbGxlY3RsLCBjcHBjbXMsIGNwdWxpbWl0LApjcnlwdHNldHVwLCBkYnVz
LCBkbXJhaWQsIGRyb3BiZWFyLCBlbWJpZ2dlbi1kaXNrLCBldmlsd20sIGV4aW0sIGZpY2wsCmZv
bnRjb25maWcsIGdsaWJjLCBnbnVwZzIsIGdycGMsIGd2ZnMsIGltYWdlbWFnaWNrLCBrdm10b29s
LCBsZWRtb24sCmxpYmFyY2hpdmUsIGxpYmNvYXAsIGxpYmNwcHJlc3RzZGssIGxpYmN1cmwsIGxp
YmRpbGwsIGxpYmZjZ2ksCmxpYmZyZWVpbWFnZSwgbGliZ2l0MiwgbGliZ3RrMywgbGliZ3RrNCwg
bGliaWlvLCBsaWJtYnVzLCBsaWJwbmcsCmxpYnNlbGludXgsIGxpYnRpcnBjLCBsaWJ1cG5wLCBs
aWJ1cmlwYXJzZXIsIGxpYnhtbDIsIGxpYnhzbHQsIGxpbmVub2lzZSwKbGludXgtdG9vbHMsIGx0
dG5nLW1vZHVsZXMsIGx1Z2FydSwgbWF0Y2hib3gtZmFrZWtleSwgbWF0Y2hib3gta2V5Ym9hcmQs
Cm1hdGNoYm94LWxpYiwgbWF0Y2hib3gtcGFuZWwsIG1vc2gsIG5mcy11dGlscywgb3Blbi1sbGRw
LCBvcGVuY3Y0LApvcGVuY3Y0LWNvbnRyaWIsIG9wZW5qZGssIHBlcmwsIHBlcmwtZGJkLW15c3Fs
LCBwZXJsLW1vemlsbGEtY2EsIHBocCwgcGlneiwKcGl4bWFuLCBweXRob24tYnJvdGxpLCBweXRo
b24tY2VydGlmaSwgcHl0aG9uLWRqYW5nbywgcHl0aG9uLWZpbGVsb2NrLApweXRob24tZm9udHRv
b2xzLCBweXRob24tcHlxdDUsIHB5dGhvbi11cmxsaWIzLCBxdDVlbmdpbmlvLCBxdDV3ZWJraXQs
CnF0NmJhc2UsIHJhY2Vob3VuZCwgcmRlc2t0b3AsIHJwY2JpbmQsIHJwaS1maXJtd2FyZSwgc29m
dGV0aGVyLCBzb2Z0aHNtMiwKc3BpY2UsIHNzZHAtcmVzcG9uZGVyLCBzd2F5LCBzeXNwcm9mLCB0
aW8sIHRyaW5pdHksIHR6ZGF0YSwgdWJvb3QsIHVjbGliYywKdW5ib3VuZCwgdmltLCB2bGMsIHhk
cml2ZXJfeGY4Ni12aWRlby1pbnRlbCwgeGVuLCB4aW5ldGQsCnhsaWJfbGlieHNobWZlbmNlLCB4
c2VydmVyX3hvcmctc2VydmVyLCB4dmtiZCwgeHdheWxhbmQsIHppYywgenhpbmctY3BwCgpSZW1v
dmVkIHBhY2thZ2VzOiBvcGVuY3YzICdwcm90b2J1ZicsIG9wZW5jdjMgJ2ZmbXBlZycKCgpGb3Ig
bW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNS4wMi4xMC9DSEFOR0VTCgpVc2VycyBv
ZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFk
ZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJl
bGVhc2U6CgpnaXQgc2hvcnRsb2cgLXMgLW4gMjAyNS4wMi45Li4KCiAgICAgNjcgIEJlcm5kIEt1
aGxzCiAgICAgNDcgIFRob21hcyBQZXJhbGUKICAgICAyOCAgVGhvbWFzIFBldGF6em9uaQogICAg
IDEyICBHaXVsaW8gQmVuZXR0aQogICAgIDEyICBKdWxpZW4gT2xpdmFpbgogICAgICA2ICBNYXJj
dXMgSG9mZm1hbm4KICAgICAgNSAgRmlvbmEgS2x1dGUKICAgICAgNSAgRnJhbmNvaXMgUGVycmFk
CiAgICAgIDUgIFBldGVyIEtvcnNnYWFyZAogICAgICAzICBBbGV4aXMgTG90aG9yw6kKICAgICAg
MyAgRGFyaW8gQmluYWNjaGkKICAgICAgMyAgSmFtZXMgS25pZ2h0CiAgICAgIDMgIE1pY2hhZWwg
Tm9zdGhvZmYKICAgICAgMyAgVGhvbWFzIERldm9vZ2R0CiAgICAgIDMgIFdhbGRlbWFyIEJyb2Rr
b3JiCiAgICAgIDIgIEFybm91dCBWYW5kZWNhcHBlbGxlCiAgICAgIDIgIFJhcGhhZWwgUGF2bGlk
aXMKICAgICAgMiAgVGl0b3VhbiBDaHJpc3RvcGhlCiAgICAgIDEgIEZsb3JpYW4gRmFpbmVsbGkK
ICAgICAgMSAgSmFtZXMgSGlsbGlhcmQKICAgICAgMSAgSm9zZXBoIEtvZ3V0CiAgICAgIDEgIEth
ZGFtYmluaSBOZW1hCiAgICAgIDEgIEx1Y2EgQ2VyZXNvbGkKICAgICAgMSAgTWF0dCBKb2huc3Rv
bgogICAgICAxICBOZWFsIEZyYWdlcgogICAgICAxICBOaWNvbGFzIENhdmFsbGFyaQogICAgICAx
ICBQZXRlciBTZWlkZXJlcgogICAgICAxICBQaGlsaXAgTW9sbG95CiAgICAgIDEgIFBpZXJyZS1Z
dmVzIEtlcmJyYXQKICAgICAgMSAgUHJleWFzCiAgICAgIDEgIFByZXlhcyBTaGFybWEKICAgICAg
MSAgU8OpYmFzdGllbiBTenltYW5za2kKICAgICAgMSAgVGjDqW8gTGVicnVuCiAgICAgIDEgIFZp
bmNlbnQgU3RlaGzDqQoKUmVnYXJkcywKQXJub3V0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
