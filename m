Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40147C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0EE840289;
	Mon, 15 Aug 2022 20:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0EE840289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwdoaczXsLQ0; Mon, 15 Aug 2022 20:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 128F040275;
	Mon, 15 Aug 2022 20:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 128F040275
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24BB71BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0A624088E
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A624088E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLDUf_aVs1XK for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:10:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 782284088D
Received: from delivery28.mailspamprotection.com
 (delivery28.mailspamprotection.com [185.56.85.156])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 782284088D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:10:31 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se28.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1oNgPr-0002PM-JI; Mon, 15 Aug 2022 15:10:29 -0500
Received: from [149.62.207.73] (port=18076 helo=smtpclient.apple)
 by es87.siteground.eu with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1oNgPq-0008qi-0e; Mon, 15 Aug 2022 20:10:26 +0000
From: Dimi Tomov <dimi@tpm.dev>
Mime-Version: 1.0 (1.0)
Date: Mon, 15 Aug 2022 23:10:25 +0300
Message-Id: <894EC3FF-0378-4556-BAA6-1B1B88437A8A@tpm.dev>
References: <20220815180311.GD2854108@scaer>
In-Reply-To: <20220815180311.GD2854108@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: iPhone Mail (19E258)
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.13)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+ZNBYDxp2B3hM6B4+r26LKPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zC49OQ6M95/0HxQPV39IDJsqs9zzoJ2M16bDJce8jCJIOq
 PoBC+AwxGRzTVvKaCS3UQRzXCPX/FYZNSNi0b2qvI6cfbKBzlcMUXCoF9Y3lvvz9igOvGzmLdAqH
 gITTmb+xwAWWjBwyG9v7zXWOtWAIcBmI274c1l/AqPuXPnq7moySgO4Ws+K1evN9zcu6c07OGjer
 XiaE1m0AbIEMNzgechKTJSeQu9Gv1lzeQhHeNwZIxtXW0Mz4B7SMF7WU9HASnzxQ9ccQ2gbYOfdp
 oOkRPBfyCUQPGRfAuQJyQcUhQy50CsjjnTVdq3kd788Q1zcw7d7JKel9c+L51wL7GJTGjLihaNvy
 4UUwo+ldQ6mSQEznwDDpvxyVOAfTFG1b0YqTy649CyBNf0ZgULb/EFo+39sUHXwyAFnSuVW90ZJg
 h3r6hAL/pjzQN/GQ45ibIzuzIh1wkn5B+muMTuS2LDwzt8Ds8HhMu8AsuC+XP0IWdUIAUNuMtkDD
 GcfMcpylyxhs01KruaxB6s0aI7mWLxFqewZEt7CZOQ7IU15wrAsvU4/yXIk618YVJp5jM2kZcUgH
 PUbw7CVpNolczSoTuJsRnENsSECCOsy4kitQ2EVON3ZmAvzhACRw3PmZbvOIthHfrU9B9Dr1ityL
 42rNivPoGYchH2Fw1KSj1e3k1mGL1zYfTH509XQw8Xdr+MnJzzZn/WnTKonJfGSB+FJgE/zwt/Rz
 tn2TlEVZo+SyR2KU+fdjzQ6YC7Heg3Xf7O1TOd6RJQvT/U9rVpsp+2+YWHqMJlXoybOvrfLlgErb
 JFPCX7X6uLCQWGN9pNli3DC1GSGUtSzO67MZZOAYUek0Yft17NriA3GK1+wg/iCTJH0JqCG7X+t1
 TW39Ja77LGPpOwBdIsa6pXKCXxjFsbUwgHS0eo7ybJmmaWykWTbAAZ1XGFTzcEStuOgM8+WgcxlS
 OIcPxmo87wugkeVczgPJFLMsHgC00qgRk2z6CMYeLQ7wp2F7GO6T6bnYu21C1+IFqWMHzhJIya1b
 hC8OG6CHeS+XMj9B6P5z9jr1E+YC0mZnY7DiOrvyPQGBoymZzgLPbwz2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:
 Mime-Version:From:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wiJuwTPkWdKSx3xEHLly2JnBicKnySuYJ2OefZrhHA=; b=Y2/xlsy1+DDk58MYj19lZYUq1E
 LFYEkJrTCMXjbuVsTez4nssE/438yg6ok/l/67cVukQGCvv5a7qfR53lqGgCLnNBH0xNtolGjO1p8
 EyikqAah63WFqh1FaLybNsBLXnXAyYsYYVeuS+rEPVfaf8VcKrV+eNYbLgJHjf8FcK3Aq2IVZFQlZ
 6JmshevuuAs3JjwEcHiWUAi6ATXngUPDnn5pcDFIqsINlzlIyJdxUiGUPfr0Q8hxjuwDEouMmWSWu
 otPdqMlfbruBh8xJbSWsIAgV4xCb/fv13mc2u+zJShxgD1lS2EjESPXqAKX1ViCwGzmTAc/oa0JQz
 LA89qSgA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=Y2/xlsy1
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: Re: [Buildroot] [PATCH 15/33] package/wolftpm: fix typo on
 BR2_PACKAGE_WOLFTPM_NUVOTON
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T2gsIGluZGVlZC4gVGhhbmsgeW91IFlhbmkuCgpUaGFuayB5b3UgZm9yIHRoaXMgZml4IFJpY2Fy
ZG8uCgpEaW1pCgpTZW50IGZyb20gbXkgaVBob25lCgo+IE9uIDE1IEF1ZyAyMDIyLCBhdCAyMTow
MywgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+IAo+IO+7
v0RpbWksIEFsLCwKPiAKPiBPbiAyMDIyLTA4LTE1IDIwOjQ2ICswMzAwLCBEaW1pIFRvbW92IHNw
YWtlIHRodXNseToKPj4gVGhpcyBpcyBpbnRlbmRlZCBhbmQgbm90IGEgdHlwby4KPj4gCj4+IElm
IHlvdSByZW5hbWUgQlIyX1BBQ0tBR0VfV09MRlRQTV9OVVZPVE9OIHRvIC4uLiBOUENUNzUwIGl0
IHdvdWxkIG5vdCBtYXRjaAo+PiB0aGUgYWN0dWFsIHdvbGZUUE0gb3B0aW9ucyB0aGF0IGlzICIt
LWVuYWJsZS1udXZvdG9uIi4KPiAKPiBJIGFtIGFmcmFpZCB5b3UgZ290IGl0IHdyb25nLiBUaGUg
b3B0aW9uIGlzIHN0aWxsIG5hbWVkCj4gQlIyX1BBQ0tBR0VfV09MRlRQTV9OVVZPVE9OLgo+IAo+
IEhvd2V2ZXIsIGluIHRoZSAubWssIGl0IHdhcyByZWZlcmVuY2VkIGFzIEJSMl9QQUNLQUdFX1dP
TEZUUE1fTlBDVDc1MAo+IHdoaWNoIGRvZXMgbm90IGV4aXN0IGFuZCBpcyBub3QgZGVmaW5lZCBh
bnl3aGVyZS4KPiAKPiBTbywgYWxsIHRoZSBwYXRjaCBkb2VzIGlzIHVzZSB0aGUgY29ycmVjdCBv
cHRpb24gZnJvbSBLY29uZmlnOgo+IAo+Pj4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfV09MRlRQTV9O
UENUNzUwKSx5KQo+Pj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfV09MRlRQTV9OVVZPVE9OKSx5KQo+
IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPiAtLSAKPiAuLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFT
Q0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBT
b2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAg
IHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsu
b3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4g
Jy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
