Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31856C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C334F409A2;
	Sat, 29 Jul 2023 21:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C334F409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcz055sAMHhR; Sat, 29 Jul 2023 21:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85BCA4154E;
	Sat, 29 Jul 2023 21:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85BCA4154E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 239831BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A4EC81F3E
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A4EC81F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_mdmwC40wQt for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:09:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 125C881F3A
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 125C881F3A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F39D183B17; Sat, 29 Jul 2023 21:09:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 23:08:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ddb1dfb40cad9bc00e68376d2f06cad28bbd296
X-Git-Newrev: 06f50ff1bf066feb6cf6ed512113773f87c884fb
X-Patchwork-Hint: ignore
Message-Id: <20230729210924.F39D183B17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/conmon: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06f50ff1bf066feb6cf6ed512113773f87c884fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Conmon is an OCI container runtime monitor.

https://github.com/containers/conmon

Dependency of podman.

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/conmon/Config.in   | 14 ++++++++++++++
 package/conmon/conmon.hash |  3 +++
 package/conmon/conmon.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cfaadc47a9..4488364458 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -547,6 +547,7 @@ F:	package/balena-engine/
 F:	package/batman-adv/
 F:	package/catatonit/
 F:	package/cni-plugins/
+F:	package/conmon/
 F:	package/containerd/
 F:	package/crun/
 F:	package/delve/
diff --git a/package/Config.in b/package/Config.in
index 0e8cdd7c8b..29a7daf6cc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2642,6 +2642,7 @@ menu "System tools"
 	source "package/bubblewrap/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
+	source "package/conmon/Config.in"
 	source "package/containerd/Config.in"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
diff --git a/package/conmon/Config.in b/package/conmon/Config.in
new file mode 100644
index 0000000000..9ba9c215b7
--- /dev/null
+++ b/package/conmon/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CONMON
+	bool "conmon"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Conmon is an OCI container runtime monitor.
+
+	  https://github.com/containers/conmon
+
+comment "conmon needs a toolchain w/ threads, wchar"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/conmon/conmon.hash b/package/conmon/conmon.hash
new file mode 100644
index 0000000000..82d1d14ba3
--- /dev/null
+++ b/package/conmon/conmon.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  7d0f9a2f7cb8a76c51990128ac837aaf0cc89950b6ef9972e94417aa9cf901fe  conmon-2.1.7.tar.gz
+sha256  9c9d771d4004725237a31ada889fe06c85a24fd0a29e41825181ab4cde54f016  LICENSE
diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
new file mode 100644
index 0000000000..f3567a4305
--- /dev/null
+++ b/package/conmon/conmon.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# conmon
+#
+################################################################################
+
+CONMON_VERSION = 2.1.7
+CONMON_SITE = $(call github,containers,conmon,v$(CONMON_VERSION))
+CONMON_LICENSE = Apache-2.0
+CONMON_LICENSE_FILES = LICENSE
+
+CONMON_DEPENDENCIES = host-pkgconf libglib2
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CONMON_DISABLE_SECCOMP = 0
+CONMON_DEPENDENCIES += libseccomp
+else
+CONMON_DISABLE_SECCOMP = 1
+endif
+
+define CONMON_CONFIGURE_CMDS
+	printf '#!/bin/bash\necho "$(CONMON_DISABLE_SECCOMP)"\n' > \
+		$(@D)/hack/seccomp-notify.sh
+	chmod +x $(@D)/hack/seccomp-notify.sh
+endef
+
+define CONMON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) bin/conmon
+endef
+
+define CONMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/bin/conmon $(TARGET_DIR)/usr/bin/conmon
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
