Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91A1C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3893040477;
	Tue,  1 Feb 2022 22:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OcTpgBvx0eOG; Tue,  1 Feb 2022 22:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 389C1400CE;
	Tue,  1 Feb 2022 22:12:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BCED1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48DAA400CE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADDgol72yjK2 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:12:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD941400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:12:36 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id F1O6nJm8qo6PDF1O6nodDw; Tue, 01 Feb 2022 23:12:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643753554; bh=5NCLexuHjQEk5H/lYTwkjmIB4RlJzZznDtBHjbBQ2rQ=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=M+6NCzkpRWF4vqqItCrKJumoqW85dT4Ig3bXagGVD7e2Gr/Gs4Oe55SmFniZFu1/z
 +5HZOIMHgL+khPs7vt9UbEoyaAlTTo2EvONgFwBkxKxevF3RUi8TS0x2jb2R11ugin
 suD7zX9vtQ1XhukxaNtejYqAl9R86TkCUZhZ4ZWkli+SBUXBzSyI9vHGVNPRp8azif
 5OUgJwFeQcpvq7fIr/WhR/c7miqQkYeK/Ic8ccd2ex05xx9+VWd6E17GYourrwS+9h
 3UDus+2piT4kIuKV9JuxlUQu9luV8n0oZTh0+u7hSlCV7oZNWlOHEueR1GYXqm+XeI
 JAcCG07y2AJnQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 1 Feb 2022 23:12:33 +0100
Message-Id: <5C805706-7722-4179-A3F0-EB6F7FA592DB@benettiengineering.com>
References: <20220201220626.350423-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220201220626.350423-1-fontaine.fabrice@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfFPoFTr0Qpc8mQds2gxSf78mMgKbvo7rDPfy4H9wazwFOJVlZNDmU22EC8liXYChq2RNO/bqxVi56LFD/4c1KxEtekbBVyI5SXTiEHIqxkq9rBNtG94J
 tJrWJKQ4EfFbulvo69zQrL1Vo0pjbyiuElI5lvPjS/oZljrWhOlLzIZWqmDwchlUc4YajquEj0YMt1jrRCYOzdPeAwsDGrZDb6in4ih4nvm5ip+EdHMlKinJ
 D7Ri+a7fgRHkHfoMtZ5WzQ==
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: add or1k support
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

SGkgRmFicmljZSwKCj4gSWwgZ2lvcm5vIDEgZmViIDIwMjIsIGFsbGUgb3JlIDIzOjA4LCBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gaGEgc2NyaXR0bzoKPiAK
PiDvu79vcjFrIGlzIHN1cHBvcnRlZCBzaW5jZSB2ZXJzaW9uIDEuMTggYW5kCj4gaHR0cHM6Ly9n
aXQuZ251cGcub3JnL2NnaS1iaW4vZ2l0d2ViLmNnaT9wPWxpYmdwZy1lcnJvci5naXQ7YT1jb21t
aXQ7aD1jMTQzZmE4MTQ2MjU4NGFkMzllYTc4MDkwODI2NmJjZTNmYjlhNDllCj4gCj4gU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpU
aGUgb3IxayByZXZlbmdlIDotKQoKUmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAt
LS0KPiBwYWNrYWdlL2xpYmdwZy1lcnJvci9Db25maWcuaW4gfCAyMyArKysrKysrKysrKysrKyst
LS0tLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmdwZy1lcnJvci9Db25maWcuaW4gYi9wYWNr
YWdlL2xpYmdwZy1lcnJvci9Db25maWcuaW4KPiBpbmRleCA0NGU5ZDY3YWFmLi4wMzE1N2RkOWZl
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZ3BnLWVycm9yL0NvbmZpZy5pbgo+ICsrKyBiL3Bh
Y2thZ2UvbGliZ3BnLWVycm9yL0NvbmZpZy5pbgo+IEBAIC0yLDE0ICsyLDE5IEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9MSUJHUEdfRVJST1JfQVJDSF9TVVBQT1JUUwo+ICAgIGJvb2wKPiAgICAjIHNl
ZSBzcmMvc3lzY2ZnLwo+ICAgIGRlZmF1bHQgeSBpZiBcCj4gLSAgICAgICAgQlIyX2FhcmNoNjQg
ICAgfHwgQlIyX2FhcmNoNjRfZWIgICAgfHwgQlIyX2FybSAgICB8fCBcCj4gLSAgICAgICAgQlIy
X2FybWViICAgIHx8IEJSMl9pMzg2ICAgICAgICB8fCBCUjJfbWlwcyAgICB8fCBcCj4gLSAgICAg
ICAgQlIyX21pcHNlbCAgICB8fCBCUjJfbWlwczY0ICAgICAgICB8fCBCUjJfbWlwczY0ZWwgICAg
fHwgXAo+IC0gICAgICAgIEJSMl9tNjhrICAgIHx8IEJSMl9uaW9zMiAgICAgICAgfHwgQlIyX3Bv
d2VycGMgICAgfHwgXAo+IC0gICAgICAgIEJSMl9wb3dlcnBjNjQgICAgfHwgQlIyX3Bvd2VycGM2
NGxlICAgIHx8IEJSMl9SSVNDVl82NCAgICB8fCBcCj4gLSAgICAgICAgQlIyX1JJU0NWXzMyICAg
IHx8IEJSMl9zMzkweCAgICAgICAgfHwgQlIyX3NoNCAgICB8fCBcCj4gLSAgICAgICAgQlIyX3No
NGViICAgIHx8IEJSMl9zaDRhICAgICAgICB8fCBCUjJfc2g0YWViICAgIHx8IFwKPiAtICAgICAg
ICBCUjJfc3BhcmMgICAgfHwgQlIyX3NwYXJjNjQgICAgICAgIHx8IEJSMl94ODZfNjQKPiArICAg
ICAgICBCUjJfYWFyY2g2NCAgICB8fCBCUjJfYWFyY2g2NF9lYiAgICB8fCBcCj4gKyAgICAgICAg
QlIyX2FybSAgICAgICAgfHwgQlIyX2FybWViICAgICAgICB8fCBcCj4gKyAgICAgICAgQlIyX2kz
ODYgICAgfHwgQlIyX21pcHMgICAgICAgIHx8IFwKPiArICAgICAgICBCUjJfbWlwc2VsICAgIHx8
IEJSMl9taXBzNjQgICAgICAgIHx8IFwKPiArICAgICAgICBCUjJfbWlwczY0ZWwgICAgfHwgQlIy
X202OGsgICAgICAgIHx8IFwKPiArICAgICAgICBCUjJfbmlvczIgICAgfHwgQlIyX29yMWsgICAg
ICAgIHx8IFwKPiArICAgICAgICBCUjJfcG93ZXJwYyAgICB8fCBCUjJfcG93ZXJwYzY0ICAgIHx8
IFwKPiArICAgICAgICBCUjJfcG93ZXJwYzY0bGUgICAgfHwgQlIyX1JJU0NWXzY0ICAgICAgICB8
fCBcCj4gKyAgICAgICAgQlIyX1JJU0NWXzMyICAgIHx8IEJSMl9zMzkweCAgICAgICAgfHwgXAo+
ICsgICAgICAgIEJSMl9zaDQgICAgICAgIHx8IEJSMl9zaDRlYiAgICAgICAgfHwgXAo+ICsgICAg
ICAgIEJSMl9zaDRhICAgIHx8IEJSMl9zaDRhZWIgICAgICAgIHx8IFwKPiArICAgICAgICBCUjJf
c3BhcmMgICAgfHwgQlIyX3NwYXJjNjQgICAgICAgIHx8IFwKPiArICAgICAgICBCUjJfeDg2XzY0
Cj4gCj4gY29uZmlnIEJSMl9QQUNLQUdFX0xJQkdQR19FUlJPUgo+ICAgIGJvb2wgImxpYmdwZy1l
cnJvciIKPiBAQCAtMzYsNiArNDEsOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElCR1BHX0VSUk9S
X1NZU0NGRwo+ICAgICAgICBpZiBCUjJfbTY4awo+ICAgIGRlZmF1bHQgIm5pb3MyLXVua25vd24t
bGludXgtZ251IiBcCj4gICAgICAgIGlmIEJSMl9uaW9zMgo+ICsgICAgZGVmYXVsdCAib3Ixay11
bmtub3duLWxpbnV4LWdudSIgXAo+ICsgICAgICAgIGlmIEJSMl9vcjFrCj4gICAgZGVmYXVsdCAi
cG93ZXJwYy11bmtub3duLWxpbnV4LWdudSIgXAo+ICAgICAgICBpZiBCUjJfcG93ZXJwYwo+ICAg
IGRlZmF1bHQgInBvd2VycGM2NC11bmtub3duLWxpbnV4LWdudSIgXAo+IC0tIAo+IDIuMzQuMQo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
