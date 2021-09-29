Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33CBC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 08:42:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D46E61357
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 08:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D46E61357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C5BF82479;
	Wed, 29 Sep 2021 08:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SDs6vDAd6Md; Wed, 29 Sep 2021 08:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ECAD80EA0;
	Wed, 29 Sep 2021 08:42:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44D171BF23F
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 08:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31E9F40425
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 08:42:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eN4uK-f0yzVA for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 08:42:47 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 961D8401EA
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 08:42:46 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MnItm-1nCUpJ3j4G-00jMTn; Wed, 29 Sep 2021 10:37:37 +0200
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20210922113820.3628-1-jose.pekkarinen@unikie.com>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <8ab0b36d-c9a4-1e61-96d1-f874127b3c1e@green-communications.fr>
Date: Wed, 29 Sep 2021 10:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922113820.3628-1-jose.pekkarinen@unikie.com>
Content-Language: fr
X-Provags-ID: V03:K1:9GaLJZn8XuhVpq0Etk4qqAwOI5FyrOtBlrspwhNoIomx6Vc0+VR
 s0pixu88BtmjhGPJ83FAHDPBvEIC8E7dip5966Y7OetzgShZWLnpuIxx4IaBY+Hw/9qHPf+
 6cmq23rB2VvuLsIct4dIj+NdZTrbAzVZO3Af/BtJH/0V5F9qmuSBGad3Hnhre7bRlQy+/dg
 t9hZYJV4eN/c9THhmM9Gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7ybLUiUUpdQ=:g5Z6DOE5K2dEBWhP8NJrib
 9NOx3xkgDEaWfOMrYb0yE5+c6TymW+jaFlWQ2Usec88S2F7Yd7rso3ypoTItV7ryHqrAzR8OA
 iZu86yvnvSJFivpUOTKw0picWoyCKyXMu9QZZMcjCCQ2vlXBLNky37e+IzAZNqUhH3tu6SwUy
 PtX6DF0bfCDN7ewBR5kekKTkMdZTOMiKFD2R9Pwtqv4/0BLJUcFQO2zoVjDvjxEt0Jbb7b3Df
 iO7ebqvT/nZ6Nw2ajqZYLzfCnEzY9S0eIa0peIShIq1wQBs5mNEpZpe8ODCzunQBkbhOHlbfl
 18DrPIELG53azBwN6yywn90eFrBEoV5mNDfxNgGmDWZnwO5HMZTfaGUYB3Jp4fE5GRG4lkmnB
 MNPNxQ5PVFVeAoqsCyAkhG3KCLxuGkLTnDS9KDmRtWakx4RsQBbf5Fcaq0xcTKEY1HG5o8awH
 lSCIqOw3tGETrt6Qu87ivvV+FcEMRiNcaEqAtX3WhsGyL5x3FBqyz8ChNk3f/YG8iXZMrLcO6
 Kt5rr8rhmKBIQ1D7CsAvicWgR9HeLZFc5R3rLOCSv71NwCfuRfNfFrYzn3nfVllb0krV2dUSa
 Z7pC9Ow5Um8eAwSOQCEWGzp9I4XXhmzTLcFvRlCVJgjU5JDaI2vi91UdSos7/gZFK8ooZit26
 soTeOjPJU0shLinFkNotAvMZWCnlNYKg5K19iPDZTGzoFKVSgQxBiIJc+yyQ1ZQq4gjqMWR9b
 ESTSw5nGJ8Kf1nd/cI1dBQk5G8mJJlReZdMGw3SLbtyvC8GztkgE80DZwExnRUnkhIcPCSG8t
 n9mz90H
Subject: Re: [Buildroot] [PATCH v2] package/wpa_supplicant: Allow mesh
 configuration
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

T24gMjIvMDkvMjAyMSAxMzozOCwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPiB3cGFfc3VwcGxp
Y2FudCBkZWZjb25maWcgZG9lc24ndCBlbmFibGUgQ09ORklHX01FU0gKPiBieSBkZWZhdWx0LCBh
bmQgY3VycmVudGx5IHRoZXJlIGlzIG9ubHkgYSBwYXRoIHRvCj4gZGlzYWJsZSBpdCBpbiBidWls
ZHJvb3QuIFRoaXMgcGF0Y2ggd2lsbCByZXN0b3JlCj4gdGhlIGxvZ2ljIHRvIGVuYWJsZSBpdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5p
a2llLmNvbT4KPiAtLS0KPiBbIHYxIC0+IHYyIF0gcy9DT05GSUdfX01FU0gvQ09ORklHX01FU0gv
Cj4gCj4gICBwYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rIHwgNCArKyst
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsgYi9w
YWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rCj4gaW5kZXggZTkwNzhiOWY4
OS4uM2MwYjBjMWRmYyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9z
dXBwbGljYW50Lm1rCj4gKysrIGIvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2Fu
dC5tawo+IEBAIC0xMDQsNyArMTA0LDkgQEAgZWxzZQo+ICAgV1BBX1NVUFBMSUNBTlRfQ09ORklH
X0RJU0FCTEUgKz0gQ09ORklHX1dJRklfRElTUExBWQo+ICAgZW5kaWYKPiAgIAo+IC1pZmVxICgk
KEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX01FU0hfTkVUV09SS0lORyksKQo+ICtpZmVxICgk
KEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX01FU0hfTkVUV09SS0lORykseSkKPiArV1BBX1NV
UFBMSUNBTlRfQ09ORklHX0VOQUJMRSArPSBDT05GSUdfTUVTSAo+ICtlbHNlCj4gICBXUEFfU1VQ
UExJQ0FOVF9DT05GSUdfRElTQUJMRSArPSBDT05GSUdfTUVTSAo+ICAgZW5kaWYKPiAgIAo+IAoK
VGVzdGVkLWJ5OiBOaWNvbGFzIENhdmFsbGFyaSA8bmljb2xhcy5jYXZhbGxhcmlAZ3JlZW4tY29t
bXVuaWNhdGlvbnMuZnI+CkFja2VkLWJ5OiBOaWNvbGFzIENhdmFsbGFyaSA8bmljb2xhcy5jYXZh
bGxhcmlAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
