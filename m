Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE622E7D26A
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 09:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7486360E97;
	Tue, 26 Sep 2023 09:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7486360E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7BgpsdlnKcp; Tue, 26 Sep 2023 09:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA74F60A81;
	Tue, 26 Sep 2023 09:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA74F60A81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBD571BF2A6
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B25CA40538
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B25CA40538
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YlwdFle676b for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 09:12:04 +0000 (UTC)
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96AB54042D
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 09:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96AB54042D
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id l46pqeQaNDAHrl46qqH9UW; Tue, 26 Sep 2023 11:12:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 11:11:57 +0200
Message-Id: <20230926091158.3767645-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926091158.3767645-1-giulio.benetti@benettiengineering.com>
References: <20230926091158.3767645-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOv1FuaCKyh6FlXHwcAkBphtIY7i6wu2Ny3O/TuDIEiTKTqbM30VwVvPdKdAB56SnoCbBOxE3g1W5S8cPm5L8+883txGn9x/7gVNupa55IC0yZJBgel8
 +gTgD482XnJxCv9bp9yghZVd+zWl1545v3Zog4zmhaJXTGdK2wumdi9YOH7iWRwzxEfC1tQ8BSnPR+dJtrkVGQSGzAHDbzirO4RpEY1ird92N9VOTqQTu3vV
 AfVtyK0cgAC4lGizVLUasEoWhYnn9fhIMvwswLivjcDDRcs7ZBWRm2xBdqewXZ87b++dlhxsuKAL6KLWHWEyPMylSvveG6Xdme25d/9zIYBnUhIwXsy65f0D
 0k+rvAe4PGp6yqun38Y4iHZQP8984p566nZ+yrTAFCIOVKobFwHJsVU/6ntJyf4gTmjvLdWxL1wejklA5PSijymS+45Qtg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695719520; bh=11H0+T7S4X6PrvZGCfe+Yk5G2f5dOaUlq2t3RMg6rYE=;
 h=From:To:Subject:Date:MIME-Version;
 b=GzUXGFr520E2hxs4yLbpU3VndtlyVDfbBHiNvLgsaliV6IAAJFGiiwIiLwyrp8Aqw
 wiwnxuzJkPEqyQq7SwQXXaBRUp25cEkoqR1aHyaTYFfz2JCd7w427RLF6OmcoL0riV
 Dc71CtcF5O+V6WIDbON0UArTYYc7UNPbz7u1+FBnQfryDc0oCcH51Q4njcDteFl8Ut
 VCKFhT70ckNg90UxC+105E3f5oCwNAdVb1C0OkUAtkPm5HvqWofLM6B1Pm/hGKzqJW
 O0AidAfWBYDzg0kaCe5e2j0sEEHV4LIdh9c9014zmM91+G27XwNiRdHU9N10VmrfxZ
 qnozDb/s1wTJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=GzUXGFr5
Subject: [Buildroot] [PATCH v2 3/4] package/linux-tools: add rtla
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
[Giulio: fix install with recent Linux versions]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Giulio:
V1->V2:
* fix install with recent Linux versions
---
 DEVELOPERS                                |  1 +
 package/linux-tools/Config.in             | 10 +++++++
 package/linux-tools/linux-tool-rtla.mk.in | 36 +++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-rtla.mk.in

diff --git a/DEVELOPERS b/DEVELOPERS
index 835c269461..31bfc67c8a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2099,6 +2099,7 @@ F:	package/timescaledb/
 N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	package/libtraceevent/
 F:	package/libtracefs
+F:	package/linux-tools/linux-tool-rtla.mk.in
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 451b0eeff5..63e2796e45 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -102,6 +102,16 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
 
 endif
 
+config BR2_PACKAGE_LINUX_TOOLS_RTLA
+	bool "rtla"
+	select BR2_PACKAGE_LINUX_TOOLS
+	select BR2_PACKAGE_LIBTRACEFS
+	help
+	  Linux 5.17 and later has 2 new tracers, osnoise and timerlat.
+	  There tracers allow performing latency analysis, for which
+	  the rtla tool provides wrapper commands to visualize and
+	  extrace latency traces and reports.
+
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
new file mode 100644
index 0000000000..a14571bb1c
--- /dev/null
+++ b/package/linux-tools/linux-tool-rtla.mk.in
@@ -0,0 +1,36 @@
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
+		echo "At least kernel 5.17 must be used." ; \
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
+	ln -sf rtla $(TARGET_DIR)/usr/bin/hwnoise
+	ln -sf rtla $(TARGET_DIR)/usr/bin/timerlat
+endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
