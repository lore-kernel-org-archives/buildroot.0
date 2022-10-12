Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4403BC433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 20:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2D14812B5;
	Wed, 12 Oct 2022 20:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2D14812B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SkC8s1T60kT; Wed, 12 Oct 2022 20:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEBEE80C46;
	Wed, 12 Oct 2022 20:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEBEE80C46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4BB71BF2AA
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7468441948
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7468441948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHUAowE8Qu6u for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 20:23:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BEED4193F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BEED4193F
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 20:23:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id E3A1860003;
 Wed, 12 Oct 2022 20:23:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 22:23:16 +0200
Message-Id: <20221012202317.2898868-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665606206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ebYXwrdVY7ABpbGC5B4GOZGRK5IlRVQG7zHixWNJxpY=;
 b=ZVx8NcdedBE0gPB+hlS0/+Uf1jSmZfrnP8C/lrKeqkI3EOfDUdcQI3/QAm++/YGh+nY7tb
 HwyCp/YXxoybwfC7ex6JmkECYh4E9Yz9QWrl1OEiCXAYRPkyvJ8MNGFLbQt75PA3MVmWNo
 7dOz7t7HCH8njfA1gn1ywzqAIqVDAer6IBgM1f5X96fVpbzYBVI/obUzEo2M/7bPILKYXb
 4GbrvLbA7Qiz4NRo2nbz8P8NsXtKnpBz/YuJEmRnt4yv4Vo6seHZZfpDqlNQJioXLREPKB
 cyyt/83C8RxM7NEErZOKajeYIGNkMl8t4GoEP1VexJEmzQC9mQU0Av4V68KP+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZVx8Ncde
Subject: [Buildroot] [PATCH 1/2] package/lttng-modules: enable CONFIG_FTRACE
 in kernel configuration
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

VGhlIGJ1aWxkIG9mIGx0dG5nLW1vZHVsZXMgd2lsbCBmYWlsIGlmIHRoZSBrZXJuZWwgZG9lcyBu
b3QgaGF2ZQpDT05GSUdfVFJBQ0VQT0lOVFMgZW5hYmxlZC4gSG93ZXZlciwgQ09ORklHX1RSQUNF
UE9JTlRTIGlzIGEKcHJvbXB0LWxlc3Mgb3B0aW9uLCBhbmQgdGhlIG1vc3QgZ2VuZXJpYyBvcHRp
b24gdGhhdCBkb2VzIGVuYWJsZQpDT05GSUdfVFJBQ0VQT0lOVFMgaXMgQ09ORklHX0ZUUkFDRS4K
CkluIGFkZGl0aW9uLCBDT05GSUdfRlRSQUNFIHdpbGwgYWxzbyBlbmFibGUgQ09ORklHX1NUQUNL
VFJBQ0UsIHdoaWNoCmlzIG5lZWRlZCBvbiBDUFUgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvbid0IHBy
b3ZpZGUgdGhlIFNUQUNLV0FMSwptZWNoYW5pc20gaW4gdGhlIGtlcm5lbCwgYXMgaXMgdGhlIGNh
c2Ugb24gQVJNIDMyLWJpdCBmb3IgZXhhbXBsZS4KClRoZXJlZm9yZSwgbGV0J3MgZW5hYmxlIENP
TkZJR19GVFJBQ0Ugd2hlbiBidWlsZGluZyBsdHRuZy1tb2R1bGVzLgoKQ2M6IENsw6ltZW50IEzD
qWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KUmVwb3J0ZWQtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL2x0dG5n
LW1vZHVsZXMvbHR0bmctbW9kdWxlcy5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMu
bWsgYi9wYWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5tawppbmRleCBkNTI3YmMx
OWVmLi45N2NkYTUzZjA4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmct
bW9kdWxlcy5taworKysgYi9wYWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5tawpA
QCAtMTQsNiArMTQsNyBAQCBMVFROR19NT0RVTEVTX01PRFVMRV9NQUtFX09QVFMgPSBDT05GSUdf
TFRUTkc9bSBDT05GSUdfTFRUTkdfQ0xPQ0tfUExVR0lOX1RFU1Q9bQogCiBkZWZpbmUgTFRUTkdf
TU9EVUxFU19MSU5VWF9DT05GSUdfRklYVVBTCiAJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxD
T05GSUdfS1BST0JFUykKKwkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19GVFJBQ0Up
CiBlbmRlZgogCiAkKGV2YWwgJChrZXJuZWwtbW9kdWxlKSkKLS0gCjIuMzcuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
