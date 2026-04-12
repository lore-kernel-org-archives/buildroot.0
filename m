Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A07E64009
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 10:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C040D42189;
	Sun, 12 Apr 2026 10:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtTJ_7jzd5dg; Sun, 12 Apr 2026 10:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F2E42228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775990342;
	bh=g41ICaTVuKA44U6HdncvlLkhGOdTqDXFFB5NFxo2Bo0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K+oru71yfh5wUKFaLN11kFkxpKPQsehvWTM68M9a8zpBoliEnMLJ47CQIoB2FB4+X
	 w907q1NUfYWaLWfkZj0y3+z28nWBJYzdGwFBNyUP6GoFm5ik19KFdLSG81JrZ7mSEd
	 dqUnXhkAVhDFdbEXeEaVx/dlD/6avyawi8C1dB4IPVpejLAGciKl4U2XQt8toJeqbq
	 U5mdRrAFpxxJTR0Amz9QI5JrGq+hKSS8KC5XxVqMUaL2INE9Vy5WgrtEZjVads1rZ+
	 +UlCQSYchhauN2gl3+bwp6RYSwno/e3GBjjukxhqZES2jZAWS02elzql3vOV+4vBSu
	 hT1PsVNE89Q/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F2E42228;
	Sun, 12 Apr 2026 10:39:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEAD1283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 10:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D484784354
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 10:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1txH0ECMJXU for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 10:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA56F84352
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA56F84352
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 10:39:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41EEA7FE36; Sun, 12 Apr 2026 10:39:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 12:25:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9639bb44c783e19691ebe2aaf94263006a720f7b
X-Git-Newrev: 3d454f76fce239a2d7887a9a04c354fc617059c8
X-Patchwork-Hint: ignore
Message-Id: <20260412103900.41EEA7FE36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opendoas: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d454f76fce239a2d7887a9a04c354fc617059c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

OpenDoas: a portable version of OpenBSD's doas command.
doas is a minimal replacement for the venerable sudo.

https://github.com/Duncaen/OpenDoas

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien:
 - add package description in commit log
 - add comments justifying the generic-package infra
 - add missing dependency on host-bison
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/opendoas/Config.in     |  9 +++++++
 package/opendoas/opendoas.hash |  3 +++
 package/opendoas/opendoas.mk   | 60 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 74 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 18197347a1..9e9c8a5a0f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1205,6 +1205,7 @@ F:	package/lua*
 F:	package/lynis/
 F:	package/lzlib/
 F:	package/moarvm/
+F:	package/opendoas/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
diff --git a/package/Config.in b/package/Config.in
index f12112c1d6..fedff0e22d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2747,6 +2747,7 @@ comment "Utilities"
 	source "package/lowdown/Config.in"
 	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
+	source "package/opendoas/Config.in"
 	source "package/pdmenu/Config.in"
 	source "package/pinentry/Config.in"
 	source "package/qprint/Config.in"
diff --git a/package/opendoas/Config.in b/package/opendoas/Config.in
new file mode 100644
index 0000000000..f359ed576f
--- /dev/null
+++ b/package/opendoas/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OPENDOAS
+	bool "opendoas"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  OpenDoas: a portable version of OpenBSD's doas command.
+	  doas is a minimal replacement for the venerable sudo.
+
+	  https://github.com/Duncaen/OpenDoas
diff --git a/package/opendoas/opendoas.hash b/package/opendoas/opendoas.hash
new file mode 100644
index 0000000000..ada1835f59
--- /dev/null
+++ b/package/opendoas/opendoas.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6da058a0e70b7543bc60624389b0b00b686189ec933828c522bf8b2600495a67  opendoas-6.8.2.tar.gz
+sha256  293e7f2bc3a06396b200956cd660cd101bdb3c109f31c9ab6f2547f2105b38af  LICENSE
diff --git a/package/opendoas/opendoas.mk b/package/opendoas/opendoas.mk
new file mode 100644
index 0000000000..06626508f4
--- /dev/null
+++ b/package/opendoas/opendoas.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# opendoas
+#
+################################################################################
+
+OPENDOAS_VERSION = 6.8.2
+OPENDOAS_SITE = $(call github,Duncaen,OpenDoas,v$(OPENDOAS_VERSION))
+OPENDOAS_LICENSE = ISC
+OPENDOAS_LICENSE_FILES = LICENSE
+
+OPENDOAS_DEPENDENCIES = host-bison
+
+# Those options looks like autotools ones, but this package has a
+# handwritten "configure" script that mimic a subset of autotools.
+# This is why this package uses the generic-package infra. See:
+# https://github.com/Duncaen/OpenDoas/blob/v6.8.2/configure
+OPENDOAS_CONF_OPTS = \
+	--target=$(GNU_TARGET_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--build=$(GNU_HOST_NAME) \
+	--prefix=/usr \
+	--sysconfdir=/etc \
+	--with-shadow
+
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+OPENDOAS_DEPENDENCIES += libxcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define OPENDOAS_INSTALL_PAM_CONF
+	$(INSTALL) -D -m 0644 $(@D)/pam.d__doas__linux $(TARGET_DIR)/etc/pam.d/doas
+endef
+
+OPENDOAS_DEPENDENCIES += linux-pam
+OPENDOAS_CONF_OPTS += --with-pam
+else
+OPENDOAS_CONF_OPTS += --without-pam
+endif
+
+define OPENDOAS_CONFIGURE_CMDS
+	(cd $(@D) && \
+	$(TARGET_CONFIGURE_OPTS) ./configure $(OPENDOAS_CONF_OPTS))
+endef
+
+define OPENDOAS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		YACC="$(HOST_DIR)/bin/bison -y"
+endef
+
+define OPENDOAS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/doas $(TARGET_DIR)/usr/bin/doas
+	$(OPENDOAS_INSTALL_PAM_CONF)
+endef
+
+# NOTE: Even though this package has a "configure" script, it is not
+# generated using autotools, so we have to use the generic package
+# infrastructure.
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
