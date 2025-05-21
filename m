Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9A6C54756
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 01:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E43DF610EA;
	Wed, 21 May 2025 01:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEaUiT9o8NIZ; Wed, 21 May 2025 01:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD9460766
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD9460766;
	Wed, 21 May 2025 01:13:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A39761BF
 for <buildroot@buildroot.org>; Wed, 21 May 2025 01:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9425B80E1E
 for <buildroot@buildroot.org>; Wed, 21 May 2025 01:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoA1gilGu19Z for <buildroot@buildroot.org>;
 Wed, 21 May 2025 01:13:27 +0000 (UTC)
X-Greylist: delayed 1813 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 21 May 2025 01:13:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD26580DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD26580DC6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.2;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD26580DC6
 for <buildroot@buildroot.org>; Wed, 21 May 2025 01:13:26 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Wed, 21 May 2025 08:27:44 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 21 May 2025 08:27:44 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, fiona.klute@gmx.de
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250519103955.49288872E7@busybox.osuosl.org>
References: <20250519103955.49288872E7@busybox.osuosl.org>
X-NTES-SC: AL_Qu2fBfuTuEot4iWdZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jAnp4h0vRHlFF0T18sKdCjuCnh6Rezd+48txc5VhR4MFKC9M9lAgIpZLNLpO5yuT4Q==
MIME-Version: 1.0
Message-ID: <3b9c0e07.4f5.196f03d322b.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgD3_8YAHi1oEgYJAA--.7066W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hJUXmgtFWpR4QACsC
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=Z/13YqgBGfZX60QBd4J6buigEO2R5ucEx4v7xr4DrZM=; b=Y
 iRHLYVxdpcuwopc+wQh4+LzzA7E+9az53H+F+MqhKKDgopON/O4LMPvSHc2KtXUv
 9b3Mxo61XQcgfBdo6jmWcGg6Cz6mPoBSKsXkXiOpKUDX4QoOxJELxoXckpxG+pCX
 ZfltVixQt+CliPAhDXjar1kcA8//ICh+ZPiMv/j0w4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=YiRHLYVx
Subject: Re: [Buildroot] [git commit branch/next] package/busybox: save
 shell history only on exit
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkhlbGxv77yMCgpBdCAyMDI1LTA1LTE5IDE5OjAwOjAwLCAiVGhvbWFzIFBldGF6em9uaSB2aWEg
YnVpbGRyb290IiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Y29tbWl0OiBodHRw
czovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTNmZmRjYzViOWRiMmE3
MDMyNTlmOTAwZmRjODI1MWM0ZTBkMTRkZmIKPmJyYW5jaDogaHR0cHM6Ly9naXQuYnVpbGRyb290
Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1yZWZzL2hlYWRzL25leHQKPgo+Qm90aCBidXN5Ym94
LmNvbmZpZyBhbmQgYnVzeWJveC1taW5pbWFsLmNvbmZpZyBzZXQKPkNPTkZJR19GRUFUVVJFX0VE
SVRJTkdfU0FWRUhJU1RPUlk9eS4gVGhpcyBjYXVzZXMgdGhlIEJ1c3lib3ggc2hlbGwgdG8KPndy
aXRlIHRoZSBoaXN0b3J5IGZpbGUgYWZ0ZXIgZXZlcnkgY29tbWFuZCwgd2hpY2ggY2FuIGJlIGEg
cHJvYmxlbSBvbgo+c3RvcmFnZSB3aXRoIGxpbWl0ZWQgd3JpdGUgY3ljbGVzIChlLmcuIGVNTUMp
Lgo+Cj5TZXQgQ09ORklHX0ZFQVRVUkVfRURJVElOR19TQVZFX09OX0VYSVQ9eSB0byBjaGFuZ2Ug
YmVoYXZpb3IgdG8gd3JpdGUKPnRoZSBoaXN0b3J5IGZpbGUgb25seSBvbiBleGl0LCB3aGljaCBy
ZWR1Y2VzIHdyaXRlcyB3aXRob3V0IGxvc2luZyB0aGUKPmhpc3RvcnkgZmVhdHVyZS4KCkFmdGVy
IGFwcGx5aW5nIHRoaXMgcGF0Y2gsIG15IHNoZWxsIGhpc3Rvcnkgd2FzIGxvc3QgYWZ0ZXIgSSBy
ZWJvb3QgbXkgYm9hcmQgd2l0aCByZWJvb3QgY29tbWFuZC4KSWYgSSBlbmFibGUgdGhlIG9wdGlv
biBDT05GSUdfRkVBVFVSRV9FRElUSU5HX1NBVkVISVNUT1JZPXksIHRoZSBzaGVsbCBoaXN0b3J5
IHdpbGwgY29tZSBiYWNrIGFmdGVyIHJlYm9vdC4KV2FzIGl0IHNvbWV0aGluZyBJIG1pc3NlZCBp
biB0aGUgZGV0YWlscz8KCj4KPlNpZ25lZC1vZmYtYnk6IEZpb25hIEtsdXRlIChXSVdBKSA8Zmlv
bmEua2x1dGVAZ214LmRlPgo+U2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4KPi0tLQo+IHBhY2thZ2UvYnVzeWJveC9idXN5Ym94LW1p
bmltYWwuY29uZmlnIHwgMiArLQo+IHBhY2thZ2UvYnVzeWJveC9idXN5Ym94LmNvbmZpZyAgICAg
ICAgIHwgMiArLQo+IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj5kaWZmIC0tZ2l0IGEvcGFja2FnZS9idXN5Ym94L2J1c3lib3gtbWluaW1hbC5jb25m
aWcgYi9wYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZpZwo+aW5kZXggOTczM2Rk
MjE1Ni4uMWU0YjQwNDQ3OSAxMDA2NDQKPi0tLSBhL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94LW1p
bmltYWwuY29uZmlnCj4rKysgYi9wYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZp
Zwo+QEAgLTEwNSw3ICsxMDUsNyBAQCBDT05GSUdfRkVBVFVSRV9FRElUSU5HX01BWF9MRU49MTAy
NAo+IENPTkZJR19GRUFUVVJFX0VESVRJTkdfVkk9eQo+IENPTkZJR19GRUFUVVJFX0VESVRJTkdf
SElTVE9SWT05OTkKPiBDT05GSUdfRkVBVFVSRV9FRElUSU5HX1NBVkVISVNUT1JZPXkKPi0jIENP
TkZJR19GRUFUVVJFX0VESVRJTkdfU0FWRV9PTl9FWElUIGlzIG5vdCBzZXQKPitDT05GSUdfRkVB
VFVSRV9FRElUSU5HX1NBVkVfT05fRVhJVD15Cj4gQ09ORklHX0ZFQVRVUkVfUkVWRVJTRV9TRUFS
Q0g9eQo+IENPTkZJR19GRUFUVVJFX1RBQl9DT01QTEVUSU9OPXkKPiAjIENPTkZJR19GRUFUVVJF
X1VTRVJOQU1FX0NPTVBMRVRJT04gaXMgbm90IHNldAo+ZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnVz
eWJveC9idXN5Ym94LmNvbmZpZyBiL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94LmNvbmZpZwo+aW5k
ZXggNjlkODk2YmViZC4uODIzZmNkMmI0NiAxMDA2NDQKPi0tLSBhL3BhY2thZ2UvYnVzeWJveC9i
dXN5Ym94LmNvbmZpZwo+KysrIGIvcGFja2FnZS9idXN5Ym94L2J1c3lib3guY29uZmlnCj5AQCAt
MTA4LDcgKzEwOCw3IEBAIENPTkZJR19GRUFUVVJFX0VESVRJTkdfTUFYX0xFTj0xMDI0Cj4gQ09O
RklHX0ZFQVRVUkVfRURJVElOR19WST15Cj4gQ09ORklHX0ZFQVRVUkVfRURJVElOR19ISVNUT1JZ
PTk5OQo+IENPTkZJR19GRUFUVVJFX0VESVRJTkdfU0FWRUhJU1RPUlk9eQo+LSMgQ09ORklHX0ZF
QVRVUkVfRURJVElOR19TQVZFX09OX0VYSVQgaXMgbm90IHNldAo+K0NPTkZJR19GRUFUVVJFX0VE
SVRJTkdfU0FWRV9PTl9FWElUPXkKPiBDT05GSUdfRkVBVFVSRV9SRVZFUlNFX1NFQVJDSD15Cj4g
Q09ORklHX0ZFQVRVUkVfVEFCX0NPTVBMRVRJT049eQo+ICMgQ09ORklHX0ZFQVRVUkVfVVNFUk5B
TUVfQ09NUExFVElPTiBpcyBub3Qgc2V0Cj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+YnVpbGRyb290IG1haWxpbmcgbGlzdAo+YnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
