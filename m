Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797DEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 16:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 291B7405D1;
	Sat,  7 May 2022 16:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6EfH0tYL8gX; Sat,  7 May 2022 16:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1355F4018B;
	Sat,  7 May 2022 16:14:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 021A31BF82D
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 16:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3BC360803
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 16:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=riseup.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbV9uk2x1Q0o for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 16:13:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 523E66079D
 for <buildroot@buildroot.org>; Sat,  7 May 2022 16:13:46 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4KwXYP5L3dz9tqg;
 Sat,  7 May 2022 09:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1651940025; bh=5nlKofEnwqliH+33AqH8gzbChtffkfEHe9I/ACRdXvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E9fTe9Uxcsp2Qo1tTzelBCNqjCXMObuYHr6Msd5NLT5aIJCQz2AsU7c4IL0QkyE2L
 eI04VMP89ScgaNzci5tChhi+XD6JBXjcUBNA/hoLXe7RC8Yzh/t+XqOEc14xdZ5tJC
 eXU2NDu+LqTalpXVAzB3xBBwS6GIdw2+bWm/f1TQ=
X-Riseup-User-ID: A2AFB4173E524308130FAA959A7DFA410AB223EF0AFBFD950DBA9C9ABDD1BB20
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4KwXYN5tRtz5vsl;
 Sat,  7 May 2022 09:13:44 -0700 (PDT)
From: Rufus Segar <rhs@riseup.net>
To: buildroot@buildroot.org
Date: Sat,  7 May 2022 17:13:38 +0100
Message-Id: <20220507161338.2125859-2-rhs@riseup.net>
In-Reply-To: <20220507161338.2125859-1-rhs@riseup.net>
References: <20220507161338.2125859-1-rhs@riseup.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package: add kdmx target and host packages
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
Cc: Rufus Segar <rhs@riseup.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Rufus Segar <rhs@riseup.net>
---
 package/Config.in           |  1 +
 package/Config.in.host      |  1 +
 package/kdmx/Config.in      | 12 ++++++++++++
 package/kdmx/Config.in.host | 12 ++++++++++++
 package/kdmx/kdmx.mk        | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 package/kdmx/Config.in
 create mode 100644 package/kdmx/Config.in.host
 create mode 100644 package/kdmx/kdmx.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..9adaf4c5a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -105,6 +105,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
 	source "package/iozone/Config.in"
+	source "package/kdmx/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
 	source "package/ktap/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index cd1c34b5a3..9bb5f0587f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -45,6 +45,7 @@ menu "Host utilities"
 	source "package/jh71xx-tools/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
+	source "package/kdmx/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
 	source "package/lld/Config.in.host"
diff --git a/package/kdmx/Config.in b/package/kdmx/Config.in
new file mode 100644
index 0000000000..af338e6bda
--- /dev/null
+++ b/package/kdmx/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_KDMX
+	bool "kdmx"
+	help
+	  kdmx is a program designed to split GDB packets and other
+	  trafic coming from a target on a serial line into 2 separate
+	  pseudo-ttys.
+
+	  The most common use of this is to run kgdb and console on a
+	  single serial port, but should be usable for alternating
+	  gdbserver or console over a serial line as well.
+
+	  git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
diff --git a/package/kdmx/Config.in.host b/package/kdmx/Config.in.host
new file mode 100644
index 0000000000..5080659171
--- /dev/null
+++ b/package/kdmx/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_KDMX
+	bool "host kdmx"
+	help
+	  kdmx is a program designed to split GDB packets and other
+	  trafic coming from a target on a serial line into 2 separate
+	  pseudo-ttys.
+
+	  The most common use of this is to run kgdb and console on a
+	  single serial port, but should be usable for alternating
+	  gdbserver or console over a serial line as well.
+
+	  git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
diff --git a/package/kdmx/kdmx.mk b/package/kdmx/kdmx.mk
new file mode 100644
index 0000000000..42e17003b0
--- /dev/null
+++ b/package/kdmx/kdmx.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# kdmx
+#
+################################################################################
+
+KDMX_VERSION = agent-proxy-1.97
+KDMX_SITE = git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
+KDMX_LICENSE = GPL-2.0+
+KDMX_LICENSE_FILES = COPYING
+
+define KDMX_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/kdmx
+endef
+
+define KDMX_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/kdmx/kdmx $(STAGING_DIR)/usr/bin
+endef
+
+define KDMX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/kdmx/kdmx $(TARGET_DIR)/usr/bin
+endef
+
+define HOST_KDMX_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/kdmx
+endef
+
+define HOST_KDMX_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(INSTALL) -D -m 0755 $(@D)/kdmx/kdmx $(HOST_DIR)/bin
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
