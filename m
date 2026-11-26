Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE6606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gvSnBvQ1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D37F381164;
	Thu, 26 Nov 2026 15:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NcQV8VFplkL; Thu, 26 Nov 2026 15:41:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79C398115C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795707679;
	b=o7GTl9PW7eNwWJrfbGH8f1gCr3nhHMItjimDNcaAQIEND1280bsULIKix/b1JcgapE/V
	 l5qwFsHBTI6J+n5/Kszcgd/mgGECjzWLLskhg4ISb2gC3yKOxkCa1z10u5vE9oHm3DvkV
	 jEb+iaZC651/z+YxdTT4fgwnzJ4bw+Ol8iY9Jo88zKlLLo4w/sQ0mJK1VON0CjAdLCHlo
	 oyMs/QGAGwJzfJMLDZAv5cuohLnfy9mBnRdYoOGB8XuMu1kNBCeHdvhhGNpqR+uIDlt6u
	 z+KBoFZk2RP73tnUAYZfVTUnOT515vy52a+PsxExCSCFBF7K66jFCMWt08TBbhwhq5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795707679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:Message-Id:To:Mime-Version:X-Mailer:References:
	 In-Reply-To:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0xDkMqL51Js3v2CKBQWZhL2ue/lILnPwKkjqV8xbUAA=;
	b=rlL1sI6LAKX4YRBCKe89CkDmGRrtFyAkiIoskpe05IsvIZOx3bPbwIpS+Dhyqet15Mp3
	 HL/F6rk/eN8n73nd1AgwQSorYBojLF9XFrOGS8W2yU8B0iBehBiVzZLLmBCrNAidGVw8M
	 DKtrXaVG7zwtkR/zOj3e5EbuAtiT+k3hw5eFffaitTFTtnNnHPkOPcLruUWrwkKlvQfSJ
	 bj2ONA/y7k/JbhJwwA2BoWtQIGbKYxY9TusdbLA26qpbqJRf71JObVUpfGxVtaGaKhD8p
	 vvUKh7pudKDRcHkuTdNGwDEpqiR2Wj1kSDlZhf+DhxFWISgLwYbgvIcs0/RJ59frEvg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795707679;
	bh=0xDkMqL51Js3v2CKBQWZhL2ue/lILnPwKkjqV8xbUAA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=gvSnBvQ1nW10YjpedgQRE7Uy8xVWKQ5pFIeKSj2/mMLOd2kgFLh1iaxIETvldPGyy
	 saWmccpRba04zYpiqxf3lz/geMiBJYCf5KonEgaRNXO1aqQJPb7DANuqC/+5UMXE3a
	 QWqz8StxIf5z525FeaY/uhBwxN5kUTSCoELTxRd8qmmjiL1YvtaJpakL4YXouaZqU/
	 ho0DDkj8SDViU1kxuBYV19uq8kSPI6og+n/q6WCnZMJcMKgtQ/ZFGTaGiWg1BtjjUe
	 oofMhImDH1usqxt0jHY9VFqozUDDl5qkBC7h5U54Ph6fVlF2C7TuvSYmJlU5quW9x1
	 HqZ9zLZGhEeLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C398115C;
	Thu, 26 Nov 2026 15:41:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E646E10B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D438940952
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCwgvW_OQz2Y for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 15:41:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8F23B408A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=theo.lebrun@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F23B408A2
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:41:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2E1614E417AA;
 Thu, 26 Nov 2026 15:41:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E1125604ED;
 Thu, 26 Nov 2026 15:41:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2900111E69106; Thu, 26 Nov 2026 16:41:06 +0100 (CET)
Date: Thu, 26 Nov 2026 16:41:06 +0100
Message-Id: <DN598PGRKIE0.E2N6C8EP7BD0@bootlin.com>
To: "dowan gullient" <dowan.gullient@smile.fr>, <buildroot@buildroot.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20260828-xdp-tools-tleb-v1-4-463c25b5a99b@bootlin.com>
 <2fc9798f-a5c7-4ca5-b1d3-88ecd8a4b062@smile.fr>
In-Reply-To: <2fc9798f-a5c7-4ca5-b1d3-88ecd8a4b062@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [4/4] package/xdp-tools: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8gRG93YW4sCgpMZXQgbWUgcmVwbHkgdG8gdGhpcyBMTE0tYXNzaXN0ZWQgcmV2aWV3IHRv
IGRvY3VtZW50IHNvbWUgZGVjaXNpb25zCmJlZm9yZSBzZW5kaW5nIFYyIChvbmNlIHRoZSBidWls
ZCBhbmQgdGVzdGVkIGlzIGRvbmUpLgoKT24gVGh1IFNlcCAzLCAyMDI2IGF0IDQ6NTkgUE0gQ0VT
VCwgZG93YW4gZ3VsbGllbnQgd3JvdGU6Cj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxT
Cj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkJQRgo+PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9a
TElCCj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlBDQVAKPj4gKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfSE9TVF9MTFZNX0JQRgo+PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9CQVNICj4+ICsJc2VsZWN0
IEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlMgIyBiYXNoCj4+ICsJc2VsZWN0IEJSMl9Q
QUNLQUdFX0VUSFRPT0wKPj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSVBST1VURTIgIyB0Ywo+PiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9UQ1BEVU1QCj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1dJUkVT
SEFSSyAjIHRzaGFyaywgY2FwaW5mb3MKPj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTkZUQUJMRVMg
IyBuZnQKPj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfU09DQVQKPj4gKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfTkRJU0M2Cj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX05ESVNDNl9ORElTQzYgIyBuZGlzYzYg
dG9vbAo+Cj4gVGhlIGxpc3Qgb2YgYHNlbGVjdGAgc3RhdGVtZW50cyBpcyBub3QgaW4gYWxwaGFi
ZXRpY2FsIG9yZGVyLCBpZiB5b3UKPiBjb3VsZCBmaXggdGhhdCwgaXQgd291bGQgYmUgYmV0dGVy
IGZvciBtYWludGVuYW5jZS4KCkRvbmUgZm9yIG5leHQgaXRlcmF0aW9uLgoKPj4gK1hEUF9UT09M
U19MSUNFTlNFID0gR1BMLTIuMCwgTEdQTC0yLjEsIEJTRC0yLUNsYXVzZQo+Cj4gVGhlIGxpY2Vu
c2Ugc3RyaW5nIHVzZXMgYmFyZSBTUERYIGlkZW50aWZpZXJzIChgR1BMLTIuMGAsIGBMR1BMLTIu
MWApIAo+IHdoaWNoIGFyZQo+IGRlcHJlY2F0ZWQuIEJ1aWxkcm9vdCByZXF1aXJlcyBleHBsaWNp
dCB2YXJpYW50cyBzdWNoIGFzIGAtb25seWAgb3IgCj4gYC1vci1sYXRlcmAKPiAob3IgdGhlIGhp
c3RvcmljYWwgYCtgKS4gRnVydGhlcm1vcmUsIHdoZW4gYSBjb21wb25lbnQgaXMgZHVhbC1saWNl
bnNlZCAKPiAoZS5nLiwKPiBsaWJ4ZHAgdW5kZXIgTEdQTC0yLjEgT1IgQlNELTItQ2xhdXNlKSwg
dGhlIGBPUmAgb3BlcmF0b3IgbXVzdCBiZSB1c2VkIAo+IGluc3RlYWQKPiBvZiBhIGNvbW1hLXNl
cGFyYXRlZCBsaXN0LiBQbGVhc2UgYXVkaXQgdGhlIHNvdXJjZSB0cmVlIGFmdGVyIGJ1aWxkIHRv
IAo+IGRldGVybWluZSB0aGUgZXhhY3QKPiBsaWNlbnNlcyB0byB1c2UsIGFuZCB1cGRhdGUgdGhl
IHZhcmlhYmxlIGFjY29yZGluZ2x5LgoKRG9uZS4gTmV3IHZhcmlhYmxlIGlzOgoKWERQX1RPT0xT
X0xJQ0VOU0UgPSBHUEwtMi4wLW9ubHksIExHUEwtMi4xLW9ubHksIEJTRC0yLUNsYXVzZQoKSSB3
aWxsIG5vdCBleHByZXNzIHRoZSBkdWFsLWxpY2Vuc2VkIGNvbXBvbmVudHMgZXhwbGljaXRseSBo
ZXJlLCBhcyB0aGUKcHJvamVjdCdzIGxpY2Vuc2luZyBpcyBub3Qgc3VwZXIgaG9tb2dlbmVvdXM6
CgogICDin6kgc29ydCAvdG1wL3hkcC10b29scy1saWNlbnNlcyB8IHVuaXEgLWMgfCBzb3J0IC1u
cgogICA3MiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAogICAxNCBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQogICAxMCBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKExHUEwtMi4xIE9SIEJTRC0yLUNsYXVzZSkKICAgIDkgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogICAgNiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZQogICAgNCBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgogICAgMyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb3ItbGF0ZXIgT1IgQlNELTItY2xhdXNlKQogICAgMiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogTEdQTC0yLjEKICAgIDIgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAr
IFdJVEggTGludXgtc3lzY2FsbC1ub3RlCiAgICAxIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBM
R1BMLTIuMSsKICAgIDEgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6ICgoR1BMLTIuMCBXSVRIIExp
bnV4LXN5c2NhbGwtbm90ZSkgT1IgQlNELTMtQ2xhdXNlKQogICAgMSBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCsKICAgIDEgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNs
YXVzZQoKPj4gK1hEUF9UT09MU19ERVBFTkRFTkNJRVMgPSBob3N0LWNsYW5nIGhvc3QtYnBmdG9v
bCBob3N0LW00IGhvc3QtcGtnY29uZiBcCj4+ICsJbGliYnBmIGVsZnV0aWxzIHpsaWIgbGlicGNh
cAo+Cj4gQWxzbyB0aGUgYFhEUF9UT09MU19ERVBFTkRFTkNJRVNgIGxpc3QgaW4gdGhlIGAubWtg
IGZpbGUgaXMgbm90IHNvcnRlZAo+IGFscGhhYmV0aWNhbGx5LgoKRml4ZWQ6CgpYRFBfVE9PTFNf
REVQRU5ERU5DSUVTID0gZWxmdXRpbHMgaG9zdC1icGZ0b29sIGhvc3QtY2xhbmcgaG9zdC1tNCBo
b3N0LXBrZ2NvbmYgXAoJbGliYnBmIGxpYnBjYXAgemxpYgoKPj4gK1Vwc3RyZWFtOiBOb3Qgc3Vi
bWl0dGVkCj4KPiBBbGwgdGhyZWUgcGF0Y2hlcyAoMDAwMSwgMDAwMiwgYW5kIHRoZSBNSVBTLXNw
ZWNpZmljIDAwMDMpIHVzZQo+IGBVcHN0cmVhbTogTm90IHN1Ym1pdHRlZGAgYXMgdGhlaXIgc3Rh
dHVzIHRhZy4gSXQgd291bGQgYmUgYmV0dGVyIHRvIAo+IGVpdGhlciBzdWJtaXQgdGhlIHBhdGNo
ZXMKPiB1cHN0cmVhbSBhbmQgdXBkYXRlIHRoZSB0YWcsIG9yIGNoYW5nZSBpdCB0byBgVXBzdHJl
YW06IE4vQWAgd2l0aCBhCj4ganVzdGlmaWNhdGlvbiBleHBsYWluaW5nIHdoeSB0aGV5IGFyZSBC
dWlsZHJvb3Qtc3BlY2lmaWMuCgpJIHVwc3RyZWFtZWQgYWxsIHRoZSBwYXRjaGVzIGltcHJvdmlu
ZyB0aGUgdGVzdC1zdWl0ZSBhYmlsaXR5IHRvIHJ1biBvbgphIGJ1c3lib3ggcm9vdGZzLgoKaHR0
cHM6Ly9naXRodWIuY29tL3hkcC1wcm9qZWN0L3hkcC10b29scy9wdWxsLzU5MwoKT25seSBvbmUg
cGF0Y2ggcmVtYWlucyBOL0E6IGl0IGlzIGEgd29ya2Fyb3VuZCBmb3IgYSBjb21waWxlciBidWcg
YW5kIHdlCmFncmVlZCB0aGF0IGl0IGRpZG4ndCBtYWtlIHNlbnNlIHRvIG1lcmdlIGludG8geGRw
LXRvb2xzLiBJdCBkb2VzIGZlZWwKYXQgdGhlIHJpZ2h0IHBsYWNlIGhvd2V2ZXIgaW4gYSBidWls
ZCBzeXN0ZW0uCgpSZWdhcmRzLAoKLS0KVGjDqW8gTGVicnVuLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
