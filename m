Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B7FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 22:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 380A582C38;
	Wed,  5 Jan 2022 22:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzbHq0qyxesy; Wed,  5 Jan 2022 22:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7125282BF5;
	Wed,  5 Jan 2022 22:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49E8C1BF267
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4148182BF5
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7exbHi9s7Tf7 for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 22:39:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B7C682BED
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 22:39:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 16076832CD; Wed,  5 Jan 2022 22:33:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 23:38:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e065065777e2955f385ae51b14c9f284b83e477
X-Git-Newrev: b61366f3cc52ea54f9b5719d25ab09e595f53173
X-Patchwork-Hint: ignore
Message-Id: <20220105223312.16076832CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alfred: new package
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
Content-Type: multipart/mixed; boundary="===============5761122837759642806=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5761122837759642806==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b61366f3cc52ea54f9b5719d25ab09e595f53173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/alfred/Config.in   | 20 ++++++++++++++++++++
 package/alfred/alfred.hash |  5 +++++
 package/alfred/alfred.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4cb07b6d9a..4b04f90ccb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1485,6 +1485,7 @@ F:	package/zfs/
 F:	support/testing/tests/package/test_zfs.py
 
 N:	José Pekkarinen <jose.pekkarinen@unikie.com>
+F:	package/alfred/
 F:	package/bmx7/
 F:	package/softhsm2/
 
diff --git a/package/Config.in b/package/Config.in
index d90fb5c450..9f4ab72a80 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2121,6 +2121,7 @@ endmenu
 
 menu "Networking applications"
 	source "package/aircrack-ng/Config.in"
+	source "package/alfred/Config.in"
 	source "package/aoetools/Config.in"
 	source "package/apache/Config.in"
 if BR2_PACKAGE_APACHE
diff --git a/package/alfred/Config.in b/package/alfred/Config.in
new file mode 100644
index 0000000000..bfcfef0d40
--- /dev/null
+++ b/package/alfred/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_ALFRED
+	bool "alfred"
+	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
+	help
+	  Alfred is a user space daemon for distributing arbitrary
+	  local information over the mesh/network in a decentralized
+	  fashion.
+
+	  This data can be anything which appears to be useful -
+	  originally designed to replace the batman-adv visualization
+	  (vis), you may distribute hostnames, phone books,
+	  administration information, DNS information, the local
+	  weather forecast ...
+
+	  https://www.open-mesh.org/projects/alfred/wiki
+
+comment "alfred needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/alfred/alfred.hash b/package/alfred/alfred.hash
new file mode 100644
index 0000000000..0799071231
--- /dev/null
+++ b/package/alfred/alfred.hash
@@ -0,0 +1,5 @@
+# From https://downloads.open-mesh.org/batman/stable/sources/alfred/alfred-2021.4.tar.gz.sha1
+sha1  be1e9c1317d40e46cfc881a31c632fec78c620a1 alfred-2021.4.tar.gz
+# Locally computed
+sha256  4c79b6c45de4bcc8cbfe64cba9a0f8b4ef304ca84c194622f2bfa41e01e2cb95  alfred-2021.4.tar.gz
+sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
diff --git a/package/alfred/alfred.mk b/package/alfred/alfred.mk
new file mode 100644
index 0000000000..ed59066393
--- /dev/null
+++ b/package/alfred/alfred.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# alfred
+#
+################################################################################
+
+ALFRED_VERSION = 2021.4
+ALFRED_SITE = https://downloads.open-mesh.org/batman/stable/sources/alfred
+ALFRED_LICENSE = GPL-2.0
+ALFRED_LICENSE_FILES = LICENSES/preferred/GPL-2.0
+ALFRED_DEPENDENCIES = libnl
+
+define ALFRED_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) \
+		CONFIG_ALFRED_CAPABILITIES=n \
+		CONFIG_ALFRED_GPSD=n
+endef
+
+define ALFRED_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/alfred $(TARGET_DIR)/usr/bin/alfred
+	$(INSTALL) -m 0755 -D $(@D)/vis/batadv-vis $(TARGET_DIR)/usr/bin/batadv-vis
+endef
+
+$(eval $(generic-package))

--===============5761122837759642806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5761122837759642806==--
