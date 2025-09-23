Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3083ECAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 20:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAD5661249;
	Tue, 23 Sep 2025 20:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1mJ_xjH9PFD; Tue, 23 Sep 2025 20:37:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112CD61242
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 112CD61242;
	Tue, 23 Sep 2025 20:37:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D61199
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 20:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 717D661234
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 20:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYQ6fekr7gWp for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 20:37:43 +0000 (UTC)
X-Greylist: delayed 455 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 23 Sep 2025 20:37:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D94676101E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D94676101E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.32.121.110;
 helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN> 
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net
 [178.32.121.110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D94676101E
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 20:37:41 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.110.54.128])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4cWWn74S7Tz5xT6;
 Tue, 23 Sep 2025 20:30:03 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Tue, 23 Sep
 2025 22:30:03 +0200
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e14f8974-f811-4645-be04-c547a47187da@kaod.org>
Date: Tue, 23 Sep 2025 22:30:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>, Joel Stanley <joel@jms.id.au>
References: <20250923135223.1062683-1-clg@kaod.org>
 <ad8d0f2e3258b51b7075195b6eea718f@free.fr>
Content-Language: en-US, fr
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <ad8d0f2e3258b51b7075195b6eea718f@free.fr>
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 2b998184-ec5d-4173-864f-d43b7ff5dbb2
X-Ovh-Tracer-Id: 237283407809776605
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGkL+GrLfPlUMa6vobdls+5NJaium2z1qXotWbWPUEDv16QP8sY/x9UsKe5zy38kTEBR8nopZNMvj6zaQuVzPM0qEnacQ3LKtm45IjOQt8bdiV9hkSk9SzmR0HGnaEkRhKleOc6TDNXqpmDcDdXpYeVp2xkU3Grne/d3QbCvCpfWKU4BRYmnn2wNiDk/WUKCNmYP49F2dytf+VV5oIKbbHxvtYSdDU7Clc9DUXp9ILvbLmfS6T4LbAvLY8ujZQAuUoVUrX68VPZQwk+fW3loF9L2X4lXvIZ8XQn1W/5pIurajKkmBEOqIgDao5yMu3gIStg4ZBEGF/gtRbY6ZcckIfCNaECfHg57m5iCkOX8HtvJY/8xA5ppc1oty3L/Ki9S6bhp4W/MFDASfI5EpKV0MjGyKeocY2C216OYkQbt/+485qkXJ83KNJfXxDWMzdK5fdmhAQYFJ+5+jaWKNkZarcbdkphxT1lYDQ5zEXjVvVFT7QzjgGj5Tji4Om2XXpc9hRJ9dA75/tRTJ2/nswbdHu0ypeUaExYaHpnIf7DwCUAHZKgLAOS5NvJ3hPLpS9qT9BESjvCnbmDZYsOw5M/6aEihQonIXSicY7VFFK1ScWWV9JGyGziIGe0TUlX29HL3HiZFyggN6R2pR7LXNyECNLuoC5/uafVSIUBgJ14hk0cHg
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=2K5GohyWnlLxYUF7jV+iB4T492btwGNQ2355bcAvcQs=; 
 c=relaxed/relaxed; d=kaod.org; h=From; s=ovhmo393970-selector1;
 t=1758659404; v=1;
 b=cmUuYIsNTpV6nwFtrdKD7fZFg7OABjaeDPWX7+SRFrZrB1BVk6OmYrTvfqqvtcGpq9UGTf9T
 8uBRgVg3z8OP3RrS3LcZAQmqch+eSbKsJL5/uO2j3uGp+fXXneqRxR/NBxqfcXIKIRQf9ZKs7Z+
 lTq5dYKWhZ1x7wEyklamPZQVp6wU0Ydjrntq6k2CSboXxacitqhmK5qybcF1S8YuTcdPfrt2jLf
 U9xcEb+acmfp/KKK4jUzcnkvPeA2F0nXBKWp7guproAWLVoypuENmdFExj3KzCbrpStf+sWtU3X
 epLfesuyrwxuWq7KS+R/hlp+y7862RiILAJejZNQFhi8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kaod.org header.i=@kaod.org header.a=rsa-sha256
 header.s=ovhmo393970-selector1 header.b=cmUuYIsN
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0012e3ea96c-31d4-4f6b-8982-93ccc5419025,
 A62628E0C3B8E0F19AFFF22E14ADFDB1FB97CF32) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed_ast2500evb: check hashes,
 use bootlin toolchain
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOS8yMy8yNSAyMTozOSwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gT24gMjMvMDkvMjAyNSAx
NTo1MiwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRoaXMgY29tbWl0IGFkZHMgQlIyX0RP
V05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15IGFuZAo+PiBCUjJfVE9PTENIQUlOX0VYVEVSTkFM
X0JPT1RMSU5fQVJNVjZfRUFCSUhGX0dMSUJDX1NUQUJMRT15IGluIHRoZQo+PiBkZWZjb25maWcs
IGJ1bXBzIGtlcm5lbCB0byA2LjE2LjcsIGFuZCBhZGRzIGN1c3RvbSBoYXNoIGZpbGVzIGFuZAo+
PiByZW1vdmVzIHRoZSBleGNlcHRpb24gZW50cnkgaW4gLmNoZWNrcGFja2FnZWlnbm9yZS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPiAKPiBT
ZXJpZXMgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPiAKPiBGb3IgaW5mbywgSSBhbHNvIG1h
ZGUgbWlub3IgZml4dXBzLiBTZWU6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vY29tbWl0LzZlNWU2Zjk4ZmQ3M2JhZWI3YmFhNDAyZDZiZDI3ZWQyYTVkNzkw
MGYKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQv
MzllYTc0ZmZjN2Q2Mzg3YWYwYTMwNDA1NDIwMDg5NjBjN2NkYmYyZgoKSW5kZWVkLCB0aGUgbGlu
dXgtaGVhZGVycyBoYXNoIGxvb2tlZCByZWR1bmRhbnQgYW5kIEkgZm9yZ290IHRvIHVwZGF0ZQp0
aGUgc3ViamVjdCB3aXRoIHRoZSBrZXJuZWwgdmVyc2lvbi4gVGhhbmtzLAoKQy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
