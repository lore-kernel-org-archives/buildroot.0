Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C84E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 22:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E38B081F8A;
	Sat, 14 Dec 2024 22:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skRaXagAz1wl; Sat, 14 Dec 2024 22:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0F9281F8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F9281F8B;
	Sat, 14 Dec 2024 22:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90E7BC5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 22:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F1DD6061B
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 22:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boVJrDYO03Gj for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 22:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9CE5960623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CE5960623
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CE5960623
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 22:08:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CDDAA19F522;
 Sat, 14 Dec 2024 23:08:37 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37922])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 23:08:37 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 23:08:37 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Martin_B=C3=B6h?= <contact@martb.dev>
Cc: buildroot@buildroot.org, Marek Belisko <marek.belisko@open-nandra.com>
In-Reply-To: <FB194E54-666A-488A-8C79-6A3CB933D55B@martb.dev>
References: <FB194E54-666A-488A-8C79-6A3CB933D55B@martb.dev>
User-Agent: Webmail Free/1.6.9
Message-ID: <2c1a4807c31ec8e2863a6852736cea6d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734214120;
 bh=TL0KRZanPQk70FtEYHYFvKFdmWnuxqjYmeT5OAGdoVo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lzqxclKT8qiEpiSK6Lp3Bz7swPC2ivJThdYK0TPzSIgRhnt/WD5rlA6EM70E7aQVr
 mQS3x03org67vFc1mMlSbvMs65PIoafhA1j2DHqwKFEsWQ9ycmbt9QG6+bPg1+8i2X
 2xOUG3+AruRDxCEvd/yoeW/Ht4ZBib44c9LdtFB05R6tOiBOvtOssybk5wremg9ARh
 aipQF20vK2htcmDEbfZkVjFLIjqTuIsFUl6+XCV6shcUArsC9D4lDk/PrXk50UQQz4
 bSMM9jdpIFiinySG/QYuMCJDVjn2nPLARRoHAWdvjgzza9dF+PNbJFHtFs+DtVeV5N
 uQ85OowFQVHzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lzqxclKT
Subject: Re: [Buildroot] [PATCH 1/1] package/polkit: fix permissions after
 version bump to 125
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

SGkgTWFydGluLAoKT24gMTMvMTIvMjAyNCAwNjozOSwgTWFydGluIELDtmggdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPiBGcm9tOiBNYXJ0aW4gQsO2aCA8Y29udGFjdEBtYXJ0Yi5kZXY+Cj4gCj4gVGhl
IHNlcnZpY2UgZmFpbGVkIHRvIHN0YXJ0IGNvcnJlY3RseSBpZiBhbnkgY3VzdG9tIHJ1bGVzIHdl
cmUKPiBpbnN0YWxsZWQuCj4gVGhpcyBjb21taXQgYWxpZ25zIHRoZSBwZXJtaXNzaW9ucyB3aXRo
IHRoZSB1cHN0cmVhbSBtZXNvbiBidWlsZCBzdGVwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcnRp
biBCw7ZoIDxjb250YWN0QG1hcnRiLmRldj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IHBhY2thZ2UvcG9sa2l0L3BvbGtpdC5tayB8IDggKysrKy0tLS0KPiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3BvbGtpdC9wb2xraXQubWsgYi9wYWNrYWdlL3BvbGtpdC9wb2xraXQubWsKPiBpbmRleCBmYjQ5
ZjZjZTJhLi42Y2QyYWE2MDQyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcG9sa2l0L3BvbGtpdC5t
awo+ICsrKyBiL3BhY2thZ2UvcG9sa2l0L3BvbGtpdC5tawo+IEBAIC01NiwxMCArNTYsMTAgQEAg
ZGVmaW5lIFBPTEtJVF9VU0VSUwo+IGVuZGVmCj4gCj4gZGVmaW5lIFBPTEtJVF9QRVJNSVNTSU9O
Uwo+IC0gL2V0Yy9wb2xraXQtMS9ydWxlcy5kIGQgNzAwIHBvbGtpdGQgcm9vdCAtIC0gLSAtIC0K
PiAtIC91c3Ivc2hhcmUvcG9sa2l0LTEvcnVsZXMuZCBkIDcwMCBwb2xraXRkIHJvb3QgLSAtIC0g
LSAtCj4gLSAvdXNyL2Jpbi9wa2V4ZWMgZiA0NzU1IHJvb3Qgcm9vdCAtIC0gLSAtIC0KPiAtIC91
c3IvbGliL3BvbGtpdC0xL3BvbGtpdC1hZ2VudC1oZWxwZXItMSBmIDQ3NTUgcm9vdCByb290IC0g
LSAtIC0gLQo+ICsgL2V0Yy9wb2xraXQtMS9ydWxlcy5kIGQgNzUwIHJvb3QgcG9sa2l0ZCAtIC0g
LSAtIC0KPiArIC91c3Ivc2hhcmUvcG9sa2l0LTEvcnVsZXMuZCBkIDc1MCByb290IHBvbGtpdGQg
LSAtIC0gLSAtCgpJIHVuZGVyc3RhbmQgdGhvc2UgdHdvIGRpcmVjdG9yaWVzIG5lZWRzIHRob3Nl
IHVwZGF0ZXMsIGR1ZSB0byB1cHN0cmVhbQpjaGFuZ2VzIHN1Y2ggYXM6Cmh0dHBzOi8vZ2l0aHVi
LmNvbS9wb2xraXQtb3JnL3BvbGtpdC9jb21taXQvYjYxNjlmMzExM2IzY2U1ZWQ4MjJlNjZhZGNj
OTYyODUwYzI0NjYwYQoKPiArIC91c3IvYmluL3BrZXhlYyBmIDA0NzU1IHJvb3Qgcm9vdCAtIC0g
LSAtIC0KPiArIC91c3IvbGliL3BvbGtpdC0xL3BvbGtpdC1hZ2VudC1oZWxwZXItMSBmIDA0NzU1
IHJvb3Qgcm9vdCAtIC0gLSAtIC0KCldoeSBkaWQgeW91IHVwZGF0ZWQgL3Vzci9iaW4vcGtleGVj
IGFuZCAKL3Vzci9saWIvcG9sa2l0LTEvcG9sa2l0LWFnZW50LWhlbHBlci0xCnRvIHJlcGxhY2Ug
NDc1NSBieSAwNDc1NT8gKHRoZXJlIGlzIG5vIGp1c3RpZmljYXRpb24gaW4gdGhlIGNvbW1pdCBs
b2cpLgoKPiBlbmRlZgo+IAo+IGRlZmluZSBQT0xLSVRfSU5TVEFMTF9JTklUX1NZU1RFTUQKPiAt
LQo+IDIuNDcuMQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpC
ZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
