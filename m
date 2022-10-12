Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3D8C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 20:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B8A0607CA;
	Wed, 12 Oct 2022 20:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8A0607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGa2lLkiCz5V; Wed, 12 Oct 2022 20:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 588036070A;
	Wed, 12 Oct 2022 20:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 588036070A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D68BA1C1148
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B15EA402F2
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B15EA402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTwhKC7AAYxg for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 20:23:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D3C2400BF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D3C2400BF
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 20:23:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 07A3E60002;
 Wed, 12 Oct 2022 20:23:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 22:23:17 +0200
Message-Id: <20221012202317.2898868-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221012202317.2898868-1-thomas.petazzoni@bootlin.com>
References: <20221012202317.2898868-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665606207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttHgxVHhULzQAtONPWzO3bKUjF9+1UZ8so3M+syYWQg=;
 b=HCdYdKfP9J2eFHNFcbqNGdUAOp3GpGtsUHk6hUu5lXQ83rj0TepWnRDdjfxbo9pdnRunSN
 V+apw/DlGXe0bM0i67H0b37EmVarTvMLcfGFC223bfxUatk74kDx8PwCI+zSYd650LfVKi
 IV8L880CuDjyIOm7Clelf+OXU/Nxf4deKLTKada6CC7eHJrYjCU0xt9KsGrRCzmtPupwMK
 9wE733RinJEAyboM9otbqJ9VUp8muKs5+G9BUWBbDwZWliQz8Hb05MzKiU+Pe6o0ufu7ur
 ZMtoSaa2Vd2ic1OqBFTg0nmoEn9VCKeB36RIJSMq9qRgwHGPczS/9D/U8+HKsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HCdYdKfP
Subject: [Buildroot] [PATCH 2/2] package/lttng-modules: bump to 2.13.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyB0aGUgbGF0ZXN0IHBvaW50IHJlbGVhc2UgaW4gdGhlIHN0YWJsZSAyLjEzIGJyYW5j
aCAoY3VycmVudGx5CnRoZSBsYXRlc3Qgc3RhYmxlIGJyYW5jaCBhdmFpbGFibGUpLgoKQ2M6IENs
w6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KUmVwb3J0ZWQtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiBwYWNr
YWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL2x0
dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdHRu
Zy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMuaGFzaCBiL3BhY2thZ2UvbHR0bmctbW9kdWxlcy9sdHRu
Zy1tb2R1bGVzLmhhc2gKaW5kZXggZmIyNTNjOWJmNi4uZTY4NWNjMzM2NyAxMDA2NDQKLS0tIGEv
cGFja2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMuaGFzaAorKysgYi9wYWNrYWdlL2x0
dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5oYXNoCkBAIC0xLDUgKzEsNSBAQAotIyBGcm9tIGh0
dHBzOi8vbHR0bmcub3JnL2ZpbGVzL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy0yLjEzLjEu
dGFyLmJ6Mi5zaGEyNTYKLXNoYTI1NiAgYTdjODZkOTFjOWJiZTY2ZDI3ZjAyNWFhMDRiOGNmYzZk
Nzc4NWVkMmZjN2VmNzc0OTMwODAwZWU0NGQ3ZjM0MyAgbHR0bmctbW9kdWxlcy0yLjEzLjEudGFy
LmJ6MgorIyBGcm9tIGh0dHBzOi8vbHR0bmcub3JnL2ZpbGVzL2x0dG5nLW1vZHVsZXMvbHR0bmct
bW9kdWxlcy0yLjEzLjcudGFyLmJ6Mi5zaGEyNTYKK3NoYTI1NiAgNWE5OTY3OWRmNzkwMzE2MGNi
ZGUzOTE4ZmVlNWFmOTBmZmFmYzkwZmM5NmNjZGVmYWE1N2NmMjMwNDkyYjIzNCAgbHR0bmctbW9k
dWxlcy0yLjEzLjcudGFyLmJ6MgogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXMKIHNoYTI1NiAg
ZDcyOTIxMjY2YmM4NDUyYTg3ODlmOGEwNGE4Mjc1NTM3Mzk5MGQwMGI3ZTBiMGYxYThlZGI4Zjg1
NGU5NGQxYyAgTElDRU5TRVMvTEdQTC0yLjEKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHR0bmctbW9k
dWxlcy9sdHRuZy1tb2R1bGVzLm1rIGIvcGFja2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVs
ZXMubWsKaW5kZXggOTdjZGE1M2YwOC4uNDE2ODMzZjRlZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9s
dHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMubWsKKysrIGIvcGFja2FnZS9sdHRuZy1tb2R1bGVz
L2x0dG5nLW1vZHVsZXMubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1MVFROR19NT0RVTEVTX1ZFUlNJT04gPSAyLjEzLjEKK0xUVE5HX01PRFVMRVNfVkVS
U0lPTiA9IDIuMTMuNwogTFRUTkdfTU9EVUxFU19TSVRFID0gaHR0cDovL2x0dG5nLm9yZy9maWxl
cy9sdHRuZy1tb2R1bGVzCiBMVFROR19NT0RVTEVTX1NPVVJDRSA9IGx0dG5nLW1vZHVsZXMtJChM
VFROR19NT0RVTEVTX1ZFUlNJT04pLnRhci5iejIKIExUVE5HX01PRFVMRVNfTElDRU5TRSA9IExH
UEwtMi4xL0dQTC0yLjAgKGtlcm5lbCBtb2R1bGVzKSwgTUlUIChsaWIvYml0ZmllbGQuaCwgbGli
L3ByaW9faGVhcC8qKQotLSAKMi4zNy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
