Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7312606A331
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 19:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nDOAwVdp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8209D814C8;
	Thu, 19 Nov 2026 19:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKJiq8ZcCiOa; Thu, 19 Nov 2026 19:11:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 25C30814BE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795115476;
	b=UZVUtISFtpDElZC5i0c8OQ27HWLkevw4DhGgkL6WzTQKhp94qgLPit25354CG/5hGv5h
	 s3xVFrvv/HQI5+gIW2uHJBM4cIXX1gkpydSwTwmr1kDr0zFpMt8/p6yRk4nKRqXGmZPAp
	 1SJv4yBx5KA7e9LsQjBhiSZVaMJMuDPXeAzdbY6wkgdOHiWUI2A0GH0mtD5irwexdiVYA
	 +jwnOi+zK0j6yjEzpUgQlQG1umYqykgctjDY8HIKByx+yyFuCz58PqstU/ye9/WQM6CmA
	 uky4FfdrcfYBEW+JNYPfHc2Sbt2wKr5Kb5zzMGjJDl6/bQAxY1836ZmXa/zg/nAHjnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795115476;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fIchME8D/qri07I2PY1wKBF4mL7GUMT7Xzw4uJNr1GE=;
	b=IbLn+rv2ZSd45DjzkHYbhuw/MaSjlHdwqZbnWkyoYXxcEJseI+3oFfivriZLm1wGDGWQ
	 mdiZUPqJfsQZKEp1+QYMmv9/zPSRs1XNgs8odKZUhc32PjiqB1QJrdvqB9w1lxIb/7NKA
	 O3kY225+COW5y6gupn908ZsxSq2P5Mv4REJOxXNF60mcLPG/J5VsrufRR2jqhLxsLT78O
	 DI0QpcnDz6mctKAc0lnRNBE6kAajcq+vi+6u9hxaBy4+2rzvV84L2GdZ9vZBz8OpxFa2m
	 eBf9UaaQxg3e5KmYgM0d0u+VnNvyElKwve8Uc9+1Cxz2Cq6QdbGBd+r4VvWkefJBlcA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795115476;
	bh=fIchME8D/qri07I2PY1wKBF4mL7GUMT7Xzw4uJNr1GE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nDOAwVdp0BKn+o1w3M+RyKvmgyeuWq26CxEbeFtqzUh4XgNw10GUfrmURxGEMiPdG
	 wExwFVFxxVSB/EmgI+PE9givEHZGkz6ysvQ3+qvuoDE5MVCZdIBn/dLKKrHcobUCQe
	 iv1YR/Ihx6PlhHepRZO9MWYsGJDM5zbIKqoYzqQOngYUF0dt4nWtYdXVMHZTDLuhda
	 g+4oTw+cSVJN9d2+NuNdqXbG54IY5yVsf5y4Xp8i3yFWgRGN0MWqEsvfYL+2kL95xl
	 7r3JUxaZwlNXSU8kyyep5ZqkXUKO9TfJ3nbhjsrjS0JJXJFYl6c/aOuNLEPFFf5FVW
	 e4IdpPwTLJfsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C30814BE;
	Thu, 19 Nov 2026 19:11:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 532F83A8
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 19:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 450698148B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 19:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZUzM-7wOmFd for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 19:11:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EAA1881479
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAA1881479
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 19:11:13 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6EF452C856C7;
 Thu, 19 Nov 2026 20:11:10 +0100 (CET)
Message-ID: <f58b0f4e-4b55-489e-b085-cef908777a9a@bubu1.eu>
Date: Thu, 19 Nov 2026 20:11:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261119161753.490766-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20261119161753.490766-1-thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to v22.23.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTkvMjYgMTc6MTcsIFRob21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBG
b3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcmVsZWFzZSwgc2VlOgo+ICAgLSBodHRwczov
L2dpdGh1Yi5jb20vbm9kZWpzL25vZGUvcmVsZWFzZXMvdGFnL3YyMi4yMy41Cj4gICAtIGh0dHBz
Oi8vbm9kZWpzLm9yZy9lbi9ibG9nL3Z1bG5lcmFiaWxpdHkvbm92ZW1iZXItMjAyNi1zZWN1cml0
eS1yZWxlYXNlcwo+IAo+IEl0IGZpeGVzIHRoZSBmb2xsb3dpbmcgdnVsbmVyYWJpbGl0aWVzOgo+
IAo+IC0gQ1ZFLTIwMjYtMTIzODYzOiBodHRwMjogcmVsZWFzZSBoZWFkZXJzIHdoZW4gYSBzdHJl
YW0gaXMgcmVtb3ZlZCAoTWF0dGVvIENvbGxpbmEpIOKAkyBIaWdoCj4gLSBDVkUtMjAyNi0xMjM4
NjQ6IHRscyxodHRwOiBwcmV2ZW50IG5lc3RlZCBwYXJzZXIgZXhlY3V0aW9uIGZyb20gZW1wdHkg
d3JpdGVzIChNYXR0ZW8gQ29sbGluYSkg4oCTIEhpZ2gKPiAtIENWRS0yMDI2LTEyMzg2NTogaHR0
cDI6IGRldGVjdCBzdHJlYW1zIGFiYW5kb25lZCBieSBuZ2h0dHAyIChNYXR0ZW8gQ29sbGluYSkg
4oCTIEhpZ2gKPiAtIENWRS0yMDI2LTEyMzg2NjogaHR0cDI6IHJldGFpbiBidWZmZXJzIHVudGls
IHNvY2tldCB3cml0ZXMgZmluaXNoIChNYXR0ZW8gQ29sbGluYSkg4oCTIEhpZ2gKPiAtIENWRS0y
MDI2LTEyMzg3MjogdGxzOiBkaXNhYmxlIHJlc3VtcHRpb24gZm9yIG1UTFMgd2l0aCBubyBzZXNz
aW9uIGlkIGNvbnRleHQgKFRpbSBQZXJyeSkg4oCTIEhpZ2gKPiAtIENWRS0yMDI2LTEyMzg3Mjog
dGxzOiBkb24ndCBhbGxvdyByZW5lZ290aWF0aW9uIG9yIEhSUiB0byBjaGFuZ2UgU05JIChUaW0g
UGVycnkpIOKAkyBIaWdoCj4gLSBDVkUtMjAyNi0xMjM4NzI6IHRsczogZG9uJ3QgYWxsb3cgVExT
IHJlc3VtcHRpb24gdG8gY2hhbmdlIFNOSSAoVGltIFBlcnJ5KSDigJMgSGlnaAo+IC0gQ1ZFLTIw
MjYtMTIzODc0OiBodHRwMjogcmV0YWluIHN0cmVhbXMgZHVyaW5nIHBlbmRpbmcgd3JpdGVzIChN
YXR0ZW8gQ29sbGluYSkg4oCTIEhpZ2gKPiAtIENWRS0yMDI2LTEyMzgyODogaHR0cDI6IGF2b2lk
IG92ZXJmbG93aW5nIEFMVFNWQyBidWZmZXJzIChNYXR0ZW8gQ29sbGluYSkg4oCTIE1lZGl1bQo+
IC0gQ1ZFLTIwMjYtMTIzODY3OiB0bHM6IGFwcGx5IHRoZSBDQSBvZiBTTkkgY29udGV4dHMgd2l0
aG91dCBhIGNlcnRpZmljYXRlIChNYXR0ZW8gQ29sbGluYSkg4oCTIE1lZGl1bQo+IC0gQ1ZFLTIw
MjYtMTIzODY4OiBodHRwMjogY2hhcmdlIGluYm91bmQgREFUQSByZXRhaW5lZCBieSBzdHJlYW1z
IHRvIG1heFNlc3Npb25NZW1vcnkgKE1hdHRlbyBDb2xsaW5hKSDigJMgTWVkaXVtCj4gLSBDVkUt
MjAyNi0xMjM4NzE6IGh0dHA6IHJlZGFjdCBwcm94eSBjcmVkZW50aWFscyBpbiBpbnZhbGlkIHBy
b3h5IFVSTCBlcnJvcnMgKE1hdHRlbyBDb2xsaW5hKSDigJMgTWVkaXVtCj4gLSBDVkUtMjAyNi0x
MjM4NzU6IGh0dHAyOiBndWFyZCBhZ2FpbnN0IG51bGwgd3JpdGUgcmVxdWVzdCBvbiBjYW5jZWxs
ZWQgc3RyZWFtIChNYXR0ZW8gQ29sbGluYSkg4oCTIE1lZGl1bQo+IC0gQ1ZFLTIwMjYtMTIzODc3
OiBodHRwczogaXNvbGF0ZSBBZ2VudCBUTFMgcG9saWN5IGtleXMgKE1hdHRlbyBDb2xsaW5hKSDi
gJMgTWVkaXVtCj4gLSBDVkUtMjAyNi0xMjM4Mjk6IHBlcm1pc3Npb246IGRvIG5vdCBsZWFrIGRl
bmllZCBkZXNjZW5kYW50cyBpbiByZWN1cnNpdmUgZnMud2F0Y2ggKFJhZmFlbEdTUykg4oCTIExv
dwo+IC0gQ1ZFLTIwMjYtMTIzODYyOiB6bGliOiBoYW5kbGUgcGFyYW1zIGNhbGxiYWNrIGFmdGVy
IGRlc3Ryb3kgKE1hdHRlbyBDb2xsaW5hKSDigJMgTG93Cj4gLSBDVkUtMjAyNi0xMjM4NzM6IHBl
cm1pc3Npb246IGNoZWNrIGhlYXAgc25hcHNob3QgZGVzdGluYXRpb24gKFJhZmFlbEdTUykg4oCT
IExvdwo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWlu
ZC5iZT4KPiAtLS0KQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcyEKCkkgYWRkZWQgdHdvIG1vcmUg
c2VjdXJpdHkgcmVsZXZhbnQgbm90ZXMgdG8gdGhlIGNvbW1pdCBtZXNzYWdlOgoKWW91IHNraXBw
ZWQgQ1ZFLTIwMjYtMTA2MDcxLCB3aGljaCBpcyBhbHNvIGZpeGVkIGluIHRoaXMgcGF0Y2ggcmVs
ZWFzZS4gCkl0J3MgbWVudGlvbmVkIGluIHRoZSBibG9nIHBvc3RzLCBidXQgbm90IGluIHRoZSBn
aXRodWIgcmVsZWFzZSBub3Rlcy4gCkFuZCB0aGUgQ1ZFIGlzL3dhcyBJIHRoaW5rIGFsc28gd3Jv
bmdseSBzY29wZWQgdG8gbm9kZSAyNi54IG9ubHksIGV2ZW4gCnRob3VnaCB0aGUgYnVnIGFwcGxp
ZXMgdG8gMjQueCBhbmQgMjIueCBhcyB3ZWxsIGFuZCBnb3QgYmFja3BvcnRlZCAKY29ycmVjdGx5
LgoKVGhlIG90aGVyIHRoaW5ncyBpcyAoYW5kIHdoaWNoIEkgZm91bmQgYSBiaXQgc3VycHJpc2lu
ZyB0YmgpIHRoYXQgd2UgCmJ1aWxkIG5vZGVqcyBhZ2FpbnN0IGl0J3MgYnVuZGxlZCBzcWxpdGUs
IHdoaWNoIGdvdCB1cGRhdGVkIGhlcmUgYW5kIApmaXhlcyBhIGJ1bmNoIG9mIHZ1bG5lcmFiaWxp
dGllcyBhcyB3ZWxsLgoKSSBoYXZlbid0IGxvb2tlZCBpZiB0aGF0J3MgZGVsaWJlcmF0ZSBvciBh
biBvdmVyc2lnaHQuIEknZCBoYXZlIGV4cGVjdGVkIAp0aGF0IHdlIHVzZSB0aGUgYnVpbGRyb290
IHBhY2thZ2VzIHNxbGl0ZSwgYnV0IHRoYXQncyBhcHBhcmVudGx5IG5vdCB0aGUgCmNhc3NlLgoK
QmVzdCwKTWFyY3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
