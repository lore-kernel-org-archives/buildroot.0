Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D17C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F21D83155;
	Wed,  9 Feb 2022 21:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4w-2VA5n2rJ; Wed,  9 Feb 2022 21:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4ED1813C5;
	Wed,  9 Feb 2022 21:35:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 162351BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3221083192
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTmXtdQ9DwJZ for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7276083163
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 87CDF8323C; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:07:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 246077a8890c96283419f93d7df4ca85f190b2c0
X-Git-Newrev: cf47c53f80a6ab82971b70b5475ecc26beffeef7
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.87CDF8323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-python: drop python2 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf47c53f80a6ab82971b70b5475ecc26beffeef7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dbus-python/Config.in      |  8 +++-----
 package/dbus-python/dbus-python.mk | 28 ++++------------------------
 2 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index 4bfb59ed91..76453e168a 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -3,16 +3,14 @@ config BR2_PACKAGE_DBUS_PYTHON
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_PACKAGE_DBUS
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_LIBGLIB2
-	# pyexpat: runtime dependency only
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  Python bindings for D-Bus
 
 	  http://dbus.freedesktop.org/doc/dbus-python/
 
 comment "dbus-python needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_DBUS && (BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
+	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON3
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 3e28aed25c..d9bb30ed67 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -9,40 +9,20 @@ DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT (dbus-python), AFL-2.1 or GPL-2.0+ (dbus-gmain)
 DBUS_PYTHON_LICENSE_FILES = COPYING dbus-gmain/COPYING
-DBUS_PYTHON_DEPENDENCIES = dbus libglib2
-HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus host-libglib2
+DBUS_PYTHON_DEPENDENCIES = dbus libglib2 python3 host-python3
+HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus host-libglib2 host-python3
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-DBUS_PYTHON_DEPENDENCIES += python host-python
-
-DBUS_PYTHON_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/bin/python2 \
-	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
-	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`"
-
-HOST_DBUS_PYTHON_DEPENDENCIES += host-python
-
-HOST_DBUS_PYTHON_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/bin/python2 \
-	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python2-config --includes`" \
-	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python2-config --ldflags`"
-else
-DBUS_PYTHON_DEPENDENCIES += python3 host-python3
-
-DBUS_PYTHON_CONF_ENV += \
+DBUS_PYTHON_CONF_ENV = \
 	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
 	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`"
 
-HOST_DBUS_PYTHON_DEPENDENCIES += host-python3
-
-HOST_DBUS_PYTHON_CONF_ENV += \
+HOST_DBUS_PYTHON_CONF_ENV = \
 	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags`" \
 	PYTHON_EXTRA_LIBS="`$(HOST_DIR)/usr/bin/python3-config --libs --embed`"
-endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
