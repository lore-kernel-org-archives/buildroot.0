Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD40C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 04:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CC4180FB3;
	Mon, 26 Aug 2024 04:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7Sc_ZNHF-L3; Mon, 26 Aug 2024 04:26:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 402D780F41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 402D780F41;
	Mon, 26 Aug 2024 04:26:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CDE41BF2C0
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 04:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 225FF4009A
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 04:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjdMO_7vZVbU for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 04:26:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFF1A40289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF1A40289
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFF1A40289
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 04:26:33 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DD3E63536441; Mon, 26 Aug 2024 06:26:31 +0200 (CEST)
Date: Mon, 26 Aug 2024 06:26:31 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZswD9wfhJbZprySD@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724646391; bh=e29wZmwvoO+kfEfXwXaJ8MmLbEaadRmjIGir1hlJP0Q=;
 h=Date:From:To:Subject:From;
 b=CHyFbYvkMDu/5Oh2e9QX7YKAqMwX2+zB3JvKQeD9GWK7KhqKccTYWw/jed6sUw3Rz
 HhZjr/J5YrFQswJ8Pde+v8kHHbwA5fC7E9xT7jRMneEDRIpmnyGnC9jZv2lf6+LZs4
 Dtue4LCDySoAXsYPHb9InWnIztv/601Ue2PV94jgu3sMppCKHNfzubAk6ehbpU9LWO
 m6zhW5hwd6qcqajAuihgymbwLcd97Dy5mpouXXUd5A4ufRpFu9Maaa8698nvk1r/+e
 gyCGcff/BZOCteTL9ryjISPyz1OybAmOVnrnLEawfpl69m8ZZhYUT2BNQdykNmlAeV
 T0YUfnfYCYlWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=CHyFbYvk
Subject: [Buildroot] [PATCH next] package/evilwm: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nice small and very fast Xorg windowmanager:
https://www.6809.org.uk/evilwm/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/evilwm/Config.in   |  9 +++++++++
 package/evilwm/evilwm.hash |  3 +++
 package/evilwm/evilwm.mk   | 21 +++++++++++++++++++++
 package/evilwm/xsession    |  2 ++
 6 files changed, 37 insertions(+)
 create mode 100644 package/evilwm/Config.in
 create mode 100644 package/evilwm/evilwm.hash
 create mode 100644 package/evilwm/evilwm.mk
 create mode 100644 package/evilwm/xsession

diff --git a/DEVELOPERS b/DEVELOPERS
index d2b64ee5c6..8117e485d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3298,6 +3298,7 @@ N:	Waldemar Brodkorb <wbx@openadk.org>
 F:	board/qemu/riscv32-virt/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	package/asterisk/
+F:	package/evilwm/
 F:	package/fbv/
 F:	package/libjwt/
 F:	package/mksh/
diff --git a/package/Config.in b/package/Config.in
index 07bd1499d8..77121612db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -438,6 +438,7 @@ comment "X window managers"
 	depends on BR2_PACKAGE_XORG7
 
 	source "package/enlightenment/Config.in"
+	source "package/evilwm/Config.in"
 	source "package/fluxbox/Config.in"
 	source "package/matchbox/Config.in"
 	source "package/metacity/Config.in"
diff --git a/package/evilwm/Config.in b/package/evilwm/Config.in
new file mode 100644
index 0000000000..86cc17dc76
--- /dev/null
+++ b/package/evilwm/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_EVILWM
+	bool "evilwm"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  A minimalist window manager for the X Window System
+
+	  https://www.6809.org.uk/evilwm/
diff --git a/package/evilwm/evilwm.hash b/package/evilwm/evilwm.hash
new file mode 100644
index 0000000000..7fede9641f
--- /dev/null
+++ b/package/evilwm/evilwm.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  d5945b20b12c91db2412fac0dbda3fb9c3ec8debb8e1b109838992b2b1bbe5d4  evilwm-1.4.3.tar.gz
+sha256  e98134d702e297c35e2b1150918a2b0cffea523f67644fa64e8dbb823fb55986  README
diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
new file mode 100644
index 0000000000..8d9df47e5d
--- /dev/null
+++ b/package/evilwm/evilwm.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# evilwm
+#
+################################################################################
+
+EVILWM_VERSION = 1.4.3
+EVILWM_SITE = https://www.6809.org.uk/evilwm/dl
+EVILWM_LICENSE = MIT
+EVILWM_LICENSE_FILES = README
+
+EVILWM_DEPENDENCIES = xlib_libX11
+
+define EVILWM_INSTALL_XSESSION_FILE
+	$(INSTALL) -m 0755 -D package/evilwm/xsession \
+		$(TARGET_DIR)/root/.xsession
+endef
+
+EVILWM_POST_INSTALL_TARGET_HOOKS += EVILWM_INSTALL_XSESSION_FILE
+
+$(eval $(autotools-package))
diff --git a/package/evilwm/xsession b/package/evilwm/xsession
new file mode 100644
index 0000000000..9892af719d
--- /dev/null
+++ b/package/evilwm/xsession
@@ -0,0 +1,2 @@
+#!/bin/sh
+exec evilwm -term xterm
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
