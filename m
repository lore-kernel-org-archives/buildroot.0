Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0190CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE5E4400B8;
	Mon,  2 Sep 2024 16:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lUTw-rT2zkS; Mon,  2 Sep 2024 16:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D20E40291
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D20E40291;
	Mon,  2 Sep 2024 16:05:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE691BF38E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48B1E60703
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9TDl_4iw1UQ for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:05:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B07B606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B07B606F6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B07B606F6
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:05:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7858B13F8A9;
 Mon,  2 Sep 2024 18:05:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 18:05:29 +0200
Date: Mon, 2 Sep 2024 18:05:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Message-ID: <ZtXiSdHDKwJIOl_g@landeda>
References: <20240902132403.177333-1-flavio.tapajos@newtesc.com.br>
 <ZtXYnRjjvtodARmI@landeda>
 <84cd0ec9-1915-41c1-a4ab-031c4310112f@newtesc.com.br>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84cd0ec9-1915-41c1-a4ab-031c4310112f@newtesc.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725293134;
 bh=qwOsNM4fsA8HWx+OaHzSwPWVGIdO3M4RRR4tIGaoC3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rTj3tVZts9Iu2AtrInSeCooj739lMkLGBa4t6YE2Td3RdnzTdw1gq3E1sZdFEuS1p
 mCu0oaZtfk8JG7nexTGR+PPAwws2RIHnCGcII+zHUfj1lx7w8sVzs/HMGzAYzZatgW
 EFxi4/YxO0roquSYBf3uOPpw8TpyIhrnQJQYhkpnKKPf2TowkwkU84oZmeAUcEfOjC
 NMmFGn3jjnvt+Tf0gzGz6yTpDGsIaz7o/tkoQBFrKrHWE6FCwHtwvPMqXPfoPbplhU
 GxYomKyfHIZc28PAjnob+jKNrqBvs+QESPcBVoRl00mGI7FbYeXoswQwdu/6hpG4aW
 oCWibKuP2oYsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rTj3tVZt
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: fix build
 issue with setuptools > 69.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmzDoXZpbywgQWxsLAoKT24gMjAyNC0wOS0wMiAxMjo1OCAtMDMwMCwgRmzDoXZpbyBUYXBhasOz
cyBzcGFrZSB0aHVzbHk6Cj4gTW9yaW4sCgpZYW5uLCBwbGVhc2UuIDstKQoKPiBFbSAwMi8wOS8y
MDI0IDEyOjI0LCBZYW5uIEUuIE1PUklOIGVzY3JldmV1Ogo+ICAgICBIb3dldmVyLCB0aHMgcGF0
Y2ggaGFzIHplcm8gY2hhbmNlIG9mIGdldHRpbmcgdXBzdHJlYW0sIHNvIGl0IG1lYW5zIHdlJ2QK
PiAgICAgaGF2ZSB0byBjYXJyeSBpdCBmb2V2ZXIgYW5kIGV2ZXIuCj4gVGhhdCBpcyB1bmxpa2Vs
eS4gQWZ0ZXIgbXkgcXVlc3Rpb24sIG1haW50YWluZXJzIG9wZW5lZCB0aGUgdGlja2V0IFs3XWh0
dHBzOi8vCj4gZ2Vycml0LnNxbGFsY2hlbXkub3JnL2Mvc3FsYWxjaGVteS9zcWxhbGNoZW15Lysv
NTQ3OCB3aXRoIHRoZSBkZXNjcmlwdGlvbjoKPiAKPiA+IFRoZSBwaW4gZm9yIGBgc2V0dXB0b29s
czw2OS4zYGAgaW4gYGBweXByb2plY3QudG9tbGBgIGhhcyBiZWVuIHJlbW92ZWQuwqAgVGhpcwo+
IHBpbiB3YXMgdG8gcHJldmVudCBhIHN1ZGRlbiBjaGFuZ2UgdG8gOnBlcDpgNjI1YCBpbiBzZXR1
cHRvb2xzIGZyb20gdGFraW5nCj4gcGxhY2Ugd2hpY2ggY2hhbmdlcyB0aGUgZmlsZSBuYW1lIG9m
IFNRTEFsY2hlbXkncyBzb3VyY2UgZGlzdHJpYnV0aW9uIG9uIHB5cGkKPiB0byBiZSBhbiBhbGwg
bG93ZXIgY2FzZSBuYW1lLCB3aGljaCBpcyB2ZXJ5IGxpa2VseSB0byBjYXVzZSBwcm9ibGVtcyB3
aXRoCj4gdmFyaW91cyBidWlsZCBlbnZpcm9ubWVudHMgdGhhdCBleHBlY3RlZCBwYXJ0aWN1bGFy
IG5hbWluZyBzdHlsZS7CoCBIb3dldmVyLCB0aGUKPiBwcmVzZW5jZSBvZiB0aGlzIHBpbiBpcyBu
b3cgYmFjayBlbnZpcm9ubWVudHMgdGhhdCBvdGhlcndpc2Ugd2FudCB0byB1c2UgYQo+IG5ld2Vy
IHNldHVwdG9vbHMsIHNvIHdlJyBkZWNpZGVkIHRvIG1vdmUgZm9yd2FyZCB3aXRoIHRoaXMgY2hh
bmdlLCB3aXRoIHRoZQo+IGFzc3VtcHRpb24gdGhhdCBlbnZpcm9ubWVudHMgd2lsbCBoYXZlIGxh
cmdlbHkgYWNjb21tb2RhdGVkIHRoZSBzZXR1cHRvb2xzCj4gY2hhbmdlIG5vdy4KCkFoLCBpZiB1
cHN0cmVhbSBoYXMgYWNrbm93bGVkZ2VkIHRoZSBpc3N1ZSBhbmQgd2lsbCByZXNvbHZlIGl0LCB0
aGVuCmluZGVlZCB3ZSBjYW4ganVzdCByZXZlcnQgaW4gdGhlIG1lYW50aW1lLgoKQnV0IHRoZW4g
eW91IHNob3VsZCBhZGQgdGhhdCBpbmZvcm1hdGlvbiB0byB0aGUgY29tbWl0IGxvZywgYW5kIGFk
ZCBhbgpVcHN0cmVhbS10YWcgdGhhdCBtZW50aW9uIGl0IGlzIG5vdCBhcHBsaWNhYmxlIHdoZW4g
eW91IHJlc3BpbiwKc29tZXRoaW5nIGxpa2U6CgogICAgVXBzdHJlYW06IE4vQQogICAgVXBzdHJl
YW0gd2lsbCBmaXggdGhpcyBpbiBhbiB1cGNvbWluZyByZWxlYXNlOgogICAgICAgIGh0dHBzOi8v
Z2Vycml0LnNxbGFsY2hlbXkub3JnL2Mvc3FsYWxjaGVteS9zcWxhbGNoZW15LysvNTQ3OAoKVGhh
bmsgeW91IGZvciBmZWVkYmFjayEKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQg
fCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAw
NTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAg
ICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdB
SU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vl
ay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwK
Jy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
