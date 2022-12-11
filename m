Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5961C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A1564ED94;
	Mon, 20 Feb 2023 22:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1564ED94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_YRylK4y7bk; Mon, 20 Feb 2023 22:51:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA034F354;
	Mon, 20 Feb 2023 22:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA034F354
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B54EA1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93B3961291
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B3961291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HG7GBqOd0FB0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F670611C8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F670611C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97487828C8; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 18:38:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bbe96083f035b21be58498d055b83b2f7576ce16
X-Git-Newrev: 93d982207b43f9e741e190a71317901972175796
X-Patchwork-Hint: ignore
Message-Id: <20230220205208.97487828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hddtemp: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=93d982207b43f9e741e190a71317901972175796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Bernd:
 - switched to actively maintained fork
 - package/Config.in: moved to "Hardware handling" (Peter)
 - added toolchain dependencies (Thomas)
 - added license hash
 - fixed build errors related to iconv and execinfo (Peter)
 - removed hook HDDTEMP_REMOVE_MAN (Thomas)
 - install hddtemp.db to target
 - added build/install _CMDS due to
   https://github.com/vitlav/hddtemp/issues/5]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr:
  - use GETTEXTIZE=YES, drop host-gettext from _DEPENDENCIES
  - drop custom build and install commands now that we gettextize
  - explicitly specify the DB path, introduce HDDTEMP_DB_PATH
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/hddtemp/Config.in    | 17 +++++++++++++++++
 package/hddtemp/hddtemp.hash |  3 +++
 package/hddtemp/hddtemp.mk   | 35 +++++++++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 04047d43da..29dffaadf1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -345,6 +345,7 @@ F:	package/glmark2/
 F:	package/gpsd/
 F:	package/gptfdisk/
 F:	package/hdparm/
+F:	package/hddtemp/
 F:	package/inih/
 F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
diff --git a/package/Config.in b/package/Config.in
index 6804e1d418..10a0493b8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -508,6 +508,7 @@ endmenu
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
 	source "package/gvfs/Config.in"
+	source "package/hddtemp/Config.in"
 	source "package/hdparm/Config.in"
 	source "package/hwdata/Config.in"
 	source "package/hwloc/Config.in"
diff --git a/package/hddtemp/Config.in b/package/hddtemp/Config.in
new file mode 100644
index 0000000000..0e02252461
--- /dev/null
+++ b/package/hddtemp/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HDDTEMP
+	bool "hddtemp"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  hddtemp is a small utility that gives you the temperature of
+	  your hard drive by reading S.M.A.R.T. informations, for drives
+	  that support this feature.
+
+	  https://github.com/vitlav/hddtemp
+	  http://www.guzu.net/linux/hddtemp.php
+
+comment "hddtemp needs dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/hddtemp/hddtemp.hash b/package/hddtemp/hddtemp.hash
new file mode 100644
index 0000000000..cd82d7f89b
--- /dev/null
+++ b/package/hddtemp/hddtemp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  592322c64f0d5f035132249e3d051b752f5d24867514522a17285d5e72d21075  hddtemp-0.4.3.tar.gz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  GPL-2
diff --git a/package/hddtemp/hddtemp.mk b/package/hddtemp/hddtemp.mk
new file mode 100644
index 0000000000..7023e11e59
--- /dev/null
+++ b/package/hddtemp/hddtemp.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# hddtemp
+#
+################################################################################
+
+HDDTEMP_VERSION = 0.4.3
+HDDTEMP_SITE = $(call github,vitlav,hddtemp,v$(HDDTEMP_VERSION))
+HDDTEMP_LICENSE = GPLv2
+HDDTEMP_LICENSE_FILES = GPL-2
+
+# Fetched from Github with no configure script
+HDDTEMP_AUTORECONF = YES
+HDDTEMP_GETTEXTIZE = YES
+
+HDDTEMP_DB_PATH = /usr/share/misc/hddtemp.db
+HDDTEMP_CONF_OPTS = --with-db-path=$(HDDTEMP_DB_PATH)
+HDDTEMP_CONF_ENV = LIBS="$(HDDTEMP_LIBS)"
+
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+HDDTEMP_DEPENDENCIES += libexecinfo
+HDDTEMP_LIBS += -lexecinfo
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+HDDTEMP_DEPENDENCIES += libiconv
+HDDTEMP_LIBS += -liconv
+endif
+
+define HDDTEMP_INSTALL_HDDTEMP_DB
+	$(INSTALL) -D $(@D)/data/hddtemp.db $(TARGET_DIR)$(HDDTEMP_DB_PATH)
+endef
+HDDTEMP_POST_INSTALL_TARGET_HOOKS += HDDTEMP_INSTALL_HDDTEMP_DB
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
