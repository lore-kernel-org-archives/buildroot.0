Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8384BC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 19:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3133F4296F;
	Thu,  6 Jan 2022 19:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qCy8yBhGLmhZ; Thu,  6 Jan 2022 19:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 939BB4293C;
	Thu,  6 Jan 2022 19:14:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8151BF409
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A0E0832E7
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PyYdn01mz-9U for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 19:14:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 813FC818C2
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 19:14:38 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5YDcnT2bkcwd95YDdnyE6T; Thu, 06 Jan 2022 20:14:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641496477; bh=IxL9Mv13ya9PEFuTcqSvrBtIn8nrXojn/+RhoMoXlWc=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=LIVHxT8TFYYwyz8LYitINfxQ0xFg4I9w0rq/3h4/oHAzxGG34nVPEshMnSkzoIGD7
 nbs/JzMKyACoBR7qsmG2Xc/oIl8TZniRCdm4KU0V1yd+H/ty7JK8mRrCwckiySDDB/
 A8CtkpoAf2bj/09HkDIPgjJo9Jzd9WXj9Cw+IIuPZ+gmM/YalmNd4RS4TxpnP8Hf6K
 dJ1Rk5F8nS5+ANX6lmBR8PYQi3A2/bbfIL0IQdIq5h3DDCTLMHrsHxvDhzrKo//246
 W0gOiZ5gXsEs5eA1smD+//XrGlBgxQqcju3db80T3FTQ1iREGqJsfN7qMj6xCjdm48
 CLOz/bWFF9B3A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 20:14:35 +0100
Message-Id: <20220106191435.147543-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCAtPdWnEALxKo5+wl3DMZHmIizrz52z6IXs0l5it1ydRo7gf2TTJ0QLMYY+4+CSmfXoR6WBBlnh1YG31Gdp2n3D6hVIfO5ihExwJFhCHeshjyuqRjgY
 SFztUcZD3vlC4ZeI0yE43xfDKseJYSbzskk8/SoB5UCFr5YmLr6uT58euCxrZf9N7s38qWBbnlZIq/Mb3sEvtoI4ockv5kjJKv/FHy8rA6TLTWVDmtpT0ToY
 Rc5QQXunhr28gJeaVUssc/Hrf2xDPaqJYfrqqSGeJ3U=
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_DEVELOPERS=3A_remove_qt5webkit?=
 =?utf-8?q?-examples_entry_from_Ga=C3=ABl_Portay?=
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjYXVzZXMgd2FybmluZyBvbiAuL3V0aWxzL2dldC1kZXZlbG9wZXJzOgpXQVJOSU5HOiAn
cGFja2FnZS9xdDUvcXQ1d2Via2l0LWV4YW1wbGVzLycgZG9lc24ndCBtYXRjaCBhbnkgZmlsZQpi
ZWNhdXNlICdwYWNrYWdlL3F0NS9xdDV3ZWJraXQtZXhhbXBsZXMvJyBoYXMgYmVlbiByZW1vdmVk
LCBzbyBsZXQncyByZW1vdmUKaXRzIGVudHJ5IGluIHRoaXMgZmlsZS4KClNpZ25lZC1vZmYtYnk6
IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgot
LS0KIERFVkVMT1BFUlMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggM2Q1YzAxZjc5NS4uNjMwMTk2
ZmQ1NCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMDIxLDcg
KzEwMjEsNiBAQCBOOglHYcOrbCBQb3J0YXkgPGdhZWwucG9ydGF5QGNvbGxhYm9yYS5jb20+CiBG
OglwYWNrYWdlL3F0NS9xdDV2aXJ0dWFsa2V5Ym9hcmQvCiBGOglwYWNrYWdlL3F0NS9xdDV3ZWJl
bmdpbmUvCiBGOglwYWNrYWdlL3F0NS9xdDV3ZWJraXQvCi1GOglwYWNrYWdlL3F0NS9xdDV3ZWJr
aXQtZXhhbXBsZXMvCiAKIE46CUdhbyBYaWFuZyA8aHNpYW5na2FvQGFvbC5jb20+CiBGOglwYWNr
YWdlL2Vyb2ZzLXV0aWxzLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
