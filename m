Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364C0C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 08:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEBE960F6B;
	Wed, 16 Nov 2022 08:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEBE960F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OS2Vbwzbx_lI; Wed, 16 Nov 2022 08:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A0860F1C;
	Wed, 16 Nov 2022 08:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A0860F1C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27E661BF36A
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 08:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EB52401A1
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 08:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EB52401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLbyld9ab9G8 for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 08:43:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D9940137
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87D9940137
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 08:43:15 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 677F31BF207;
 Wed, 16 Nov 2022 08:43:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 09:43:13 +0100
Message-Id: <20221116084313.1068060-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668588193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mv9Hh/4znDp+gXFzoGdJJdgU+e+v5FraXtI9Akpg248=;
 b=fketOUmDpo3ThmaQ/bGKa7/H5sUbV3evkc5bThP3oOrXnhLjsL6fRcyHM0uERXzBk1Tzdd
 vXb/wTk2Di/yz9V6qGfLP78rTznR9+EjiR05mRsiSKHlsFVNIO9zv92GJpxgakcBGNlw5z
 qZWjwVOUtQUYd51HBhiAqP14ARoFtiFpp2BR8mUkIImTXj6CwVdBs1aReJNFM+5TJ10JEy
 bEQa4sKmG1DLKjjQWImuAXFcZWtUuAz1C1wSToMF11G2rb4uSy3srMsNNOwnOB+fWS/G8r
 i95Jgw/bkEKgpFZrGr5ywiUXW9rO3MUH42Px4vfd2ed6nobjDlXcNHE2/D+9pQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fketOUmD
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_package/mali-driver=3A_remove_?=
 =?utf-8?q?Miqu=C3=A8l_from_the_DEVELOPERS_list?=
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
From: Miquel Raynal via buildroot <buildroot@buildroot.org>
Reply-To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBhbSBub3QgcmVhbGx5IG1haW50YWluaW5nIHRoZXNlIHBhY2thZ2VzLCBJIGRvbid0IGZvbGxv
dyBjbG9zZWx5CmVub3VnaCBub3IgdXNlIHRoZW0gdG8gdGFrZSB0aGUgdGltZSB0byBtYWtlIHRo
ZSBuZWNlc3NhcnkgY2hhbmdlcy4KR2l1bGlvIGhhcyBiZWVuIG11Y2ggbW9yZSByZWFjdGl2ZSB0
aGFuIG1lIHRvIGZpeCBpc3N1ZXMgYW5kIGhlIGlzCmFscmVhZHkgbGlzdGVkIGZvciB0aGVtIGFu
eXdheS4KCkNjOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KLS0tCiBERVZFTE9QRVJTIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBhZjIx
YjhiZGQwLi41MWY3YjNiOGQ2IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BF
UlMKQEAgLTIxNTIsMTAgKzIxNTIsNiBAQCBGOgljb25maWdzL2JhbmFuYXBpX20yX3BsdXNfZGVm
Y29uZmlnCiBOOglNaWtoYWlsIEJvaWtvIDxtaWtoYWlsYm9pa284NUBnbWFpbC5jb20+CiBGOglw
YWNrYWdlL2xpYmZyaWJpZGkvCiAKLU46CU1pcXXDqGwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgotRjoJcGFja2FnZS9tYWxpLWRyaXZlci8KLUY6CXBhY2thZ2Uvcm9ja2NoaXAt
bWFsaS8KLQogTjoJTWlyY2VhIEdsaWdhIDxnbGlnYS5taXJjZWFAZ21haWwuY29tPgogRjoJcGFj
a2FnZS9tYnVmZmVyLwogCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
