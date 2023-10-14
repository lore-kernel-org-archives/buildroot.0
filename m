Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682CBCDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 21:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5A1F81F53;
	Sat, 14 Oct 2023 21:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A1F81F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4_-Bus5sEBE; Sat, 14 Oct 2023 21:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E8181F4D;
	Sat, 14 Oct 2023 21:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6E8181F4D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA7121BF83E
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 21:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A39BD409AA
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 21:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A39BD409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2SQl6cfNixX for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 21:57:47 +0000 (UTC)
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B3AE4094E
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 21:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B3AE4094E
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rmdiq6C0m6PZFrmdjqeJje; Sat, 14 Oct 2023 23:57:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Oct 2023 23:57:40 +0200
Message-Id: <20231014215741.716289-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231014215741.716289-1-giulio.benetti@benettiengineering.com>
References: <20231014215741.716289-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDTBDC5btgH/FKL2LPsVUZ1Ix4HFQmX+D3+xwXEKQCtbu0GpEJmvNsHSQzwTYfX7iZXZnhUMmWiQCeP9tTPLEOOnJZyJI+DRvtkRiQGuLpb9T6PTb1Va
 KnEDeezeZZsOtpY0NS1/lGZsFIk7uj7HJtnEqUlePoPWaB4sT67EbuetIUdi5/RfNbUCfUuBM3O/Fc3la5HboFcGvXsZYwkj/vjI6syqwowrn3iSL485bcEf
 1dWEYQ17Tf9RZLYd+Tp4dOKuuL2xv/Ft4Po/Y6o47yA9/bkwLH+d4MPechnyB6/pVmkaR0oY1R9LRNs6IuS/rwHmO9Net97gQFX8vHL9Vr8QEWr5P6jva0pp
 L+y18cFu54Iu95JheFB13Qs21OhCC6nXf1nOn26XNB58d/H3dzwVKTTdzN+J+/SexgblWrfB0T4l4znB155J7lGmH8zu7Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697320663; bh=Mn7MGCGmfloqa6bLqBUJrFXysSjEDupHxP34U5z9nGQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=CW3PlxtWhm335ftAgCxgAIubLLHJjc6TvGb9FqC38ZXvhLEqKCczUQ7iZvn5nn7DJ
 BFy9Sv7F0LxiiO6tQWbPx1kfPnEnI1cb8M4zHsCx46oHws8yN1zL0vp/KUwfuag+dJ
 M1FLi3xSGNRnVcahmR2OrI6lqmFDFgkxhb65shUnvBUPegdXkVSyIgnH99rpXbsF7m
 utDKq1T2KWntR2/v3GBm+Nn5gAVvMxLwr2rdk9lYD7vtSzcoHfFa2OszSWV8K+1OOH
 ooLfiN5Rz1uwc39XW1jwqFekt4G2z0laql1pQc1w4pAfK+DGepggoFZYYLHgpgB8Xc
 JDMW10SJSGwZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CW3PlxtW
Subject: [Buildroot] [PATCH v4 3/4] package/linux-tools: add rtla
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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
V1->V2:
* fix install with recent Linux versions
V2->V3:
* deal with hwnoise presence as suggested by Yann Morin
* change Config.in comment according to the point above
---
 DEVELOPERS                                |  2 ++
 package/linux-tools/Config.in             | 10 ++++++
 package/linux-tools/linux-tool-rtla.mk.in | 40 +++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-rtla.mk.in

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c4bc87e16..8f76d471ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1223,6 +1223,7 @@ F:	package/libnss/
 F:	package/libnvme/
 F:	package/libtraceevent/
 F:	package/libtracefs
+F:	package/linux-tools/linux-tool-rtla.mk.in
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mmc-utils/
@@ -2116,6 +2117,7 @@ F:	package/timescaledb/
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
