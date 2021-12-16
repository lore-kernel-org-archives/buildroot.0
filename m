Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0D3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A830E4175D;
	Thu, 16 Dec 2021 18:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMd0ysNeN-CK; Thu, 16 Dec 2021 18:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E99DC41703;
	Thu, 16 Dec 2021 18:27:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F033A1BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDF5F6104E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=arachnodroid.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etIlHjlv_6Vn for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:26:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from v220200749773122244.hotsrv.de (unknown
 [IPv6:2a03:4000:47:39d:747f:15ff:fe4f:d530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E26661041
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arachnodroid.de;
 s=dkim; t=1639679164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WimmMYhLoB4wFMwXUKeppbWgbJvcgoXX0PtBWyPehoQ=;
 b=sBSUqhKeHq4w2sSyC/aAyrmdkY6dTYUi9iUgHENDJAnnpTg86Q2atm8DpZ9pjHg9NDp1rO
 XazYt3Ys5RpG+GywKWgCbvlM/AhhCFypBmKl2uqMGUmlNiez1w/vMB3mmbJQM9Q/zIyzxg
 bBSa9NN2eFeByWFH/N2vbMi7xV9DEEc=
Received: from [192.168.0.240] (ip4d1580a8.dynamic.kabel-deutschland.de
 [77.21.128.168])
 by v220200749773122244.hotsrv.de (OpenSMTPD) with ESMTPSA id cbad3a62
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:26:04 +0000 (UTC)
Message-ID: <575adfc5-e3e1-1bfd-f40d-73d5caa189f5@arachnodroid.de>
Date: Thu, 16 Dec 2021 19:26:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: buildroot@buildroot.org
References: <bug-14451-163@https.bugs.busybox.net/>
 <bug-14451-163-aEqUC9bjBs@https.bugs.busybox.net/>
 <5e9075fc-3083-b8d2-2358-cc5281b306ac@arachnodroid.de>
 <aafcded5-c0f4-4745-a226-da57d0e7a805@mind.be>
From: Michael Taubert <info@arachnodroid.de>
In-Reply-To: <aafcded5-c0f4-4745-a226-da57d0e7a805@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: don't disable DRI3 for
 some Gallium drivers
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKSSdtIG5vdCB0aGF0IGZhbWlsaWFyIHdpdGggdGhlc2UgY29uZmlncywgeWV0
LiBCdXQgaWYgSSB1bmRlcnN0YW5kIGl0IApyaWdodCwgeW91ciBhZHZpY2UgaXMgdG8gaGF2ZSB0
aGUgc2VsZWN0aW9uIG9mIHRoZXNlIEdhbGxpdW0gZHJpdmVycyAKc2hvdWxkIGFsc28gc2VsZWN0
IEJSMl9QQUNLQUdFX01FU0EzRF9EUklfRFJJVkVSLgoKSSB3aWxsIGhhdmUgYSBsb29rIG9uIGhv
dyB0byBkbyB0aGF0IHRvbW9ycm93IGFuZCBwcm92aWRlIGFub3RoZXIgcGF0Y2ggCnRoZW4uCgpL
aW5kIHJlZ2FyZHMsCk1pY2hhZWwKCkFtIDE2LjEyLjIwMjEgdW0gMTg6Mjggc2NocmllYiBBcm5v
dXQgVmFuZGVjYXBwZWxsZToKPiAgwqBIaSBNaWNoYWVsLAo+IAo+IE9uIDE0LzEyLzIwMjEgMjA6
MDYsIE1pY2hhZWwgVGF1YmVydCB3cm90ZToKPj4gQ2VydGFpbiBHYWxsaXVtIGRyaXZlcnMgbmVl
ZCBEUkkzIHN1cHBvcnQsIG90aGVyd2lzZSBvcGVuZ2wgd29uJ3Qgd29yay4KPj4gT24gdGhlIFJh
c3BiZXJyeSBQaSA0LCBmb3IgZXhhbXBsZSwgZ2x4Z2VhcnMgd2lsbCBjb21wbGFpbiBhYm91dAo+
Pgo+PiAnRmFpbGVkIHRvIG9wZW4gYm8gMTogcGVybWlzc2lvbiBkZW5pZWQnCj4+Cj4+IFRoZXNl
IGRyaXZlcnMgbXVzdCBub3QgYmUgc2VsZWN0ZWQgdG8gZGlzYWJsZSBEUkkzIHN1cHBvcnQuIEl0
IHNlZW1zIHRvCj4+IGJlIHRoZSBzYW1lIGZvciBMaW1hIGFuZCBQYW5mcm9zdCwgcGxlYXNlIGNo
ZWNrIGJ1ZyAxMzgzMS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUYXViZXJ0IDxpbmZv
QGFyYWNobm9kcm9pZC5kZT4KPj4gLS0tCj4+IMKgwqBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsg
fCA2ICsrKysrLQo+PiDCoMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFj
a2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4+IGluZGV4IDYxYjA5NWNjY2EuLjk3ODBkNWE5NjAgMTAw
NjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+PiArKysgYi9wYWNrYWdlL21l
c2EzZC9tZXNhM2QubWsKPj4gQEAgLTEyMSw3ICsxMjEsMTEgQEAgTUVTQTNEX0NPTkZfT1BUUyAr
PSBcCj4+IMKgwqDCoMKgwqDCoMKgwqAgLURnYWxsaXVtLWV4dHJhLWh1ZD10cnVlCj4+IMKgwqBl
bmRpZgo+Pgo+PiAtaWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfRFJJX0RSSVZFUiksKQo+PiAr
aWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfRFJJX0RSSVZFUikgXAo+PiArwqDCoMKgwqDCoMKg
ICQoQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1YzRCkgXAo+PiArwqDCoMKgwqDC
oMKgICQoQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1ZDNCkgXAo+PiArwqDCoMKg
wqDCoMKgICQoQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0xJTUEpIFwKPj4gK8Kg
wqDCoMKgwqDCoCAkKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9QQU5GUk9TVCks
KQo+IAo+ICDCoFRoZSBtZXNhM2Qgc3R1ZmYgZ29lcyB3YXkgb3ZlciBteSBoZWFkLCBhY3R1YWxs
eSwgYnV0IEkgd291bGQgdGhpbmsgCj4gdGhhdCB0aGUgcHJvcGVyIHNvbHV0aW9uIGhlcmUgd291
bGQgYmUgdGhhdCB0aGVzZSBjb25maWdzIHNlbGVjdCAKPiBCUjJfUEFDS0FHRV9NRVNBM0RfRFJJ
X0RSSVZFUi4KPiAKPiAgwqBJIGtub3cgaXQgc291bmRzIHdlaXJkIHRoYXQgYSBnYWxsaXVtIGRy
aXZlciBpcyBhbHNvIGEgRFJJIGRyaXZlciwgYnV0IAo+IEkgZ3Vlc3MgdGhhdCdzIHdoYXQgaXQg
aXMuLi4KPiAKPiAgwqBCZXJuZCwgY2FuIHlvdSBjb21tZW50Pwo+IAo+ICDCoFJlZ2FyZHMsCj4g
IMKgQXJub3V0Cj4gCj4+IMKgwqBNRVNBM0RfQ09ORl9PUFRTICs9IFwKPj4gwqDCoMKgwqDCoMKg
wqDCoCAtRGRyaS1kcml2ZXJzPSAtRGRyaTM9ZGlzYWJsZWQKPj4gwqDCoGVsc2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
