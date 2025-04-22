Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2898CC369D1
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D383C404E1;
	Tue, 22 Apr 2025 21:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfqSd0rlKWoE; Tue, 22 Apr 2025 21:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125B240571
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125B240571;
	Tue, 22 Apr 2025 21:20:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC1841A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A58C940861
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucUAc3W9vZfp for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C15DF40571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C15DF40571
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C15DF40571
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:20:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 423091C0DFB; Tue, 22 Apr 2025 23:19:59 +0200 (CEST)
Message-ID: <b42bf2fb-b533-43b9-bbf7-bfdaae144b54@rnout.be>
Date: Tue, 22 Apr 2025 23:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Buildroot Mailing List <buildroot@buildroot.org>,
 ML_BuildrootUsers <buildroot-users@buildroot.org>,
 buildroot-lts-sponsors@buildroot.org
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1745356799; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=lPONKLZPk8knprIRUfY6hVdYk9CXe6HYmi1yzUgFYqQ=;
 b=dw94A20YfNBJH2MtaR+KU62K6uF4MDbr+W2ylAU6mit3jq9liy6zR2zN8kk7nlH1VP57a5
 uVRIJrS/2RGSWLCTp+j9bSWz8mbqWiiuBIx7adBARxJhqe6XkhMwdURFWGI3tNP3xTcsxc
 RrMaq+SpOFJ4l0pCE4Wp8PU904gxAHyGUqhUfB1zwtdWofw79HCEhw8+bX/l8fzVUFQ2ug
 uyrz2s4eAN+HWA40vsweRp3QEZljaNyTq4w9hZicfR2Mt4RsXwILF6W7IPaBc7+HXGdVgQ
 +YOp/KE8vA1tZsP+8s++EL3q1qOE+A+F2BwXgtcHuy6kpuBIWIZzIv4il3BL4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: [Buildroot] Buildroot 2024.11.4 released
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
MDI0LjExLjQgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMTEuNC50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjExLjQudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjExLjQgdGFnKQoKTm90aWNlIHRoYXQgdGhlIDIwMjQuMDIueCBzZXJpZXMg
aXMgbm93IGVuZCBvZiBsaWZlLiBQbGVhc2UgbWlncmF0ZSB0bwp0aGUgMjAyNS4wMi54IHNlcmll
cyBpbnN0ZWFkLgoKCkJ1aWxkcm9vdCAyMDI0LjExLjQgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4
aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2Nv
dmVyZWQgc2luY2UgdGhlIDIwMjQuMTEuMyByZWxlYXNlLgoKSW1wb3J0YW50IC8gc2VjdXJpdHkg
cmVsYXRlZCBmaXhlczoKCi0geHNlcnZlcl94b3JnLXNlcnZlciAmIHh3YXlsYW5kOiBDVkUtMjAy
NC05NjMyLCBDVkUtMjAyNS0yNjU5NCwKIMKgwqDCoENWRS0yMDI1LTI2NTk1LCBDVkUtMjAyNS0y
NjU5NiwgQ1ZFLTIwMjUtMjY1OTcsIMKgQ1ZFLTIwMjUtMjY1OTgKIMKgwqDCoENWRS0yMDI1LTI2
NTk5LCBDVkUtMjAyNS0yNjYwMCwgQ1ZFLTIwMjUtMjY2MDEuCi0gZXhpbTogQ1ZFLTIwMjUtMzAy
MzIuCi0gbWJlZHRsczogQ1ZFLTIwMjUtMjc4MDksIENWRS0yMDI1LTI3ODEwLgotIGF1Z2Vhczog
Q1ZFLTIwMjUtMjU4OC4KLSBsaWJhcmNoaXZlOiBDVkUtMjAyNC01Nzk3MCwgQ1ZFLTIwMjUtMTYz
MiwgQ1ZFLTIwMjUtMjU3MjQuCi0geHdheWxhbmQ6IENWRS0yMDI0LTMxMDgxLCBDVkUtMjAyNC0z
MTA4MywgQ1ZFLTIwMjQtOTYzMiwKIMKgwqDCoENWRS0yMDI1LTI2NTk0LCBDVkUtMjAyNS0yNjU5
NSwgQ1ZFLTIwMjUtMjY1OTYsCiDCoMKgwqBDVkUtMjAyNS0yNjU5NywgQ1ZFLTIwMjUtMjY1OTgs
IENWRS0yMDI1LTI2NTk5LAogwqDCoMKgQ1ZFLTIwMjUtMjY2MDAsIENWRS0yMDI1LTI2NjAxCi0g
bGlib3BlbmgyNjQ6IENWRS0yMDI1LTI3MDkxLgotIGxpYm1vZHNlY3VyaXR5OiBDVkUtMjAyNS0y
NzExMC4KLSB0aW55eG1sMjogQ1ZFLTIwMjQtNTA2MTUuCgpVcGRhdGVkL2ZpeGVkIHBhY2thZ2Vz
OgoKbGliZ2VvcywgZnJlZXJkcCwgbGlic291cDMsIGNhaXJvLCBsaW51eCwgYXByLCBtYWxpLWRy
aXZlciwKbGliY29hcCwgcHl0aG9uLWZhc3RhcGksIHB5dGhvbi10d2lzdGVkLCB0b3IsIG1jLCBs
aW51eC1oZWFkZXIsCmxpbnV4LXRvb2xzLgoKVGVzdCBJbXByb3ZlbWVudHM6CgotIGxpbnV4LXRv
b2xzOiBzZWxmdGVzdHM6IEFkZCBwYXRoIGNvbnRhaW5pbmcgQlBGIGJpbmFyeS4KLSB0ZXN0aW5n
OiBhZGQgZ2l0IHJ1bnRpbWUgdGVzdC4KCkluZnJhc3RydWN0dXJlIHVwZGF0ZXMvZml4ZXM6Cgot
IERFVkVMT1BFUlM6IGNoYW5nZSBhcm5vdXQncyBhZGRyZXNzLgotIERFVkVMT1BFUlM6IGFkZCBE
YXJpbyBCaW5hY2NoaSBmb3IgdGktazMtYm9vdC1maXJtd2FyZS4KLSBzdXBwb3J0L2Rvd25sb2Fk
L3N2bjogdXNlICdzdm4gaW5mbycgd2hpdGggTENfQUxMPUMqKi4KLSBkaWxsbzogRml4IGFuIGlz
c3VlIHJlbGF0ZWQgdG8gX1NJVEUgdXJsIGZvciBtYWtlIHNob3ctaW5mby4KLSBrY29uZmlnOiBI
YW5kbGUgYmFja3NwYWNlICheSCkga2V5LgotIHBrZy1zdGF0czogYWRkIC12Ly0tdmVyYm9zZSBv
cHRpb24KCkJ1aWxkIGlzc3Vlcy9wcm9ibGVtcyBzb2x2ZWQgZm9yOgoKZnJlZXN3aXRjaCwgZ2xp
YmMsIHY0bDJsb29wYmFjaywgbHMxMDI4YXJkYiwgbHMxMDI4YXJkYiwKbWVzYTNkLWRlbW9zLgoK
CkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI0LjExLjQvQ0hBTkdFUwoKVXNl
cnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVw
Z3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhp
cyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zIC1uIDIwMjQuMTEuMy4uCgogwqDCoMKgwqA3IMKg
QmVybmQgS3VobHMKIMKgwqDCoMKgNCDCoFBldGVyIEtvcnNnYWFyZAogwqDCoMKgwqA0IMKgVGhv
bWFzIFBlcmFsZQogwqDCoMKgwqAzIMKgSnVsaWVuIE9saXZhaW4KIMKgwqDCoMKgMiDCoENvbGlu
IEV2cmFyZAogwqDCoMKgwqAyIMKgRGFyaW8gQmluYWNjaGkKIMKgwqDCoMKgMiDCoEZpb25hIEts
dXRlIChXSVdBKQogwqDCoMKgwqAyIMKgR2lsbGVzIEJhcmRvdXgKIMKgwqDCoMKgMiDCoE1hcmN1
cyBIb2ZmbWFubgogwqDCoMKgwqAyIMKgTmlrbGFzIENhc3NlbAogwqDCoMKgwqAyIMKgVGhvbWFz
IERldm9vZ2R0CiDCoMKgwqDCoDIgwqBUaG9tYXMgUGV0YXp6b25pCiDCoMKgwqDCoDEgwqBBcm5v
dXQgVmFuZGVjYXBwZWxsZQogwqDCoMKgwqAxIMKgRnJhbmsgVmFuYmV2ZXIKIMKgwqDCoMKgMSDC
oEdpdWxpbyBCZW5ldHRpCiDCoMKgwqDCoDEgwqBNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlubwog
wqDCoMKgwqAxIMKgTWF4aW0gS29jaGV0a292CiDCoMKgwqDCoDEgwqBQZXRlciBTZWlkZXJlcgog
wqDCoMKgwqAxIMKgUmFwaGHDq2wgTcOpbG90dGUKIMKgwqDCoMKgMSDCoFJvbWFpbiBOYW91cgog
wqDCoMKgwqAxIMKgU8OpYmFzdGllbiBTenltYW5za2kKIMKgwqDCoMKgMSDCoFlhbm4gRS4gTU9S
SU4KClJlZ2FyZHMsCkFybm91dAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
