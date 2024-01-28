Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9B9C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 19:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08066408C1;
	Sun, 28 Jan 2024 19:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08066408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nAuKAmubasyd; Sun, 28 Jan 2024 19:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DE6640578;
	Sun, 28 Jan 2024 19:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE6640578
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D1631BF573
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 19:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DF4082379
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 19:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DF4082379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTqMuaeWuPqb for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 19:40:15 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F39A82279
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 19:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F39A82279
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.221.4]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkHQX-1qoTLN0cfZ-00kgXd; Sun, 28
 Jan 2024 20:40:08 +0100
Message-ID: <18dad1bb-cfe6-476f-b8be-85ea98c84f3f@gmx.at>
Date: Sun, 28 Jan 2024 20:40:07 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20230901192719.102415-1-dalang@gmx.at>
 <20230901192719.102415-4-dalang@gmx.at>
 <1f2e43ba-7a94-48a2-be01-2e8e419fc036@mind.be>
Content-Language: en-US
In-Reply-To: <1f2e43ba-7a94-48a2-be01-2e8e419fc036@mind.be>
X-Provags-ID: V03:K1:7PjP8N8OGe21olDKJ7E6TSHCmN9NEEAk2WpIJx22MgZVMYfFnrf
 0G9s0oU6TLcexzzdzjFASNgM+yxY9VUpwhLAVw51Ej64RwOGrnQxWY5tNw4DFEVBmD5G5in
 ACmGsniYk/l1iIWvECn/jiGoWTHttlBkVa0Yj/KI0Fkb27b8BeUD2hLzdEfML6douaVLjdt
 36FlGfMsqaJjfGDv8k1+w==
UI-OutboundReport: notjunk:1;M01:P0:FE2v+Qqzakk=;wrLn4rmUoO0xa2B3c+a+1yzrc+P
 C85DEFxyqNoDm6VN6GO6+KgTH4BYjiwUSaNhPBMalgREuyoQAupRxjnK+ltZGFf2ppIJF2tY+
 hiW7IWfZIsajNSMZ6SRTS8OtLCYUKO5gXJe+7rIVfPxjMz12dUXft/4Y7kFWyhWfHoY7gm4GW
 PxnIIWl2k/X2vR+9gBysb+KsA+goQSDeqQnoSaUjA6Efx8y8zsCW7BMYDgy3FQPc9U8G48HRN
 b2jNe7OPih/8TUZnpzk9h5Xo99rAUqZYYG7fdN9WfbcV1oGWYK1aopb5BNy4Rcc2vLbsMfEsI
 uvCNQvbk8Sa/rHP68AqLVAIR1gq3xPQZ2XX3KDPJrsvmoj89Ueyy1vMEFE7Cl3w+W25bWeent
 2juouUKBjJekQWcVcb+6MTllONGywj/3DhtqhURHpPo3Cf5D2fSQL4ubHWG3dZVaf3hCJOsfu
 jCgFubd+jFjqCBHf943lAA/bKLSo5mt93/tAiyiJRlT9ffMbY4gN5WZ6BEzLbNGstzJwiRHZB
 X5bffHRWAvVe4H3WWKuImQtGHe0Hw6iph0gHQSrGI4h9v6qzIliKTqyMKiFQSd1T5rBrgl2zT
 4gQq6ToV9R33A5vtfF4HY1BIUbIbuz3oXxbQoBIZNY6URMRsFpCW/OZQ8eS6R9+5FgcS2y1Uf
 HCZ7+KA1p0PPYj4lQP6hRJna5jBQfXlZIosPhVJ9avMRyP6eTQPXDMxa8/YFE+fFnRlvEc8iA
 8yl0h9BVuRzYg2qv/SEUaBLfvIlZIS4zX7wI3z4Zn02rNfxJKmI5N5Y3vEL7swP3I+sHL+S29
 CSj06ympkAtXhtg2yN9dRIXlmc82Ho2iSILp7ewehPzr+flxdZVZJhNe76Y/Hv70pwymhx+0p
 LVrCisNUTc6VY/q3PgE9iknu+DJUg3JjDVSy1dtaealwLnPf18RWdkJlaYeFoZWumVT0CEw8O
 jXlDxdhacT8+sqmIR9rBoggdmEY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1706470808; x=1707075608; i=dalang@gmx.at;
 bh=I8QRq3VRsnLhROTkvQPFcRih1Qjun7i2qkYLd7az9aE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=PS0TYXK6goXT9BthhT9s7KounZ+fxX8AYYCGoY06buhDq04+GK9KWUuSpVBxqrJT
 QHC4zzek7Zy+3LVonM9mxB87CJd83TZVsNmtvdwrGL085ELJS9zEbtGME1bACdeeV
 i9o4rIbbQRwUeY8f/SSYLtx+7HtDzcOGcKdmHrxonpbdwEVa6/nD1zCOg/s7ruL4h
 0uz0Gp0pYiS/E+GFEce4Tz3c10/ZnyDNk8vV1P4o0ZgUS/mt1WcEW85hFS1k52kZu
 eSyyG+sjB2pfuLLEBWfrgHj+B7w6IpLwcyIYX7p396q7Ppo6LYXk2gLYl/L6cu5sP
 G31cuFqG65xeEIbaiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=PS0TYXK6
Subject: Re: [Buildroot] [PATCH v4 4/6] support/scripts/cve.py: switch to
 NVD API v2
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LA0KDQpPbiAxMi4wMS4yNCAyMDozOSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3Jv
dGU6DQo+IMKgSGkgRGFuaWVsLA0KPiANCj4gwqBJJ20gZmluYWxseSBnZXR0aW5nIGFyb3VuZCB0
byB0aGlzIHBhdGNoIHNlcmllcy4uLiBJIGhhdmUgb25lIGxpdHRsZSBxdWVzdGlvbiAoYW5kIGEg
bG90IG9mIGxpdHRsZSBjaGFuZ2VzIHRoYXQgSSdtIGRvaW5nIHdoaWxlIGFwcGx5aW5nKS4NCg0K
QXMgSSBtZW50aW9uZWQgaW4gbXkgbGFzdCBlbWFpbCB0byBUaG9tYXMgWzBdLCBJIGhhdmUgc2lu
Y2UgbW92ZWQgYXdheSBmcm9tIHRoZSBkYXRhYmFzZSBhcHByb2FjaCBiYWNrIHRvIGpzb24gZmls
ZXMuDQpBZGRpdGlvbmFsbHkgSSB0b3llZCB3aXRoIHRoZSBpZGVhIG9mIHVzaW5nIEdpdExhYiBm
b3IgZmV0Y2hpbmcgYW5kIG9wdGltaXppbmcgdGhlIGRhdGEgYmVjYXVzZSBwYXNzaW5nIGl0IG9u
IHRvIGJ1aWxkcm9vdCB1c2Vycy4NCkEgcXVpY2sgcHJvdmUgb2YgY29uY2VwdCBjYW4gYmUgZm91
bmQgZm91bmQgaGVyZSBbMV0uDQoNCj4gDQo+IE9uIDAxLzA5LzIwMjMgMjE6MjcsIERhbmllbCBM
YW5nIHdyb3RlOg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIGNvbmZpZyBpbiB2dWxb
J2N2ZSddLmdldCgnY29uZmlndXJhdGlvbnMnLCAoKSk6DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGZvciBub2RlIGluIGNvbmZpZ1snbm9kZXMnXToNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgY3BlX21hdGNoIGluIG5vZGVbJ2NwZU1h
dGNoJ106DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiBub3QgY3BlX21hdGNoWyd2dWxuZXJhYmxlJ106DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXRjaF9kYXRhID0gc2Vs
Zi5leHRyYWN0X2NwZV9tYXRjaF9kYXRhKGNwZV9tYXRjaCkNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIG5vdCBtYXRjaF9kYXRhOg0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250
aW51ZQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y3BlX21hdGNoZXMuYXBwZW5kKG1hdGNoX2RhdGEpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25maWd1cmF0aW9ucy5hcHBlbmQoW3Z1bFsnY3Zl
J11bJ2lkJ10sIG1hdGNoX2RhdGFbMF1dKQ0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIGN1cnNv
ciA9IHNlbGYuZGJfY29ubmVjdGlvbi5jdXJzb3IoKQ0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKg
ICMgRHJvcCBhbGwgQ1ZFcyB0aGF0IGFyZSByZWplY3RlZCwgc3RhdHVzIG1pZ2h0IGhhdmUgY2hh
bmdlZA0KPj4gK8KgwqDCoMKgwqDCoMKgIGN1cnNvci5leGVjdXRlbWFueSgnREVMRVRFIEZST00g
Y3ZlcyBXSEVSRSBpZCA9ID8nLCBjdmVfaWRzX2Ryb3BwZWQpDQo+PiArDQo+PiArwqDCoMKgwqDC
oMKgwqAgIyBEZWxldGUgY29uZmlndXJhdGlvbiBtYXBwaW5nIGZvciBpbmNsdWRlZCBDVkVzLCBv
dGhlcndpc2Ugd2UgY2FuJ3QgZGV0ZWN0DQo+PiArwqDCoMKgwqDCoMKgwqAgIyB1cHN0cmVhbSBk
cm9wcGluZyBjb25maWd1cmF0aW9ucy4NCj4+ICvCoMKgwqDCoMKgwqDCoCBjdXJzb3IuZXhlY3V0
ZW1hbnkoJ0RFTEVURSBGUk9NIGNvbmZpZ3VyYXRpb25zIFdIRVJFIGN2ZV9pZCA9ID8nLCBjdmVf
aWRzX2NoYW5nZWQpDQo+PiArwqDCoMKgwqDCoMKgwqAgY3Vyc29yLmV4ZWN1dGVtYW55KCdJTlNF
UlQgT1IgUkVQTEFDRSBJTlRPIGN2ZXMgVkFMVUVTICg/LCA/LCA/LCA/LCA/KScsIGN2ZXMpDQo+
PiArwqDCoMKgwqDCoMKgwqAgY3Vyc29yLmV4ZWN1dGVtYW55KCdJTlNFUlQgT1IgUkVQTEFDRSBJ
TlRPIGNwZV9tYXRjaGVzIFZBTFVFUyAoPywgPywgPywgPywgPywgPyknLCBjcGVfbWF0Y2hlcykN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBjdXJzb3IuZXhlY3V0ZW1hbnkoJ0lOU0VSVCBPUiBSRVBMQUNF
IElOVE8gY29uZmlndXJhdGlvbnMgVkFMVUVTICg/LCA/KScsIGNvbmZpZ3VyYXRpb25zKQ0KPiAN
Cj4gwqBBRkFJVSwgdGhlIGNvbmZpZ3VyYXRpb25zIHRhYmxlIGlzIHRoZXJlIHRvIG1ha2UgYW4g
TS1OIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIENWRXMgYW5kIENQRV9tYXRjaGVzLiBIb3dldmVyLCBJ
IGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoaXMgaXMgbmVlZGVkIG9yIGV2ZW4gcG9zc2libGUgLSBp
LmUuLCBpdCBuZWNlc3NhcmlseSBoYXMgdG8gYmUgYSAxLU4gcmVsYXRpb25zaGlwLiBJbmRlZWQs
IHRoZSBjb2RlIGFib3ZlIGFsd2F5cyBjcmVhdGVzIGJvdGggYSBDUEVfbWF0Y2ggbGluZSBhbmQg
YSBjb25maWd1cmF0aW9uIGxpbmU7IHRoZSBJRCBvZiB0aGUgQ1BFX21hdGNoIGxpbmUgaXMgVU5J
UVVFLCBzbyB0aGUgc2FtZSBtYXRjaCBsaW5lIGNhbm5vdCBiZSByZXVzZWQgZm9yIGFub3RoZXIg
Q1ZFLg0KDQpMb29raW5nIGF0IHRoZSBkYXRhYmFzZSB3aGVuIEkgbGFzdCByYW4gdGhpcyB2ZXJz
aW9uIGluIFNlcHRlbWJlciBvZiAyMDIzLCB0aGUgY291bnRzIGluIHRoZSB0aHJlZSB0YWJsZXMg
bG9va2VkIGxpa2UgdGhpczoNCi0gY3ZlczogMjExMDY2IHJvd3MNCi0gY3ZlX21hdGNoZXM6IDM5
ODE3OCByb3dzDQotIGNvbmZpZ3VyYXRpb25zOiAxOTcxNDU5IHJvd3MNCg0KU28gaXQgc2VlbXMg
dGhhdCB0aGUgc2FtZSBjdmVfbWF0Y2hlcyBJRCBpcyB1c2VkIGZvciBtdWx0aXBsZSBjdmVzLg0K
DQo+IA0KPiDCoFNvLCBJIHRoaW5rIHRoaXMgY29uZmlndXJhdGlvbnMgdGFibGUgaXMgZW50aXJl
bHkgcmVkdW5kYW50LCBhbmQgaW5zdGVhZCB0aGUgY3BlX21hdGNoZXMgdGFibGUgc2hvdWxkIGp1
c3QgY29udGFpbiBhIHJlZmVyZW5jZSB0byB0aGUgQ1ZFIElELg0KPiANCj4gwqAoRG9uJ3QgY2hh
bmdlIGFuZCByZXNlbmQgdGhpcyBwYXRjaCwgSSd2ZSBtYWRlIGEgd2hvbGUgbG90IG9mIGNoYW5n
ZXMgbXlzZWxmIGFuZCBJIGNhbiByZW1vdmUgdGhpcyBjb25maWd1cmF0aW9ucyB0YWJsZSB0b28u
KQ0KPiANCj4gwqBSZWdhcmRzLA0KPiDCoEFybm91dA0KDQpSZWdhcmRzLA0KRGFuaWVsDQoNClsw
XTogaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMy1E
ZWNlbWJlci82ODE4ODguaHRtbA0KWzFdOiBodHRwczovL2dpdGxhYi5jb20vZGFuaWVsbGFuZy9u
dmQtdjIuMC8NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
