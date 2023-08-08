Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B50EC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 14:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9FB861135;
	Tue,  8 Aug 2023 14:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9FB861135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kL79bq3kuulG; Tue,  8 Aug 2023 14:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED006112D;
	Tue,  8 Aug 2023 14:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED006112D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EEF01BF398
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 14:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46D00416A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 14:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46D00416A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnpX9T64cj9j for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 14:36:25 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7F2D41690
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 14:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7F2D41690
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 5E2ECCF919
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 14:24:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1F9621BF204;
 Tue,  8 Aug 2023 14:24:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 16:24:27 +0200
Message-Id: <20230808142427.290337-1-clement.ramirez@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: clement.ramirez@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691504691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SilQnnJIe9LJjVW9COYKKKaEzDvHxdKjlVpMfb3joWk=;
 b=IaPwNOKMqQKKzbpC/vTr1qUCnkgEuuF8UCd1bELV6g5Zci97a0L+dFU7R0nlwRaZSsjSgV
 mfTd8hU7kGZDEbxi5cFP0Vb62UEOLJx+u69UAWAGEw4HvWCjsd0C+57Epa05uxC+8Amahj
 dlbwiNnn4Gv28L7aamnQQTAEYRMV2wQDYpHH+T/8JDavlmuG+Qewgicf0arQtWCtPluyW3
 ENKgG6JpniLIm0LjBe1XINpyNkX++sKvokfwYwArXjBg3GfROsIrG08YJHUGvJ1E+iYTHj
 xB8+BuauTw9STKsECnYVEuhh2purxC9S3WKaKgLUpttehX+7jHu5jRDTCfCqDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IaPwNOKM
Subject: [Buildroot] [PATCH 1/1] package/aubio: add AUBIO_CPE_ID_VENDOR
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
From: =?utf-8?q?Cl=C3=A9ment_Ramirez_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Y3BlOjIuMzphOmF1YmlvOmF1YmlvIGlzIGEgdmFsaWQgaWRlbnRpZmllciBmb3IKdGhpcyBwYWNr
YWdlOgpodHRwczovL252ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUvc2VhcmNoL3Jlc3VsdHM/bmFt
aW5nRm9ybWF0PTIuMyZrZXl3b3JkPWF1YmlvCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBSYW1p
cmV6IDxjbGVtZW50LnJhbWlyZXpAYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9hdWJpby9hdWJp
by5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9hdWJpby9hdWJpby5tayBiL3BhY2thZ2UvYXViaW8vYXViaW8ubWsKaW5kZXggNjQx
NzRhMTEzZC4uYmZjNjI3ZmE5MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9hdWJpby9hdWJpby5tawor
KysgYi9wYWNrYWdlL2F1YmlvL2F1YmlvLm1rCkBAIC05LDYgKzksNyBAQCBBVUJJT19TSVRFID0g
aHR0cHM6Ly9hdWJpby5vcmcvcHViCiBBVUJJT19TT1VSQ0UgPSBhdWJpby0kKEFVQklPX1ZFUlNJ
T04pLnRhci5iejIKIEFVQklPX0xJQ0VOU0UgPSBHUEwtMy4wKwogQVVCSU9fTElDRU5TRV9GSUxF
UyA9IENPUFlJTkcKK0FVQklPX0NQRV9JRF9WRU5ET1IgPSBhdWJpbwogQVVCSU9fSU5TVEFMTF9T
VEFHSU5HID0gWUVTCiAKIEFVQklPX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZgotLSAKMi4z
NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
