Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2851EC369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 09:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9089C41729;
	Sat, 12 Apr 2025 09:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yjs5ebYci8Z3; Sat, 12 Apr 2025 09:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82C1141723
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82C1141723;
	Sat, 12 Apr 2025 09:14:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC35108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 09:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7C4241716
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 09:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lToDIo8yHEr for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 09:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAB7540884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB7540884
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAB7540884
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 09:14:33 +0000 (UTC)
Received: from tianyuanhao3$163.com (
 [240e:40c:2100:9a03:d2c9:f2c6:3dac:73e4] ) by ajax-webmail-wmsvr-40-129
 (Coremail) ; Sat, 12 Apr 2025 17:14:26 +0800 (CST)
X-Originating-IP: [240e:40c:2100:9a03:d2c9:f2c6:3dac:73e4]
Date: Sat, 12 Apr 2025 17:14:26 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, "James Hilliard" <james.hilliard1@gmail.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <Z/ktsWj+ng6Z5pyA@yd-6wlzhs3>
References: <20250411113731.4804-1-tianyuanhao3@163.com>
 <Z/ktsWj+ng6Z5pyA@yd-6wlzhs3>
X-NTES-SC: AL_Qu2fBviftkot4COeZ+kfmksSgOg6X8CxuP8g3IRWO5x+jADp6Bw/Z2VSNFjk0eO0FQmOmgmGfhxXzs5+ZoRAf6kBzzOw/Vr8Y76sMU/Phw2W5A==
MIME-Version: 1.0
Message-ID: <490223b3.2688.196294762bd.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gSgvCgDnLxLyLvpn66yTAA--.989W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXRctjWf501S3OAADs-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=2JnLNuZ1WUNGOrc4ZXCGk9PN/rDwGCGy39gAbXNoVlM=; b=E
 gz4GwvIxqfWGngtRX+IcuQeXQU4TE4mJpJXVUeonuG+7DmW47zvXdD37nZb6J69b
 Obkx5Hqz59jbtTIF7/PcVMcVRHWTHLx39HzXb1Gm4qvzRwm6HR7IkfzU67hWIT3Z
 6pv/JvGvnQ0kzrBzExwwnie4ascDkdabH/O+hj9/VY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Egz4GwvI
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: install service files
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
Content-Type: multipart/mixed; boundary="===============4167959529893710924=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4167959529893710924==
Content-Type: multipart/alternative; 
	boundary="----=_Part_38970_1409835193.1744449266365"

------=_Part_38970_1409835193.1744449266365
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgWWFubixBdCAyMDI1LTA0LTExIDIyOjU2OjQ5LCB5YW5uLm1vcmluQG9yYW5nZS5jb20gd3Jv
dGU6Cj5ZdWFuaGFvLCBBbGwsCj4KPk9uIDIwMjUtMDQtMTEgMDQ6MzcgLTA3MDAsIFRJQU4gWXVh
bmhhbyBzcGFrZSB0aHVzbHk6Cj4+IEluc3RhbGwgdGFpbHNjYWxlZCB0byAvdXNyL3NiaW4sIGFz
IHRoZSBzZXJ2aWNlIGZpbGUgcmVmZXJlbmNlcyB0aGF0Cj4+IGxvY2F0aW9uLgo+PiAKPj4gU2ln
bmVkLW9mZi1ieTogVElBTiBZdWFuaGFvIDx0aWFueXVhbmhhbzNAMTYzLmNvbT4KPj4gQ2M6IEph
bWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+PiAtLS0KPlstLVNOSVAt
LV0KPj4gK2RlZmluZSBUQUlMU0NBTEVfSU5TVEFMTF9UQVJHRVRfQ01EUwo+PiArCSQoSU5TVEFM
TCkgLUQgLW0gMDc1NSAkKEBEKS9iaW4vdGFpbHNjYWxlIFwKPj4gKwkJJChUQVJHRVRfRElSKS91
c3IvYmluL3RhaWxzY2FsZQo+PiArCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKEBEKS9iaW4vdGFp
bHNjYWxlZCBcCj4+ICsJCSQoVEFSR0VUX0RJUikvdXNyL3NiaW4vdGFpbHNjYWxlZAo+PiArZW5k
ZWYKPgo+SSB3b3VsZCBzdWdnZXN0IHRoYXQsIHJhdGhlciB0aGFuIG92ZXJyaWRlIHRoZSBkZWZh
dWx0IF9DTURTLCB5b3UKPnByb3ZpZGUgYSBwb3N0LWluc3RhbGwgaG9vayB0aGF0IGRvZXMgYSBz
eW1saW5rIGluIHNiaW4uCgpIb3cgYWJvdXQgY3JlYXRpbmcgdGhpcyBzeW1ib2xpYyBsaW5rIGlu
IFRBSUxTQ0FMRV9JTlNUQUxMX0lOSVRfKioqPwoKCj4KPj4gK2RlZmluZSBUQUlMU0NBTEVfSU5T
VEFMTF9JTklUX09QRU5SQwo+Wy0tU05JUC0tXQo+PiArZGVmaW5lIFRBSUxTQ0FMRV9JTlNUQUxM
X0lOSVRfU1lTVEVNRAo+Wy0tU05JUC0tXQo+Cgo+V2hhdCBhYm91dCBUQUlMU0NBTEVfSU5TVEFM
TF9JTklUX1NZU1YgPwoKClRoZSB1cHN0cmVhbSByZXBvc2l0b3J5IGRvZXMgbm90IHByb3ZpZGUg
YSBzeXN2IGluaXQgc2NyaXB0LCBhbmQgSSBhbSBub3QgZmFtaWxpYXIgd2l0aCBzeXN2IGluaXQg
ZWl0aGVyLgoKCj4KPlJlZ2FyZHMsCj5ZYW5uIEUuIE1PUklOLgo+CgpSZWdhcmRzLApUSUFOIFl1
YW5oYW8=
------=_Part_38970_1409835193.1744449266365
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRpdiBp
ZD0ic3BuRWRpdG9yQ29udGVudCI+PHByZSBzdHlsZT0id2lkdGg6IDExODMuMzFweDsgd29yZC1i
cmVhazogYnJlYWstd29yZCAhaW1wb3J0YW50OyI+SGkgWWFubiw8L3ByZT48L2Rpdj48cHJlPkF0
IDIwMjUtMDQtMTEgMjI6NTY6NDksIHlhbm4ubW9yaW5Ab3JhbmdlLmNvbSB3cm90ZToKJmd0O1l1
YW5oYW8sIEFsbCwKJmd0OwomZ3Q7T24gMjAyNS0wNC0xMSAwNDozNyAtMDcwMCwgVElBTiBZdWFu
aGFvIHNwYWtlIHRodXNseToKJmd0OyZndDsgSW5zdGFsbCB0YWlsc2NhbGVkIHRvIC91c3Ivc2Jp
biwgYXMgdGhlIHNlcnZpY2UgZmlsZSByZWZlcmVuY2VzIHRoYXQKJmd0OyZndDsgbG9jYXRpb24u
CiZndDsmZ3Q7IAomZ3Q7Jmd0OyBTaWduZWQtb2ZmLWJ5OiBUSUFOIFl1YW5oYW8gJmx0O3RpYW55
dWFuaGFvM0AxNjMuY29tJmd0OwomZ3Q7Jmd0OyBDYzogSmFtZXMgSGlsbGlhcmQgJmx0O2phbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20mZ3Q7CiZndDsmZ3Q7IC0tLQomZ3Q7Wy0tU05JUC0tXQomZ3Q7
Jmd0OyArZGVmaW5lIFRBSUxTQ0FMRV9JTlNUQUxMX1RBUkdFVF9DTURTCiZndDsmZ3Q7ICsJJChJ
TlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQpL2Jpbi90YWlsc2NhbGUgXAomZ3Q7Jmd0OyArCQkkKFRB
UkdFVF9ESVIpL3Vzci9iaW4vdGFpbHNjYWxlCiZndDsmZ3Q7ICsJJChJTlNUQUxMKSAtRCAtbSAw
NzU1ICQoQEQpL2Jpbi90YWlsc2NhbGVkIFwKJmd0OyZndDsgKwkJJChUQVJHRVRfRElSKS91c3Iv
c2Jpbi90YWlsc2NhbGVkCiZndDsmZ3Q7ICtlbmRlZgomZ3Q7CiZndDtJIHdvdWxkIHN1Z2dlc3Qg
dGhhdCwgcmF0aGVyIHRoYW4gb3ZlcnJpZGUgdGhlIGRlZmF1bHQgX0NNRFMsIHlvdQo8ZGl2PiZn
dDtwcm92aWRlIGEgcG9zdC1pbnN0YWxsIGhvb2sgdGhhdCBkb2VzIGEgc3ltbGluayBpbiBzYmlu
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNjgsIDY4
LCA2OCk7IGZvbnQtZmFtaWx5OiBzeXN0ZW0tdWksIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogbWVk
aXVtOyB3aGl0ZS1zcGFjZS1jb2xsYXBzZTogY29sbGFwc2U7IGJhY2tncm91bmQtY29sb3I6IHJn
YmEoMTQ4LCAxNjMsIDE4NCwgMC4wMyk7Ij5Ib3cgYWJvdXQgY3JlYXRpbmcgdGhpcyBzeW1ib2xp
YyBsaW5rIGluIFRBSUxTQ0FMRV9JTlNUQUxMX0lOSVRfKioqPzwvc3Bhbj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj4mZ3Q7CiZndDsmZ3Q7ICtkZWZpbmUgVEFJTFNDQUxFX0lOU1RBTExfSU5JVF9PUEVO
UkMKJmd0O1stLVNOSVAtLV0KJmd0OyZndDsgK2RlZmluZSBUQUlMU0NBTEVfSU5TVEFMTF9JTklU
X1NZU1RFTUQKJmd0O1stLVNOSVAtLV0KJmd0Owo8ZGl2PiZndDtXaGF0IGFib3V0IFRBSUxTQ0FM
RV9JTlNUQUxMX0lOSVRfU1lTViA/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3BhbiBzdHls
ZT0iY29sb3I6IHJnYig2OCwgNjgsIDY4KTsgZm9udC1mYW1pbHk6IHN5c3RlbS11aSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiBtZWRpdW07IHdoaXRlLXNwYWNlLWNvbGxhcHNlOiBjb2xsYXBzZTsg
YmFja2dyb3VuZC1jb2xvcjogcmdiKDI1MSwgMjUxLCAyNTEpOyI+VGhlIHVwc3RyZWFtIHJlcG9z
aXRvcnkgZG9lcyBub3QgcHJvdmlkZSBhIHN5c3YgaW5pdCBzY3JpcHQsIGFuZCBJIGFtIG5vdCBm
YW1pbGlhciB3aXRoIHN5c3YgaW5pdCBlaXRoZXIuPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PiZndDsKJmd0O1JlZ2FyZHMsCiZndDtZYW5uIEUuIE1PUklOLgomZ3Q7CjxwcmUgc3R5bGU9Indp
ZHRoOiAxMTgzLjMxcHg7IHdvcmQtYnJlYWs6IGJyZWFrLXdvcmQgIWltcG9ydGFudDsiPlJlZ2Fy
ZHMsClRJQU4gWXVhbmhhbzwvcHJlPgo8L3ByZT48L2Rpdj4=
------=_Part_38970_1409835193.1744449266365--


--===============4167959529893710924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4167959529893710924==--

