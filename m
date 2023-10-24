Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42BAC07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 14:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 506EB4EEBD;
	Tue, 24 Oct 2023 14:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 506EB4EEBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRv1_iiW-ffX; Tue, 24 Oct 2023 14:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8126A4EEBB;
	Tue, 24 Oct 2023 14:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8126A4EEBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 114BE1BF2C4
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E913342F67
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E913342F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfrJl4tiS3HP for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 14:38:01 +0000 (UTC)
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53C01400BF
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 14:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53C01400BF
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 048E3BDE9D7B;
 Tue, 24 Oct 2023 16:37:57 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 24 Oct 2023 14:37:57 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <fb3955a6-c58e-4705-aa5f-c7e2c931732b@benettiengineering.com>
References: <mailman.9571.1697362018.35217.buildroot@buildroot.org>
 <be45c0d3f882a072e054632ae086413b@umbiko.net>
 <f22e9a6b-0229-4919-ad70-8eb60ab1fe65@benettiengineering.com>
 <79d4b2171690584e6cf0358b8a05ab51@umbiko.net>
 <fb3955a6-c58e-4705-aa5f-c7e2c931732b@benettiengineering.com>
Message-ID: <d67ee9f1ba7df1c75055c5b576992efb@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.10 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1698158278; bh=dazyX2rhX/PgCXigTSR+lzJtKhY4Mq7F5ERlyJcQl9U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=IsPTrxqfFHSmUYERFn3kQH8nwQgBn/jygYjdqRuoLIFcBQiNGcxPUTCH8NfIn3ePV
 1Mp07IRN8rxm9BlWrT/p/CATzHYCqozzGunQS2MdshdVI+/DwL+GHP5lrdkJam8CKM
 HmcXVvvhtylvRLl91IWPzjQcOYhCW3IwBDgtLqnw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=IsPTrxqf
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

SGkgR2l1bGlvLAoKTmljZSB0aGF0IHRoaXMgd2FzIHVzZWZ1bC4KCk9uIDIwMjMtMTAtMjQgMTM6
NDksIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhpIEFuZHJlYXMsCj4gCj4gT24gMjQvMTAvMjMg
MDg6MjcsIEFuZHJlYXMgWmllZ2xlciB3cm90ZToKPiAKPiBbIFNOSVAgXQo+IAo+PiBJIHB1dCB0
b2dldGhlciBhIGRlZmNvbmZpZywgYmFzZWQgb24gCj4+IGNvbmZpZ3MvcmFzcGJlcnJ5cGk0XzY0
X2RlZmNvbmZpZzsgY2hhbmdlcyBhcmUsIHJvdWdobHk6Cj4+IAo+PiAgwqAgQy1saWJyYXJ5IG11
c2wKPj4gIMKgIGJpbnV0aWxzIDIuNDEKPj4gIMKgIGdjYyAxMwo+PiAKPj4gIMKgIFBJQy9QSUUg
bm90IHNldAo+PiAgwqAgU1NQIG5vbmUKPj4gIMKgIFJFTFJPIG5vbmUKPj4gCj4+ICDCoCBrZXJu
ZWwgdmVyc2lvbiA2LjYtcmM2Cj4+ICDCoCBrZXJuZWwgcGF0Y2ggCj4+IGh0dHBzOi8vbWlycm9y
cy5lZGdlLmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC9wcm9qZWN0cy9ydC82LjYvcGF0Y2gt
Ni42LXJjNi1ydDkucGF0Y2gueHoKPj4gIMKgIG5vIG92ZXJsYXkgc3VwcG9ydAo+PiAgwqAgbGlu
dXgga2VybmVsIHRvb2xzIC0+IHJ0bGEKPj4gCj4+IFlvdSB3aWxsIHJ1biBpbnRvIGFub3RoZXIg
ZXJyb3IgZmlyc3QsIGJlY2F1c2UgbGlidHJhY2VmcyBpcyBtaXNzaW5nIAo+PiBob3N0IGRlcGVu
ZGVuY2llcy4KPj4gCj4+ICBGcm9tIHNyYy9tZXNvbi5idWlsZDoKPj4gIMKgIGZsZXggPSBmaW5k
X3Byb2dyYW0oJ2ZsZXgnLCByZXF1aXJlZDogdHJ1ZSkKPj4gIMKgIGJpc29uID0gZmluZF9wcm9n
cmFtKCdiaXNvbicsIHJlcXVpcmVkOiB0cnVlKQo+PiAKPj4gTW9kaWZpZWQgcGFja2FnZS9saWJ0
cmFjZWZzL2xpYnRyYWNlZnMubWs6Cj4+ICDCoCBMSUJUUkFDRUZTX0RFUEVOREVOQ0lFUyA9IGhv
c3QtYmlzb24gaG9zdC1mbGV4IGhvc3QtcGtnY29uZiAKPj4gbGlidHJhY2VldmVudAo+PiAKPj4g
QlIyX2FhcmNoNjQ9eQo+PiBCUjJfY29ydGV4X2E3Mj15Cj4+IEJSMl9BUk1fRlBVX1ZGUFY0PXkK
Pj4gQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfTVVTTD15Cj4+IEJSMl9CSU5VVElMU19WRVJTSU9O
XzJfNDFfWD15Cj4+IEJSMl9HQ0NfVkVSU0lPTl8xM19YPXkKPj4gQlIyX1RPT0xDSEFJTl9CVUlM
RFJPT1RfQ1hYPXkKPj4gIyBCUjJfUElDX1BJRSBpcyBub3Qgc2V0Cj4+IEJSMl9TU1BfTk9ORT15
Cj4+IEJSMl9SRUxST19OT05FPXkKPj4gQlIyX1NZU1RFTV9ESENQPSJldGgwIgo+PiBCUjJfUk9P
VEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9yYXNwYmVycnlwaTQtNjQvcG9zdC1idWlsZC5z
aCIKPj4gQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvcmFzcGJlcnJ5cGk0LTY0
L3Bvc3QtaW1hZ2Uuc2giCj4+IEJSMl9MSU5VWF9LRVJORUw9eQo+PiBCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OPXkKPj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iNi42LXJjNiIKPj4gQlIyX0xJTlVYX0tFUk5FTF9QQVRDSD0iaHR0cHM6Ly9taXJyb3JzLmVk
Z2Uua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Byb2plY3RzL3J0LzYuNi9wYXRjaC02LjYt
cmM2LXJ0OS5wYXRjaC54eiIKPj4gQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3MTEi
Cj4+IEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+PiBCUjJfTElOVVhfS0VSTkVMX0lO
VFJFRV9EVFNfTkFNRT0iYnJvYWRjb20vYmNtMjcxMS1ycGktNC1iIgo+PiBCUjJfTElOVVhfS0VS
TkVMX05FRURTX0hPU1RfT1BFTlNTTD15Cj4+IEJSMl9QQUNLQUdFX0xJTlVYX1RPT0xTX1JUTEE9
eQo+PiBCUjJfUEFDS0FHRV9SUElfRklSTVdBUkU9eQo+PiBCUjJfUEFDS0FHRV9SUElfRklSTVdB
UkVfVkFSSUFOVF9QSTQ9eQo+PiBCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQ09ORklHX0ZJTEU9
ImJvYXJkL3Jhc3BiZXJyeXBpNC02NC9jb25maWdfNF82NGJpdC50eHQiCj4+ICMgQlIyX1BBQ0tB
R0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExfRFRCX09WRVJMQVlTIGlzIG5vdCBzZXQKPj4gQlIyX1RB
UkdFVF9ST09URlNfRVhUMj15Cj4+IEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4+IEJSMl9U
QVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKPj4gIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIg
aXMgbm90IHNldAo+PiBCUjJfUEFDS0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQo+PiBCUjJfUEFDS0FH
RV9IT1NUX0dFTklNQUdFPXkKPj4gQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQo+PiAKPiAKPiBS
ZXByb2R1Y2VkIGFuZCB5ZXMgaXQncyBmaXhlZCB3aXRoIC1EX0dOVV9TT1VSQ0UgYXMgcG9pbnRl
ZCBoZXJlOgo+IGh0dHBzOi8vbWFuNy5vcmcvbGludXgvbWFuLXBhZ2VzL21hbjMvQ1BVX1NFVC4z
Lmh0bWwKPiAKPiBBIGh1Z2UgdGhhbmsgeW91IGZvciB0aGUgaGVscCEKPiAKPiBEbyB5b3UgbWlu
ZCBpZiBJIGFkZCB5b3VyIFNvQiBkZXNjcmliaW5nIHdoYXQgeW91J3ZlIGFkZGVkIG9uIHRoaXMg
Cj4gcGF0Y2g/Cj4gCgpOb3QgYXQgYWxsOgpTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIFppZWdsZXIg
PGJyMDE1QHVtYmlrby5uZXQ+Cgo+IC0tCj4gR2l1bGlvIEJlbmV0dGkKPiBDRU8vQ1RPQEJlbmV0
dGkgRW5naW5lZXJpbmcgc2FzCgpLaW5kIHJlZ2FyZHMsCkFuZHJlYXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
