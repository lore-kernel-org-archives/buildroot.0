Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCC2C00A8F
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 13:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F4538498B;
	Tue, 24 Oct 2023 13:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4538498B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R430xx8RshWE; Tue, 24 Oct 2023 13:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7DBB84985;
	Tue, 24 Oct 2023 13:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7DBB84985
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97D441BF2C4
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 13:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7184E4EE1F
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 13:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7184E4EE1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wnBKvFjdn0D for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 13:49:17 +0000 (UTC)
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 696A84257B
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 13:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696A84257B
Received: from [172.25.4.220] ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vHmSqtMsGjYsGvHmTqDiQv; Tue, 24 Oct 2023 15:49:13 +0200
Message-ID: <fb3955a6-c58e-4705-aa5f-c7e2c931732b@benettiengineering.com>
Date: Tue, 24 Oct 2023 15:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it
To: Andreas Ziegler <br015@umbiko.net>
References: <mailman.9571.1697362018.35217.buildroot@buildroot.org>
 <be45c0d3f882a072e054632ae086413b@umbiko.net>
 <f22e9a6b-0229-4919-ad70-8eb60ab1fe65@benettiengineering.com>
 <79d4b2171690584e6cf0358b8a05ab51@umbiko.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <79d4b2171690584e6cf0358b8a05ab51@umbiko.net>
X-CMAE-Envelope: MS4xfDowguxCWGMfVsf/4yBQZEZ6q6wFnRlqzP8UKaNzrN9i/9O40eWNC70/+agWuS3hiSbBtIjSLnOn8DhCetMxIpBF8TQ99EOTYTOl+CHXpji7j8h2wiFS
 YDZwP2gNdYGiwg5MVbhSfRCHONeMDTTr/DljARl1iYMnj0MHnbdwEmV5fJXIGBc4Wd7NFezZoWDUmctACDTe69zIHvPyG4pUEMoLvtbksJ/MrEHhrItlnaUF
 ndG4PlPJelykLqbAmV1RMuiglVMX01sWBa6kB9kb/ob+/7Vkqcg6zqGtTi5ERYiftias7pO5PtN4L0hODXQixSNextse96mFahXwnymSoGm6e7MlJWC69KRs
 Fk79Z1TgZIWcoDTYzjHq5fmAuiUNye8Pj9Ygmvhgl6yrUH1FWpo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698155353; bh=KIg/ydeKwrce0/WmUzsNk0JKqBvORQjA8I+gK5f3KcE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Myg/KcSrAW0VVH4V1ac5QYy3xt2jrlyIdZM7Nry3Q2Ak3cr/s9hc+hFWnMTI9VWiD
 KoMFRUbs3Hk2V4PAQjdKFRq3jIAvLFxEm0s+tSqWN2kENErz6vQb2uGh0TIe9k/3N1
 fAqQ1q3oZiwZcnHfYWJAECIztbKp6sVaMGrEQAN1HNmGNmrjA0lDFHl0yA1s/eyr48
 pq8x3UyEUhQRaUEIdtaERMWrEQ+I+h7PewJKZt5GvwgbOt2Dl0HYsX3sFnCpQlViCc
 uNbIPNDzRHcOK1T5XlTv/aZvrT/FLevvpRp4qGL+11DTVDA3npJpVRjhfteGqRYBAe
 n1Lfyn5RO4x1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Myg/KcSr
Subject: Re: [Buildroot] [PATCH v4 3/4] package/linux-tools: add rtla
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pierre Floury <pierre.floury@gmail.com>, buildroot <buildroot@buildroot.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywKCk9uIDI0LzEwLzIzIDA4OjI3LCBBbmRyZWFzIFppZWdsZXIgd3JvdGU6Cgpb
IFNOSVAgXQoKPiBJIHB1dCB0b2dldGhlciBhIGRlZmNvbmZpZywgYmFzZWQgb24gY29uZmlncy9y
YXNwYmVycnlwaTRfNjRfZGVmY29uZmlnOyAKPiBjaGFuZ2VzIGFyZSwgcm91Z2hseToKPiAKPiAg
wqAgQy1saWJyYXJ5IG11c2wKPiAgwqAgYmludXRpbHMgMi40MQo+ICDCoCBnY2MgMTMKPiAKPiAg
wqAgUElDL1BJRSBub3Qgc2V0Cj4gIMKgIFNTUCBub25lCj4gIMKgIFJFTFJPIG5vbmUKPiAKPiAg
wqAga2VybmVsIHZlcnNpb24gNi42LXJjNgo+ICDCoCBrZXJuZWwgcGF0Y2ggCj4gaHR0cHM6Ly9t
aXJyb3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Byb2plY3RzL3J0LzYuNi9w
YXRjaC02LjYtcmM2LXJ0OS5wYXRjaC54ego+ICDCoCBubyBvdmVybGF5IHN1cHBvcnQKPiAgwqAg
bGludXgga2VybmVsIHRvb2xzIC0+IHJ0bGEKPiAKPiBZb3Ugd2lsbCBydW4gaW50byBhbm90aGVy
IGVycm9yIGZpcnN0LCBiZWNhdXNlIGxpYnRyYWNlZnMgaXMgbWlzc2luZyAKPiBob3N0IGRlcGVu
ZGVuY2llcy4KPiAKPiAgRnJvbSBzcmMvbWVzb24uYnVpbGQ6Cj4gIMKgIGZsZXggPSBmaW5kX3By
b2dyYW0oJ2ZsZXgnLCByZXF1aXJlZDogdHJ1ZSkKPiAgwqAgYmlzb24gPSBmaW5kX3Byb2dyYW0o
J2Jpc29uJywgcmVxdWlyZWQ6IHRydWUpCj4gCj4gTW9kaWZpZWQgcGFja2FnZS9saWJ0cmFjZWZz
L2xpYnRyYWNlZnMubWs6Cj4gIMKgIExJQlRSQUNFRlNfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNv
biBob3N0LWZsZXggaG9zdC1wa2djb25mIAo+IGxpYnRyYWNlZXZlbnQKPiAKPiBCUjJfYWFyY2g2
ND15Cj4gQlIyX2NvcnRleF9hNzI9eQo+IEJSMl9BUk1fRlBVX1ZGUFY0PXkKPiBCUjJfVE9PTENI
QUlOX0JVSUxEUk9PVF9NVVNMPXkKPiBCUjJfQklOVVRJTFNfVkVSU0lPTl8yXzQxX1g9eQo+IEJS
Ml9HQ0NfVkVSU0lPTl8xM19YPXkKPiBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9DWFg9eQo+ICMg
QlIyX1BJQ19QSUUgaXMgbm90IHNldAo+IEJSMl9TU1BfTk9ORT15Cj4gQlIyX1JFTFJPX05PTkU9
eQo+IEJSMl9TWVNURU1fREhDUD0iZXRoMCIKPiBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBU
PSJib2FyZC9yYXNwYmVycnlwaTQtNjQvcG9zdC1idWlsZC5zaCIKPiBCUjJfUk9PVEZTX1BPU1Rf
SU1BR0VfU0NSSVBUPSJib2FyZC9yYXNwYmVycnlwaTQtNjQvcG9zdC1pbWFnZS5zaCIKPiBCUjJf
TElOVVhfS0VSTkVMPXkKPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiBCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjYtcmM2Igo+IEJSMl9MSU5VWF9L
RVJORUxfUEFUQ0g9Imh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4L2tl
cm5lbC9wcm9qZWN0cy9ydC82LjYvcGF0Y2gtNi42LXJjNi1ydDkucGF0Y2gueHoiCj4gQlIyX0xJ
TlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3MTEiCj4gQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQ
UE9SVD15Cj4gQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImJyb2FkY29tL2JjbTI3
MTEtcnBpLTQtYiIKPiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15Cj4gQlIy
X1BBQ0tBR0VfTElOVVhfVE9PTFNfUlRMQT15Cj4gQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFPXkK
PiBCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfVkFSSUFOVF9QSTQ9eQo+IEJSMl9QQUNLQUdFX1JQ
SV9GSVJNV0FSRV9DT05GSUdfRklMRT0iYm9hcmQvcmFzcGJlcnJ5cGk0LTY0L2NvbmZpZ180XzY0
Yml0LnR4dCIKPiAjIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9JTlNUQUxMX0RUQl9PVkVSTEFZ
UyBpcyBub3Qgc2V0Cj4gQlIyX1RBUkdFVF9ST09URlNfRVhUMj15Cj4gQlIyX1RBUkdFVF9ST09U
RlNfRVhUMl80PXkKPiBCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCj4gIyBCUjJf
VEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+IEJSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09M
Uz15Cj4gQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4gQlIyX1BBQ0tBR0VfSE9TVF9NVE9P
TFM9eQo+IAoKUmVwcm9kdWNlZCBhbmQgeWVzIGl0J3MgZml4ZWQgd2l0aCAtRF9HTlVfU09VUkNF
IGFzIHBvaW50ZWQgaGVyZToKaHR0cHM6Ly9tYW43Lm9yZy9saW51eC9tYW4tcGFnZXMvbWFuMy9D
UFVfU0VULjMuaHRtbAoKQSBodWdlIHRoYW5rIHlvdSBmb3IgdGhlIGhlbHAhCgpEbyB5b3UgbWlu
ZCBpZiBJIGFkZCB5b3VyIFNvQiBkZXNjcmliaW5nIHdoYXQgeW91J3ZlIGFkZGVkIG9uIHRoaXMg
cGF0Y2g/CgotLSAKR2l1bGlvIEJlbmV0dGkKQ0VPL0NUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNh
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
