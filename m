Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B6606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tofy3cs2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D818811F2;
	Wed, 11 Nov 2026 11:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yO2nqarbCrEZ; Wed, 11 Nov 2026 11:55:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 20699811BB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794398124;
	b=V21Y7kY4h3SKWddSnUOe9jlw6yGa1A7gq3irUIb8d/mvZuAxef3l9blm6lowUvBDBfta
	 fVuEaDCbTZMNKthvR/z6mZth6zg9Wz8q24TtxeXGD+Ack0iCnYMquqtfOzDQScpvZPXz0
	 SO/ybcegwa8pLiDX2/IiSRwE9AptIAECEh757kPhzUHeBaULkxvf8qRIxIXleqH+lSarT
	 QSaq1w8tnCLveT3lWoxZ138TtMffyyHD35BUcsoYQPiFbWVnHvjeMk48i2iMWgQnLks/r
	 nShAUpbMyDobSGisZUnyschq+wXOl6ra6fQD1iDpcBNxdtXCZg9P2H9FKRbPoAKLY7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794398124;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=MsLmFGn2xIzhmR/ExZNY5UjQQ67pux7CgTfPerWcWm8=;
	b=ERQD5exWKj93tx8HWN309vJE8DpQRp1X5uhmN5c9C2QcHx5FT1HipMsy23nRjdc5gS2+
	 e+5B4SYJdLBouhBEvw4l3J6vVCDQqNL6RkiTiwZK1AeGZsj+TlxzZCJOe1TsDq2XHWPi/
	 vFlLCt5R6gMIRwUHTJ/vobMwSfxDoHEt9mmF4cbivqsj2+D7rH1D8oHJfx8YWU2SpZhWI
	 7m6CPrznY7QAyyE/uOMqpFWN2WhNxw4dPSJh7XQbVO9sqPz2wIYl5sVkDZhIGUVzKX/JF
	 NXYvsqesXC3Ee03MwperGx4Bvg4alTyFJVyJYo2UX8KoVFQmu6B4OFzqcvhiFdHdVrA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794398124;
	bh=MsLmFGn2xIzhmR/ExZNY5UjQQ67pux7CgTfPerWcWm8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tofy3cs2bBFPuEsAEVngyLcC23+v0sAxDGs+f6/VpNictsdxY099ilHf3nZ4/SXgM
	 l1+krC6lnywavMIuweL1cWxL2c7tgAMmKFgLSTrg7dk6TuMX4iHreVa6WJLoQrdCZk
	 IJ+3Xm5OKaf2o3N1msVOmZ70LRS9xGjyCIQmtxg+RTu3yvt0p8Qz4eupRA2eHAcm8F
	 1FHmIo0u5CBq+wZaXJQhPc5eSvP7RgOwrOXPEZZsvVgXPS1XteK+SHb32J+e0XmMJH
	 eDw9M+aiuJbaiMFUxXT7UQVaT2t0tLQW/6tzF9HhtCCw9hqo1S2xFoPDRnhlW3G5lY
	 xh1TVuhnFtRXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20699811BB;
	Wed, 11 Nov 2026 11:55:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9378828C
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 849C140217
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbZOnfC2Z417 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:55:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BB289400D5
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB289400D5
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:55:17 +0000 (UTC)
Received: from [IPV6:2a01:e0a:1164:dba0:bf0c:75c5:43f0:4c00] (unknown
 [IPv6:2a01:e0a:1164:dba0:bf0c:75c5:43f0:4c00])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id CBA84180DDE;
 Wed, 11 Nov 2026 12:55:14 +0100 (CET)
Message-ID: <89062ef9-f704-4714-a86f-8bf0f3123f49@grenoble.cnrs.fr>
Date: Wed, 11 Nov 2026 12:55:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
 <20261110215557.2248804-2-angelo.compagnucci@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20261110215557.2248804-2-angelo.compagnucci@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/5] boot/at91bootstrap3: bump 3.x series to
 3.10.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMTEvMjAyNiAyMjo1NSwgQW5nZWxvIENvbXBhZ251Y2NpIHdyb3RlOgo+IFRoZSBwYXRj
aCBmaXhpbmcgdGhlIGJ1aWxkIHdpdGggR0NDIDE1IGlzIG5vdCB1cHN0cmVhbSBpbiAzLjEwLjQg
eWV0Cj4gYW5kIGFwcGxpZXMgYXMgaXM6IGNvcHkgaXQgdG8gdGhlIHYzLjEwLjQgZGlyZWN0b3J5
LiBUaGUgdjMuMTAuMyBjb3B5Cj4gc3RheXMsIHVzZWQgYnkgdGhlIGRlZmNvbmZpZ3MgdGhhdCBm
ZXRjaCB2My4xMC4zIGZyb20gZ2l0Cj4gKGFjbWVzeXN0ZW1zX2FjcXVhX2E1XyogYW5kIGF0OTFz
YW05eDVla18qKS4KPiAKPiBSZWxlYXNlIG5vdGVzOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51
eDRzYW0vYXQ5MWJvb3RzdHJhcC9yZWxlYXNlcy90YWcvdjMuMTAuNAo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZ2VsbyBDb21wYWdudWNjaSA8YW5nZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4KClRl
c3RlZC1ieTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+CkFja2VkLWJ5OiBF
ZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KClNwZWNpZmljYWxseSwgSSBhcHBs
aWVkIHBhdGNoZXMgMSBhbmQgMiBvbiB0b3Agb2YgbWFzdGVyICg3OTY2ZmE5NjA1NTYKInBhY2th
Z2UvbGliY3VybDogZml4IGJ1aWxkIG9uIExvb25nQXJjaCB3aXRoIG11c2wiKSwgYnVpbHQgdGhl
CmFjbWVzeXN0ZW1zX2FjcXVhX2E1XzUxMm1iX2RlZmNvbmZpZywgYm9vdGVkIG9uIGFuIEFjcXVh
IDUxMsKgTWlCCmJvYXJkLCBhbmQgbG9nZ2VkLWluIG9uIHRoZSBzZXJpYWwgY29uc29sZS4KCkJl
c3QgcmVnYXJkcywKCkVkZ2FyLgoKPiAtLS0KPiAgYm9vdC9hdDkxYm9vdHN0cmFwMy9Db25maWcu
aW4gICAgICAgICAgICAgICAgIHwgIDQgKy0KPiAgYm9vdC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9v
dHN0cmFwMy5oYXNoICAgICAgIHwgIDIgKy0KPiAgLi4uY29uZGl0aW9uYWxseS1kZWZpbmUtYm9v
bC1mYWxzZS1hbmQtLnBhdGNoIHwgNDcgKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBib290L2F0OTFib290c3RyYXAzL3YzLjEwLjQvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29u
ZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBh
L2Jvb3QvYXQ5MWJvb3RzdHJhcDMvQ29uZmlnLmluIGIvYm9vdC9hdDkxYm9vdHN0cmFwMy9Db25m
aWcuaW4KPiBpbmRleCA4M2QzYTAyMTIxLi42MTgxZjM5YmIxIDEwMDY0NAo+IC0tLSBhL2Jvb3Qv
YXQ5MWJvb3RzdHJhcDMvQ29uZmlnLmluCj4gKysrIGIvYm9vdC9hdDkxYm9vdHN0cmFwMy9Db25m
aWcuaW4KPiBAQCAtMjIsNyArMjIsNyBAQCBjb25maWcgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQ
M19MQVRFU1RfVkVSU0lPTgo+ICAJYm9vbCAiNC4wLjAiCj4gIAo+ICBjb25maWcgQlIyX1RBUkdF
VF9BVDkxQk9PVFNUUkFQM19MQVRFU1RfVkVSU0lPTl8zWAo+IC0JYm9vbCAiMy4xMC4zIgo+ICsJ
Ym9vbCAiMy4xMC40Igo+ICAKPiAgY29uZmlnIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VT
VE9NX0dJVAo+ICAJYm9vbCAiQ3VzdG9tIEdpdCByZXBvc2l0b3J5Igo+IEBAIC02MSw3ICs2MSw3
IEBAIGVuZGlmCj4gIGNvbmZpZyBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX1ZFUlNJT04KPiAg
CXN0cmluZwo+ICAJZGVmYXVsdCAidjQuMC4wIiBpZiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAz
X0xBVEVTVF9WRVJTSU9OCj4gLQlkZWZhdWx0ICJ2My4xMC4zIiBpZiBCUjJfVEFSR0VUX0FUOTFC
T09UU1RSQVAzX0xBVEVTVF9WRVJTSU9OXzNYCj4gKwlkZWZhdWx0ICJ2My4xMC40IiBpZiBCUjJf
VEFSR0VUX0FUOTFCT09UU1RSQVAzX0xBVEVTVF9WRVJTSU9OXzNYCj4gIAlkZWZhdWx0IEJSMl9U
QVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVkVSU0lPTiBcCj4gIAkJaWYgQlIyX1RB
UkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fR0lUIHx8IEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJB
UDNfQ1VTVE9NX1NWTgo+ICAJZGVmYXVsdCAiY3VzdG9tIglpZiBCUjJfVEFSR0VUX0FUOTFCT09U
U1RSQVAzX0NVU1RPTV9UQVJCQUxMCj4gZGlmZiAtLWdpdCBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMv
YXQ5MWJvb3RzdHJhcDMuaGFzaCBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMu
aGFzaAo+IGluZGV4IGU2MTFmMTYzYzkuLjk3MjdhODg4NTAgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9h
dDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5oYXNoCj4gKysrIGIvYm9vdC9hdDkxYm9vdHN0
cmFwMy9hdDkxYm9vdHN0cmFwMy5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gICMgTG9jYWxseSBj
YWxjdWxhdGVkCj4gLXNoYTI1NiAgYjZhZTViY2FhY2M1YTk0OWY0MDAxODJlMDM2YWUwNTMwNDk2
Mzg0NDRhM2JhOGIxZGQxNTRlYzVmNzg5OGQ4ZSAgYXQ5MWJvb3RzdHJhcDMtdjMuMTAuMy50YXIu
Z3oKPiArc2hhMjU2ICBiNmI0Y2Q0YjEyN2VmYmUxMDM3NTQ2NzNkMjhlYjJhYmI5NzcyYjUzNzhk
OWM4Y2JmYzAxYzYzYjU4ZDI3NDUxICBhdDkxYm9vdHN0cmFwMy12My4xMC40LnRhci5nego+ICBz
aGEyNTYgIDA4YzViOTVkZjI4YmU3ZjJlMDQzOWZiMmI3N2ZlMjc1MjRmOTdjNDk5ODUwNjQxZTQ1
NDBjMDdlYTBiMmMyNWQgIGF0OTFib290c3RyYXAzLXY0LjAuMC50YXIuZ3oKPiAgc2hhMjU2ICA1
YTM4MDliMWMyYmExM2I3MjQyNTcyMzIyOTUxMzExYzU4NDQxOWYxZjg1MTZmNjY1ZDZjMDZmMDY2
OGQ3OGRlICBMSUNFTlNFUy9NSVQudHh0Cj4gZGlmZiAtLWdpdCBhL2Jvb3QvYXQ5MWJvb3RzdHJh
cDMvdjMuMTAuNC8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29s
LWZhbHNlLWFuZC0ucGF0Y2ggYi9ib290L2F0OTFib290c3RyYXAzL3YzLjEwLjQvMDAwMS1pbmNs
dWRlLXR5cGVzLmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4zNTJjMWMwYTQzCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuNC8wMDAxLWluY2x1
ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gKPiBA
QCAtMCwwICsxLDQ3IEBACj4gK0Zyb20gOTA4YzY1Njc4ODY3NTY1YTkzNGVhNWE5NjdiZmU3ZTIw
NGQxY2NhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogRWRnYXIgQm9uZXQgPGJv
bmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4gK0RhdGU6IFdlZCwgMjUgSnVuIDIwMjUgMTE6MTM6NDMg
KzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBpbmNsdWRlL3R5cGVzLmg6IGNvbmRpdGlvbmFsbHkg
ZGVmaW5lIGJvb2wsIGZhbHNlIGFuZCB0cnVlCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVu
Y29kaW5nOiA4Yml0Cj4gKwo+ICtpbmNsdWRlL3R5cGVzLmggdHlwZWRlZnMg4oCYYm9vbOKAmSBh
bmQgbWFjcm8tZGVmaW5lcyDigJhmYWxzZeKAmSBhbmQg4oCYdHJ1ZeKAmS4KPiArSG93ZXZlciwg
c2luY2UgQzIzLCB0aGVzZSBhcmUgcHJlZGVmaW5lIGtleXdvcmRzLiBBcyBDMjMgaXMgdGhlIGRl
ZmF1bHQKPiArQyBkaWFsZWN0IGZvciBHQ0MgMTUsIGJ1aWxkaW5nIHdpdGggdGhpcyBjb21waWxl
ciBmYWlscyB3aXRoOgo+ICsKPiArICAgIGluY2x1ZGUvdHlwZXMuaDoyMzoyMzogZXJyb3I6IOKA
mGJvb2zigJkgY2Fubm90IGJlIGRlZmluZWQgdmlhIOKAmHR5cGVkZWbigJkKPiArICAgICAgIDIz
IHwgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7Cj4gKyAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICBefn5+Cj4gKyAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IG5vdGU6IOKAmGJv
b2zigJkgaXMgYSBrZXl3b3JkIHdpdGgg4oCYLXN0ZD1jMjPigJkgb253YXJkcwo+ICsKPiArRml4
IHRoaXMgYnVpbGQgZmFpbHVyZSBieSBvbmx5IGRlZmluaW5nIOKAmGJvb2zigJksIOKAmGZhbHNl
4oCZIGFuZCDigJh0cnVl4oCZIG9uIEMKPiArZGlhbGVjdHMgb2xkZXIgdGhhbiBDMjMuCj4gKwo+
ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NHNhbS9hdDkxYm9vdHN0cmFwL3B1
bGwvMTg4Cj4gK1tFZGdhcjogYmFja3BvcnQgdG8gdjMuMTAuM10KPiArCj4gK1NpZ25lZC1vZmYt
Ynk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+ICstLS0KPiArIGluY2x1
ZGUvdHlwZXMuaCB8IDMgKysrCj4gKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4g
Kwo+ICtkaWZmIC0tZ2l0IGEvaW5jbHVkZS90eXBlcy5oIGIvaW5jbHVkZS90eXBlcy5oCj4gK2lu
ZGV4IDEyNDZhNGRmLi4yYzFhNDFjZiAxMDA2NDQKPiArLS0tIGEvaW5jbHVkZS90eXBlcy5oCj4g
KysrKyBiL2luY2x1ZGUvdHlwZXMuaAo+ICtAQCAtNDIsOCArNDIsMTEgQEAgdHlwZWRlZiBzaWdu
ZWQgbG9uZyBsb25nIHM2NDsKPiArIHR5cGVkZWYgdW5zaWduZWQgbG9uZyBzaXplX3Q7Cj4gKyB0
eXBlZGVmIHNpZ25lZCBsb25nIHNzaXplX3Q7Cj4gKyAKPiArKy8qIGJvb2wsIGZhbHNlIGFuZCB0
cnVlIGFyZSBwcmVkZWZpbmVkIHNpbmNlIEMyMy4gKi8KPiArKyNpZiBfX1NURENfVkVSU0lPTl9f
IDwgMjAyMzExTAo+ICsgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7Cj4gKyAjZGVmaW5lIGZh
bHNlCTBVCj4gKyAjZGVmaW5lIHRydWUJMVUKPiArKyNlbmRpZgo+ICsgCj4gKyAjZW5kaWYgLyog
VFlQRVNfSF8gKi8KPiArLS0gCj4gKzIuNDMuMAo+ICsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
