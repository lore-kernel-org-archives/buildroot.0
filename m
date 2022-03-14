Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F166C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 21:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CB89827F0;
	Mon, 14 Mar 2022 21:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6azXoBjnZ8_r; Mon, 14 Mar 2022 21:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC22082419;
	Mon, 14 Mar 2022 21:01:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C51E91BF30F
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 21:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2B5482419
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 21:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwoZPOks4fmM for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 21:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28EFB81990
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 21:01:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:84f3:986a:6873:580d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 208B913F838;
 Mon, 14 Mar 2022 22:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647291697;
 bh=3bnTdzOSK9qb8QkHKUvGlb0pmGsyvQicOTY2dqika1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RV6kApu70SXSASmaqZNvXXeCG3zxFbfDrvf/RmOq3w+1skp63wkW8ob+bFYWQDFiy
 /HvMoCL7j63sjBoWfmEBysRErb+22Ied0MF/+9cM13ZIa4NqYzU34HqA6yrVykr+P7
 9rNBXlWPa0dgdvfVrqJafzm26OA4QKwgXpgQXwh5D6v1v13SaTSz4i2hBLG5aWV2F1
 4pNZbDt6g0keOSMYkt+BMO/1qQFLy2InX5VD1luqUlJUXKFLRNWA2uUB0T/eyfBBdu
 QagtZnQgtkI8XTAuSSWY5lpkrixly2Ciim+SiqjMqQ20rntAl0hkVoF7iNCoHJlmt7
 q2VK/i13O6/RA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Mar 2022 22:01:32 +0100
Date: Mon, 14 Mar 2022 22:01:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220314210132.GX283544@scaer>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
 <20220314153111.1390512-2-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220314153111.1390512-2-clement.leger@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v4 1/8] boot/optee-os: add option to select
 DTC dependency
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2zDqW1lbnQsIEFsbCwKCk9uIDIwMjItMDMtMTQgMTY6MzEgKzAxMDAsIENsw6ltZW50IEzDqWdl
ciB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBTb21lIHBsYXRmb3JtcyAoc3RtMzIsIHNh
bSkgbmVlZHMgRFRDIHRvIGJ1aWxkIHRoZSBwbGF0Zm9ybQo+IGRldmljZS10cmVlcy4gQWRkIEJS
Ml9UQVJHRVRfT1BURUVfT1NfTkVFRFNfRFRDIGNvbmZpZ3VyYXRpb24KPiBvcHRpb24gdG8gc2Vs
ZWN0IGhvc3QtZHRjIHBhY2thZ2Ugd2hlbiBidWlsZGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGJvb3Qv
b3B0ZWUtb3MvQ29uZmlnLmluICAgfCA3ICsrKysrKysKPiAgYm9vdC9vcHRlZS1vcy9vcHRlZS1v
cy5tayB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZp
Zy5pbgo+IGluZGV4IDA5NzQ1Nzg0ODQuLjJmNjE0M2YxZjQgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9v
cHRlZS1vcy9Db25maWcuaW4KPiArKysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+IEBAIC00
OCw2ICs0OCwxMyBAQCBjb25maWcgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fUkVQT19WRVJT
SU9OCj4gIAo+ICBlbmRpZgo+ICAKPiArY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNf
RFRDCj4gKwlib29sICJPUC1URUUgT1MgbmVlZHMgZHRjIgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdF
X0hPU1RfRFRDCj4gKwloZWxwCj4gKwkgIFNlbGVjdCB0aGlzIG9wdGlvbiBpZiB5b3VyIE9QLVRF
RSBPUyBwbGF0Zm9ybSBjb25maWd1cmF0aW9uCj4gKwkgIHJlcXVpcmVzIHRoZSBEZXZpY2UgVHJl
ZSBjb21waWxlciB0byBiZSBhdmFpbGFibGUuCgpUaGUgZm9sbG93aW5nIG9wdGlvbiwgQlIyX1RB
UkdFVF9PUFRFRV9PU19WRVJTSU9OLCBpcyByZWxhdGVkIHRvIHRoZQp2ZXJzaW9uIHNlbGVjdGlv
biwgYWJvdmUsIHNvIGFkZGluZyB0aGlzIG5ldyBvcHRpb24gcmlnaHQgaW4gdGhlIG1pZGRsZQpp
cyBub3QgdmVyeSBncmVhdC4gSSd2ZSBtb3ZlZCB0aGF0IG5ldyBvcHRpb24gYmVsb3cuCgpBcHBs
aWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIGNvbmZp
ZyBCUjJfVEFSR0VUX09QVEVFX09TX1ZFUlNJT04KPiAgCXN0cmluZwo+ICAJZGVmYXVsdCAiMy4x
NS4wIglpZiBCUjJfVEFSR0VUX09QVEVFX09TX0xBVEVTVAo+IGRpZmYgLS1naXQgYS9ib290L29w
dGVlLW9zL29wdGVlLW9zLm1rIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+IGluZGV4IDE2
NmI1ZTY5M2MuLjlmNzZkODQ1MGUgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1v
cy5tawo+ICsrKyBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsKPiBAQCAtMjMsNiArMjMsMTAg
QEAgZW5kaWYKPiAgCj4gIE9QVEVFX09TX0RFUEVOREVOQ0lFUyA9IGhvc3Qtb3BlbnNzbCBob3N0
LXB5dGhvbjMgaG9zdC1weXRob24tcHljcnlwdG9kb21leCBob3N0LXB5dGhvbi1weWVsZnRvb2xz
Cj4gIAo+ICtpZmVxICgkKEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfRFRDKSx5KQo+ICtPUFRF
RV9PU19ERVBFTkRFTkNJRVMgKz0gaG9zdC1kdGMKPiArZW5kaWYKPiArCj4gICMgT24gNjRiaXQg
dGFyZ2V0cywgT1AtVEVFIE9TIGNhbiBiZSBidWlsdCBpbiAzMmJpdCBtb2RlLCBvcgo+ICAjIGNh
biBiZSBidWlsdCBpbiA2NGJpdCBtb2RlIGFuZCBzdXBwb3J0IDMyYml0IGFuZCA2NGJpdAo+ICAj
IHRydXN0ZWQgYXBwbGljYXRpb25zLiBTaW5jZSBidWlsZHJvb3QgY3VycmVudGx5IHJlZmVyZW5j
ZXMKPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
