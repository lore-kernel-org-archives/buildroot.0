Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDD3C04FE2
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 611A1418F7;
	Wed,  9 Aug 2023 17:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 611A1418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CA-k1Cm1TOhU; Wed,  9 Aug 2023 17:15:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32DBB418EF;
	Wed,  9 Aug 2023 17:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32DBB418EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3101BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 638454076E
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 638454076E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2VLDYVMU0M2 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:15:18 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B146740761
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B146740761
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id C7EEF40F55
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 19:15:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJ2ZC1TfbnNy for <buildroot@buildroot.org>;
 Wed,  9 Aug 2023 19:15:12 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by mx.kolabnow.com (Postfix) with ESMTPS id 944FB40EB9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 19:15:12 +0200 (CEST)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id 31531719;
 Wed,  9 Aug 2023 19:15:12 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:15:00 +0200
Message-Id: <20230809171501.1329182-2-zgyarmati@zgyarmati.de>
In-Reply-To: <20230809171501.1329182-1-zgyarmati@zgyarmati.de>
References: <20230809171501.1329182-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received
 :received:received; s=dkim20160331; t=1691601312; x=1693415713;
 bh=uLGg0vOqbRKdOcxHu3FoeWA5/SmbJQohmjvvXRNki3Q=; b=mbGMiO5TMuQA
 GsygXFRNgIVJWW1FL645eKoYCk6b66hLl2+Iy70snM53M/tFpwSmmiLoB1OSRcdI
 AgWLx6HhQMvYkKPx9Dnw9jwLXK9fOvUZpVRS32uASs0+q66otKFyKdZ1++L9Xb9t
 U4VW5npRNCxp2SjSF4tA11Nr4pd8YWDccYchy5gtnHwLIpw9freXpKI8exwAoDRe
 VrLeR9KbpXl8XYUV/OKtN/uA4L1HEga8eeig5ekaJ7uPF2wfdiwwiCbULBRbY83k
 KHG4lNL0ujLxEnbghDDbGg2XTGedZnktoJ101EQyoXPYSiDVXcLt6RBcsir7Z6CZ
 NNqmpMKl449wXY/iL4hGUdCD6VzxyorLV6tW3wkCtoC0OdmI5uawpIZQc+U3YwED
 ZFonrprO80LNLqwc/zY8Y0TlkWUnIisS6/qF+KdE3PxNth320cmNB6s66JKRwEGO
 MAINuLReZR3E8ueSSYUw3S5Kza7pcHbGzkZg6XkFP2bgtaKdhMHuE5mHf8YCMCPA
 snrud4Q3q0tMH1EGGoxUIU+9i+ImtfRD6PqrSrhEX2AdfRQmyDEym9k2fRBHTg+a
 duzxhaLjts2QAigKCh058iAe4JeH2enwbcN1GX4E1zFuCxZaIEMsMWipUsmRHpVu
 jqy6mRYqo1g6Oc9oiyOAtgJ+GK1kNKA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=mbGMiO5T
X-Mailman-Original-Authentication-Results: ext-mx-out003.mykolab.com
 (amavisd-new); 
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH v1 1/2] package/qt6/qt6core5compat: add new
 package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6core5compat/Config.in          | 12 ++++++
 .../qt6/qt6core5compat/qt6core5compat.hash    | 10 +++++
 package/qt6/qt6core5compat/qt6core5compat.mk  | 39 +++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/qt6/qt6core5compat/Config.in
 create mode 100644 package/qt6/qt6core5compat/qt6core5compat.hash
 create mode 100644 package/qt6/qt6core5compat/qt6core5compat.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 3788caa6a3..126bc22180 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -47,5 +47,6 @@ source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6core5compat/Config.in"
 
 endif
diff --git a/package/qt6/qt6core5compat/Config.in b/package/qt6/qt6core5compat/Config.in
new file mode 100644
index 0000000000..484aaa72c5
--- /dev/null
+++ b/package/qt6/qt6core5compat/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QT6CORE5COMPAT
+	bool "qt6core5compat"
+	select BR2_PACKAGE_QT6BASE_XML
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt 5 Core Compat module contains the Qt 5 Core APIs 
+	  that were removed in Qt 6. The module facilitates the 
+	  transition to Qt 6.
+
+	  https://doc.qt.io/qt-6/qtcore5-index.html
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
new file mode 100644
index 0000000000..0735df3af2
--- /dev/null
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
+sha256  d4b249abb823d575eee9045c24d924ba8d1276e6be7735b287689991d998aa7a  qt5compat-everywhere-src-6.4.3.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.mk b/package/qt6/qt6core5compat/qt6core5compat.mk
new file mode 100644
index 0000000000..0b6d9369cb
--- /dev/null
+++ b/package/qt6/qt6core5compat/qt6core5compat.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# qt6core5compat
+#
+################################################################################
+
+QT6CORE5COMPAT_VERSION = $(QT6_VERSION)
+QT6CORE5COMPAT_SITE = $(QT6_SITE)
+QT6CORE5COMPAT_SOURCE = qt5compat-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CORE5COMPAT_VERSION).tar.xz
+QT6CORE5COMPAT_INSTALL_STAGING = YES
+QT6CORE5COMPAT_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6CORE5COMPAT_CMAKE_BACKEND = ninja
+
+QT6CORE5COMPAT_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0 with exception (tools), \
+	GFDL-1.3 (docs), \
+	BSD-3-Clause
+
+QT6CORE5COMPAT_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6CORE5COMPAT_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6CORE5COMPAT_DEPENDENCIES = \
+	host-pkgconf \
+	qt6base
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
