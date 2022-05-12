Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7551AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B22B40399;
	Thu, 12 May 2022 20:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpMcHQzFOaSR; Thu, 12 May 2022 20:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CB6D40463;
	Thu, 12 May 2022 20:18:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 630D01BF398
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5910B60B22
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=esdemc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uU1yEJ2sjEfQ for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:18:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29DC1607D0
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:18:31 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id k2so5384486qtp.1
 for <buildroot@buildroot.org>; Thu, 12 May 2022 13:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=esdemc.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0Edn/dY8tm5NjD7weXO/5UyOa9kFoapKxbnlvbg0Nk=;
 b=apSGCdS6XwTOsYGn8MIR3d/X3Dsby+J2YzWyOwmjnwdeRJLhDsWcKKAW/U0Unxk5fd
 6+/Z7t6PTt/H92Uj1hOf+jIfOXHETIWV1itw3+2lBNg1eGovJnSYbYh4bsWIJwJ3D+NQ
 /OGVFsCBLGUo6cwlIC2fhNGzucoKzEAhVlaEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0Edn/dY8tm5NjD7weXO/5UyOa9kFoapKxbnlvbg0Nk=;
 b=rdwcQZEOvIJWYzvC+PTYTt8e0yphxTrmnVIpvM43XGHNzOpGuAQHyMK+Sn3XdSLQCT
 wgxHaKH+G74d8GduO2eck2owfonqm5v7ukcOUl48uw0RS4EXNCXqKecqnlFZaN88A/bJ
 M3hYX7hIfk8c0EVFbDfzH+cPHxYE9gsG6U8eBkD46xpt22fhOrhxyqfjB+E2FOIX6nZT
 VQx42U0RiKiAwL/q7eoJ0uHR4ELIj7dkJYaEkhXNDu2H6C+SPpLvXfg2GKpN/AQIgDxk
 2iEWqC/7VXlZmDxhhdCI7g/mHjEYpsxrFxc7mFzc8Rlb523G8BTA8PoaXq0fmBgroHe6
 /43Q==
X-Gm-Message-State: AOAM530CVffTbKhCJ6AjPaUwA4IalV9ezEdxJp//FlaJjeGc3EusrphU
 g7zIEBmyufhN0MXDqJEyozA79Ynn/ydiUA==
X-Google-Smtp-Source: ABdhPJzVzayABK5zmS5Nulxp0lyEN4GIFy0RsrX6yGZeRlt99/vBXsuNPzJV0pk1PlUlK1eLmRe1oA==
X-Received: by 2002:ac8:7fc2:0:b0:2f3:d47d:487c with SMTP id
 b2-20020ac87fc2000000b002f3d47d487cmr1545001qtk.157.1652386709686; 
 Thu, 12 May 2022 13:18:29 -0700 (PDT)
Received: from ESDEMC-D50.localdomain (216-229-79-152.fidnet.com.
 [216.229.79.152]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05620a401300b0069fc13ce1f2sm323377qko.35.2022.05.12.13.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 13:18:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 15:18:20 -0500
Message-Id: <20220512201820.13611-1-adamg@esdemc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] add package/python-pyqtchart
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
 package/Config.in                             |  1 +
 .../0005-configure-emit-sip-flags.patch       | 25 ++++++++++
 package/python-pyqt5/python-pyqt5.mk          |  2 +-
 package/python-pyqtchart/Config.in            |  8 ++++
 .../python-pyqtchart/python-pyqtchart.hash    |  5 ++
 package/python-pyqtchart/python-pyqtchart.mk  | 48 +++++++++++++++++++
 6 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 package/python-pyqt5/0005-configure-emit-sip-flags.patch
 create mode 100644 package/python-pyqtchart/Config.in
 create mode 100644 package/python-pyqtchart/python-pyqtchart.hash
 create mode 100644 package/python-pyqtchart/python-pyqtchart.mk

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
index 0000000000..1731b85e0b
--- /dev/null
+++ b/package/python-pyqtchart/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYQTCHART
+	bool "python-pyqtchart"
+	depends on BR2_PACKAGE_PYTHON_PYQT5
+	select BR2_PACKAGE_QT5CHARTS
+	help
+	  Python bindings for Qt Charts
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
index 0000000000..fb22ebc997
--- /dev/null
+++ b/package/python-pyqtchart/python-pyqtchart.mk
@@ -0,0 +1,48 @@
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
+PYTHON_PYQTCHART_DEPENDENCIES = python-pyqt5
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_PYQTCHART_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
+PYTHON_PYQTCHART_RM_PORT_BASE = port_v3
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+PYTHON_PYQTCHART_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
+PYTHON_PYQTCHART_RM_PORT_BASE = port_v2
+endif
+
+PYTHON_PYQTCHART_CONF_OPTS = \
+	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQTCHART_PYTHON_DIR)/site-packages/PyQt5 \
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
