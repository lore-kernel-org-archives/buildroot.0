Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88655CCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5DD40D4F;
	Sat, 11 Oct 2025 21:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sxwxc67mKh1o; Sat, 11 Oct 2025 21:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6734D409AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6734D409AE;
	Sat, 11 Oct 2025 21:33:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F2D512B;
 Sat, 11 Oct 2025 21:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 203398130E;
 Sat, 11 Oct 2025 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8o2g1S1g3KN; Sat, 11 Oct 2025 21:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F1F4E812F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F4E812F5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1F4E812F5;
 Sat, 11 Oct 2025 21:33:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AAEF1B978C72; Sat, 11 Oct 2025 23:33:23 +0200 (CEST)
Message-ID: <891a8699-17da-4e43-a300-2a82c61e04c8@rnout.be>
Date: Sat, 11 Oct 2025 23:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr-BE
To: Buildroot Mailing List <buildroot@buildroot.org>,
 ML_BuildrootUsers <buildroot-users@buildroot.org>,
 buildroot-lts-sponsors@buildroot.org
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1760218403; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language;
 bh=J/Rd7SNYkpkUD2DvWbU1j+3HdFy4IiZWdY94yxKpETc=;
 b=HDXhGW8ylCt/adsJjENwCga6oTDi3GF7o8GNS977t/b6vY+HGU4l642oNPcIPDXmlv9u/h
 jmlOtqrbkMhta1XbtwZ9NMpUBvVMJ9UOP49e7FLoTTzFEG6WFeEUyWAVd4nSmKXqUzfjW5
 +AAvKNxWck0XrYw60mT5GFIuIdMDsz5vPXCbKbe9Pzeh9XZ47PUvaUaHlYeSo9CkOKarcD
 y+j8HgoyZ4pEFx13zWo7t+sMHE2Jw6ZhnhYZIpfwcNSm6Q0KSaCdqoGrMx4pX4tiuZvQL1
 1LlkO/qdoNmvhOZEyT2OeqpXZzCRm41edHjkgOnOkqfZX4pH0imeISl2jVsHqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HDXhGW8y
Subject: [Buildroot] Buildroot 2025.08.1 released
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
MDI1LjA4LjEgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMDguMS50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI1LjA4LjEudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI1LjA4LjEgdGFnKQoKQnVpbGRyb290IDIwMjUuMDguMSBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNS4wOCByZWxlYXNlLgoKCiAgICAgSW1wb3J0
YW50IC8gc2VjdXJpdHkgcmVsYXRlZCBmaXhlczoKCiAgICAgLSBhdG9wOiBDVkUtMjAyNS0zMTE2
MAogICAgIC0gY2l2ZXR3ZWI6IENWRS0yMDI1LTU1NzYzCiAgICAgLSBjanNvbjogQ1ZFLTIwMjUt
NTcwNTIKICAgICAtIGNvbm5tYW46IENWRS0yMDI1LTMyMzY2LCBDVkUtMjAyNS0zMjc0MwogICAg
IC0gY3VwczogQ1ZFLTIwMjUtNTgwNjAsIENWRS0yMDI1LTU4MzY0CiAgICAgLSBleHBhdDogQ1ZF
LTIwMjUtNTkzNzUKICAgICAtIGZhc3RkOiBDVkUtMjAyNS0yNDM1NgogICAgIC0gZmV0Y2htYWls
OiBDVkUgbnVtYmVyIHBlbmRpbmcKICAgICAtIGdob3N0c2NyaXB0OiBDVkUtMjAyNS01OTc5OCwg
Q1ZFLTIwMjUtNTk3OTksIENWRS0yMDI1LTU5ODAwLAogICAgICAgICAgICAgICAgICAgIENWRS0y
MDI1LTU5ODAxCiAgICAgLSBpbnRlbC1taWNyb2NvZGU6IENWRS0yMDI1LTIwMDUzLCBDVkUtMjAy
NS0yMDEwOSwgQ1ZFLTIwMjUtMjI4MzksCiAgICAgICAgICAgICAgICAgICAgICAgIENWRS0yMDI1
LTIyODQwLCBDVkUtMjAyNS0yMjg4OSwgQ1ZFLTIwMjUtMjY0MDMKICAgICAtIGphc3BlcjogQ1ZF
LTIwMjMtNTEyNTcsIENWRS0yMDI1LTg4MzUKICAgICAtIGxpYmN1cmw6IENWRS0yMDI1LTEwMTQ4
LCBDVkUtMjAyNS05MDg2CiAgICAgLSBsaWJvcGVuc3NsOiBDVkUtMjAyNS05MjMwLCBDVkUtMjAy
NS05MjMxLCBDVkUtMjAyNS05MjMyCiAgICAgLSBsaWJzc2g6IENWRS0yMDI1LTgxMTQsIENWRS0y
MDI1LTgyNzcKICAgICAtIGx1YTogQ1ZFLTIwMTQtNTQ2MQogICAgIC0gb3BlbmN2NDogQ1ZFLTIw
MjUtNTM2NDQKICAgICAtIHBjcmUyOiBDVkUtMjAyNS01ODA1MAogICAgIC0gcG9jbzogQ1ZFLTIw
MjUtNjM3NQogICAgIC0gcG9zdGdyZXNxbDogQ1ZFLTIwMjUtODcxMywgQ1ZFLTIwMjUtODcxNCwg
Q1ZFLTIwMjUtODcxNQogICAgIC0gcHl0aG9uLWRqYW5nbzogQ1ZFLTIwMjUtNTc4MzMsIENWRS0y
MDI1LTU5NjgxLCBDVkUtMjAyNS01OTY4MgogICAgIC0gcHl0aG9uLXBpcDogQ1ZFLTIwMjUtODg2
OQogICAgIC0gcmFwdG9yOiBDVkUtMjAyNC01NzgyMiwgQ1ZFLTIwMjQtNTc4MjMKICAgICAtIHN5
c2xvZy1uZzogQ1ZFLTIwMjQtNDc2MTkKICAgICAtIHRpZmY6IENWRS0yMDI0LTEzOTc4LCBDVkUt
MjAyNS04OTYxLCBDVkUtMjAyNS05MTY1CgoKICAgICBVcGRhdGVkIC8gZml4ZWQgcGFja2FnZXM6
IGFzdGVyaXNrLCBib2luYywgYm9vdC13cmFwcGVyLWFhcmNoNjQsIGMtaWNhcCwKICAgICBjaG9j
b2xhdGUtZG9vbSwgY2pzb24sIGNwcC1odHRwbGliLCBjdXRla2V5Ym9hcmQsIGRvY2tlci1lbmdp
bmUsIGZhdGNhdCwKICAgICBmbHVlbnQtYml0LCBnbnVwZzIsIGdudXBsb3QsIGh0cGRhdGUsIGlw
dXRpbHMsIGtvZGksIGxpYmZyZWVpbWFnZSwKICAgICBsaWJvcGVuc3NsLCBsaWJzZWxpbnV4LCBs
aWJzZW1hbmFnZSwgbGlieGtiY29tbW9uLCBsaWJ4bWxycGMsCiAgICAgbGludXgtZmlybXdhcmUs
IGxpbnV4cHRwLCBsbHZtLCBsdWFvc3NsLCBsdXZpLCBtYXJpYWRiLCBtZGlvLXRvb2xzLAogICAg
IG1vZHNlY3VyaXR5Miwgb3BlbmpwZWcsIHBhbmdvLCBwaHAtbHVhLCBwb2xpY3ljb3JldXRpbHMs
CiAgICAgcHl0aG9uLWFpb2h0dHAtc2Vzc2lvbiwgcHl0aG9uLWNlcnRpZmksIHB5dGhvbi1jcnlw
dG9ncmFwaHksCiAgICAgcHl0aG9uLWZsYXNrLWNvcnMsIHB5dGhvbi1weXR6LCBweXRob24tdHJv
dmUtY2xhc3NpZmllcnMsCiAgICAgcHl0aG9uLXR5cGluZy1leHRlbnNpb25zLCBydGw4NzIzYnUs
IHJ0bDg3MjNkcywgcnRsODgyMWN1LCBydGw4ODIyY3MsCiAgICAgcnRsXzQzMywgcnVieSwgc2Ft
YmE0LCBzeXNwcm9mLCB0aS1rMy1ib290LWZpcm13YXJlLCB0aWZmLCB0b3IsIHVib290LAogICAg
IHVjbGliYywgdXB4LCB2dWxrYW4taGVhZGVycywgd2Via2l0Z3RrLCB3aWxjLWRyaXZlciwgd2xy
b290cywgeDExcjcsCiAgICAgeGlsaW54LWVtYmVkZGVkc3csIHhpbGlueC1wcmVidWlsdCwgeGxp
Yl94dHJhbnMsIHhyODE5LXhyYWRpbywgenppcGxpYgoKICAgICBCb2FyZHMgdXBkYXRlZCAvIGZp
eGVkOiBiZWFnbGVib25lYWksIGxvb25nYXJjaDY0LWVmaSwgcWVtdSAoYWxsKSwKICAgICB2ZXJz
YWwsIHplZGJvYXJkCgogICAgIEJvYXJkcyByZW1vdmVkOiBhdDkxc2FtOTI2MGVrbmYsIGF0bWVs
X3NhbWE1ZDN4ZWssIHJvc2VhcHBsZXBpCgogICAgIFRlc3QgSW1wcm92ZW1lbnRzOgoKICAgICAt
IHRlc3RfZG9ja2VyX2NvbXBvc2U6IHVwZGF0ZSBrZXJuZWwgJiBWTSBDUFUKICAgICAtIFRlc3Ra
ZnNVY2xpYmM6IHVzZSBpbnRlcm5hbCBiYWNrZW5kIGZvciB1Q2xpYmMtbmcgdG9vbGNoYWluCiAg
ICAgLSBHaXRUZXN0QmFzZTogcmVtb3ZlIGdpdCBkYWVtb24gZHVlIHRvIEdpdGxhYi1DSSBzZWN1
cml0eSBzZXR0aW5ncwoKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoK
aHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI1LjA4
LjEvQ0hBTkdFUwoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBl
bmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250
cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zIC1uIDIwMjUuMDguLgoK
ICAgICAyMSAgVGhvbWFzIFBlcmFsZQogICAgIDE1ICBUaXRvdWFuIENocmlzdG9waGUKICAgICAg
OSAgRGFyaW8gQmluYWNjaGkKICAgICAgOSAgVGhvbWFzIFBldGF6em9uaQogICAgICA4ICBCZXJu
ZCBLdWhscwogICAgICA4ICBOZWFsIEZyYWdlcgogICAgICA4ICBQZXRlciBLb3JzZ2FhcmQKICAg
ICAgNSAgR2l1bGlvIEJlbmV0dGkKICAgICAgNSAgV2FsZGVtYXIgQnJvZGtvcmIKICAgICAgNCAg
QWxleGlzIExvdGhvcsOpCiAgICAgIDQgIEphbWVzIEhpbGxpYXJkCiAgICAgIDQgIFJvbWFpbiBO
YW91cgogICAgICA0ICBTY290dCBGYW4KICAgICAgMyAgRmlvbmEgS2x1dGUgKFdJV0EpCiAgICAg
IDMgIEp1bGllbiBPbGl2YWluCiAgICAgIDIgIEFkYW0gRHVza2V0dAogICAgICAyICBBZHJpYW4g
UGVyZXogZGUgQ2FzdHJvCiAgICAgIDIgIEFuZ2VsbyBDb21wYWdudWNjaQogICAgICAyICBGcmFu
Y29pcyBQZXJyYWQKICAgICAgMiAgVGhvbWFzIERldm9vZ2R0CiAgICAgIDEgIEFsZXggTWNMYWlu
CiAgICAgIDEgIEFybm91dCBWYW5kZWNhcHBlbGxlCiAgICAgIDEgIEJyeWFuIEJyYXR0bG9mCiAg
ICAgIDEgIEZsb3JpYW4gTGFyeXNjaAogICAgICAxICBNYXhpbSBLb2NoZXRrb3YKICAgICAgMSAg
Tmljb2xhcyBDYXZhbGxhcmkKICAgICAgMSAgUmFwaGFlbCBQYXZsaWRpcwogICAgICAxICBSb2Jl
cnQgTWFya28KICAgICAgMSAgVmlhY2hlc2xhdiBCb2NoYXJvdgogICAgICAxICBWaWN0b3IgS3Jh
d2llYwogICAgICAxICBZZWdvciBZZWZyZW1vdgoKUmVnYXJkcywKQXJub3V0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
