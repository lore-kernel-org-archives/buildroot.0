Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95114C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A617424A1;
	Tue,  7 Jun 2022 14:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HceS5-9vfcw7; Tue,  7 Jun 2022 14:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B0AE42490;
	Tue,  7 Jun 2022 14:10:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0C151BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACED642490
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XX7ydARj3nqL for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:10:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.24])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BB794248F
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1654611039;
 s=strato-dkim-0002; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=2icOIWHcxDusK/dClQ2RhoToqCE5BNIl86pPPzS8Y1c=;
 b=krRXgww/xH+Txb+SayR9PiIn5/yYUqtj9ajFKaPtu1MhQsoT5+/juj9gVo5mj7zSnF
 JHk1mylwk8Q5UEx/0UXmFPl4f2iAA8EF95bSQMTY0UkmI2EngpBpSfB1t8Rz4Q3e76Jr
 eaz6EdZkVmj1KTMYTTKlSv593Xr0lUijTArwymelzttpTjtHWB8+6wJGOvKGyE2FJj2h
 utyTPF3/XKJk8SMdBktProIo8p8W02VmqCF+VhmtXwFDRkGfAVN+tBdK+2GdRMiZ19oI
 ceZ4vzwWTokpvcCYBxrrEaQ1/lR3X1WN9jeSptcW78nVustikVmdUHn6sbTzrw7GMdaK
 9Ycw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOK7nWzzuvt/yikxt/E0="
X-RZG-CLASS-ID: mo00
Received: from tesla.fritz.box by smtp.strato.de (RZmta 47.45.0 DYNA|AUTH)
 with ESMTPSA id Q06403y57EAdDvN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Tue, 7 Jun 2022 16:10:39 +0200 (CEST)
From: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 16:10:36 +0200
Message-Id: <20220607141036.246843-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openal: bump to version 1.22.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgotLS0KIHBhY2th
Z2Uvb3BlbmFsL29wZW5hbC5oYXNoIHwgMiArLQogcGFja2FnZS9vcGVuYWwvb3BlbmFsLm1rICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5hbC9vcGVuYWwuaGFzaCBiL3BhY2thZ2Uvb3BlbmFs
L29wZW5hbC5oYXNoCmluZGV4IDNmMWE1NzRlM2UuLmVhZTc4YjA1ODIgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2Uvb3BlbmFsL29wZW5hbC5oYXNoCisrKyBiL3BhY2thZ2Uvb3BlbmFsL29wZW5hbC5oYXNo
CkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgOGFjMTdlNGUz
YjMyYzFhZjNkNTUwOGFjZmZmYjgzODY0MDY2OWI0Mjc0NjA2Yjc4OTJhYTc5NmNhOWQ3NDY3ZiAg
b3BlbmFsLTEuMjEuMS50YXIuZ3oKK3NoYTI1NiAgODE0ODMxYTgwMTNkNzM2NWRmZDE5MTdiMjdm
MWZiNmU3MjNmM2JlM2ZlMWM2YTdmZjQ1MTY0MjVkODM5MmY2OCAgb3BlbmFsLTEuMjIuMC50YXIu
Z3oKIHNoYTI1NiAgZDgwOGNlMjE3ZTViNjExODU0ZGE2MjJiNTdlYzI5ZmU1NDU1ODRjNDhiYzUz
NTJmYWU3MmE0YjZlNTA3NGExNSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuYWwv
b3BlbmFsLm1rIGIvcGFja2FnZS9vcGVuYWwvb3BlbmFsLm1rCmluZGV4IGE4NzhlNDg0N2YuLjNk
NjI0MTM5YzIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3BlbmFsL29wZW5hbC5taworKysgYi9wYWNr
YWdlL29wZW5hbC9vcGVuYWwubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwogCi1PUEVOQUxfVkVSU0lPTiA9IDEuMjEuMQorT1BFTkFMX1ZFUlNJT04gPSAxLjIy
LjAKIE9QRU5BTF9TSVRFID0gJChjYWxsIGdpdGh1YixrY2F0LG9wZW5hbC1zb2Z0LCQoT1BFTkFM
X1ZFUlNJT04pKQogT1BFTkFMX0xJQ0VOU0UgPSBMR1BMLTIuMCsKIE9QRU5BTF9MSUNFTlNFX0ZJ
TEVTID0gQ09QWUlORwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
