Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06532C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 20:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EEC4610B4;
	Wed, 28 Sep 2022 20:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EEC4610B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPB_7P8CUcND; Wed, 28 Sep 2022 20:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6853610CB;
	Wed, 28 Sep 2022 20:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6853610CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92DAF1BF2F8
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 20:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C8FF418C9
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 20:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C8FF418C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjR8yK964gup for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 20:24:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2FBB418AF
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2FBB418AF
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 20:24:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ddbaoJcSLRFZ1ddbao845Y; Wed, 28 Sep 2022 22:24:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 22:24:29 +0200
Message-Id: <20220928202429.461673-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDo7UWNeNppeshIQ6JhqZbHitluNt9K1mQgomy/z+XHAOHL4iYwsgg/Hq3ATxZze03URTGi4AScJnq4frnyoK0cOva8atirXim5I21u/cEZSLGQkPOHJ
 YBiHNEb6DQZ6HtoyIbEX/If3O04LhxG8xjD3BU0TFfhqHOKvESOT1ipJ5V1KX+IaQEGrvEzmXt1zd+8VXW2dzhXoQZeBXYy4AQ/UvRYOo+12lgs02Ws6b0SB
 s+0EY/1flgiqIMxd+9x0xFF54D1MJwUGwBa+sTWubFRQHMi8zLgSXbZexzhsHeOSDmevcPJe+h3pYZU0ZNdi+Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664396672; bh=vyt7ysBQVXuNQnGpantIvkbDCg86frf93nA4aTG46ao=;
 h=From:To:Subject:Date:MIME-Version;
 b=mmdOl9QKbmi05jtfTCAbWNHNYZmcX5fW/uwIXKtgmg5Vu7qDRxqoy5TmAhh9pRWGW
 5Ows1onVc2iufPz4rr+pdnlaVTkTwuc0Ef1IPxkO5H8gDZnS8GJWHFvSUve4vOOqMr
 yVFV5r9y63PIh5rLXZ47pBbwgqhL4b+06GZB6bJmLLw/ac8HJ1mfJppHvP55T78K4s
 sh9+s+24HxQNzkdOoOkz/tJSTVEmoBYu4QBBVpBhxlyvMb0HMMfrVIJcHJ1IIhsIsm
 TR9DAbFzcMGCsNMUOLL0S4+DwF9QwL1nDeFPFnAoa/TlTYChh2z4XMDmLe8BahUWMv
 TzgMZIRI2Fphg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=mmdOl9QK
Subject: [Buildroot] [PATCH] package/qt5: fix build failure due to libressl
 use
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
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qt5 only supports openssl, check [0] and [1]. So in qt5base.mk let's check
if BR2_PACKAGE_LIBOPENSSL is enabled instead of BR2_PACKAGE_OPENSSL(that
could be openssl or libressl) and for qt5enginio and qt5webkit let's select
specifically BR2_PACKAGE_LIBOPENSSL instead of only BR2_PACKAGE_OPENSSL.
This way we make sure that only openssl is selected and not libressl or
other future openssl-like implementations.

Fixes:
http://autobuild.buildroot.net/results/a956b48b782dbaa055d7146360465e2493a809d9/

[0]: https://doc.qt.io/qt-5/ssl.html#enabling-and-disabling-ssl-support
[1]: https://bugreports.qt.io/browse/QTBUG-68374

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
index b738f0db7c..d421972392 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL # Only openssl is supported by qt5
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	help
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 26c3897d1d..035e8b19b8 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_LEVELDB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL # Only openssl is supported by qt5
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
