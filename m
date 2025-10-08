Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE4FCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 10:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA9140AE8;
	Wed,  8 Oct 2025 10:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2fqiG5T0LYk; Wed,  8 Oct 2025 10:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2748140AAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2748140AAA;
	Wed,  8 Oct 2025 10:34:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1820226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 932E660DB0
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1uJurzIBvre for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 10:34:08 +0000 (UTC)
X-Greylist: delayed 903 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 08 Oct 2025 10:34:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3205060D9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3205060D9B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3205060D9B
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:34:07 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.59; Wed, 8 Oct
 2025 12:18:59 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.059; Wed, 8 Oct 2025 12:18:59 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Titouan Christophe <titouan.christophe@mind.be>,
 =?utf-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@arm.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Alistair Francis
 <alistair@alistair23.me>
Thread-Topic: [Buildroot] [PATCH] package/xen: security bump to v4.20.1
Thread-Index: AQHcN6rNpdeygQr4/E6Tph/rWXW6zLS31IkAgAAUhQA=
Date: Wed, 8 Oct 2025 10:18:59 +0000
Message-ID: <588646e8-70c5-4d3a-bd54-dde2274124df@actia.se>
References: <20251007164756.893264-1-titouan.christophe@mind.be>
 <aOYpXF3P53jPhGtV@debian>
In-Reply-To: <aOYpXF3P53jPhGtV@debian>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.67]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14451657662
Content-ID: <5305609977D918489C6019EAB7748008@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [PATCH] package/xen: security bump to v4.20.1
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

SGkgVGl0b3VhbiwgVmluY2VudCwNCg0KT24gMTAvOC8yNSAxMTowNSBBTSwgVmluY2VudCBTdGVo
bMOpIHdyb3RlOg0KID4gT24gVHVlLCBPY3QgMDcsIDIwMjUgYXQgMDY6NDc6NTNQTSArMDIwMCwg
VGl0b3VhbiBDaHJpc3RvcGhlIHZpYSANCmJ1aWxkcm9vdCB3cm90ZToNCiA+PiBSZW1vdmUgcGF0
Y2hlcyB0aGF0IGFyZSBhcHBsaWVkIHVwc3RyZWFtLCBhbmQgYWRhcHQgbGljZW5zZSBoYXNoIA0K
Zm9sbG93aW5nDQogPj4gdXBzdHJlYW0gY29tbWl0IDdiMDY4YWM4OTAyNDMwODg2MmM0ZjQ0OGRk
MjQ4NjQ1ZDJiOGU4ODINCiA+PiAoIlJlbW92ZSBleHRyYSBjb3BpZXMgb2YgbGljZW5zZXMgYW5k
IGxpY2Vuc2UgaGVhZGVycyIpDQogPj4NCiA+PiBBZGQgbmV3IHBhdGNoIHRvIGZpeCBhIGNvbXBp
bGF0aW9uIGlzc3VlIHdpdGggZ2NjMTUNCiA+DQogPiBIaSBUaXRvdWFuLA0KID4NCiA+IFRoYW5r
IHlvdSBmb3Igd29ya2luZyBvbiByZWZyZXNoaW5nIHRoZSB4ZW4gcGFja2FnZSwgYW5kIGZvciAN
CnByZXBhcmluZyB0aGlzDQogPiBkZXRhaWxlZCBsaXN0IG9mIENWRXMhDQogPg0KID4gSSBmZWFy
IGJ1bXBpbmcgeGVuIHRvIDQuMjAgd2lsbCBub3QgY29tcGlsZSBzbyBlYXNpbHk7IGluIGZhY3Qg
dGhpcyANCnBhdGNoIGRvZXMNCiA+IGluZGVlZCBicmVhayB0aGUgZm9sbG93aW5nIHRlc3RzOg0K
ID4NCiA+IC0gdGVzdHMucGFja2FnZS50ZXN0X3hlbi5UZXN0WGVuQWFyY2g2NA0KID4gLSB0ZXN0
cy5wYWNrYWdlLnRlc3RfeGVuLlRlc3RYZW5Bcm12Nw0KID4NCiA+IEJ1bXBpbmcgWGVuIGlzIHNv
bWV0aGluZyBJIGhhdmUgdHJpZWQgb24gbXkgc2lkZSBhcyB3ZWxsLCBhbmQgSSBoYXZlIA0KcmVh
bGl6ZWQNCiA+IHJlY2VudGx5IHRoYXQgYSBzdWJzdGFudGlhbCBjaGFuZ2UgaGFzIGhhcHBlbmVk
IGJldHdlZW4gWGVuIDQuMTkgYW5kIA0KNC4yMDogdGhlDQogPiBxZW11LXhlbiBmb2xkZXIgaXMg
bm90IHNoaXBwZWQgaW4gdGhlIGFyY2hpdmUgYW55bW9yZS4gWzFdDQogPg0KWGVuIGRvZXMgc3Vw
cG9ydCB1c2luZyB0aGUgc3lzdGVtIHFlbXUgYXMgd2VsbCwgYW5kIHRoZSBxZW11IHBhY2thZ2Ug
aW4gDQpidWlsZHJvb3QgaXMgbmV3IGVub3VnaC4gSSB3YXMgZGFiYmxpbmcgYSBsaXR0bGUgYml0
IHdpdGggaXQgIGEgeWVhciBhZ28gDQpidXQgZGlkbid0IGdldCBmYXIgZW5vdWdoIHRvIHJ1biBh
bnkgc2lnbmlmaWNhbnQgdGVzdHMuDQoNClhlbiBidWlsZGluZyB3b3VsZCBuZWVkIC0td2l0aC1z
eXN0ZW0tcWVtdT15ZXMsIGFuZCBJIGZvcmdvdCB3aGF0IHN3aXRjaCANCndhcyBuZWVkZWQgZm9y
IHFlbXUuDQoNCkl0IGNvdWxkIGJlIGFuIGF2ZW51ZSB0byBleHBsb3JlIGFzIHdlbGwuDQoNCkJl
c3QgcmVnYXJkcyAvLyBKb2huIEVybmJlcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
