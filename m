Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D549AC07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 07:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB8541749;
	Sat, 24 Sep 2022 07:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB8541749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4dd6RYAyhHy; Sat, 24 Sep 2022 07:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A43B4176D;
	Sat, 24 Sep 2022 07:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A43B4176D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1921BF315
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 07:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11DCA83E75
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 07:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11DCA83E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wF6xs-gyz6T2 for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 07:09:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C45983E4E
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 07:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C45983E4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1937785B12; Sat, 24 Sep 2022 07:09:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 08:59:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b15de20a07b31ca3c4954a1f1ce035e00161934
X-Git-Newrev: 530d6f661e506a4774b7236cb93d65f669adbc92
X-Patchwork-Hint: ignore
Message-Id: <20220924070904.1937785B12@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=530d6f661e506a4774b7236cb93d65f669adbc92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crun is a fast and low-memory OCI Container Runtime in C.

https://github.com/containers/crun

Signed-off-by: Christian Stewart <christian@paral.in>
Tested-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/crun/Config.in |  7 +++++++
 package/crun/crun.hash |  4 ++++
 package/crun/crun.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b756e60e3..103b5f223c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -532,6 +532,7 @@ F:	package/python-pylibftdi/
 N:	Christian Stewart <christian@paral.in>
 F:	package/batman-adv/
 F:	package/containerd/
+F:	package/crun/
 F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-compose/
diff --git a/package/Config.in b/package/Config.in
index 57c0e7959a..afe2dcc21d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2571,6 +2571,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
 	source "package/dcron/Config.in"
diff --git a/package/crun/Config.in b/package/crun/Config.in
new file mode 100644
index 0000000000..5aca10dcdb
--- /dev/null
+++ b/package/crun/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CRUN
+	bool "crun"
+	select BR2_PACKAGE_YAJL # libocispec
+	help
+	  crun is a fast and low-memory OCI Container Runtime in C.
+
+	  https://github.com/containers/crun
diff --git a/package/crun/crun.hash b/package/crun/crun.hash
new file mode 100644
index 0000000000..de61310e08
--- /dev/null
+++ b/package/crun/crun.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  acd24012daa951cf1674b20b2d5f87975d5d6c8e8c80bfe12e4cffa3495cae67  crun-1.5.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
new file mode 100644
index 0000000000..c92e6e5605
--- /dev/null
+++ b/package/crun/crun.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# crun
+#
+################################################################################
+
+CRUN_VERSION = 1.5
+CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
+CRUN_DEPENDENCIES = host-pkgconf yajl
+
+CRUN_LICENSE = GPL-2.0+ (crun binary), LGPL-2.1+ (libcrun)
+CRUN_LICENSE_FILES = COPYING COPYING.libcrun
+
+CRUN_AUTORECONF = YES
+CRUN_CONF_OPTS = --disable-embedded-yajl
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+CRUN_DEPENDENCIES += libcap
+CRUN_CONF_OPTS += --enable-caps
+else
+CRUN_CONF_OPTS += --disable-caps
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CRUN_DEPENDENCIES += libseccomp
+CRUN_CONF_OPTS += --enable-seccomp
+else
+CRUN_CONF_OPTS += --disable-seccomp
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+CRUN_CONF_OPTS += --enable-systemd
+CRUN_DEPENDENCIES += systemd host-pkgconf
+else
+CRUN_CONF_OPTS += --disable-systemd
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
