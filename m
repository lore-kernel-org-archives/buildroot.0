Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75168C4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 20:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA58416DE;
	Fri, 19 Jan 2024 20:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DA58416DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1P47S-tGXXfk; Fri, 19 Jan 2024 20:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0583E4194E;
	Fri, 19 Jan 2024 20:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0583E4194E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7391C1BF98E
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 585BE4044B
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 585BE4044B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2J5-g7qqJhn for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 20:44:07 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21212405CF
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 20:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21212405CF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EB68213F81D;
 Fri, 19 Jan 2024 21:44:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 19 Jan 2024 21:44:01 +0100
Date: Fri, 19 Jan 2024 21:44:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <ZarfESFB_voB0vC4@landeda>
References: <20240109183354.361126-1-sairon@sairon.cz>
 <ZaOkIQZ9czn7zQpU@landeda>
 <8cd703c2-6256-4993-a6c8-aba7a824676d@sairon.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cd703c2-6256-4993-a6c8-aba7a824676d@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705697045;
 bh=onqGRTef604gbNe9W8bEVLhJRX+eYy+7MWYr0XjcmDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eYNIvAiwTX17IsZ6hH0TkH9nEpqihYqTX/mxXBgH/Vx7pBF7dv9MdAC2KpTUz1Mqk
 6qDOxHpDmZrz9VpdtdMDFk2bZtNnoXg5MwdwQGM5ptp8zs3ueZ6WJQ8bqI6dvMX5Z8
 o7nQciehJSF2FgklzM+3TGsABsWPvg8/eufRuVKuefbkME+p+yl5N00MhnOo/FeuU5
 IGAcqjVflVtmlM0Ve9steDKGQFzswIDU5jg+zvAcXwQWS+VvZU9u3H27EYytyq2WvO
 O3oeZVFmZw1sJ/7PR2yzAQkj42Kv26jsbMzV59p/xeI1q4tKZ6LwHOsGQGpiA43xCO
 pKSAoCW5RHNOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eYNIvAiw
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20231211
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFuLCBBbGwsCgpPbiAyMDI0LTAxLTE3IDEyOjE1ICswMTAwLCBKYW4gxIxlcm3DoWsgc3Bha2Ug
dGh1c2x5Ogo+ID4gPiBVcGRhdGVkIFdIRU5DRSBoYXNoIGR1ZSB0byB2YXJpb3VzIGNvbW1pdHM6
Cj4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zp
cm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC9sb2cvV0hFTkNFCj4gPiAKPiA+IElmIHRoZSBmaWxl
IGNoYW5nZWQsIHRoYXQgaXMgYmVjYXVzZSB0aGVyZSB3ZXJlIGNoYW5nZXMgdXBzdHJlYW0sIHNv
Cj4gPiBzdGF0aW5nIHRoZXJlIGFyZSAidmFyaW91cyBjb21taXRzIiB0aGF0IGNoYW5nZWQgdGhl
IGZpbGUgaXMgbm90IHZlcnkKPiA+IGhlbHBmdWwuCj4gSXQncyBhIGJpdCB2YWd1ZSBmb3JtdWxh
dGlvbiBpbmRlZWQsIGhvd2V2ZXIgaXQncyBhY2NvbXBhbmllZCB3aXRoIHRoZSBsaW5rCj4gdG8g
dGhlIGxpc3Qgb2YgY2hhbmdlcyBpbiB0aGUgdXBzdHJlYW0gZ2l0IHRyZWUuIFVuZm9ydHVuYXRl
bHkgY2dpdCBVSQo+IGRvZXNuJ3QgaGF2ZSBhIHdheSB0byBzcGVjaWZ5IGNvbW1pdCByYW5nZSB0
byBsaW1pdCB0aGUgbGlzdCBvZiBjb21taXRzLgo+IEFueXdheSwgSSBzaW1wbHkgZm9sbG93ZWQg
dGhlIGV4YW1wbGUgb2YgcHJldmlvdXMgdXBkYXRlcyBvZiBsaW51eC1maXJtd2FyZSwKPiB3aGVy
ZSBhIHNpbWlsYXIgd29yZGluZyB3YXMgdXNlZDoKClJpZ2h0LCBhbmQgdGhhdCdzIG5pY2UgdGhh
dCB5b3UgbG9va2VkIGF0IHByZXZpb3VzIGVudHJpZXMsIHRoYW5rcyEgOi0pCgpJbXByb3Zpbmcg
dGhlIGNvbW1pdCBsb2dzIGlzIGFsc28gYSBsb25nLWxhc3RpbmcgZ29hbCBhbmQgZWZmb3J0IG9m
Cm1pbmUsIG9uZSBjb21taXQgYXQgYSB0aW1lISA7LSkKClRoYW5rIHlvdSBmb3IgeW91ciBjb250
cmlidXRpb25zIQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJ
SSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBf
LypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
