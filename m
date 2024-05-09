Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F4EC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C87141F5C;
	Thu,  9 May 2024 21:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pid954Ge2blc; Thu,  9 May 2024 21:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4997441F6C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4997441F6C;
	Thu,  9 May 2024 21:52:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2904E1BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14E658406C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnFUnag4h0vp for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5667A8406B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5667A8406B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5667A8406B
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:52:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.125.17]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGRz-1sElQT1iZx-00Phvq; Thu, 09
 May 2024 23:52:40 +0200
Message-ID: <42c07d69-06e4-4e94-a1b0-75db415b1cdb@gmx.de>
Date: Thu, 9 May 2024 23:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20240426215144.1107186-1-fiona.klute@gmx.de>
 <20240509225126.6b340d1a@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240509225126.6b340d1a@windsurf>
X-Provags-ID: V03:K1:X56r+bpQYehiAz7/Gz3YZm40Ffd0VK44+c2n+5sdvkyUKJF9zkH
 fRbEDlR8d0DZCN/cLgllMhF75Wth4BNtZMWFiccuq9Ltrop9UaNELYTWDTPtNfcsH0IXtXj
 eNaxuERlmTU1J6/H2ARsyEckz9fvfF2OhaHusa/hhjOb5J/TlyNbe0Axplpy3QvAxIVsk0z
 v69fyU1yEBQvl1RCFSXUA==
UI-OutboundReport: notjunk:1;M01:P0:Jli0hDjL9gs=;8O9LxRwRdLP9q8ZF1/nCTeLIQO5
 N02K6+LYzm1luAL/kyL2rvdvmI4hnEGhZpNAL/evIPFodE5UGxxbQCbKbmwqsTqDIFT5V3wUn
 7oEu5CeURfzr4KyY6Uo4HVD7uUadOk4g7CotnPIbIduyGcpNwyMTKss9/8HVfq94rGio5I2WG
 goZmin5WxNeigJuHLYjgC5d1XYmGcpZB5zQ2xjzVss5q5GEaGHZZRagzWkrB8cV49sLhVYpew
 +PotHLPr+h8f6RlkUe9Qi8WT1Bhlf3V1jqQliXxAqEY/yXL50y8LTqQxqfiJ5OlvwW7by37ly
 fYT4Z13t2shPARgCtIuSQHpFZq8gkhVNZ+sKeJWGgniAisrplQs8Kr6HhyHR0z2bEwr+yjADz
 3sk6LHN9KR//vHYdlugLbD9aHtjRJmfBOyyUMhadGpRAtYkJrIygeO9c84Alwi6HQU+HsNh9n
 lx403ph/SEH4bFnrJIqo9RzaxY3BX9q+JI4ZvLig0SiLyH4Kb1vzSiOI/HbPeTXox/zUeDPqc
 R9h9o82llxN0tB3kMdgC8JKPaVMrSew87I1HmByiPUvVhL7XPj5US5Vn1y6ueohIAyKtDQjDF
 EBUeDRqlqSD6/9iFt4RoVA72KebQBcA6PVae9NDT5ZTi81jCKd2I9/kLZSMMweaq/attygXl6
 pbPCnj3mt82WiWu9mXe16B6xNbnKCFlTvNiww+c15Xnr+SvX5nxWPF51YQ49mtnBP8o7pidh+
 sowOjHTypOOxQRtHB2HVOjgyNlYR87It6Ri7FE91kEtfeIGIvW6ZqMjxE484J9lZUwhg44NXW
 jNUQKh+CTvdAhtNcauwBuGsGZ6kgYGc2oyGs04fEXNjm4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1715291560; x=1715896360; i=fiona.klute@gmx.de;
 bh=aKpejI0jUUSqiPfYfh4VPKiDM73QxSFXCaA3ErV4274=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=bBc2rU2REGR0mw6NvNNe4eXa+ETJvmmFvGAQ3ReGLgHOcoRdmz3i/b29LLTZSeiF
 F5sHqPGq5HM9Tmz4jwR4KGRg41/w3fIdIBRkj1ckdNWonmr5ir+lugZfSneaxWzTJ
 f3tKogq6kxwNpSFbEEFG5qP99WEvwa8KYtxZ45GVer/HEowE4GAdo0Sq/xZBhBkOq
 1qx9YQhEP0IEOGbWcC7WSC78KDfncmivqiNmjW722vDmLyvLWCJwcoiBu6H0nlYGY
 3w5nwy2OZehT8qjPSRZZEV+eDo0bTjAH3PcuhQ69+DHxLkrhZdrqeeD6VYNtJ5rsw
 /AOTji2acit3wt8Rrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=bBc2rU2R
Subject: Re: [Buildroot] [PATCH 1/1] package/kmod: fix build with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

SGkgVGhvbWFzIQoKQW0gMDkuMDUuMjQgdW0gMjI6NTEgc2NocmllYiBUaG9tYXMgUGV0YXp6b25p
Ogo+IEhlbGxvIEZpb25hLAo+Cj4gT24gRnJpLCAyNiBBcHIgMjAyNCAyMzo1MTo0NCArMDIwMAo+
IEZpb25hIEtsdXRlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90
ZToKPgo+PiBGcm9tOiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGUrd2l3YUBnbXguZGU+Cj4+Cj4+
IFBhdGNoIGZyb20gdXBzdHJlYW0gUFIgc3RpbGwgYmVpbmcgZGlzY3Vzc2VkOgo+PiBodHRwczov
L2dpdGh1Yi5jb20va21vZC1wcm9qZWN0L2ttb2QvcHVsbC8zMgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGUrd2l3YUBnbXguZGU+Cj4KPiBUaGFua3MgZm9yIHRo
ZSBwYXRjaC4gT25lIHRoaW5nIHRoYXQgSSBmaW5kIHN0cmFuZ2UgaXMgdGhhdCBJIGNhbm5vdAo+
IHJlcHJvZHVjZS4gWWVzLCBJIGdldCB3YXJuaW5ncyBkdWUgdG8gYmFzZW5hbWUoKSwgYnV0IG5v
dCBhbiBhY3R1YWwKPiBidWlsZCBmYWlsdXJlIChJJ20gdXNpbmcgYSB0b29sY2hhaW4gYmFzZWQg
b24gbXVzbCAxLjIuNSkuIFRoZXJlIGFyZQo+IGFsc28gbm8gYnVpbGQgZmFpbHVyZXMgaW4gb3Vy
IGF1dG9idWlsZGVycy4KPgo+IEhlcmUgaXMgdGhlIGRlZmNvbmZpZyB0aGF0IEkgdGVzdGVkOgo+
Cj4gQlIyX2FybT15Cj4gQlIyX2NvcnRleF9hOT15Cj4gQlIyX0FSTV9FTkFCTEVfVkZQPXkKPiBC
UjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49
eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WN19FQUJJSEZfTVVTTF9TVEFC
TEU9eQo+IEJSMl9JTklUX05PTkU9eQo+IEJSMl9TWVNURU1fQklOX1NIX05PTkU9eQo+ICMgQlIy
X1BBQ0tBR0VfQlVTWUJPWCBpcyBub3Qgc2V0Cj4gQlIyX1BBQ0tBR0VfS01PRD15Cj4gQlIyX1BB
Q0tBR0VfS01PRF9UT09MUz15Cj4gIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+
Cj4gSSBqdXN0IGdldDoKPgo+IHRvb2xzL2ttb2QuYzogSW4gZnVuY3Rpb24g4oCYa21vZF9oZWxw
4oCZOgo+IHRvb2xzL2ttb2QuYzo3MTo0MDogd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24g4oCYYmFzZW5hbWXigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCj4gICAgIDcxIHwgICAgICAgICAgICAgICAgICAgICAgICAgIkNvbW1hbmRzOlxuIiwgYmFz
ZW5hbWUoYXJndlswXSkpOwo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+Cj4gdG9vbHMva21vZC5jOjcxOjQwOiB3YXJuaW5nOiBuZXN0ZWQg
ZXh0ZXJuIGRlY2xhcmF0aW9uIG9mIOKAmGJhc2VuYW1l4oCZIFstV25lc3RlZC1leHRlcm5zXQo+
IHRvb2xzL2ttb2QuYzo2NToxNjogd2FybmluZzogZm9ybWF0IOKAmCVz4oCZIGV4cGVjdHMgYXJn
dW1lbnQgb2YgdHlwZSDigJhjaGFyICrigJksIGJ1dCBhcmd1bWVudCAyIGhhcyB0eXBlIOKAmGlu
dOKAmSBbLVdmb3JtYXQ9XQo+ICAgICA2NSB8ICAgICAgICAgcHJpbnRmKCJrbW9kIC0gTWFuYWdl
IGtlcm5lbCBtb2R1bGVzOiBsaXN0LCBsb2FkLCB1bmxvYWQsIGV0Y1xuIgo+ICAgICAgICB8ICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgo+IC4uLi4uLgo+ICAgICA3MSB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICJDb21tYW5kczpcbiIsIGJhc2VuYW1lKGFyZ3ZbMF0pKTsKPiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQKPgo+Cj4gVGhvdWdodHM/CgpU
aGF0J3MgZXhhY3RseSB3aGF0IEknbSBzZWVpbmcgdG9vLiBUaGUgcHJvYmxlbSBpcyB0aGF0IHdo
ZW4geW91IHRoZW4KdHJ5IHRvIHVzZSB0aGUgcmVzdWx0aW5nIGJpbmFyaWVzIChlLmcuIG1vZHBy
b2JlKSB0aGV5IHNlZ2ZhdWx0LCBiZWNhdXNlCndoYXQncyBleHBlY3RlZCB0byBiZSBhIHBvaW50
ZXIgaXMgc29tZSBvdGhlciB2YWx1ZSAocHJvYmFibHkgaW50LCB3aXRoCmRpZmZlcmVudCBsZW5n
dGgpIGFuZCB0aGUgcmVzdWx0IGlzIGFuIGludmFsaWQgcG9pbnRlci4KClNvIHRoZSBidWlsZCBw
YXNzZXMsIGJ1dCB0aGUgcmVzdWx0aW5nIGttb2QgdG9vbHMgYXJlIHVudXNhYmxlLiBUaGF0J3MK
aG93IEkgZm91bmQgdGhlIGlzc3VlLCBJIHdhcyB3b25kZXJpbmcgd2h5IG5vIG1vZHVsZXMgd2Vy
ZSBsb2FkZWQgb24gbXkKYm9hcmQuIEkgd291bGQndmUganVzdCBzd2l0Y2hlZCB0byB0aGUgQnVz
eWJveCBlcXVpdmFsZW50cywgYnV0IHRoZXkKY2FuJ3QgaGFuZGxlIGNvbXByZXNzZWQgbW9kdWxl
cy4KClNvcnJ5IEkgd2Fzbid0IGNsZWFyZXIsIEkgdHJpZWQgdG8ga2VlcCB0aGUgY29tbWl0IG1l
c3NhZ2Ugc2hvcnQsCmV2aWRlbnRseSB0b28gc2hvcnQuCgpCZXN0IHJlZ2FyZHMsCkZpb25hCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
