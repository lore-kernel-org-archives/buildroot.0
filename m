Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE31C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 15:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE0380E89;
	Sun,  4 Jan 2026 15:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypstiC2yyBUQ; Sun,  4 Jan 2026 15:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05A5680E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767540898;
	bh=JZig5qy0O7EHfPF6S+e2ZR4Df+8IQmWGtN3hUklvk60=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RiFdh2ZqJKLK5amxRb5jgL8//7CLTTco9ApIjGX/bY9iTtH8Duhx9BiZMvYpvi0dG
	 +d/+my1NO5UUZ15h0n3HbrWHFeQWR6LLcSAfbzUT5zogjeqJf50Xcqaml0L6Bggt8E
	 F98OIY3nZXtbk3C+jBwxhOHwXKo8Fur809ZVlJJChK48Xsxc6Gu98sZ1UnQj/7rQS0
	 dzm2VYEHf2MvJJCFvmnVPldwrrV4aZjv63+RABqlU5OI/gk8kxS8znK41hqzUzVaQi
	 3IIlm+iAUmPz29vN5J4ij5EJYzDRn92A6NKT/Vd0crDsKIkyK1lWK4y6Npim1esIvZ
	 wDPOn2dNviVBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05A5680E81;
	Sun,  4 Jan 2026 15:34:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ADE52DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 15:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 406956076B
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 15:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZiswMBjrtkm for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 15:34:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7F9660758
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7F9660758
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7F9660758
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 15:34:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.67]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGz1f-1vgbGL2xcZ-00Gu9o; Sun, 04
 Jan 2026 16:34:50 +0100
Message-ID: <951a546a-a56c-4aa9-b515-b72f73bd249b@gmx.de>
Date: Sun, 4 Jan 2026 16:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260103114046.2461857-1-fiona.klute@gmx.de>
 <3fe4137c982f5acd08e775ca43dab9f2@free.fr>
 <12ad4f39-5622-430c-9b02-fcd5893f6730@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <12ad4f39-5622-430c-9b02-fcd5893f6730@gmx.de>
X-Provags-ID: V03:K1:PE+gGg22NNj4zDnFWabbHgVl237f0bfvOelQEQ7A8NWMyVRmgk5
 9Wvb5wxkROjvYbUfGIZW3DI9IpWgmZS1rnJTKk13QloHK5DPaKYV8Xj1B/0oiCJfQr8W4X4
 kOwcSTDGDTPsKVE1Dn4RDCw96eVcl1YqwMKGARzxJRsotbkMgUyELg25esX7SQbFkZG9rha
 GJJthtxQy07gK2U94sUMw==
UI-OutboundReport: notjunk:1;M01:P0:Pk1RBahSul4=;BhLfQxUxVbykfGjS65VMVmvIGHf
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767540890; x=1768145690; i=fiona.klute@gmx.de;
 bh=XRT1oYXnnvjHVL2NF9+/45SZxU+ykaaJbn70tBKILQU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pKAoeJ/wEYZE4iswPCn27Cf8TMw68sS/KB/7uw7mA0Ov4xG6Nfg814ffGbJ8XL6F
 16ndkvT7AOwhAA0P8CFPspWJYEn1TGDQq/I54kpA2ybUtmPeeV/DW5b+6B8M1PzZX
 i0Y6KvtAUhmBrNhNv+y5c2SHEMAkD3uQdUXdlR0Gn3l5zAiQRHeawCtIzihmVgSIa
 moFFRe5XWE+3q8WyyzNXKN6pbQr4q5zixlH6XWsuTKVQvRT6adUMchsHa2QEHC5Ib
 feOdp0DG6J0MbjE8bz2ewDbEDjIUNDs092vj/+lMwh1YRhsF6Ecd0LVfqsWA7JltO
 egRSO8BjGygrR2qRfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pKAoeJ/w
Subject: Re: [Buildroot] [PATCH 1/1] package/squashfs: bump to version 4.7.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDQuMDEuMjYgdW0gMTU6NDMgc2NocmllYiBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290Ogo+
IEhpIEp1bGllbiEKPiAKPiBBbSAwNC4wMS4yNiB1bSAxMzo1MiBzY2hyaWViIEp1bGllbiBPbGl2
YWluOgo+PiBIaSBGaW9uYSwKPj4KPj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guCj4+Cj4+IE9uIDAz
LzAxLzIwMjYgMTI6NDAsIEZpb25hIEtsdXRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+PiBVcHN0
cmVhbSBjaGFuZ2Vsb2c6Cj4+PiBodHRwczovL2dpdGh1Yi5jb20vcGxvdWdoZXIvc3F1YXNoZnMt
dG9vbHMvYmxvYi80LjcuNC9DSEFOR0VTLm1kCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmlvbmEg
S2x1dGUgPGZpb25hLmtsdXRlQGdteC5kZT4KPj4+IC0tLQo+PiBbLi4uXQo+Pj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvc3F1YXNoZnMvc3F1YXNoZnMubWsgYi9wYWNrYWdlL3NxdWFzaGZzL3NxdWFz
aGZzLm1rCj4+PiBpbmRleCBmMmNiMGFiMjVlLi4wNGIzMjhjY2FiIDEwMDY0NAo+Pj4gLS0tIGEv
cGFja2FnZS9zcXVhc2hmcy9zcXVhc2hmcy5tawo+Pj4gKysrIGIvcGFja2FnZS9zcXVhc2hmcy9z
cXVhc2hmcy5tawo+Pj4gQEAgLTQsNyArNCw3IEBACj4+PiDCoCMKPj4+Cj4+PiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+Pj4KPj4+IC1TUVVBU0hGU19WRVJTSU9OID0gNC42LjEKPj4+ICtTUVVB
U0hGU19WRVJTSU9OID0gNC43LjQKPj4KPj4gVGhpcyBuZXcgdmVyc2lvbiBpcyBpbnRyb2R1Y2lu
ZyBuZXcgYnVpbGQgZmFpbHVyZXMuIFNlZToKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWlu
L2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yMjQzODQ3ODA4Cj4+Cj4+IEZvciByZWZlcmVuY2UsIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uIHBhc3NlcyB0ZXN0LXBrZzoKPj4gaHR0cHM6Ly9naXRsYWIuY29t
L2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yMjQzODUzMzAxCj4+Cj4+IFRoaXMgaXMg
bGlrZWx5IGR1ZSB0byB0aGUgbmV3IFNFRUtfREFUQSB1c2FnZSBpbiBsc2VlaygpLCB3aGljaAo+
PiBtaWdodCBub3QgYmUgYWx3YXlzIHByZXNlbnQgb3IgbWlnaHQgcmVxdWlyZSBfR05VX1NPVVJD
RSB0bwo+PiBiZSBkZWZpbmVkLiBTZWU6Cj4+IGh0dHBzOi8vbWFuNy5vcmcvbGludXgvbWFuLXBh
Z2VzL21hbjIvbHNlZWsuMi5odG1sCj4+Cj4+IENvdWxkIHlvdSBoYXZlIGEgbG9vaywgcGxlYXNl
Pwo+IExvb2tzIHRvIG1lIGxpa2UgdGhlIHRvb2xjaGFpbnMgbmVlZCB0byBiZSB1cGRhdGVkLiBU
aGUgam9iIGxvZyBjbGVhcmx5IAo+IHNob3dzIC1EX0dOVV9TT1VSQ0Ugb24gdGhlIGNvbW1hbmQg
bGluZS4gV2hhdCdzIG5vdGljZWFibGUgaXMgdGhhdCB0aGUgCj4gZmFpbGluZyBidWlsZHMgYWxs
IHVzZQo+IAo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfVVJMPSJodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvdG9vbGNoYWlucy8gCj4gdGFyYmFsbHMvJEpPQl9OQU1FLTIwMjAuMTEuMi50
YXIuYnoyIgo+IAo+IHdoaWxlIHRoZSBwYXNzaW5nIG9uZXMgKGRpZG4ndCBjaGVjayBhbGwgb2Yg
dGhlbSwgYnV0IGEgaGFuZGZ1bCkgdXNlIAo+IEJvb3RsaW4gc3RhYmxlIHRvb2xjaGFpbnMuCj4g
Cj4gRS5nLiBpbiB0aGUgYnItYXJtLWZ1bGwtc3RhdGljIG9uZSBhcm0tYnVpbGRyb290LWxpbnV4
LXVjbGliY2dudWVhYmkvIAo+IHN5c3Jvb3QvdXNyL2luY2x1ZGUvdW5pc3RkLmggZG9lcyBub3Qg
ZGVmaW5lIFNFRUtfREFUQSBhdCBhbGwsIHdpdGggb3IgCj4gd2l0aG91dCBfR05VX1NPVVJDRSwg
dW5saWtlIHdpdGggYSBjdXJyZW50IGdsaWJjIHZlcnNpb24uCj4gCj4gSW50ZXJlc3RpbmdseSBt
dXNsIGRvZXMgKm5vdCogcmVxdWlyZSBfR05VX1NPVVJDRSwgdW5pc3RkLmggZGVmaW5lcyBhbGwg
Cj4gU0VFS18qIG1hY3JvcyB1bmNvbmRpdGlvbmFsbHkuIEkgZGlkIG5vdCBjaGVjayBzaW5jZSB3
aGVuIHRob3VnaCwgSSAKPiB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgaWYgYSAyMDIwIHZlcnNpb24g
d291bGQgZmFpbCwgdG9vLgpPaCwgYW5vdGhlciByZWxldmFudCBkZXRhaWw6IEluIHVDbGliYyBT
RUVLX0RBVEEgc3VwcG9ydCBpcyBhIGZhaXJseSAKcmVjZW50IGFkZGl0aW9uIChjb21taXQgSnVs
eSAyMDI0LCBmaXJzdCB0YWcgaW5jbHVkaW5nIGl0IGlzIHYxLjAuNTApLiAKU28gdUNsaWJjIHRv
b2xjaGFpbnMgZnJvbSAyMDIwIGRlZmluaXRlbHkgd29uJ3Qgd29yay4gU2VlOiAKaHR0cHM6Ly9j
Z2l0LnVjbGliYy1uZy5vcmcvY2dpL2NnaXQvdWNsaWJjLW5nLmdpdC9jb21taXQvaW5jbHVkZS91
bmlzdGQuaD9pZD0wNWIxMTgwOWJkMTE0NTBhZmYzZDIwZTQzZjE4NDE1Y2U1ODYwMWU3CgpCZXN0
IHJlZ2FyZHMsCkZpb25hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
