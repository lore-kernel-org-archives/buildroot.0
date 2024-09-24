Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAD6CF9C71
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 08:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E8AA40151;
	Tue, 24 Sep 2024 08:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWWZJUMCnwEu; Tue, 24 Sep 2024 08:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FC95405BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FC95405BC;
	Tue, 24 Sep 2024 08:09:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 753411BF36C
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 08:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 635294028F
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 08:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qo566R3pqmda for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 08:09:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.5;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCCFB40285
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCFB40285
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCCFB40285
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 08:09:42 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Tue, 24 Sep 2024 16:09:40 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 24 Sep 2024 16:09:40 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Arnout Vandecappelle" <arnout@mind.be>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <ccc3bdea-4ce5-4ccb-a143-d55cda8574bf@mind.be>
References: <20240922090713.20744-1-andyshrk@163.com>
 <7728aa00-20d0-4dd8-8db7-4b6c75265082@mind.be>
 <295f913.4081.19222169e77.Coremail.andyshrk@163.com>
 <ccc3bdea-4ce5-4ccb-a143-d55cda8574bf@mind.be>
X-NTES-SC: AL_Qu2ZBf2duksj5iCfYulS+zN027ZZGIPiw4tinfIOfuALgRno+Sw7QGRAAUPr2/saae/gRRYXLIxDPzl9AOta
MIME-Version: 1.0
Message-ID: <93c415f.83d8.192231435fb.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bygvCgDHr43Ec_JmTHkCAA--.2115W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxpkXmbycJ5wSgABsS
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=NMINMWV+pZYz8/rslI7fcMCS1WXOBOFI5+eN9FK7VuE=; b=I
 pe1PJUloY7fSZ3FrfojW6sbAXC0IzV1cikCa2C9ai0RLmRB2/OsVXhICVJ+MGnkA
 AF0OoDfug9+puICYG29MSYO9XcP0QE5BZUORrR2Jw8UcyZv3DjJwfJN1qciwWJBZ
 DaqSzQ6dCl0btL7EPxfp+tl9Qa/1aP3oe76J8gg9CI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Ipe1PJUl
Subject: Re: [Buildroot] [PATCH] package/io: New package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkhpIEFybm91dCwKCuWcqCAyMDI0LTA5LTI0IDE0OjI4OjA177yMIkFybm91dCBWYW5kZWNhcHBl
bGxlIHZpYSBidWlsZHJvb3QiIDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4g5YaZ6YGT77yaCj4K
Pgo+T24gMjQvMDkvMjAyNCAwNTozMiwgQW5keSBZYW4gd3JvdGU6Cj4+IAo+PiBIaSBBcm5vdXTv
vIwKPj4gCj4+IEF0IDIwMjQtMDktMjQgMDI6NDc6MDIsICJBcm5vdXQgVmFuZGVjYXBwZWxsZSB2
aWEgYnVpbGRyb290IiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Pj4gICBIaSBB
bmR5LAo+W3NuaXBdCj4+PiAgIEkgZ3Vlc3MgdGhpcyByZWxpZXMgb24gQ09ORklHX0RFVk1FTSB0
byBiZSBzZXQgaW4gdGhlIGtlcm5lbC4gVGhpcyBzaG91bGQgYmUKPj4+IG1lbnRpb25lZCBpbiB0
aGUgQ29uZmlnLmluIGhlbHAgdGV4dCwgYW5kIGlkZWFsbHkgc29tZXRoaW5nIGxpa2UgdGhpczoK
Pj4gCj4+IEkgd2lsbCBtZW50aW9uIGl0IGluIENvbmZpZy5pbiwgYXMgc29tZXRpbWVzIHdlIG1h
eSBidWlsZCBhIHJvb3RmcyB3aXRob3V0IGxpbnV4IGtlcm5lbCwKPj4gaSBhbSBub3Qgc3VyZSB3
ZSBzaG91ZCBhZGQgdGhpcyBMSU5VWF9DT05GSUdfRklYVVBTIG9yIG5vdC4KPgo+ICBMSU5VWF9D
T05GSUdfRklYVVBTIGlzIGlnbm9yZWQgaWYgeW91IGRvbid0IGJ1aWxkIHRoZSBrZXJuZWwgZnJv
bSB3aXRoaW4gCj5idWlsZHJvb3QsIHNvIHRoYXQncyBmaW5lLiBUaGUgbWFpbiBxdWVzdGlvbiBp
czogaXMgdGhlcmUgZXZlciBhIHNpdHVhdGlvbiB3aGVyZSAKPnlvdSBjYW4gdXNlIHRoaXMgdG9v
bCB3aXRob3V0IGhhdmluZyBDT05GSUdfREVWTUVNIHNldD8gSWYgbm90LCBpdCdzIHByb2JhYmx5
IAo+YmV0dGVyIHRvIGFkZCB0aGUgZml4dXAuCj4KPiAgSXQncyBhIGJpdCBhIHRyaWNreSBkZWNp
c2lvbiBpbiB0aGlzIGNhc2UgaG93ZXZlciwgYmVjYXVzZSBDT05GSUdfREVWTUVNIGlzIGEgCj5z
ZWN1cml0eSBibGFjayBob2xlLiBJZiB5b3UgYWNjaWRlbnRhbGx5IGxlYXZlIHRoZSBpbyB0b29s
IGVuYWJsZWQsIHlvdSdyZSAKPmZvcmNpbmcgdGhlIGtlcm5lbCB0byBidWlsZCBpbiB0aGlzIGFu
dGlmZWF0dXJlLi4uCj4KPiAgU28gb24gc2Vjb25kIHRob3VnaHQsIHByb2JhYmx5IGJldHRlciBu
b3QgdG8gaW5jbHVkZSB0aGUgTElOVVhfQ09ORklHX0ZJWFVQUy4KCk9rYXksIEkgd2lsbCBmb2xs
b3cgeW91IHN1Z2dlc3Rpb24uClRoYW5rIHlvdS4KCj4KPiAgUmVnYXJkcywKPiAgQXJub3V0Cj4K
Pgo+PiAKPj4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4KPj4+Cj4+PiBkZWZpbmUgSU9fTElOVVhf
Q09ORklHX0ZJWFVQUwo+Pj4gCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0RFVk1F
TSkKPj4+IGVuZGVmCj4+Pgo+Pj4+ICtkZWZpbmUgSU9fQlVJTERfQ01EUwo+Pj4+ICsJJChUQVJH
RVRfQ0MpICQoVEFSR0VUX0NGTEFHUykgJChUQVJHRVRfTERGTEFHUykgJChARCkvaW8uYyAtbyAk
KEBEKS9pbwo+Pj4+ICtlbmRlZgo+Pj4+ICsKPj4+PiArZGVmaW5lIElPX0lOU1RBTExfVEFSR0VU
X0NNRFMKPj4+PiArCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAkKEBEKS9pbyAkKFRBUkdFVF9ESVIp
L3Vzci9iaW4vaW8KPj4+PiArZW5kZWYKPj4+PiArCj4+Pj4gKyQoZXZhbCAkKGdlbmVyaWMtcGFj
a2FnZSkpCj4+Pgo+Pj4KPj4+ICAgUmVnYXJkcywKPj4+ICAgQXJub3V0Cj4+Pgo+Pj4gWzFdIGh0
dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNERVZFTE9QRVJTCj4+Pgo+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+PiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+X19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj5odHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
