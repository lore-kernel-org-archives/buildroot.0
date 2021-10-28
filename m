Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB094C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26FC960C40
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26FC960C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1993827FD;
	Thu, 28 Oct 2021 21:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oA3amx-EE_gW; Thu, 28 Oct 2021 21:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A487827E0;
	Thu, 28 Oct 2021 21:16:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08ECC1BF317
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECDE7606FA
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_BsEMsgnEdf for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 21:16:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60E2E60664
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 21:16:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (23)
Received: from zm (pub-198.183.29.194.multiplay.pl [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id 2A7601C3ABC;
 Thu, 28 Oct 2021 23:16:15 +0200 (CEST)
References: <20211028160307.1123157-1-fontaine.fabrice@gmail.com>
 <20211028160307.1123157-2-fontaine.fabrice@gmail.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Oct 2021 23:16:08 +0200
In-reply-to: <20211028160307.1123157-2-fontaine.fabrice@gmail.com>
Message-ID: <8735oketpd.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/netdata: disable unit tests
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
IERpc2FibGUgdW5pdCB0ZXN0cyB3aGljaCBhcmUgZW5hYmxlZCBieSBkZWZhdWx0IGlmIGNtb2Nr
YSBpcyBmb3VuZCBzaW5jZQo+IHRoZSBhZGRpdGlvbiBvZiB0aGUgcGFja2FnZSBpbiBjb21taXQK
PiAxZDJiYjQ2OTA3OGI1ODE4YWEyMzkwYjk4NjhjZDYzMjIwMGYxN2EyCj4KPiBTaWduZWQtb2Zm
LWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0K
PiAgcGFja2FnZS9uZXRkYXRhL25ldGRhdGEubWsgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bmV0ZGF0YS9uZXRkYXRhLm1rIGIvcGFja2FnZS9uZXRkYXRhL25ldGRhdGEubWsKPiBpbmRleCBk
NjZhOTYwMmUyLi4zNDM2NWNiZjU2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbmV0ZGF0YS9uZXRk
YXRhLm1rCj4gKysrIGIvcGFja2FnZS9uZXRkYXRhL25ldGRhdGEubWsKPiBAQCAtMTAsNyArMTAs
OSBAQCBORVREQVRBX0xJQ0VOU0UgPSBHUEwtMy4wKwo+ICBORVREQVRBX0xJQ0VOU0VfRklMRVMg
PSBMSUNFTlNFCj4gICMgbmV0ZGF0YSdzIHNvdXJjZSBjb2RlIGlzIHJlbGVhc2VkIHdpdGhvdXQg
YSBnZW5lcmF0ZWQgY29uZmlndXJlIHNjcmlwdAo+ICBORVREQVRBX0FVVE9SRUNPTkYgPSBZRVMK
PiAtTkVUREFUQV9DT05GX09QVFMgPSAtLWRpc2FibGUtZGJlbmdpbmUKPiArTkVUREFUQV9DT05G
X09QVFMgPSBcCj4gKwktLWRpc2FibGUtZGJlbmdpbmUgXAo+ICsJLS1kaXNhYmxlLXVuaXQtdGVz
dHMKPiAgTkVUREFUQV9ERVBFTkRFTkNJRVMgPSBsaWJ1diB1dGlsLWxpbnV4IHpsaWIKPgo+ICBp
ZmVxICgkKEJSMl9HQ0NfRU5BQkxFX0xUTykseSkKClJldmlld2VkLWJ5OiBNYXJjaW4gTmllc3Ry
b2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4KCi0tCk1hcmNpbiBOaWVzdHLDs2oKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
