Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B847C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 09:06:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AC260232
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 09:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79AC260232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 554FC405D6;
	Thu, 28 Oct 2021 09:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHMgzv5XK1CZ; Thu, 28 Oct 2021 09:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B10EC405E4;
	Thu, 28 Oct 2021 09:06:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C11E1BF9D1
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 09:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 090AB405E9
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 09:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kudNprOFvJSW for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 09:06:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BC9B405E4
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 09:06:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (20)
Received: from zm (pub-198.183.29.194.multiplay.pl [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id 2435A1C6AF6;
 Thu, 28 Oct 2021 11:06:03 +0200 (CEST)
References: <20211026075020.12072-1-b.bilas@grinn-global.com>
 <20211026075020.12072-2-b.bilas@grinn-global.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 28 Oct 2021 11:05:57 +0200
In-reply-to: <20211026075020.12072-2-b.bilas@grinn-global.com>
Message-ID: <87fsslecxx.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/chiliboard: bump to linux 5.14.14
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

CkJhcnRvc3ogQmlsYXMgPGIuYmlsYXNAZ3Jpbm4tZ2xvYmFsLmNvbT4gd3JpdGVzOgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0b3N6IEJpbGFzIDxiLmJpbGFzQGdyaW5uLWdsb2JhbC5jb20+Cj4gLS0t
Cj4gIGNvbmZpZ3MvZ3Jpbm5fY2hpbGlib2FyZF9kZWZjb25maWcgfCA0ICsrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9jb25maWdzL2dyaW5uX2NoaWxpYm9hcmRfZGVmY29uZmlnIGIvY29uZmlncy9ncmlubl9jaGls
aWJvYXJkX2RlZmNvbmZpZwo+IGluZGV4IDViMDVlZDQ0ZDYuLmU3MmE4MmNlZTggMTAwNjQ0Cj4g
LS0tIGEvY29uZmlncy9ncmlubl9jaGlsaWJvYXJkX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3Mv
Z3Jpbm5fY2hpbGlib2FyZF9kZWZjb25maWcKPiBAQCAtMSwxMiArMSwxMiBAQAo+ICBCUjJfYXJt
PXkKPiAgQlIyX2NvcnRleF9hOD15Cj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19D
VVNUT01fNV80PXkKPiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE0
PXkKPiAgQlIyX1NZU1RFTV9ESENQPSJldGgwIgo+ICBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NS
SVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCj4gIEJSMl9ST09URlNfUE9TVF9TQ1JJ
UFRfQVJHUz0iLWMgYm9hcmQvZ3Jpbm4vY2hpbGlib2FyZC9nZW5pbWFnZS5jZmciCj4gIEJSMl9M
SU5VWF9LRVJORUw9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS40LjI2Igo+ICtCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE0LjE0Igo+ICBCUjJfTElOVVhfS0VSTkVM
X0RFRkNPTkZJRz0ib21hcDJwbHVzIgo+ICBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkK
PiAgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImFtMzM1eC1jaGlsaWJvYXJkIgoK
ClJldmlld2VkLWJ5OiBNYXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNv
bT4KCi0tCk1hcmNpbiBOaWVzdHLDs2oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
