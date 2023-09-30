Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE0EE748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E3E4043A;
	Sat, 30 Sep 2023 19:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1E3E4043A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWaXKdlB1uHd; Sat, 30 Sep 2023 19:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07EBD418C3;
	Sat, 30 Sep 2023 19:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EBD418C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 497031BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FCBD60808
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FCBD60808
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1x-ch7cSJmZc for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60DA260797
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60DA260797
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C98783D1B; Sat, 30 Sep 2023 19:56:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 21:55:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 285413fb7bf073f4182e974622689786b37508e1
X-Git-Newrev: cd7bc6b1c410514765c51821bb8d843f136fea4a
X-Patchwork-Hint: ignore
Message-Id: <20230930195629.4C98783D1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnvme: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd7bc6b1c410514765c51821bb8d843f136fea4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnvme provides type definitions for NVMe specification and utilities
for nvme devices handling in Linux. libnvme is needed by udisks from
version 2.10.0+

https://github.com/linux-nvme/libnvme

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libnvme/Config.in    |  7 +++++++
 package/libnvme/libnvme.hash |  3 +++
 package/libnvme/libnvme.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 420d7cf15f..85e99aee30 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1218,6 +1218,7 @@ F:	package/harfbuzz/
 F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
+F:	package/libnvme/
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mmc-utils/
diff --git a/package/Config.in b/package/Config.in
index b494d8ff83..8cf4fe3f51 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1715,6 +1715,7 @@ menu "Hardware handling"
 	source "package/libllcp/Config.in"
 	source "package/libmbim/Config.in"
 	source "package/libnfc/Config.in"
+	source "package/libnvme/Config.in"
 	source "package/libpciaccess/Config.in"
 	source "package/libphidget/Config.in"
 	source "package/libpri/Config.in"
diff --git a/package/libnvme/Config.in b/package/libnvme/Config.in
new file mode 100644
index 0000000000..f298046563
--- /dev/null
+++ b/package/libnvme/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBNVME
+	bool "libnvme"
+	help
+	  libnvme provides type definitions for NVMe specification
+	  and utilities for nvme devices handling in Linux.
+
+	  https://github.com/linux-nvme/libnvme
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
new file mode 100644
index 0000000000..b869ae295a
--- /dev/null
+++ b/package/libnvme/libnvme.hash
@@ -0,0 +1,3 @@
+# Locally calculated sha256 checksums
+sha256  f73ba1edde059b2d5e7c1048ad4f895e6047bff241c94b34a7aff5894779d086  libnvme-1.5.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
new file mode 100644
index 0000000000..71885e198c
--- /dev/null
+++ b/package/libnvme/libnvme.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# libnvme
+#
+################################################################################
+
+LIBNVME_VERSION = 1.5
+LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
+LIBNVME_LICENSE = LGPL-2.1
+LIBNVME_LICENSE_FILES = COPYING
+LIBNVME_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBNVME_DEPENDENCIES += python3
+LIBNVME_CONF_OPTS += -Dpython=enabled
+else
+LIBNVME_CONF_OPTS += -Dpython=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBNVME_DEPENDENCIES += openssl
+LIBNVME_CONF_OPTS += -Dopenssl=enabled
+else
+LIBNVME_CONF_OPTS += -Dopenssl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+LIBNVME_DEPENDENCIES += json-c
+LIBNVME_CONF_OPTS += -Djson-c=enabled
+else
+LIBNVME_CONF_OPTS += -Djson-c=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_KEYUTILS),y)
+LIBNVME_DEPENDENCIES += keyutils
+LIBNVME_CONF_OPTS += -Dkeyutils=enabled
+else
+LIBNVME_CONF_OPTS += -Dkeyutils=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
