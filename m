Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B75C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:53:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5297E60295
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 16:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5297E60295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9168606CA;
	Fri, 10 Sep 2021 16:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDJZykClGXDo; Fri, 10 Sep 2021 16:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CD3E605CC;
	Fri, 10 Sep 2021 16:52:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E17D21BF2C7
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0309605CC
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 16:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0h5zgjMZ-qVE for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 16:52:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D28B605C9
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 16:52:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (15)
Received: from zm (pub-198.183.29.194.multiplay.pl [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id CC1271C5811;
 Fri, 10 Sep 2021 18:52:48 +0200 (CEST)
References: <20210904223115.545819-1-fontaine.fabrice@gmail.com>
User-agent: mu4e 1.6.6; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Sep 2021 18:52:25 +0200
In-reply-to: <20210904223115.545819-1-fontaine.fabrice@gmail.com>
Message-ID: <87sfycqso3.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: fix build with glibc
 >= 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

CkZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cgo+
IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBnbGliYyA+PSAyLjM0Ogo+Cj4g
Li4vZ2xpYi9nc3Bhd24uYzogSW4gZnVuY3Rpb24gJ3NhZmVfY2xvc2Vmcm9tJzoKPiAuLi9nbGli
L2dzcGF3bi5jOjE0OTc6NzogZXJyb3I6IHRvbyBmZXcgYXJndW1lbnRzIHRvIGZ1bmN0aW9uICdj
bG9zZV9yYW5nZScKPiAgMTQ5NyB8ICAgaWYgKGNsb3NlX3JhbmdlIChsb3dmZCwgR19NQVhVSU5U
KSAhPSAwICYmIGVycm5vID09IEVOT1NZUykKPiAgICAgICB8ICAgICAgIF5+fn5+fn5+fn5+Cj4K
PiBGaXhlczoKPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9jYmMw
OTEzZmEyY2M0ODZkZWI2NGIwN2I1YjEzMzQxYTVhOTcwMjVlCj4KPiBTaWduZWQtb2ZmLWJ5OiBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0KPiAgLi4u
dGx5LXVzZS0zLXBhcmFtZXRlcnMtZm9yLWNsb3NlX3JhbmdlLnBhdGNoIHwgMzMgKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9saWJnbGliMi8wMDA0LWNvcnJlY3RseS11c2UtMy1wYXJhbWV0
ZXJzLWZvci1jbG9zZV9yYW5nZS5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ2xp
YjIvMDAwNC1jb3JyZWN0bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2VfcmFuZ2UucGF0Y2gg
Yi9wYWNrYWdlL2xpYmdsaWIyLzAwMDQtY29ycmVjdGx5LXVzZS0zLXBhcmFtZXRlcnMtZm9yLWNs
b3NlX3JhbmdlLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
Li5iZmNhNGIxNGVmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGliZ2xpYjIvMDAw
NC1jb3JyZWN0bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2VfcmFuZ2UucGF0Y2gKPiBAQCAt
MCwwICsxLDMzIEBACj4gK0Zyb20gYjcxMTE3ZDg5NDM0ZGI4M2QzNGJjMWI5ODFjYTAzZDRiZTI5
OTU3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KPiArRGF0ZTogVGh1LCA4IEp1bCAyMDIxIDE3OjI2OjQzIC0wNzAwCj4gK1N1
YmplY3Q6IFtQQVRDSF0gY29ycmVjdGx5IHVzZSAzIHBhcmFtZXRlcnMgZm9yIGNsb3NlX3Jhbmdl
Cj4gKwo+ICtsaWJjIGltcGxlbWVudGF0aW9uIGhhcyAzIHBhcmFtZXRlciBlLmcuCj4gK2h0dHBz
Oi8vd3d3LmZyZWVic2Qub3JnL2NnaS9tYW4uY2dpP3F1ZXJ5PWNsb3NlX3JhbmdlJnNla3Rpb249
MiZmb3JtYXQ9aHRtbAo+ICsKPiArU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KPiArCj4gK1tSZXRyaWV2ZWQgZnJvbToKPiAraHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL2dsaWIvLS9jb21taXQvYjcxMTE3ZDg5NDM0ZGI4M2QzNGJjMWI5ODFjYTAzZDRi
ZTI5OTU3Nl0KPiArU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFi
cmljZUBnbWFpbC5jb20+Cj4gKy0tLQo+ICsgZ2xpYi9nc3Bhd24uYyB8IDIgKy0KPiArIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdp
dCBhL2dsaWIvZ3NwYXduLmMgYi9nbGliL2dzcGF3bi5jCj4gK2luZGV4IDg5OTY0N2MyZi4uMzA3
M2ExMGE0IDEwMDY0NAo+ICstLS0gYS9nbGliL2dzcGF3bi5jCj4gKysrKyBiL2dsaWIvZ3NwYXdu
LmMKPiArQEAgLTE1MjAsNyArMTUyMCw3IEBAIHNhZmVfY2xvc2Vmcm9tIChpbnQgbG93ZmQpCj4g
KyAgICAqCj4gKyAgICAqIEhhbmRsZSBFTk9TWVMgaW4gY2FzZSBpdOKAmXMgc3VwcG9ydGVkIGlu
IGxpYmMgYnV0IG5vdCB0aGUga2VybmVsOyBpZiBzbywKPiArICAgICogZmFsbCBiYWNrIHRvIHNh
ZmVfZmR3YWxrKCkuICovCj4gKy0gIGlmIChjbG9zZV9yYW5nZSAobG93ZmQsIEdfTUFYVUlOVCkg
IT0gMCAmJiBlcnJubyA9PSBFTk9TWVMpCj4gKysgIGlmIChjbG9zZV9yYW5nZSAobG93ZmQsIEdf
TUFYVUlOVCwgMCkgIT0gMCAmJiBlcnJubyA9PSBFTk9TWVMpCj4gKyAjZW5kaWYgIC8qIEhBVkVf
Q0xPU0VfUkFOR0UgKi8KPiArICAgKHZvaWQpIHNhZmVfZmR3YWxrIChjbG9zZV9mdW5jLCBHSU5U
X1RPX1BPSU5URVIgKGxvd2ZkKSk7Cj4gKyAjZW5kaWYKPiArLS0KPiArR2l0TGFiCj4gKwoKUmV2
aWV3ZWQtYnk6IE1hcmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29tPgpU
ZXN0ZWQtYnk6IE1hcmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29tPgoK
LS0KTWFyY2luIE5pZXN0csOzagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
