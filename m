Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22E8CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 20:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2758242083;
	Fri, 13 Oct 2023 20:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2758242083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDmt3jEykjfe; Fri, 13 Oct 2023 20:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E82FA42092;
	Fri, 13 Oct 2023 20:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E82FA42092
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 205401BF33D
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D0E060E2E
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D0E060E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXkOmMTWKmeo for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 20:37:31 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 833BB60EF6
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 20:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 833BB60EF6
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rOuVqO37yfJOlrOuWq58gq; Fri, 13 Oct 2023 22:37:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 22:37:23 +0200
Message-Id: <20231013203724.120389-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013203724.120389-1-giulio.benetti@benettiengineering.com>
References: <20231013203724.120389-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDpXLKNZrU4ZFHdqMpKljQYE4rjw8jxdDYjrh3zo/Wtj/xxsWXZXEEZw4vxrXlEgv/U243bZn6fWGaVNYDpTgYECksvxdIdfMsl/IZwhKZMUz6tvzES7
 KOAN3UOYH9UYJXUcBUqnSgS3FBPBcUfn3OauTIEjRH3fSeWrH2boZNf3SAhiOnSgxevlzrgC53bOE+dYhPd+xbaQWOButo38o6FkLnSK0NdRgeflc1QZo6DR
 5aw1X10JAqAToA+K3UrOz3r1xpqT3Ck/yiU8XDQZC1D9iMDuI4Y79abRaPR8bGvJM20cPzRnjgFvJC37Teac7qs27g6UEXV1EnDLvLGhz+O6ciw3NjRLl1IX
 husK1u2hLHw9vjY/1jzP90/hAsXv+CKQPlGnBMHF5qomIOGP1w60zoKYHg6PPfC+V+aLB5FjNSuzyUCTzHDPnR6PGn/DxQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697229448; bh=RUPKEr28qsjnfjO3Xx+l+KU+SkyPmzrVCVZvxFobASk=;
 h=From:To:Subject:Date:MIME-Version;
 b=cytG3mcyVXNc+JCa1PxAv2BBy+oShRc8HMJgxugPx7/TwqfZU3slLcE8TKAeOI9at
 XjyRIqZZJbSHlP83Y7mZXQOzxMgns74yZvmcn0qVfLPQL6P6oj94+1VJCRXsHGgVoK
 Q6UdJbGA9tgYKhA2IrviZsFKa2i6QOPkhZ9RprU5YW3jdzG8SqwnFOjoCZnCI12TS+
 Z8OFFbzbZSYm9i4W5DJfRkq0cBydk6Bdta770yRnfmsZ+fusXgKJJlO7nhYIrZRw+6
 wHx4w51GTQMrf32XnSjBzpTelg1avedhPWGI2aTDzqW0xBiu/E2BW514g14xwOJHfL
 SX9Pb7uCy73vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=cytG3mcy
Subject: [Buildroot] [PATCH v3 3/4] package/linux-tools: add rtla
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

The RealTime Linux Analysis tool includes a set of commands that relies
on the osnoise and timerlat tracers from the ftrace kernel subsystem,
allowing to analyze the lantency sources coming from the hardware and
the kernel itself.

This tool was introduced in v5.17, and relies on libtracefs and
libtraceevent, although libtraceevent itself is already a dependency for
libtracefs.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio: fix install on recent Linux versions]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Giulio:
V1->V2:
* fix install with recent Linux versions
V2->V3:
* deal with hwnoise presence as suggested by Yann Morin
* change Config.in comment according to the point above
---
 DEVELOPERS                                |  1 +
 package/linux-tools/Config.in             | 10 ++++++
 package/linux-tools/linux-tool-rtla.mk.in | 40 +++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-rtla.mk.in

diff --git a/DEVELOPERS b/DEVELOPERS
index 8932c88953..86496f6cc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2114,6 +2114,7 @@ F:	package/timescaledb/
 N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	package/libtraceevent/
 F:	package/libtracefs
+F:	package/linux-tools/linux-tool-rtla.mk.in
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 451b0eeff5..4df73159be 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -102,6 +102,16 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
 
 endif
 
+config BR2_PACKAGE_LINUX_TOOLS_RTLA
+	bool "rtla"
+	select BR2_PACKAGE_LINUX_TOOLS
+	select BR2_PACKAGE_LIBTRACEFS
+	help
+	  Linux 5.19 and later has 2 new tracers, osnoise and timerlat.
+	  Linux 6.3 has new tracer hwnoise. These tracers allow performing
+	  latency analysis, for which the rtla tool provides wrapper
+	  commands to visualize and extract latency traces and reports.
+
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
new file mode 100644
index 0000000000..04b98f443d
--- /dev/null
+++ b/package/linux-tools/linux-tool-rtla.mk.in
@@ -0,0 +1,40 @@
+################################################################################
+#
+# rtla
+#
+################################################################################
+
+LINUX_TOOLS += rtla
+
+RTLA_DEPENDENCIES = host-pkgconf libtracefs
+RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
+	CC=$(TARGET_CC) \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+
+define RTLA_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not implement the rtla tool." ; \
+		echo "At least kernel 5.19 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) \
+	$(MAKE) $(RTLA_MAKE_OPTS) \
+	-C $(LINUX_DIR)/tools/tracing rtla
+endef
+
+# make rtla_install build and install by default documentation using rst2man
+# but it's not available in Buildroot and we don't want manual files in target
+# folder so let's simply install the resulting rtla binary and create symlinks
+# like Linux does in its tools/tracing/rtla/Makefile
+define RTLA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla $(TARGET_DIR)/usr/bin
+	ln -sf rtla $(TARGET_DIR)/usr/bin/osnoise
+	ln -sf rtla $(TARGET_DIR)/usr/bin/timerlat
+
+	# Check if hwnoise is provided or not
+	if grep -q hwnoise $(LINUX_DIR)/tools/tracing/rtla/Makefile; then \
+		ln -sf rtla $(TARGET_DIR)/usr/bin/hwnoise ; \
+	fi
+endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
