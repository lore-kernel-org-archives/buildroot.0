Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C250C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4A1F80E49;
	Sun,  4 Jan 2026 14:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4iyOmt6V-h1; Sun,  4 Jan 2026 14:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9DF180E4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767537835;
	bh=V2yDFNAyGJuhO6BS422+Y4JRLGChDEQNHfVA2RgRF0E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YbiBcb96hcYypLZbrE6PdN+BEGDrakANX7YRDzkBeq5g2J2cyB4dQMiwWLQ4sfvoh
	 BjhVZvRJXTmCebM3CGW0iqXWvMqtJ6erSohAp22GcciZDeckIiO44l3yVwmj/Rpi0A
	 lCo9RVRmiQ9hj2jDBrHdmp6kubFbW3hknGwU9NjUFAj2OGDMrAMehtdo04F09yO1pj
	 9T/HFReLxBZqGEzKDp8UZ3S8tgsaiive823GZO0qdnQ1IXgHEFM57rq0CbPRdUbhRE
	 VYrzLuZZ9afZrSjMEL520zmQrERg5xdFyAAsYakkNBiHMFEkXaRTRypagAEsmXKGjS
	 N4UFjr5IQhjuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9DF180E4C;
	Sun,  4 Jan 2026 14:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4D992DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6C7C80E4C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlopUnbTrYtF for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78E3180E49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E3180E49
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78E3180E49
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:43:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.67]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwYu-1vsxiM267I-00yOgE; Sun, 04
 Jan 2026 15:43:50 +0100
Message-ID: <12ad4f39-5622-430c-9b02-fcd5893f6730@gmx.de>
Date: Sun, 4 Jan 2026 15:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260103114046.2461857-1-fiona.klute@gmx.de>
 <3fe4137c982f5acd08e775ca43dab9f2@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <3fe4137c982f5acd08e775ca43dab9f2@free.fr>
X-Provags-ID: V03:K1:tN5XM0AtWsIWDBmQRf0RK+v+6cWnrA3dS8llS9qHjH9arKXDIyd
 4+rdvqIyRfWq7TJtstchjU12DLNOHth8wXyg9lZqdQqtpZU9fOqZfSrSPwGP5ES5hingOp/
 ZZwbCo3k0uRuhenkmgk3RAUNzbSID69UbI0AmDnwsfFT9P6Ogt1Y9+BEnfp6PS+60Yq0h2l
 mcPfREsWYltEWJiFw2PgA==
UI-OutboundReport: notjunk:1;M01:P0:db4oEK5pxns=;08AW8qf0YC87VDEgtBvXxDB+lnb
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767537830; x=1768142630; i=fiona.klute@gmx.de;
 bh=aCFGglAkZKNMelfEf75/HqAhksun7s0EkaJ89LUkcRQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ruCb4im9O3ETEUqlsVw0fnEaAqL4smyEFb4xmiaX2UHzPZ90SG7SymzFJJN6Z8JC
 Y1T6eNme3SgUq1laNV3dK857PHLAqHs6uMcqICdGUaqFHT4tK8rFBW5qUNuCiVaVW
 YhZuUsz7BirobwhxdB00PKLYPu99XU+p6+ZtmAkDXS/7VT5O2FlP4naD4Ill8Rkjl
 UgpqP/87BDywQMAfBeWeH4dOQAC4RxEQUD6M6IRMJErOAb3XsoH4vWFxLdbDzsm7P
 AewbxJls/bzN6D401e5qW9nR49HWA/f4qTZmeFTHiBRh8MTh11pG8F7zRt1pCF6+Q
 Jm29Vem5pZ8MaDpkOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ruCb4im9
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

SGkgSnVsaWVuIQoKQW0gMDQuMDEuMjYgdW0gMTM6NTIgc2NocmllYiBKdWxpZW4gT2xpdmFpbjoK
PiBIaSBGaW9uYSwKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiAwMy8wMS8yMDI2
IDEyOjQwLCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBVcHN0cmVhbSBjaGFu
Z2Vsb2c6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9wbG91Z2hlci9zcXVhc2hmcy10b29scy9ibG9i
LzQuNy40L0NIQU5HRVMubWQKPj4KPj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgPGZpb25h
LmtsdXRlQGdteC5kZT4KPj4gLS0tCj4gWy4uLl0KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3F1
YXNoZnMvc3F1YXNoZnMubWsgYi9wYWNrYWdlL3NxdWFzaGZzL3NxdWFzaGZzLm1rCj4+IGluZGV4
IGYyY2IwYWIyNWUuLjA0YjMyOGNjYWIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uvc3F1YXNoZnMv
c3F1YXNoZnMubWsKPj4gKysrIGIvcGFja2FnZS9zcXVhc2hmcy9zcXVhc2hmcy5tawo+PiBAQCAt
NCw3ICs0LDcgQEAKPj4gwqAjCj4+Cj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+Cj4+IC1T
UVVBU0hGU19WRVJTSU9OID0gNC42LjEKPj4gK1NRVUFTSEZTX1ZFUlNJT04gPSA0LjcuNAo+IAo+
IFRoaXMgbmV3IHZlcnNpb24gaXMgaW50cm9kdWNpbmcgbmV3IGJ1aWxkIGZhaWx1cmVzLiBTZWU6
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yMjQz
ODQ3ODA4Cj4gCj4gRm9yIHJlZmVyZW5jZSwgdGhlIHByZXZpb3VzIHZlcnNpb24gcGFzc2VzIHRl
c3QtcGtnOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGlu
ZXMvMjI0Mzg1MzMwMQo+IAo+IFRoaXMgaXMgbGlrZWx5IGR1ZSB0byB0aGUgbmV3IFNFRUtfREFU
QSB1c2FnZSBpbiBsc2VlaygpLCB3aGljaAo+IG1pZ2h0IG5vdCBiZSBhbHdheXMgcHJlc2VudCBv
ciBtaWdodCByZXF1aXJlIF9HTlVfU09VUkNFIHRvCj4gYmUgZGVmaW5lZC4gU2VlOgo+IGh0dHBz
Oi8vbWFuNy5vcmcvbGludXgvbWFuLXBhZ2VzL21hbjIvbHNlZWsuMi5odG1sCj4gCj4gQ291bGQg
eW91IGhhdmUgYSBsb29rLCBwbGVhc2U/Ckxvb2tzIHRvIG1lIGxpa2UgdGhlIHRvb2xjaGFpbnMg
bmVlZCB0byBiZSB1cGRhdGVkLiBUaGUgam9iIGxvZyBjbGVhcmx5IApzaG93cyAtRF9HTlVfU09V
UkNFIG9uIHRoZSBjb21tYW5kIGxpbmUuIFdoYXQncyBub3RpY2VhYmxlIGlzIHRoYXQgdGhlIApm
YWlsaW5nIGJ1aWxkcyBhbGwgdXNlCgpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX1VSTD0iaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Rvb2xjaGFpbnMvdGFyYmFsbHMvJEpPQl9OQU1FLTIw
MjAuMTEuMi50YXIuYnoyIgoKd2hpbGUgdGhlIHBhc3Npbmcgb25lcyAoZGlkbid0IGNoZWNrIGFs
bCBvZiB0aGVtLCBidXQgYSBoYW5kZnVsKSB1c2UgCkJvb3RsaW4gc3RhYmxlIHRvb2xjaGFpbnMu
CgpFLmcuIGluIHRoZSBici1hcm0tZnVsbC1zdGF0aWMgb25lIAphcm0tYnVpbGRyb290LWxpbnV4
LXVjbGliY2dudWVhYmkvc3lzcm9vdC91c3IvaW5jbHVkZS91bmlzdGQuaCBkb2VzIG5vdCAKZGVm
aW5lIFNFRUtfREFUQSBhdCBhbGwsIHdpdGggb3Igd2l0aG91dCBfR05VX1NPVVJDRSwgdW5saWtl
IHdpdGggYSAKY3VycmVudCBnbGliYyB2ZXJzaW9uLgoKSW50ZXJlc3RpbmdseSBtdXNsIGRvZXMg
Km5vdCogcmVxdWlyZSBfR05VX1NPVVJDRSwgdW5pc3RkLmggZGVmaW5lcyBhbGwgClNFRUtfKiBt
YWNyb3MgdW5jb25kaXRpb25hbGx5LiBJIGRpZCBub3QgY2hlY2sgc2luY2Ugd2hlbiB0aG91Z2gs
IEkgCndvdWxkbid0IGJlIHN1cnByaXNlZCBpZiBhIDIwMjAgdmVyc2lvbiB3b3VsZCBmYWlsLCB0
b28uCgpCZXN0IHJlZ2FyZHMsCkZpb25hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
