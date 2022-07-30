Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C90C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 16:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28EAB83F02;
	Sat, 30 Jul 2022 16:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EAB83F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D76fCUGkDA25; Sat, 30 Jul 2022 16:07:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45EC083E9D;
	Sat, 30 Jul 2022 16:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45EC083E9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38EFE1BF376
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10CA9417C6
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10CA9417C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0f2N6d4tlmOm for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 16:07:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0393B417C3
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 16:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0393B417C3
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9FD4286A1B; Sat, 30 Jul 2022 15:53:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 18:06:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81e7e2e773a7ea59bbb129233183b481066ecf6e
X-Git-Newrev: d4b13b21024a894a2fc682090f3e01d53bd699e9
X-Patchwork-Hint: ignore
Message-Id: <20220730155337.9FD4286A1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdill: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4b13b21024a894a2fc682090f3e01d53bd699e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libdill is a C library that makes writing structured concurrent programs
easy.

There has been no release in more than two years, so we use the latest
commit on the master branch.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998@free.fr:
  - explain use of a sha1
  - fix check-package warnings
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libdill/Config.in    |  7 +++++++
 package/libdill/libdill.hash |  3 +++
 package/libdill/libdill.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3d33e83e5a..88e0d02c69 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -164,6 +164,7 @@ F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
+F:	package/libdill/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index 4ff1fb2f3c..fd0598c537 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1999,6 +1999,7 @@ menu "Other"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libdill/Config.in"
 	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libdill/Config.in b/package/libdill/Config.in
new file mode 100644
index 0000000000..2376fc9698
--- /dev/null
+++ b/package/libdill/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDILL
+	bool "libdill"
+	help
+	  Libdill is a C library that makes writing structured
+	  concurrent programs easy.
+
+	  http://libdill.org
diff --git a/package/libdill/libdill.hash b/package/libdill/libdill.hash
new file mode 100644
index 0000000000..4a1fb91a57
--- /dev/null
+++ b/package/libdill/libdill.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  6df7527e8f1e91f5106c21c5bfeaa69eee470bec476c74585143e3e439864404  libdill-fa01648cf2a8d06e53c965b45eeacfb3ac57bd04.tar.gz
+sha256  3f78d9c42c8919cb6dc63e51de17b9eb40a49d9cdd876ce59e77392721e8c2c6  COPYING
diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
new file mode 100644
index 0000000000..117e8254e0
--- /dev/null
+++ b/package/libdill/libdill.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libdill
+#
+################################################################################
+
+LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
+LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
+LIBDILL_LICENSE = MIT
+LIBDILL_LICENSE_FILES = COPYING
+LIBDILL_INSTALL_STAGING = YES
+# Fetched from Github, with no configure script
+LIBDILL_AUTORECONF = YES
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBDILL_CONF_OPTS += --enable-threads
+else
+LIBDILL_CONF_OPTS += --disable-threads
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBDILL_DEPENDENCIES += openssl
+LIBDILL_CONF_OPTS += --enable-tls
+else
+LIBDILL_CONF_OPTS += --disable-tls
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
