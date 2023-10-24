Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBBCC00A8F
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 14:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 096F94EEF3;
	Tue, 24 Oct 2023 14:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 096F94EEF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8NVgBPNc-BJ; Tue, 24 Oct 2023 14:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E85254EF2F;
	Tue, 24 Oct 2023 14:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E85254EF2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 840F31BF2C4
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D18E400BF
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D18E400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usFM3FnEAcFo for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 14:43:11 +0000 (UTC)
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1114443305
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 14:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1114443305
Received: from localhost.localdomain ([146.241.115.208])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vIccqa0A1F9g1vIcdq3zk2; Tue, 24 Oct 2023 16:43:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 24 Oct 2023 16:42:55 +0200
Message-Id: <20231024144256.2708299-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
References: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCfqDRGTjnV0/deiU1Ci/VzCZdfyy/C1FQfEvegVYRDH+NzQSIED1KHrg3JRIYysKpx6assReImtkb+NxYJzzbXVhnPGrfwXq3JISq+F6acIvSn9YAWw
 736nMUXKYNZ4v/2rOSUXB6DnD/HE1J859TFSuvV7uvad76d9xNbJ17d4VWeA8nxmPpX1JJXDdr/qAe50ANKoeUvrZYWje+4n+XY9L5I8HztF7qGsHuO0W8Ev
 j+u7jNQqAO+tzXGhsVuZGqYxoV5BRqLN3/ImfmCbkJiAjPECyi3bLF9dCpqV7RNOX1lbuxbJlm1w8EpCEiu2sJ4xAWI+cfjBxeS2ENVXrOJHIUr1vgnHvaYC
 Mj3PcJLST7Lhl4FxgVTp7UMQbzyQ/AjfGv23rsLZcd9occPpLuVUktgUEpi+VlKo6YX5YQnan+e/spvntkGt1iQJd6gYr7JTF47uj2qzrvje71bgD3U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698158588; bh=6fbAHsAp5QAnyeV+DJ6WE2KSiikf4k+L5Ig5fli9QIk=;
 h=From:To:Subject:Date:MIME-Version;
 b=OlcDrRvW8uYhObW2hHEDw87hyuqTAuMVqVNEYd1Q5tS1LHmbQ9WK0HG2Sg/o9wosf
 MuSHSmx7+6DCfTsPsjqqjM5+IC9XpxvU58xrLgJN0CMfaem2dnLS6Dc1oQVBzNFjAi
 N9Vp/P5E1Y9kyU1o7C79ACHrKVnnjmGGkmjVmxQoO//QQPCrVUCzNA0aKJaf3s4gj4
 vTy/GOstuH7ECNFY39ca2Y786yUmayOTvru1WOPJH/yUARfiawvlhCOKZ2chbAzLpc
 TH1xAjNMZGkVk1PuVhVj6IEB4gerYCHilKXzfv6njDLIycfXcXubEYFlWJSJXkPqdP
 YKXh6chWnOyNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OlcDrRvW
Subject: [Buildroot] [PATCH v5 3/4] package/linux-tools: add rtla
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

The RealTime Linux Analysis tool includes a set of commands that relies
on the osnoise and timerlat tracers from the ftrace kernel subsystem,
allowing to analyze the lantency sources coming from the hardware and
the kernel itself.

This tool was introduced in v5.17 but until v5.19 it relied on libprocps
that has been deprecated soon. So let's make it available for v5.19+.
Rtla relies on libtracefs and libtraceevent, although libtraceevent itself
is already a dependency for libtracefs.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio: fix install on recent Linux versions]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Andreas: deal with Linux Fixups, musl, SSP]
Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
V1->V2:
* fix install with recent Linux versions
V2->V3:
* deal with hwnoise presence as suggested by Yann Morin
* change Config.in comment according to the point above
V4->V5:
Suggested by Andreas Ziegler:
* improved commit log to explain why we support the package with Linux
  5.19+
* added Linux Fixups
* added -D_GNU_SOURCE to build with musl
* added SSP workaround
---
 DEVELOPERS                                |  2 +
 package/linux-tools/Config.in             | 10 +++++
 package/linux-tools/linux-tool-rtla.mk.in | 55 +++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-rtla.mk.in

diff --git a/DEVELOPERS b/DEVELOPERS
index 09af18c54c..f9776fdaad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1227,6 +1227,7 @@ F:	package/libnss/
 F:	package/libnvme/
 F:	package/libtraceevent/
 F:	package/libtracefs
+F:	package/linux-tools/linux-tool-rtla.mk.in
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mmc-utils/
@@ -2120,6 +2121,7 @@ F:	package/timescaledb/
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
index 0000000000..603d86722d
--- /dev/null
+++ b/package/linux-tools/linux-tool-rtla.mk.in
@@ -0,0 +1,55 @@
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
+	EXTRA_CFLAGS="-D_GNU_SOURCE" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+define RTLA_DISABLE_STACK_PROTECTOR
+	$(SED) 's/-fstack-protector.* //' $(LINUX_DIR)/tools/tracing/rtla/Makefile
+endef
+endif
+
+define RTLA_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERLAT_TRACER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HIST_TRIGGERS)
+endef
+
+define RTLA_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not implement the rtla tool." ; \
+		echo "At least kernel 5.19 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(RTLA_DISABLE_STACK_PROTECTOR)
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
