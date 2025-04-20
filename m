Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2456C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 20:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A4940486;
	Sun, 20 Apr 2025 20:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up9XZi9bVMLK; Sun, 20 Apr 2025 20:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC3A403B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC3A403B7;
	Sun, 20 Apr 2025 20:51:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE2551C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 20:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C43A56079A
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 20:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f51jzPMtSQBQ for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 20:51:48 +0000 (UTC)
X-Greylist: delayed 343 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 20 Apr 2025 20:51:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 917E86072C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 917E86072C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 917E86072C
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 20:51:47 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 4E58AE002E4;
 Sun, 20 Apr 2025 22:46:01 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Sun, 20 Apr 2025 22:45:38 +0200
Message-ID: <20250420204540.32264-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1745181961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=l8crfmcR1lcuVlApXKGgCe1ZlEjkqxxJ9AqsvEgVcz4=;
 b=hxw5R+fSs/LCFUljAcoIo+YY8zRyKETq/Jo4RRqkJSB/T/zRLuF2shHPjerZPFewyXOy+G
 ejgy4KOvbIyoEdRWJrmdTrxeRsCwyD8peMuAe9Vu8wPGUZ7vSg4PhL3CdLcSraIgvSOuOa
 sfkNb4NyolZ+cr6cUqeIz/MCZkDQZ1o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=hxw5R+fS
Subject: [Buildroot] [PATCH 1/1] package/casync-nano: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

casync-nano is an implementation of a subset of the features of casync,
optimized for performing OTA updates on embedded systems.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/Config.in.host               |  1 +
 package/casync-nano/Config.in        | 21 +++++++++++++++++++++
 package/casync-nano/Config.in.host   |  7 +++++++
 package/casync-nano/casync-nano.hash |  3 +++
 package/casync-nano/casync-nano.mk   | 28 ++++++++++++++++++++++++++++
 7 files changed, 64 insertions(+)
 create mode 100644 package/casync-nano/Config.in
 create mode 100644 package/casync-nano/Config.in.host
 create mode 100644 package/casync-nano/casync-nano.hash
 create mode 100644 package/casync-nano/casync-nano.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a921c8a74..6f30b6b938 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1130,6 +1130,9 @@ F:	package/rsyslog/
 N:	Florian Fainelli <f.fainelli@gmail.com>
 F:	package/cpulimit/
 
+N:	Florian Larysch <fl@n621.de>
+F:	package/casync-nano/
+
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
 F:	package/odhcploc/
diff --git a/package/Config.in b/package/Config.in
index c29109aa7e..cfff6a77eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2456,6 +2456,7 @@ endif
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
 	source "package/casync/Config.in"
+	source "package/casync-nano/Config.in"
 	source "package/cfm/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index bf04f5fa97..b0f7529a13 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/bmap-writer/Config.in.host"
 	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
+	source "package/casync-nano/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/checksec/Config.in.host"
diff --git a/package/casync-nano/Config.in b/package/casync-nano/Config.in
new file mode 100644
index 0000000000..ec7eeafaaa
--- /dev/null
+++ b/package/casync-nano/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_CASYNC_NANO
+	bool "casync-nano"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZSTD
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Tiny casync-like tool optimized for embedded systems.
+
+	  https://github.com/florolf/casync-nano
+
+if BR2_PACKAGE_CASYNC_NANO
+
+config BR2_PACKAGE_CASYNC_NANO_CASYNC_SHIM
+	bool "install casync shim"
+	# only once package should provide the "casync" command
+	depends on !BR2_PACKAGE_CASYNC
+	help
+	  Install a shim that provides basic compatibility with the
+	  "extract" sub-command of casync to programs that expect it.
+
+endif
diff --git a/package/casync-nano/Config.in.host b/package/casync-nano/Config.in.host
new file mode 100644
index 0000000000..2fc3340017
--- /dev/null
+++ b/package/casync-nano/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_CASYNC_NANO
+	bool "host casync-nano tool"
+	help
+	  casync-nano host tool (csn-tool) for casync-nano specific
+	  features like chunk encryption.
+
+	  https://github.com/florolf/casync-nano
diff --git a/package/casync-nano/casync-nano.hash b/package/casync-nano/casync-nano.hash
new file mode 100644
index 0000000000..1697fa93ef
--- /dev/null
+++ b/package/casync-nano/casync-nano.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  29ed8a767304e7e3032e66feea3d2dada7cc7db73344231a54bf080cc6e65ecf  casync-nano-1.1.1.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/casync-nano/casync-nano.mk b/package/casync-nano/casync-nano.mk
new file mode 100644
index 0000000000..a15377a6b4
--- /dev/null
+++ b/package/casync-nano/casync-nano.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# casync-nano
+#
+################################################################################
+
+CASYNC_NANO_VERSION = 1.1.1
+CASYNC_NANO_SITE = $(call github,florolf,casync-nano,v$(CASYNC_NANO_VERSION))
+CASYNC_NANO_LICENSE = LGPL-2.1
+CASYNC_NANO_LICENSE_FILES = COPYING
+CASYNC_NANO_DEPENDENCIES = host-pkgconf openssl zstd libcurl
+
+ifeq ($(BR2_PACKAGE_CASYNC_NANO_CASYNC_SHIM),y)
+define CASYNC_NANO_INSTALL_CASYNC_SHIM
+	ln -sf csn $(TARGET_DIR)/usr/bin/casync
+endef
+endif
+
+define CASYNC_NANO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m0755 $(@D)/csn $(TARGET_DIR)/usr/bin/csn
+	$(CASYNC_NANO_INSTALL_CASYNC_SHIM)
+endef
+
+HOST_CASYNC_NANO_DEPENDENCIES = host-pkgconf host-openssl
+HOST_CASYNC_NANO_CONF_OPTS = -DBUILD_CSN=Off -DBUILD_CSN_TOOL=On
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
