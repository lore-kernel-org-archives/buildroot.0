Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB31C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4893B60B65;
	Sat,  5 Feb 2022 19:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YdE7axBobSh; Sat,  5 Feb 2022 19:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EE616080A;
	Sat,  5 Feb 2022 19:40:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E23F91BF342
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 19:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDEF5813ED
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 19:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUcFpard4QWY for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 19:40:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A35F813D4
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 19:40:06 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id GQuine03aDzPJGQuinFcDh; Sat, 05 Feb 2022 20:40:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644090004; bh=6vvhp74W3kc4aq6mrrxanbXHM1JJhvm1lqdOo79SwFA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ZYLDz3j9FiO/0WSu72pTHpPF6UQZA6BcKBf0HEvuMjEbPpwgRl47Ywfr7BnwXoB6v
 JI/kpi6kvxy4JCTm3TZY4WsjwkQL130JxYOweKYSAA/5QIyK5+eNuF32wkfx/r9qmQ
 mCrv7HdBiqnbMEtVR4E10xrKwjDmBIJE3hP10CDIVq6T7RSPBaNWAy0pSASS6oAOvP
 DaOeMqPn1vzgXcM7Zuy+SBSOxBCYO6aiASHSbvHl9wuMAiqW0seWqdchEkP7yXrBQE
 O4vzS5um7DNqB8RxZ8SHc1rNxS1Zxayb3pzYBw+xmhPy3gWBj9ul8vyfSul2ICah8r
 yf4CHbRbPZG0g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 5 Feb 2022 20:40:03 +0100
Message-Id: <E4DB79AE-E3E6-4297-A498-52D9AA71BE47@benettiengineering.com>
References: <20220205181259.5831-1-peter.macleod.thompson@gmail.com>
In-Reply-To: <20220205181259.5831-1-peter.macleod.thompson@gmail.com>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfBxBw0kDgj+7MtHSMCSzGYWpXY6npoclMPV3YnsilldkFerLucjZH6huunOXC3Es3hIFVjtBcl91+PUC0f2F+7wR5vYjVtvDoKctRo7zl6kYlUp+62MK
 37p7gYv0mntxJd06hvYeQKXpw/5aDrpQA8bED/PtMnS653uoGcuJIlPqbK2+ZpZqbzLfSovazg/P0dvlonIc6RIr6NkSR8c2zY/uoyQop3YnxrThXgqt6Vi/
 nXDA+2ibJnV6PWch8b4SIw==
Subject: Re: [Buildroot] [PATCH 1/1] bump version to 2.0.18
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

SGkgUGV0ZXIsCgpvbiBzdWJqZWN0IGl04oCZcyBtaXNzaW5nOgpwYWNrYWdlL3NkbDJfdHRmOiBi
dW1wIHZlcnNpb24gdG8gMi4wLjE4CgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IElsIGdpb3JubyA1
IGZlYiAyMDIyLCBhbGxlIG9yZSAxOToxMywgUGV0ZXIgVGhvbXBzb24gPHBldGVyLm1hY2xlb2Qu
dGhvbXBzb25AZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7v0Zyb206IFBldGVyVGhvbXBz
b24gPHBldGVyLm1hY2xlb2QudGhvbXBzb25AZ21haWwuY29tPgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBldGVyVGhvbXBzb24gPHBldGVyLm1hY2xlb2QudGhvbXBzb25AZ21haWwuY29tPgo+IC0tLQo+
IHBhY2thZ2Uvc2RsMl90dGYvc2RsMl90dGYuaGFzaCB8IDQgKystLQo+IHBhY2thZ2Uvc2RsMl90
dGYvc2RsMl90dGYubWsgICB8IDIgKy0KPiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zZGwyX3R0Zi9zZGwy
X3R0Zi5oYXNoIGIvcGFja2FnZS9zZGwyX3R0Zi9zZGwyX3R0Zi5oYXNoCj4gaW5kZXggMTY0NTll
NGE1OS4uYTQ5MGIwMDJiNiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3NkbDJfdHRmL3NkbDJfdHRm
Lmhhc2gKPiArKysgYi9wYWNrYWdlL3NkbDJfdHRmL3NkbDJfdHRmLmhhc2gKPiBAQCAtMSwzICsx
LDMgQEAKPiAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIGE5ZWNlYjFhZDg4YzFmMTU0
NWNkN2JkMjhlN2NiYzBiMmMxNDE5MWQ0MDIzOGY1MzFhMTViMDFiMWIyMmNkMzMgIFNETDJfdHRm
LTIuMC4xNS50YXIuZ3oKPiAtc2hhMjU2ICBmNjM3MDgwOWM5ZjY0NDc2MDkyMGQ5OTQ1YzViZTA3
YWVkMTc2NjQ5NzVmMmU0NzQxMDEzZDRkOWEyZWM2OTZmICBDT1BZSU5HLnR4dAo+ICtzaGEyNTYg
IDcyMzRlYjg4ODM1MTRlMDE5ZTc3NDdjNzAzZTRhNzc0NTc1YjE4ZDQzNWMyMmE0YTI5ZDA2OGNi
NzY4YTIyNTEgIFNETDJfdHRmLTIuMC4xOC50YXIuZ3oKPiArc2hhMjU2ICBlMjExZGZlN2UyYzM2
ZTY0MDQ4YmU4ODZmZTNmMmJiYmE4NzMyY2U0ZGQ3N2I1OTZhMzU1ZDNhYmJlYzc3NWE0ICBDT1BZ
SU5HLnR4dAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NkbDJfdHRmL3NkbDJfdHRmLm1rIGIvcGFj
a2FnZS9zZGwyX3R0Zi9zZGwyX3R0Zi5tawo+IGluZGV4IDMyNmNiOTkzNjYuLjFmZTdjMGEwNzUg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zZGwyX3R0Zi9zZGwyX3R0Zi5tawo+ICsrKyBiL3BhY2th
Z2Uvc2RsMl90dGYvc2RsMl90dGYubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAjCj4gIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiAKPiAtU0RMMl9UVEZfVkVSU0lPTiA9IDIuMC4xNQo+ICtTREwyX1RU
Rl9WRVJTSU9OID0gMi4wLjE4Cj4gU0RMMl9UVEZfU09VUkNFID0gU0RMMl90dGYtJChTREwyX1RU
Rl9WRVJTSU9OKS50YXIuZ3oKPiBTREwyX1RURl9TSVRFID0gaHR0cDovL3d3dy5saWJzZGwub3Jn
L3Byb2plY3RzL1NETF90dGYvcmVsZWFzZQo+IFNETDJfVFRGX0xJQ0VOU0UgPSBabGliCj4gLS0g
Cj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
