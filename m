Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A33C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E6D400BB;
	Sun, 14 Jul 2024 20:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POj1-KTq3YQQ; Sun, 14 Jul 2024 20:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D8F405F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D8F405F3;
	Sun, 14 Jul 2024 20:23:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1DAA1BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A9E660635
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxF0I5qKVcKP for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ACAD6063E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ACAD6063E
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 674AF868B8; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 22:16:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1282ebc83049949f1373bf78dd09e444aaa33d2f
X-Git-Newrev: 17deaf60f66fc08a796233920a104e5233b501e0
X-Patchwork-Hint: ignore
Message-Id: <20240714202320.674AF868B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] tipidee: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8976434123977260519=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8976434123977260519==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=17deaf60f66fc08a796233920a104e5233b501e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also needs a host version to be able to generate the binary config file.
The host version is user-selectable so the user has the option of
running the compiler in a post-build script some other way.

We don't install the config file compiler tipidee-config on target.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
[Arnout:
 - Remove BR2_PACKAGE_TIPIDEE_CONFIGURATION, use empty value of
   BR2_PACKAGE_TIPIDEE_CONFIG_FILE to flag false.
 - Rename BR2_PACKAGE_TIPIDEE_CONFIGURATION_FILE to
   BR2_PACKAGE_TIPIDEE_CONFIG_FILE.
 - Default BR2_PACKAGE_TIPIDEE_CONFIG_FILE to empty.
 - Fix spelling of BR2_PACKAGE_HOST_TIPIDEE.
 - Add J. to DEVELOPERS.
 - Install in /usr instead of /.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                     |  3 ++
 package/Config.in              |  1 +
 package/Config.in.host         |  1 +
 package/tipidee/Config.in      | 31 ++++++++++++++++++
 package/tipidee/Config.in.host |  8 +++++
 package/tipidee/tipidee.hash   |  3 ++
 package/tipidee/tipidee.mk     | 72 ++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 119 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ba40388982..9f67e3b02f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1442,6 +1442,9 @@ N:	Ismael Luceno <ismael@iodev.co.uk>
 F:	package/axel/
 F:	package/mawk/
 
+N:	J. Neuschäfer <j.neuschaefer@gmx.net>
+F:	package/tipidee
+
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/amarula/
 F:	board/asus/
diff --git a/package/Config.in b/package/Config.in
index f42762140a..6c390f7bd3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2606,6 +2606,7 @@ endif
 	source "package/tinc/Config.in"
 	source "package/tinyproxy/Config.in"
 	source "package/tinyssh/Config.in"
+	source "package/tipidee/Config.in"
 	source "package/tor/Config.in"
 	source "package/traceroute/Config.in"
 	source "package/transmission/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 89e5ca5191..5843210d10 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -114,6 +114,7 @@ menu "Host utilities"
 	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
+	source "package/tipidee/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
diff --git a/package/tipidee/Config.in b/package/tipidee/Config.in
new file mode 100644
index 0000000000..b9e6b4769f
--- /dev/null
+++ b/package/tipidee/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_TIPIDEE
+	bool "tipidee"
+	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
+	select BR2_PACKAGE_HOST_TIPIDEE if BR2_PACKAGE_TIPIDEE_CONFIG_FILE != ""
+	help
+	  tipidee is a web server. It supports HTTP 1.0 and 1.1. It aims
+	  to be compliant with RFC 9112: while it only implements a very
+	  limited subset of the optional functionality in HTTP 1.1, it
+	  implements all the mandatory parts. It is usable with both
+	  HTTP and HTTPS.
+
+	  It runs under a super-server, e.g. inetd, s6-tcpserver, or
+	  s6-tlsserver (for HTTPS). Traditionally, inetd-mode web
+	  servers aren't considered performant, but tipidee aims to eke
+	  out every single drop of performance that is attainable with
+	  its programming model.
+
+	  https://skarnet.org/software/tipidee/
+
+if BR2_PACKAGE_TIPIDEE
+
+config BR2_PACKAGE_TIPIDEE_CONFIG_FILE
+	string "configuration source file"
+	default ""
+	help
+	  The configuration file in source (text) format, documented at:
+
+	  https://skarnet.org/software/tipidee/tipidee.conf.html
+
+endif
diff --git a/package/tipidee/Config.in.host b/package/tipidee/Config.in.host
new file mode 100644
index 0000000000..e120a186fb
--- /dev/null
+++ b/package/tipidee/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_TIPIDEE
+	bool "host tipidee"
+	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
+	help
+	  This package builds the tipidee-config tool for the host.
+
+	  https://skarnet.org/software/tipidee/
diff --git a/package/tipidee/tipidee.hash b/package/tipidee/tipidee.hash
new file mode 100644
index 0000000000..ecc1ab34b4
--- /dev/null
+++ b/package/tipidee/tipidee.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  d9e91fc719879a43d54329b99b02c6649c54e428e77bc96a0573506b52bf1422  tipidee-0.0.5.0.tar.gz
+sha256  8feb7933c6e6506a7f20fbfc03fd37df3caff4becdf3b7a0ffad5016277e441e  COPYING
diff --git a/package/tipidee/tipidee.mk b/package/tipidee/tipidee.mk
new file mode 100644
index 0000000000..1e15782aa4
--- /dev/null
+++ b/package/tipidee/tipidee.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# tipidee
+#
+################################################################################
+
+TIPIDEE_VERSION = 0.0.5.0
+TIPIDEE_SITE = https://skarnet.org/software/tipidee
+TIPIDEE_LICENSE = ISC
+TIPIDEE_LICENSE_FILES = COPYING
+TIPIDEE_DEPENDENCIES = skalibs
+
+TIPIDEE_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define TIPIDEE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(TIPIDEE_CONF_OPTS))
+endef
+
+define TIPIDEE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define TIPIDEE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	rm -f $(TARGET_DIR)/bin/tipidee-config
+	rm -f $(TARGET_DIR)/libexec/tipidee-config-preprocess
+endef
+
+ifneq ($(BR2_PACKAGE_TIPIDEE_CONFIG_FILE),)
+TIPIDEE_DEPENDENCIES += host-tipidee
+
+define TIPIDEE_INSTALL_CONFIG
+	$(HOST_DIR)/bin/tipidee-config \
+		-i $(call qstrip, $(BR2_PACKAGE_TIPIDEE_CONFIG_FILE)) \
+		-o $(TARGET_DIR)/etc/tipidee.conf.cdb
+endef
+TIPIDEE_POST_INSTALL_TARGET_HOOKS += TIPIDEE_INSTALL_CONFIG
+
+endif
+
+HOST_TIPIDEE_DEPENDENCIES = host-skalibs
+
+HOST_TIPIDEE_CONF_OPTS = \
+	--prefix=$(HOST_DIR) \
+	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(HOST_DIR)/include \
+	--with-dynlib=$(HOST_DIR)/lib \
+	--disable-static \
+	--enable-shared \
+	--disable-allstatic
+
+define HOST_TIPIDEE_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_TIPIDEE_CONF_OPTS))
+endef
+
+define HOST_TIPIDEE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_TIPIDEE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install-dynlib install-bin install-libexec
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))

--===============8976434123977260519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8976434123977260519==--
