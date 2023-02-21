Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C35BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 18:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB7060A88;
	Tue, 21 Feb 2023 18:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEB7060A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xoHtOv8x4PQe; Tue, 21 Feb 2023 18:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE1760A7D;
	Tue, 21 Feb 2023 18:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE1760A7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B46C11BF409
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 18:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B5C640179
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 18:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B5C640179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wM5E4lgZKmC for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 18:30:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F0C140158
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F0C140158
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 18:30:54 +0000 (UTC)
Received: from localhost.localdomain ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UXPgpHXhH4IFHUXPgpzQcQ; Tue, 21 Feb 2023 19:30:52 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 19:30:51 +0100
Message-Id: <20230221183051.4011311-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfC37JHTtnK7zMfn/48+HmfQrxDnN/VpTzGAoO/dFPsjy/sTzjLK5G+/fXr/OPgI33HGiSW/aWrqNqZvpY3WxoPfKZsA7cVbbAwp6V5d6kLknZdiCu0H1
 +s9q7odKULopO6HpqWIxfAKHBFmP0u1GIp2city+88ZnUY3eIokJ7Yni9L57E03d5zvTPPEnC3qBKfi3hNQGy+z9tVPFUTv9THWuDjRXEgjzWx0QpTLHuWBj
 G3PQH0QUTytmtBGMpeEHjPTtGMoyTJdtbtC6mzuxOvYoXF1EABAePI5UU69z3zRU
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677004252; bh=wDqO411vReip33/wSabgcOcsSqffiMjC7X7+SeJeZWs=;
 h=From:To:Subject:Date:MIME-Version;
 b=YyNckSAHbqQh9jsoBpCaTDIZ3vvCC1dcYEjTLNyr4eVlGIrcR0dIWlfVIgmSOJFP0
 IVX7AyWF/cdTmS6rJcoF2C2ugyRy90n8kKnfVQymcAseMtaGFgKS08zrAI86L028mI
 8VrI0UgUtkuwzUuF+665LgxWOmnkecqgpPo9VodCgeHA9HKQ+vc3OzxthteEM0vQnq
 YMuslYiJ4/tP1vd6iK9NHx05FJYLYRUtpzIzlKupWmnGSCC8C3fOhOODUXg90bFBjW
 qJVTRKYUk4Ryw/Gw0dWADpqng+6+GcYjvMrsHjYdPrAClbkdRfMcm5RC2d0GkqnH9U
 I7rSygmgxyUxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YyNckSAH
Subject: [Buildroot] [PATCH] package/jpeg: fix build failure when qt5base
 tries to use libjpeg
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qt5 fails to build with libjpeg since the API is different from
libjpeg-turbo and libjpeg-turbo is pointed as the library Qt5 usually link
against to[0]. So let's default jpeg variant to libjpeg-turbo if
BR2_PACKAGE_QT5BASE_JPEG is selected.

Fixes:
still not failed

[0]: https://doc.qt.io/qt-5/qtgui-index.html#licenses-and-attributions

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/jpeg/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 371f89aa49..3a39a0dfb8 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -16,7 +16,8 @@ if BR2_PACKAGE_JPEG
 
 choice
 	prompt "jpeg variant"
-	default BR2_PACKAGE_JPEG_TURBO if BR2_PACKAGE_JPEG_SIMD_SUPPORT
+	default BR2_PACKAGE_JPEG_TURBO if BR2_PACKAGE_JPEG_SIMD_SUPPORT || \
+					  BR2_PACKAGE_QT5BASE_JPEG
 	help
 	  Select the normal libjpeg or libjpeg-turbo.
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
