Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF26C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 10:42:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0266D6113E
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 10:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0266D6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA9C8403B;
	Wed, 22 Sep 2021 10:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_xDZCZp2Dns; Wed, 22 Sep 2021 10:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07BFE83F8E;
	Wed, 22 Sep 2021 10:42:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 890391BF951
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 10:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77BFC60B42
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 10:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IZg2oANbUin for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 10:42:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A695607D7
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 10:42:05 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MaHOX-1mPXpM2hK1-00WCEg; Wed, 22 Sep 2021 12:42:01 +0200
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20210922095216.2388856-1-jose.pekkarinen@unikie.com>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <49c4f0bc-1d73-3718-ec68-c99ed1b79e74@green-communications.fr>
Date: Wed, 22 Sep 2021 12:42:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922095216.2388856-1-jose.pekkarinen@unikie.com>
Content-Language: fr
X-Provags-ID: V03:K1:pI4UfxkmQgZLpcg9ZbQly1TxphJDeM0/7vp6F+VP+fEIyAznvGK
 s0sqhY8JwMAT/XRu4j0T8O4yixJwUl6xb1ytVV7O9osjGBoM1Od/RUMEQ1FU3Gwy805J0gO
 UMZ7lzQbmErguyPLMcy+J5igzszR9JmJrobo+oQBuZ3nmsx1XPaiz5B/TyX1FJzHyJxH1Ez
 oB9Xtpf2kKaq6Jb7BqPuw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H8XS5Wwz7LM=:V8snj9MPo0RWurkQWwr8ry
 u0808XB2eUH/87v0TsoJSCsBZGo7o6gkJwerDZC5LYm2qac8bKFqTV/6FiC2+z+bLR/C/KNwU
 HN7eKBEw365afFzEJ/SPeC46D8Y9RgSljfVbVzl2hqz3FVKNYosnSlkukppTJU4+Y6mpZtzCc
 6vrZcgEnf0LJaG7lRYvQuF02ugt4voTFvyI+Vi8p4TUsMl0H0bcaxuyWWeoU//izUMY7EZ5j5
 OtTkyR+v0tYHaBRb3MlLgu0Ohr8O5cAyIgTkFmp5cLt64ziCEv+Bwg7R2Ov+3rrTjcyvlEI0K
 Bi5tCFJrGjGiaZPyq2N/ZavlZNC15tKcMnzBJyUEFxpCZEAuJDDhZmIBEbcMiX2T2ukWzxgPO
 8jch4FF8SGkf5Cu1l20B1WOTQq+E//PEMq1r3Bb8jiSeiCLu22jYf0uWATcfH5chLGi9czSRe
 7pS+PPr2DwhkUQrEwyUD0zPVFqlQg1sCtQLMJMRCAuhku00OwIjEKArqzk4NjJkK2jZmUy4vy
 V6X1Ir7xSOMzDGIS8r7rkIrX0A/MNv5q5FM3Btd+/FIVmtDV6k/IBHmdHW+QqgCcFAd65/1Av
 7ViqyqwfnbLNQUOmweiyXfzL9yFJlQCeycjnciGGms1vD6bAtnKJCgjXtdMI6E0HNAHfmDXSq
 8uJMhdIKn7qJCQI7iB6B5hEQYiNiLHIt8ZYz6f5KaiU5G6vgGwgperHuNe7CdGv4EMSj8GgOi
 Z5lym0tAJjwyUT7XlXriKFI28gaGhOVMX9QbRhAL6kaFOzFN3S1VSO9NMRCROGOeraAl4LgeM
 f4Qq11W
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: Allow mesh
 configuration
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

T24gMjIvMDkvMjAyMSAxMTo1MiwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPiB3cGFfc3VwcGxp
Y2FudCBkZWZjb25maWcgZG9lc24ndCBlbmFibGUgQ09ORklHX01FU0gKPiBieSBkZWZhdWx0LCBh
bmQgY3VycmVudGx5IHRoZXJlIGlzIG9ubHkgYSBwYXRoIHRvCj4gZGlzYWJsZSBpdCBpbiBidWls
ZHJvb3QuIFRoaXMgcGF0Y2ggd2lsbCByZXN0b3JlCj4gdGhlIGxvZ2ljIHRvIGVuYWJsZSBpdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5p
a2llLmNvbT4KPiAtLS0KPiAgIHBhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQu
bWsgfCA0ICsrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxp
Y2FudC5tayBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsKPiBpbmRl
eCBlOTA3OGI5Zjg5Li4zZTYzMmQ3MjQ3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd3BhX3N1cHBs
aWNhbnQvd3BhX3N1cHBsaWNhbnQubWsKPiArKysgYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dw
YV9zdXBwbGljYW50Lm1rCj4gQEAgLTEwNCw3ICsxMDQsOSBAQCBlbHNlCj4gICBXUEFfU1VQUExJ
Q0FOVF9DT05GSUdfRElTQUJMRSArPSBDT05GSUdfV0lGSV9ESVNQTEFZCj4gICBlbmRpZgo+ICAg
Cj4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfTUVTSF9ORVRXT1JLSU5HKSwp
Cj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfTUVTSF9ORVRXT1JLSU5HKSx5
KQo+ICtXUEFfU1VQUExJQ0FOVF9DT05GSUdfRU5BQkxFICs9IENPTkZJR19fTUVTSAoKdHlwbyA/
Cgo+ICtlbHNlCj4gICBXUEFfU1VQUExJQ0FOVF9DT05GSUdfRElTQUJMRSArPSBDT05GSUdfTUVT
SAo+ICAgZW5kaWYKPiAgIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
