Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB928C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:16:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F283B610A4
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F283B610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B7682716;
	Thu, 28 Oct 2021 21:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mk0faCA4Bqwt; Thu, 28 Oct 2021 21:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA6F3826C8;
	Thu, 28 Oct 2021 21:16:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD4B81BF317
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AD5E40486
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hh21_IbiHDAx for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 21:16:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94E3E40101
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 21:16:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (23)
Received: from zm (pub-198.183.29.194.multiplay.pl [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id 7EE511C4BA5;
 Thu, 28 Oct 2021 23:16:05 +0200 (CEST)
References: <20211028160307.1123157-1-fontaine.fabrice@gmail.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Oct 2021 23:16:00 +0200
In-reply-to: <20211028160307.1123157-1-fontaine.fabrice@gmail.com>
Message-ID: <877ddwetpm.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/netdata: add libcap optional
 dependency
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

CkZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cgo+
IGxpYmNhcCBpcyBhbiBvcHRpb25hbCBkZXBlbmRlbmN5IHdoaWNoIGlzIGVuYWJsZWQgYnkgZGVm
YXVsdCBzaW5jZSB0aGUKPiBhZGRpdGlvbiBvZiB0aGUgcGFja2FnZSBpbiBjb21taXQKPiAxZDJi
YjQ2OTA3OGI1ODE4YWEyMzkwYjk4NjhjZDYzMjIwMGYxN2EyCj4KPiBTaWduZWQtb2ZmLWJ5OiBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFj
a2FnZS9uZXRkYXRhL25ldGRhdGEubWsgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV0ZGF0YS9uZXRkYXRhLm1r
IGIvcGFja2FnZS9uZXRkYXRhL25ldGRhdGEubWsKPiBpbmRleCAxYzIwYzQ5ZGVlLi5kNjZhOTYw
MmUyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbmV0ZGF0YS9uZXRkYXRhLm1rCj4gKysrIGIvcGFj
a2FnZS9uZXRkYXRhL25ldGRhdGEubWsKPiBAQCAtMzMsNiArMzMsMTMgQEAgZWxzZQo+ICBORVRE
QVRBX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtanNvbmMKPiAgZW5kaWYKPgo+ICtpZmVxICgkKEJS
Ml9QQUNLQUdFX0xJQkNBUCkseSkKPiArTkVUREFUQV9DT05GX09QVFMgKz0gLS13aXRoLWxpYmNh
cAo+ICtORVREQVRBX0RFUEVOREVOQ0lFUyArPSBsaWJjYXAKPiArZWxzZQo+ICtORVREQVRBX0NP
TkZfT1BUUyArPSAtLXdpdGhvdXQtbGliY2FwCj4gK2VuZGlmCj4gKwo+ICBpZmVxICgkKEJSMl9Q
QUNLQUdFX05GQUNDVCkseSkKPiAgTkVUREFUQV9DT05GX09QVFMgKz0gLS1lbmFibGUtcGx1Z2lu
LW5mYWNjdAo+ICBORVREQVRBX0RFUEVOREVOQ0lFUyArPSBuZmFjY3QKClJldmlld2VkLWJ5OiBN
YXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4KCi0tCk1hcmNpbiBO
aWVzdHLDs2oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
