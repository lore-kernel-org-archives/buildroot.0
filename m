Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D52EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 16:41:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E98610EA
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 16:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55E98610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B6AE40247;
	Thu, 14 Oct 2021 16:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uUVlgm3Ax-rK; Thu, 14 Oct 2021 16:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCB01403C6;
	Thu, 14 Oct 2021 16:41:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9114F1BF575
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 16:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CEB440262
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 16:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id knhUtzA8FJQC for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 16:41:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 734DE4033F
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 16:41:06 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D569A1C000A;
 Thu, 14 Oct 2021 16:41:02 +0000 (UTC)
Date: Thu, 14 Oct 2021 18:41:00 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211014184100.615d5d90@bootlin.com>
In-Reply-To: <20211014160824.2154396-1-fontaine.fabrice@gmail.com>
References: <20211014160824.2154396-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdbi: needs dynamic library
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

SGksCgpPbiBUaHUsIDE0IE9jdCAyMDIxIDE4OjA4OjI0ICswMjAwCkZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKCj4gbGliZGJpIG5lZWRzIGR5bmFt
aWMgbGlicmFyeSB0byBhdm9pZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2VkCj4g
c2luY2UgdGhlIGFkZGl0aW9uIG9mIHRoZSBwYWNrYWdlIGluIGNvbW1pdAo+IGM2YWFjNmViZGJi
ZDM4NzMxMTBhOWUxOWRlMTk1N2U0OWNiOTM0NGU6Cj4gCj4gZGJpX21haW4uYzo4NDoyOiBlcnJv
cjogI2Vycm9yIG5vIGR5bmFtaWMgbG9hZGluZyBzdXBwb3J0Cj4gICAgODQgfCAjZXJyb3Igbm8g
ZHluYW1pYyBsb2FkaW5nIHN1cHBvcnQKPiAgICAgICB8ICBefn5+fgo+IAo+IEZpeGVzOgo+ICAt
IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzljZDU2YTYyNWNiZDUyYjBj
MDcwZTJkNDYyZTAyZjUxNjFkOTYzMWQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9saWJkYmkt
ZHJpdmVycy9Db25maWcuaW4gfCA0ICsrKysKPiAgcGFja2FnZS9saWJkYmkvQ29uZmlnLmluICAg
ICAgICAgfCA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkYmktZHJpdmVycy9Db25maWcuaW4gYi9wYWNrYWdlL2xp
YmRiaS1kcml2ZXJzL0NvbmZpZy5pbgo+IGluZGV4IDA4N2U2YWFmMGUuLjdjNTA1MzQwYzEgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJkYmktZHJpdmVycy9Db25maWcuaW4KPiArKysgYi9wYWNr
YWdlL2xpYmRiaS1kcml2ZXJzL0NvbmZpZy5pbgo+IEBAIC0xLDggKzEsMTIgQEAKPiAgY29uZmln
IEJSMl9QQUNLQUdFX0xJQkRCSV9EUklWRVJTCj4gIAlib29sICJsaWJkYmktZHJpdmVycyIKPiAr
CWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGxpYmRiaQo+ICAJc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQkRCSQo+ICAJaGVscAo+ICAJICBUaGUgbGliZGJpLWRyaXZlcnMgcHJvamVjdCBwcm92
aWRlcyB0aGUKPiAgCSAgZGF0YWJhc2Utc3BlY2lmaWMgZHJpdmVycyBmb3IgdGhlIGxpYmRiaSBm
cmFtZXdvcmsuCj4gIAo+ICAJICBodHRwOi8vbGliZGJpLWRyaXZlcnMuc291cmNlZm9yZ2UubmV0
Cj4gKwo+ICtjb21tZW50ICJsaWJkYmktZHJpdmVycyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBkeW5h
bWljIGxpYnJhcnkiCj4gKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUwo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYmRiaS9Db25maWcuaW4gYi9wYWNrYWdlL2xpYmRiaS9Db25maWcuaW4KPiBp
bmRleCBkZWQyYmM2ZTUzLi4xM2FjMzQ0ZjgyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZGJp
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGliZGJpL0NvbmZpZy5pbgo+IEBAIC0xLDcgKzEs
MTEgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0xJQkRCSQo+ICAJYm9vbCAibGlkYmkiCj4gKwlk
ZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKPiAgCWhlbHAKPiAgCSAgbGliZGJpIGltcGxlbWVu
dHMgYSBkYXRhYmFzZS1pbmRlcGVuZGVudCBhYnN0cmFjdGlvbiBsYXllcgo+ICAJICBpbiBDLCBz
aW1pbGFyIHRvIHRoZSBEQkkvREJEIGxheWVyIGluIFBlcmwuCj4gIAo+ICAJICBodHRwOi8vbGli
ZGJpLnNvdXJjZWZvcmdlLm5ldAo+ICsKPiArY29tbWVudCAibGliZGJpIG5lZWRzIGEgdG9vbGNo
YWluIHcvIGR5bmFtaWMgbGlicmFyeSIKPiArCWRlcGVuZHMgb24gQlIyX1NUQVRJQ19MSUJTCgoK
SW5kZWVkLAoKQWxzbyBpbiBjb2xsZWN0ZCBDb25maWcuaW4sICJkZXBlbmRzIG9uIiBuZWVkcyB0
byBiZSBhZGRlZAphbmQgaXRzIHJlbGF0ZWQgY29tbWVudC4KCi0tLS0gODwgLS0tLQpjb25maWcg
QlIyX1BBQ0tBR0VfQ09MTEVDVERfREJJCglib29sICJkYmkiCglkZXBlbmRzIG9uICFCUjJfU1RB
VElDX0xJQlMgIyBsaWJkYmkKCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJEQkkKCWhlbHAKCSAgRXhl
Y3V0ZXMgU1FMIHN0YXRlbWVudHMgb24gdmFyaW91cyBkYXRhYmFzZXMgYW5kCgkgIGludGVycHJl
dHMgdGhlIHJldHVybmVkIGRhdGEuCgpjb21tZW50ICJkYmkgbmVlZHMgYSB0b29sY2hhaW4gdy8g
ZHluYW1pYyBsaWJyYXJ5IgoJZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMKLS0tLSA4PCAtLS0t
CgpIZXJ2w6kKCi0tIApIZXJ2w6kgQ29kaW5hLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
