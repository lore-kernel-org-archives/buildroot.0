Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10123C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A9C80DCC;
	Sun,  6 Sep 2026 12:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9SRVipIUN6q; Sun,  6 Sep 2026 12:22:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8633980BD6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788697350;
	b=lc/auvqbVvvEGXwuOU68KBoak1/pXH7wLLMW8d9NWmxloIDAane5qIDgdJms21EH2l6K
	 KmguaOtmxyuYCdd80m/5fOpde4HdINZdu5cSpqRokU+rUlwZPqgRZxvfFuUhBlptVfGPu
	 cmYxVrgUx7WFg/EklkZYKm6gin4ksJfDi3zhIUxbCDMMl3ErZyKjxVsM//a/xnt+8ULSD
	 wn+Z15BclbRYMb+fgpwXf8frKc24pxYZAl1Dn+acJpZsI07pd5gf4Ah91TsSP+Vwd9QeH
	 MbcCcAZkGunnGgflUVDlFNuaZYFw0YujC8YQqLXtWaQa1hvgKADSrsHkOp+bgvII8xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788697350;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=X7Q+L4x0z/aWkuFn8zhYgaw3yxBwO7Fb6+FD389tjYA=;
	b=Axx395srB5LD8ecHv802J2ZiBxNPNz2Xv9HWLoIZNylNe+BQBYkqPzdsZcIAc5Pzt14L
	 doyglKzIMhfDi0+iu13mLH2xImLLGMt1M/LVQV5m4ATxCfy18CCfdokr+EBrr6ORKWom2
	 ce7TV7s+sIqpG3GzMi7+NZC0w+BV1QkrjD8swgGz9ulMxq8Kxtq0sdMSyM8iVLp6tMzX5
	 Yfsw6vaLLjXA422jtXrhvsScfoY6UUdEJPVeItKFF0lEBumyOEaWCRJ3HVt5QF5+5RbJp
	 NO0S1vzr/EMseOffCcCP0u3ss+rZi3cW5RBdKBst+1BmoKHrsBB1uj6mz58jLOe5tIw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788697350;
	bh=X7Q+L4x0z/aWkuFn8zhYgaw3yxBwO7Fb6+FD389tjYA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lw2A+LHn37iEBgyWdFtQ6gtlkGDnhWRp2Q/HUipRJEjfpzwBDQpZRsUWM+0b2bCbE
	 QViWYGRPm1iYCbEOFoIvTOVTILXHAhpiEwcpBmqlGhSANIprJHP2dobn3BFz2YEJHv
	 /QNJH6P2i4TB/vytqNRmZfD7RO6ce1BZ88SfGugRM+i8aDKGEWPIgNrJjFEpwwInyh
	 LQaUYukFV53EU1X4K1Yyb/EIrQzgxrpuaoxGBER9rVM1JITYxkFobQEj5vGzccCELM
	 lx15fGiI/9ITFoNaCAk958Fc/ULw5KjDgQrvMeDMpUfYqswdM7vOxyUSALkMfh6TLt
	 mZmLh5wfiKsRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8633980BD6;
	Sun,  6 Sep 2026 12:22:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF76A9CF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B591040068
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2pRnAYtij0s for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:22:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6CEA24000B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788697348;
 b=sOhHRkRQ6FI9J1lQPJPxYuJVFo0mZC+hn+vORS72UIn7ZSmn6T48AN8UnqsaRPrakUKo
 q1eFN80wTjp31gHG8cji/CXlm3QyabCm4qk7s3UpZft13ROzyNcMO3sYwypmY8tk00msK
 yq82Nq2T3LM6RDGduvlmb0SRfDLv9/aj4gkiiL7MDMRXL1p+5gml80zP7yOGYmQc++CRd
 F6N9OHBi9AkJHLMPV1OPfD5eX0uyC47tvJ7cRlD5o8qNr0pU26CRRL1XX2VCTJFq2Uzni
 9u5bvkGSCBuexlES5fgp/+5tfzLjCbBU7vOYAdTpO9J05iJxPEolZDpjhgPFK3gGjgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788697348;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=4YmIax1LClVYf6fGDkeQ+XmmKOReeTx/Msmoni4zHXI=;
 b=rELJnqJNwDdjb/iWLENkp4bOxdhGYj4J2Qz4/UsAMoouV2GvJvgwwHORTwTgDnoe8D1U
 UEcHb52DHfe4onRHt4mWFzCNCS0BB+N1CTn1cQvh42DmT2dQpvqppSVklLyqMyCDmjKaO
 EDJtx7pkRFhGqEo7HXXVl6DwvK1U694sM9cR9N/LqKclT0iLeW8nndf1bFMEFRN6q4hpy
 AMBj26lWn/jUswWdy6dBdPzyVQs6f56ZAQc9UPiVrlfWvRVkeOdAowIzfWUB2dMUFMzZJ
 ZmsfWzhsHYTusfVgu5oUrNYQOSTLojnhidn5NSc9H4jiT/osRjSTDWGcTOeaSsXNdrw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ujN8FxN0; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CEA24000B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:22:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 89CAB6013B;
 Sun,  6 Sep 2026 14:22:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 14:22:22 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 14:22:22 +0200
To: =?UTF-8?Q?Daniel_Br=C3=A1t?= <danek.brat@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260820092324.1273711-1-danek.brat@gmail.com>
References: <20260820092324.1273711-1-danek.brat@gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <73d5fe936d7894569ecf46033527ed68@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: add support for
 binutils 2.47
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFuaWVsLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2guCgpPbiAyMC8wOC8yMDI2IDExOjIzLCBE
YW5pZWwgQnLDoXQgd3JvdGU6Cj4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9waXBlcm1haWwvYmlu
dXRpbHMvMjAyNi1KdWx5LzE1MDQ0OS5odG1sCj4gCj4gIiBUaGlzIHJlbGVhc2UgY29udGFpbnMg
bnVtZXJvdXMgYnVnIGZpeGVzLCBhbmQgYWxzbyB0aGUKPiAgIGZvbGxvd2luZyBuZXcgZmVhdHVy
ZXM6Cj4gCj4gICAgICogQSBuZXcgYXNzZW1ibGVyIGNvbW1hbmQgbGluZSBvcHRpb246IAo+IC0t
cmVsb2Mtc2VjdGlvbi1zeW09W2FsbHxpbnRlcm5hbHxub25lXQo+ICAgICAgIGNvbnRyb2xzIHdo
ZXRoZXIgcmVsb2NhdGlvbnMgcmVmZXJlbmNpbmcgbG9jYWwgYmluZGluZyBzeW1ib2xzIAo+IGFy
ZSBhZGp1c3RlZAo+ICAgICAgIHRvIHVzZSBzZWN0aW9uIHN5bWJvbHMuCj4gCj4gICAgICogQWRk
IHN1cHBvcnQgZm9yIFJJU0MtViBzdGFuZGFyZCBleHRlbnNpb25zOgo+ICAgICAgIHphbGFzciB2
MS4wLCBzdnJzdzYwdDU5YiB2MS4wLCB6dmFiZCB2MS4wLCBzbXBtcG10IHYxLjAsCj4gICAgICAg
enZxd2RvdGE4aSwgenZxd2RvdGExNmksIHp2Zndkb3RhMTZiZiBhbmQgenZmcXdkb3RhOGYgdjEu
MCwKPiAgICAgICB6dnF3YmRvdGE4aSwgenZxd2Jkb3RhMTZpLCB6dmZ3YmRvdGExNmJmLCB6dmZx
d2Jkb3RhOGYgYW5kCj4gICAgICAgenZmYmRvdGEzMmYgdjEuMCwgU3BhY2VtaVQ6IHhzbXR2ZG90
IHYxLjAsIHhzbXR2ZG90aWkgdjEuMC4KPiAKPiAgICAgKiBUaGUgQUFyY2g2NCBkaXNhc3NlbWJs
ZXIgbm93IGFjY2VwdHMgYSBjb21tYW5kIGxpbmUgb3B0aW9uIG9mICItTQo+ICAgICAgIGFubm90
YXRlIiB3aGljaCBkaXNwbGF5cyB0aGUgc3ltYm9sIGFzc29jaWF0ZWQgd2l0aCB1bmRlZmluZWQK
PiAgICAgICBpbnN0cnVjdGlvbnMsIHNob3VsZCB0aGVyZSBiZSBvbmUuCj4gCj4gICAgICAgU2lt
aWxhcmx5IHRoZSB4ODYgYW5kIHg4Nl82NCBkaXNhc3NlbWJsZXJzIG5vdyBhY2NlcHQgYSBjb21t
YW5kIAo+IGxpbmUKPiAgICAgICBvcHRpb24gb2YgIi1NIGFubm90YXRlLWltbWVkaWF0ZXMiIHdo
aWNoIGRpc3BsYXlzIHRoZSBzeW1ib2wKPiAgICAgICBhc3NvY2lhdGVkIHdpdGggaW1tZWRpYXRl
IHZhbHVlcywgc2hvdWxkIHRoZXJlIGJlIG9uZS4KPiAKPiAgICAgKiBPYmpkdW1wIGFuZCByZWFk
ZWxmIG5vdyBoYXZlIGEgLS1kZWJ1Zy1kaXI9PERJUj4gb3B0aW9uIHdoaWNoIGNhbiAKPiBiZQo+
ICAgICAgIHVzZWQgdG8gdGVsbCB0aGVtIHdoZXJlIHRvIGZpbmQgc2VwYXJhdGUgZGVidWcgaW5m
byBmaWxlcy4KPiAKPiAgICAgKiBPYmpkdW1wIG5vdyBoYXMgYSAtLW1hcC1nbG9iYWwtdmFycyBv
cHRpb24gd2hpY2ggZGlzcGxheXMgdGhlCj4gICAgICAgbG9jYXRpb24gYW5kIHR5cGUgb2YgZ2xv
YmFsIHZhcmlhYmxlcyBpbiBvYmplY3QgZmlsZXMuCj4gCj4gICAgICogVGhlIGJmZCBsaW5rZXIg
bm93IGhhcyBhbiBvcHRpbWl6YXRpb24gbGV2ZWwgb2YgemVyby4gIFVzaW5nICItTyAKPiAwIgo+
ICAgICAgIG9uIHRoZSBsaW5rZXIgY29tbWFuZCBsaW5lIHdpbGwgc3RvcCBpdCBmcm9tIGNvbWJp
bmluZyB0aGUgCj4gY29udGVudHMKPiAgICAgICBvZiBtZXJnZWFibGUgc2VjdGlvbnMuICBUaGlz
IGNhbiBzaWduaWZpY2FudGx5IHNwZWVkIHVwIHRoZSBsaW5rCj4gICAgICAgcHJvY2VzcyBhdCB0
aGUgY29zdCBvZiBwcm9kdWNpbmcgbGFyZ2VyIGJpbmFyaWVzLgo+IAo+ICAgICAqIEFkZCBsaW5r
ZXIgc3VwcG9ydCBmb3IgLS1zdGFydC1saWIvLS1lbmQtbGliIG9wdGlvbnMgYW5kIExJQiAKPiBs
aW5rZXIKPiAgICAgICBzY3JpcHQgc3RhdGVtZW50IGZvciB0cmVhdGluZyBhIGxpc3Qgb2Ygb2Jq
ZWN0IGZpbGVzIGFzIG1lbWJlcnMgCj4gb2YKPiAgICAgICBhbiBhcnRpZmljaWFsIGFyY2hpdmUu
Cj4gCj4gICAgICogQWRkIGxpbmtlciBzdXBwb3J0IGZvciBhcmNoaXZlcyB3aXRoIG5vIHN5bWJv
bCBpbmRleCBpbiB0aGVpciBhbGwKPiAgICAgICBmb3JtYXRzLCBub3Qgb25seSBYQ09GRi4gIE9u
IGJ5IGRlZmF1bHQgYW5kIGNvbnRyb2xsZWQgd2l0aAo+ICAgICAgIC0tbm8tbGluay1tYXBsZXNz
IGFuZCAtLWxpbmstbWFwbGVzcyBvcHRpb25zLCBhbHNvIGZvciBYQ09GRi4KPiAKPiAgICAgTm90
ZSAtIHN1cHBvcnQgZm9yIHRoZSAzMi1iaXQgczM5MCB0YXJnZXQgaGFzIGJlZW4gZGVwcmVjYXRl
ZCB3aXRoCj4gICAgIHRoaXMgcmVsZWFzZS4gIFN1cHBvcnQgZm9yIHRoZSA2NC1iaXQgczM5MHgg
dGFyZ2V0IHN0aWxsIHdvcmtzCj4gICAgIGhvd2V2ZXIuIgo+IAo+IEFzIHdpdGggcHJldmlvdXMg
bmV3IGJpbnV0aWxzIHZlcnNpb25zLCBwYXRjaGVzIDAwMDEgYW5kIDAwMDIgd2VyZSAKPiByZWJh
c2VkCj4gYW5kIGNhcnJpZWQgb3ZlciB0byB0aGlzIHZlcnNpb24gYXMgd2VsbC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQnLDoXQgPGRhbmVrLmJyYXRAZ21haWwuY29tPgoKVGhhbmtzIGZv
ciB0aGUgcGF0Y2guCgpJbiBCdWlsZHJvb3QsIHdoZW4gd2UgYWRkIGEgbmV3IGJpbnV0aWxzIHZl
cnNpb24gc2VyaWVzLAp3ZSBhbHNvIHVzdWFsbHkgaW5jcmVhc2UgdGhlIGRlZmF1bHQgdmVyc2lv
biBhbmQgcmVtb3ZlCnRoZSBvbGRlc3QgdmVyc2lvbiwgaW4gYSBzaW5nbGUgcGF0Y2ggc2VyaWVz
LgoKU2VlIHRoZSBwYWNrYWdlIGhpc3RvcnkgZm9yIGV4YW1wbGVzOgpodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXRzL21hc3Rlci9wYWNrYWdlL2JpbnV0
aWxzCgpGb3IgdGhhdCByZWFzb24sIEkgYXBwbGllZCB0aGUgc2VyaWVzIGZyb20gQmVybmQsCnBy
b3Bvc2VkIGF0OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNjA5MDYxMDMy
NTcuMzY4ODM2Mi0xLWJlcm5kQGt1aGxzLm5ldC9ULyN0CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
