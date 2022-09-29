Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0615EC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 10:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E93183689;
	Thu, 29 Sep 2022 10:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E93183689
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xncxn8XWGhGB; Thu, 29 Sep 2022 10:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7577832D9;
	Thu, 29 Sep 2022 10:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7577832D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7D581BF5A2
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 10:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE8FF419F6
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 10:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE8FF419F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59YqiTLbC-9d for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 10:46:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E17D419DE
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E17D419DE
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 10:46:52 +0000 (UTC)
Received: from localhost.localdomain ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dr46onOUNeEtAdr46oe4aq; Thu, 29 Sep 2022 12:46:51 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 12:46:48 +0200
Message-Id: <20220929104648.324977-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928205527.GH1419013@scaer>
References: <20220928205527.GH1419013@scaer>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMDqaZSGHZGzs9/JRsl3KNvAIQLN1IrLmiCpMtxgssnakR+0B4l65vU0IpiLCDdlF5xRFitmRQ3yN9MFRc3yQMn+xEC3lmk2cNHTrtk6uTfWTW/YjEFc
 nlk9MvtDonakkn4imOyYQ3btsdCHlKVuxfoWvBfTmeDytjxonIQcyDElhpE6glkwW6x+Gzo0+iBtF+FmB99++rT+7IaSryZ6tJAHs11HlekY0NtxBrHp4MRj
 5Ei5QAUEHCpBYwLTQWhFLhqEvYk08+7EqG8Y9US5BqaiKse9uX7kYoDcBVDSRavjK5g3hZyH39mrmg+dlW+/rU7U69FzYlGhdt/YbZexkseCVc7vMsoGnfQq
 W3hDC2nq
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664448411; bh=SdI+Q1xyR7fgI1Dlar2uXMwoS4ThQFsciFylDq8iIoQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=YItLZ0RU8DGstyU+fMmpaQB/JCU4uLCdB97H3GaVmL0GTZmiYuQeXOzbavdSdJ/iN
 ZZgIfoBE4DLduD57lNmKxNY7gn4Vlv1E1plDMKonESBo8M+cTJx4qOGIYMV3xMZrAS
 mblNqPl0x3byvNKUd621//5fCl/bIAkgko3ohHgYw5JrTXsJfc8rENvIlao35SOM+e
 Jex0g/OKuyaZUoD3RfNdI6kJUOJYDKzsB9QkyCzFsV8/eUlHzX6t1FofxkIKwVSFhA
 M7eTjLgtwCJj8hoqKFkQhhZZIX3Bb0iqpNo/2xXEu4w4ngPXAqTKmdvUZzY02cZLm9
 53a39Ljy7ZXxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YItLZ0RU
Subject: [Buildroot] [PATCH v2] package/qt5: fix build failure due to
 libressl use
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qt5 only supports openssl, check [0] and [1]. So in qt5base.mk let's check
if BR2_PACKAGE_LIBOPENSSL is enabled instead of BR2_PACKAGE_OPENSSL(that
could be openssl or libressl) and for qt5enginio and qt5webkit let's select
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL instead of only BR2_PACKAGE_OPENSSL.
This way we make sure that only openssl is selected and not libressl or
other future openssl-like implementations.

Fixes:
http://autobuild.buildroot.net/results/a956b48b782dbaa055d7146360465e2493a809d9/

[0]: https://doc.qt.io/qt-5/ssl.html#enabling-and-disabling-ssl-support
[1]: https://bugreports.qt.io/browse/QTBUG-68374

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL instead of BR2_PACKAGE_LIBOPENSSL
---
 package/qt5/qt5base/qt5base.mk   | 4 ++--
 package/qt5/qt5enginio/Config.in | 1 +
 package/qt5/qt5webkit/Config.in  | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a81892422c..efa0e16e9a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -229,8 +229,8 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBOPENSSL),-openssl,-no-openssl)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBOPENSSL),openssl)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index b738f0db7c..f758548eb5 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # Only openssl is supported by qt5
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	help
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 26c3897d1d..e52374550c 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_LEVELDB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # Only openssl is supported by qt5
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
