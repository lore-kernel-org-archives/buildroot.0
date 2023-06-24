Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2457BEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 09:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 951AC81F3B;
	Sat, 24 Jun 2023 09:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 951AC81F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKCi-ng1lFLV; Sat, 24 Jun 2023 09:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFA1881F2D;
	Sat, 24 Jun 2023 09:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFA1881F2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6958D1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 09:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E8F5415E7
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 09:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E8F5415E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTeZ72ETp8fH for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 09:06:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 665B9415E6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 665B9415E6
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 09:06:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 544A6A4C04E3;
 Sat, 24 Jun 2023 11:06:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59622)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qCzDc-0002d9-3B;
 Sat, 24 Jun 2023 11:06:09 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 11:06:08 +0200
Message-Id: <20230624090608.3221984-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687597569;
 bh=s/4L6nm52vLnWmievBB5ROiu21HhRea0eo1Io+ng5lI=;
 h=From:To:Cc:Subject:Date:From;
 b=sMNojJmQNvWdwegTsLvCIVix7vlHMOtU4FANsDScVXbimg4/5SxcHnTCFdKzYTs/Y
 ZUf53bYFj198dVMcnyXkDVkFm3REj+zo8G4rNN3mwj9ex8E8Ge7b+XOzLbJ1GYXSyQ
 YLHff+yZNdhbmBSqGhrEjOy4eWEoPQaNQ6Ufs9ogTuGJAdzCgcM6rP1I0Nfp2/fFeA
 OWZRe+fo6Z1s6BO+ps8R3wfk8SAbGc1Nt30GsMbUfWikHJbQir8WJ8dmKvw/5s/HyR
 getJ6N6DaAbdW0SMi4NBUCdm1M3w/8y6cz7/rxpoOTQi6BdMY1avokuqwINdO0c5XV
 AYD4RjwW8dNnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=sMNojJmQ
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/1=5D_DEVELOPERS=3A_remove_Jos?=
 =?utf-8?q?=C3=A9_Pekkarinen?=
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RS1tYWlscyBhcmUgYm91bmNpbmc6Cgo8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+OiBob3N0
IEFTUE1YLkwuR09PR0xFLmNvbVs3NC4xMjUuMTMzLjI2XSBzYWlkOgogICAgNTUwLTUuMS4xIFRo
ZSBlbWFpbCBhY2NvdW50IHRoYXQgeW91IHRyaWVkIHRvIHJlYWNoIGRvZXMgbm90IGV4aXN0LiBQ
bGVhc2UKICAgIHRyeSA1NTAtNS4xLjEgZG91YmxlLWNoZWNraW5nIHRoZSByZWNpcGllbnQncyBl
bWFpbCBhZGRyZXNzIGZvciB0eXBvcyBvcgogICAgNTUwLTUuMS4xIHVubmVjZXNzYXJ5IHNwYWNl
cy4gTGVhcm4gbW9yZSBhdCA1NTAgNS4xLjEKClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxi
ZXJuZEBrdWhscy5uZXQ+Ci0tLQogREVWRUxPUEVSUyB8IDEzIC0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVW
RUxPUEVSUwppbmRleCA5YjU5YmJjNTRiLi4wNWZmNGIzYjI2IDEwMDY0NAotLS0gYS9ERVZFTE9Q
RVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTE2MjAsMTkgKzE2MjAsNiBAQCBOOglKb3PDqSBMdWlz
IFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KIEY6CXBhY2thZ2Uv
emZzLwogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKIAotTjoJ
Sm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Ci1GOglwYWNrYWdl
L2FsZnJlZC8KLUY6CXBhY2thZ2UvYXZvY2Fkby8KLUY6CXBhY2thZ2UvYm14Ny8KLUY6CXBhY2th
Z2Uvb3BlbnNjLwotRjoJcGFja2FnZS9weXRob24tYWV4cGVjdC8KLUY6CXBhY2thZ2UvcHl0aG9u
LWFsZW1iaWMvCi1GOglwYWNrYWdlL3B5dGhvbi1sYXJrLwotRjoJcGFja2FnZS9zb2Z0aHNtMi8K
LUY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fYWV4cGVjdC5w
eQotRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9hdm9jYWRvLnB5Ci1GOglz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9hZXhwZWN0LnB5Ci0KIE46
CUpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KIEY6CXBhY2thZ2UvYXQtc3Bp
Mi1jb3JlLwogRjoJcGFja2FnZS9jbGFuZy8KLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
