Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911B3CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 20:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D31B4208B;
	Fri, 13 Oct 2023 20:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D31B4208B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmNQRxEHI93I; Fri, 13 Oct 2023 20:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C72A74208F;
	Fri, 13 Oct 2023 20:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C72A74208F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77FE51BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50FCE82123
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50FCE82123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vg_KksrEZ_np for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 20:37:31 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDE36820CF
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 20:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE36820CF
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rOuVqO37yfJOlrOuVq58gP; Fri, 13 Oct 2023 22:37:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 22:37:21 +0200
Message-Id: <20231013203724.120389-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDpXLKNZrU4ZFHdqMpKljQYE4rjw8jxdDYjrh3zo/Wtj/xxsWXZXEEZw4vxrXlEgv/U243bZn6fWGaVNYDpTgYECksvxdIdfMsl/IZwhKZMUz6tvzES7
 KOAN3UOYH9UYJXUcBUqnSgS3FBPBcUfn3OauTIEjRH3fSeWrH2boZNf3SAhiOnSgxevlzrgC53bOE+dYhPd+xbaQWOButo38o6FkLnSK0NdRgeflc1QZo6DR
 5aw1X10JAqAToA+K3UrOz3r1xpqT3Ck/yiU8XDQZC1D9iMDuI4Y79abRaPR8bGvJM20cPzRnjgFvJC37Teac7qs27g6UEXV1EnDLvLGhz+O6ciw3NjRLl1IX
 husK1u2hLHw9vjY/1jzP90/hAsXv+CKQPlGnBMHF5qomIOGP1w60zoKYHg6PPfC+V+aLB5FjNSuzyUCTzHDPnR6PGn/DxQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697229448; bh=jNNpSvHkL3PwjaU847M2orfQrU03sw2ZWvAOi2tQk/k=;
 h=From:To:Subject:Date:MIME-Version;
 b=jJ8NUrsB0XoQAB03d6sl1ivJDJ4mSLJE2PapkbTGXDt97Cq1f5QP+EbRTAiX/jRYo
 7jEJWBLNHLZEwR0Xq1Wuy+Ej3pi1kJlQ2kJMwXYBvWjtDXFs0JR48RdtfvMBykWZlD
 vhSTQsEGkizcy4T2OwHxUiTUkpxmHA6/BntHUprgMm533iCpNA5CglM3xS3+XjZZqc
 QD9LkZPxIHTgFEQFM/D7sL7PUaKdcmxS9HlRKXXNQJHK6chpYvwmOc8Jyd03JnwAC0
 HI0r66YKeFpCYtCTNAbUNfelTJIvv8y82k8QLDUK+dedh62sRBAkP1e7C6HEpyTH50
 So0RK65BWT6Yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jJ8NUrsB
Subject: [Buildroot] [PATCH v3 1/4] package/libtraceevent: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

Introduce the libtraceevent library, that used to be bundled with the
trace-cmd tool. This library is now used by several tools and libraries
such as trace-cmd, libtracefs and rtla.

This package tries to install libraries in /usr/local/lib by default,
hence the redefinition of the "prefix" variable, so that the library
gets installed in "/usr/lib" instead.

The same applies to the pkgconfig handling of the proved Makefile, which
installs the .pc files in the /usr/local area by default, hence the
redefinition of the pkgconfig_dir to either the correct directory within the
staging area, or to empty value for the target to avoid installing the .pc
in that case.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio: bump version to 1.7.3 and add hash file]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Giulio:
V1->V2:
* bump to version 1.7.3
* add hash file
---
 DEVELOPERS                               |  3 +++
 package/Config.in                        |  1 +
 package/libtraceevent/Config.in          |  9 +++++++
 package/libtraceevent/libtraceevent.hash |  4 +++
 package/libtraceevent/libtraceevent.mk   | 33 ++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/libtraceevent/Config.in
 create mode 100644 package/libtraceevent/libtraceevent.hash
 create mode 100644 package/libtraceevent/libtraceevent.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 06583c3c0a..e426f65cc2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2111,6 +2111,9 @@ F:	package/postgresql/
 F:	package/protozero/
 F:	package/timescaledb/
 
+N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
+F:	package/libtraceevent/
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/package/Config.in b/package/Config.in
index f4399a6021..2b3d3e612f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -117,6 +117,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
 	source "package/libbpf/Config.in"
+	source "package/libtraceevent/Config.in"
 	source "package/lmbench/Config.in"
 	source "package/lsof/Config.in"
 	source "package/ltp-testsuite/Config.in"
diff --git a/package/libtraceevent/Config.in b/package/libtraceevent/Config.in
new file mode 100644
index 0000000000..d351e3b4de
--- /dev/null
+++ b/package/libtraceevent/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBTRACEEVENT
+	bool "libtraceevent"
+	help
+	  libtraceevent is a library that interfaces with the ftrace
+	  subsystem in the linux kernel.
+	  It used to be bundled directly in the trace-cmd
+	  tool, but it was eventually extracted so that it can be used
+	  by multiple other tools and libraries, such as libtracefs and
+	  rtla.
diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
new file mode 100644
index 0000000000..15c4883afd
--- /dev/null
+++ b/package/libtraceevent/libtraceevent.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  097b72e0d907f3107825fb2edf0188324bf70dc9da360f6efa68dc484ffde541  libtraceevent-1.7.3.tar.gz
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
new file mode 100644
index 0000000000..75c23f7410
--- /dev/null
+++ b/package/libtraceevent/libtraceevent.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libtraceevent
+#
+################################################################################
+
+LIBTRACEEVENT_VERSION = 1.7.3
+LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
+LIBTRACEEVENT_INSTALL_STAGING = YES
+LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
+LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
+
+define LIBTRACEEVENT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define LIBTRACEEVENT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	DESTDIR=$(STAGING_DIR) \
+	pkgconfig_dir="/usr/lib/pkgconfig" \
+	prefix="/usr" \
+	install
+endef
+
+define LIBTRACEEVENT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	DESTDIR=$(TARGET_DIR) \
+	pkgconfig_dir="" \
+	prefix="/usr" \
+	install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
