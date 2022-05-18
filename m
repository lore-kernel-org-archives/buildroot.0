Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2714C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 21:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A57584366;
	Wed, 18 May 2022 21:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNMKZGzmH9-E; Wed, 18 May 2022 21:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C2F1842CD;
	Wed, 18 May 2022 21:40:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE1CA1BF380
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4A941CD7
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=esdemc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ngko34sNQKB for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 21:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 489D141CCF
 for <buildroot@buildroot.org>; Wed, 18 May 2022 21:40:43 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id hh4so3038063qtb.10
 for <buildroot@buildroot.org>; Wed, 18 May 2022 14:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=esdemc.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/4Ll2nQaU61xBAmG7at01bmp1w+IdMptuZ/kpz92Uw=;
 b=RqsZEaBrsDhVKOqbQk2sw5xsJ3UMqWtN69Xug8qST2KWbAVoedbv0guSPJWfwW9x4X
 N8L+VOzbY8YADl7DiH+VdORcWwhig/MhHDyxsd7RubJS6IPrAO1FDMvTTKzy9TOFpxzj
 AzKlTLMwMnYqKaNJFvXTckBLYPJXZEsljMpyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/4Ll2nQaU61xBAmG7at01bmp1w+IdMptuZ/kpz92Uw=;
 b=ImgMrRS8q4en/4AX3FLv/yrzheNDPtkSv7marH5e0GrKN4ZiVBZjMI/BNXfI07IfBr
 CJblcNxrLiRPBAmppsd0k/QKIfl+03/LRcrChAdNMOtI35eVrPpwMx0AZCyiM0nm9WO1
 4hukq7NKJNH49uBXYztcB1GlLcHrrMyUjDOM2335M/wD33lJ7Nja3HeZT2a1Wbft11YM
 4Ab+21PX2QF3NGAlubPlJgxueReCvbBkOjNyvWh3UI/XFNbt186hDH0v0HsQ8mcqY+qB
 n70yZnLKnB93BXtP0c3LVxUrYlI0Qq2PwpJhByLYnaEJylxyku36pdF03C8caBJWysRB
 mkFA==
X-Gm-Message-State: AOAM533RMWDMkPNOPCfL/mPUYXJdNcu9jkH0MVtY9xhQQIOWpx+tdgBz
 /ICIY9kigm2ogD3mPks+YRz0R4se/LNlEA==
X-Google-Smtp-Source: ABdhPJzdH7jb4gC4RlVFIDY3fZ3grBmKnBcU9HqreyO+7M3QP/y7NXPcdCAwDN9b06V/zBPsXKm4Zw==
X-Received: by 2002:ac8:5b87:0:b0:2f3:cef0:cd7d with SMTP id
 a7-20020ac85b87000000b002f3cef0cd7dmr1650722qta.428.1652910041842; 
 Wed, 18 May 2022 14:40:41 -0700 (PDT)
Received: from ESDEMC-D50.localdomain (216-229-79-152.fidnet.com.
 [216.229.79.152]) by smtp.gmail.com with ESMTPSA id
 f71-20020a379c4a000000b0069fc13ce20esm213544qke.63.2022.05.18.14.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 14:40:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 16:39:32 -0500
Message-Id: <20220518213933.2475-1-adamg@esdemc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] add package/python-pyqtchart
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
From: Adam Gausmann via buildroot <buildroot@buildroot.org>
Reply-To: Adam Gausmann <adamg@esdemc.com>
Cc: =?UTF-8?q?Manuel=20V=C3=B6gele?= <develop@manuel-voegele.de>,
 Adam Gausmann <adamg@esdemc.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Gausmann <adamg@esdemc.com>
---
Changes v1 -> v2:
 - python-pyqtchart/Config.in: Fix typo in package description (thanks Yegor)
 - python-pyqtchart.mk: Remove unnecessary python2 compat (thanks Yegor)
 - python-pyqtchart.mk: Add qt5charts as a dependency
 - Add myself to DEVELOPERS

 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 .../0005-configure-emit-sip-flags.patch       | 25 ++++++++++++
 package/python-pyqt5/python-pyqt5.mk          |  2 +-
 package/python-pyqtchart/Config.in            |  8 ++++
 .../python-pyqtchart/python-pyqtchart.hash    |  5 +++
 package/python-pyqtchart/python-pyqtchart.mk  | 40 +++++++++++++++++++
 7 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 package/python-pyqt5/0005-configure-emit-sip-flags.patch
 create mode 100644 package/python-pyqtchart/Config.in
 create mode 100644 package/python-pyqtchart/python-pyqtchart.hash
 create mode 100644 package/python-pyqtchart/python-pyqtchart.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ffb55dee8e..af8f9e42a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -26,6 +26,9 @@
 #   infrastructure, and will be CC'ed on all patches that add or
 #   modify packages that use this infrastructure.
 
+N:	Adam Gausmann <adamg@esdemc.com>
+F:	package/python-pyqtchart/
+
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
 
diff --git a/package/Config.in b/package/Config.in
index 8892134133..b21b3dc5c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1176,6 +1176,7 @@ menu "External python modules"
 	source "package/python-pyphen/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
+	source "package/python-pyqtchart/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pysendfile/Config.in"
diff --git a/package/python-pyqt5/0005-configure-emit-sip-flags.patch b/package/python-pyqt5/0005-configure-emit-sip-flags.patch
new file mode 100644
index 0000000000..ad524f1e53
--- /dev/null
+++ b/package/python-pyqt5/0005-configure-emit-sip-flags.patch
@@ -0,0 +1,25 @@
+configure.py: emit sip_flags
+
+Other PyQt packages (e.g. PyQtChart) obtain their sip_flags from PyQt5. The
+default mechanism is for PyQt5 to embed it in the QtCore package and the other
+packages will try to import PyQt5.QtCore and read it; however, because this is
+not a host package, it cannot be imported during configuration.
+
+Another option is to provide those flags as a command-line option to the other
+packages' configure.py scripts. So, this patch emits the sip_flags generated by
+PyQt5 to a file which will be installed in staging dir for the other packages
+to read.
+
+Signed-off-by: Adam Gausmann <adamg@esdemc.com>
+
+--- a/configure.py	2022-05-12 14:45:48.624851781 -0500
++++ b/configure.py	2022-05-12 14:44:24.704852510 -0500
+@@ -1450,6 +1450,8 @@ def generate_makefiles(target_config, ve
+ 
+     # Set the SIP platform, version and feature flags.
+     sip_flags = get_sip_flags(target_config)
++    with open('sip_flags', 'w+') as f:
++        f.write(sip_flags)
+ 
+     # Go through the modules.
+     pyqt_modules = list(target_config.pyqt_modules)
diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index af32f63796..2698a1e0ad 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -157,7 +157,6 @@ PYTHON_PYQT5_CONF_OPTS = \
 	-w --confirm-license \
 	--no-designer-plugin \
 	--no-docstrings \
-	--no-sip-files \
 	$(foreach module,$(PYTHON_PYQT5_MODULES),--enable=$(module))
 
 define PYTHON_PYQT5_CONFIGURE_CMDS
@@ -180,6 +179,7 @@ define PYTHON_PYQT5_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
 	touch $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/__init__.py
 	$(RM) -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/uic/port_v2
+	install -D $(@D)/sip_flags $(STAGING_DIR)/usr/share/PyQt5/sip_flags
 endef
 
 $(eval $(generic-package))
diff --git a/package/python-pyqtchart/Config.in b/package/python-pyqtchart/Config.in
new file mode 100644
index 0000000000..a985927db7
--- /dev/null
+++ b/package/python-pyqtchart/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYQTCHART
+	bool "python-pyqtchart"
+	depends on BR2_PACKAGE_PYTHON_PYQT5
+	select BR2_PACKAGE_QT5CHARTS
+	help
+	  Python bindings for Qt Charts.
+
+	  http://www.riverbankcomputing.com/software/pyqt/
diff --git a/package/python-pyqtchart/python-pyqtchart.hash b/package/python-pyqtchart/python-pyqtchart.hash
new file mode 100644
index 0000000000..79852741da
--- /dev/null
+++ b/package/python-pyqtchart/python-pyqtchart.hash
@@ -0,0 +1,5 @@
+# Locally-computed:
+sha256	91c9c6857e8c8891faa3875e3714392150016f365a63cdff8bfd40b6c33ea277  PyQtChart_gpl-5.7.tar.gz
+
+# Hash for license file
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/python-pyqtchart/python-pyqtchart.mk b/package/python-pyqtchart/python-pyqtchart.mk
new file mode 100644
index 0000000000..56bbc5d643
--- /dev/null
+++ b/package/python-pyqtchart/python-pyqtchart.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# python-pyqtchart
+#
+################################################################################
+
+PYTHON_PYQTCHART_VERSION = 5.7
+PYTHON_PYQTCHART_SOURCE = PyQtChart_gpl-$(PYTHON_PYQTCHART_VERSION).tar.gz
+PYTHON_PYQTCHART_SITE = http://downloads.sourceforge.net/project/pyqt/PyQtChart/PyQtChart-$(PYTHON_PYQTCHART_VERSION)
+PYTHON_PYQTCHART_LICENSE = GPL-3.0
+
+PYTHON_PYQTCHART_DEPENDENCIES = python-pyqt5 qt5charts
+
+PYTHON_PYQTCHART_CONF_OPTS = \
+	--destdir $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5 \
+	--qmake $(HOST_DIR)/bin/qmake \
+	--sysroot $(STAGING_DIR)/usr \
+	--no-docstrings \
+	--no-sip-files \
+	--pyqt-sip-flags "$(file <$(STAGING_DIR)/usr/share/PyQt5/sip_flags)" \
+	--qtchart-version=2.0.1 \
+
+define PYTHON_PYQTCHART_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(HOST_DIR)/bin/python configure.py \
+			$(PYTHON_PYQTCHART_CONF_OPTS) \
+	)
+endef
+
+define PYTHON_PYQTCHART_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define PYTHON_PYQTCHART_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
