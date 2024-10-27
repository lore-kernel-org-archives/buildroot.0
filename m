Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB66AD10C15
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 10:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31D4080CFE;
	Sun, 27 Oct 2024 10:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68SM2fJoP_kT; Sun, 27 Oct 2024 10:29:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DB9880B6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DB9880B6E;
	Sun, 27 Oct 2024 10:29:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB6D971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E376E80591
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcKSX4ACaEoE for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 10:29:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A409880B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A409880B6E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A409880B6E
 for <buildroot@busybox.net>; Sun, 27 Oct 2024 10:29:03 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42f6bec84b5so35265455e9.1
 for <buildroot@busybox.net>; Sun, 27 Oct 2024 03:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730024941; x=1730629741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W1fP/ozQCu+Ym0qcJrvKe5MjNMBt5bKSGtSj6XKUeAE=;
 b=KZ4ujCsqf5o/dZRjsq8GVHYduMeYiWRvn0yQ4TUbZIrpI287Vp2tX2aQ93l0oWupfT
 QlAeyYYM5UO1unaszufaJuvmWBT1hCRGD4asL21GLhrnKNjBIiNTa0H3prZM06ncoEZg
 SBUB8Fh3/fU5rRSggtpZzKt4AndZyzJCbgfI+Mhzm0J8oDbkru2Xjbc3p5z1tSa5oI2l
 SILhWzoA/T8HQRshjcOl2gWx6DAlg8IYwew1O5WLzq0tIM5TNhs2sFbk2gR2+8Qj4Pu/
 Z/Wa8cba8HNDV13Ye7g4vcwNSgxvD7qMUS+ICNf1XVLAzOVfu64gdmvw4kxE3G0xi0m5
 XhfQ==
X-Gm-Message-State: AOJu0Yy4mk0q+AQVKrw4+1goPHIjV1qvGohoQfDIIsJ74v1fGsCAWLU9
 rxlzruLRfjovZpmun0l2ZK7HFdJ+6mSGyPhRSQtDutilQ8KKu63N1Y2fVDp0OipLOmpHrD0n+w/
 Hcw==
X-Google-Smtp-Source: AGHT+IG3tM6pqGjhvgLNkv54dSO2y6jDk2QOQ9F0U6wyU2f17AmAGaKhRVbQLpOKJkjDm5VmjSti+A==
X-Received: by 2002:a05:600c:1d06:b0:42e:d4a2:ce67 with SMTP id
 5b1f17b1804b1-4319acb200bmr49755645e9.17.1730024940708; 
 Sun, 27 Oct 2024 03:29:00 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b1c645sm6455691f8f.17.2024.10.27.03.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 03:29:00 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 27 Oct 2024 11:28:26 +0100
Message-ID: <20241027102827.899852-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027102827.899852-1-francois.perrad@gadz.org>
References: <20241027102827.899852-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1730024941; x=1730629741; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W1fP/ozQCu+Ym0qcJrvKe5MjNMBt5bKSGtSj6XKUeAE=;
 b=HXiuxL62/xya68b85vQQmh9l6M3Bz1XdO/DYfzlduKiAOLu/jaSpaA10ooPQYUwcYU
 CgdPK5ZxEnRfFnCQ7Npr47z4uwyPBcbUJ0dB+bGF1+p7qvQKGSUjPXWmuo7m/1j0U1bF
 WvfdjN8aAud3Jphn/3zXJPRte6vTLgLjXBATge9dWa7cFOvI/S6Bul2SD8jzxOqi6MAg
 6wBqj5HVCWCXhY/pGEqIu4Td+4niCm+fP+s2BdJY/uOaMhO+zwBbIOLq0Dd7fPKxyGIS
 SKnuAMI2sFfEMYJ6Q1h9VZjcTRe3328ahC4RGdOO2XgoI85/NMbreHw44yv8Mk8++bl5
 IMFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=HXiuxL62
Subject: [Buildroot] [PATCH v3 2/2] package/lynis: new package
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                  |  1 +
 package/Config.in                           |  1 +
 package/lynis/Config.in                     | 10 +++++
 package/lynis/lynis.hash                    |  3 ++
 package/lynis/lynis.mk                      | 48 +++++++++++++++++++++
 support/testing/tests/package/test_lynis.py | 26 +++++++++++
 6 files changed, 89 insertions(+)
 create mode 100644 package/lynis/Config.in
 create mode 100644 package/lynis/lynis.hash
 create mode 100644 package/lynis/lynis.mk
 create mode 100644 support/testing/tests/package/test_lynis.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 8755ec77a..b51bdc95f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1167,6 +1167,7 @@ F:	package/lpty/
 F:	package/lrandom/
 F:	package/lsqlite3/
 F:	package/lua*
+F:	package/lynis/
 F:	package/lzlib/
 F:	package/moarvm/
 F:	package/mstpd/
diff --git a/package/Config.in b/package/Config.in
index 6cd49afe3..adc675845 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2701,6 +2701,7 @@ menu "Security"
 	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
 	source "package/ima-evm-utils/Config.in"
+	source "package/lynis/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
 	source "package/optee-test/Config.in"
diff --git a/package/lynis/Config.in b/package/lynis/Config.in
new file mode 100644
index 000000000..2757e86a2
--- /dev/null
+++ b/package/lynis/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LYNIS
+	bool "lynis"
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_GZIP  # runtime (zgrep /proc/config.gz)
+	help
+	  Lynis is an auditing tool which tests and gathers (security)
+	  information from Unix based systems.
+	  Written in shell and running on system itself.
+
+	  https://cisofy.com/lynis/
diff --git a/package/lynis/lynis.hash b/package/lynis/lynis.hash
new file mode 100644
index 000000000..b5bc550eb
--- /dev/null
+++ b/package/lynis/lynis.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b0ed01d30a4415beb78acc47867f8e0779c9966d4febc5f4a31594ba2a0bd44d  lynis-3.1.2.tar.gz
+sha256  57151f0fa287550534af08facb1c6693ca803ffa65b512da38b55c3130810bcf  LICENSE
diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
new file mode 100644
index 000000000..2dca13bc1
--- /dev/null
+++ b/package/lynis/lynis.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# lynis
+#
+################################################################################
+
+LYNIS_VERSION = 3.1.2
+LYNIS_SITE = $(call github,CISOfy,lynis,$(LYNIS_VERSION))
+LYNIS_LICENSE = GPL-3.0
+LYNIS_LICENSE_FILES = LICENSE
+
+define LYNIS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/lynis \
+		$(TARGET_DIR)/usr/sbin/lynis
+	$(INSTALL) -D -m 0644 $(@D)/default.prf \
+		$(TARGET_DIR)/etc/lynis/default.prf
+	$(INSTALL) -D -m 0644 $(@D)/developer.prf \
+		$(TARGET_DIR)/etc/lynis/developer.prf
+	$(INSTALL) -D -m 0644 $(@D)/plugins/* \
+		-t $(TARGET_DIR)/etc/lynis/plugins
+	$(INSTALL) -D -m 0644 $(@D)/include/* \
+		-t $(TARGET_DIR)/usr/share/lynis/include
+	$(INSTALL) -D -m 0644 $(@D)/db/*.db \
+		-t $(TARGET_DIR)/usr/share/lynis/db
+	$(INSTALL) -D -m 0644 $(@D)/db/languages/en \
+		$(TARGET_DIR)/usr/share/lynis/db/languages/en
+endef
+
+ifneq ($(BR2_PACKAGE_GAWK),y)
+define LYNIS_AWK_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AWK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_AWK_LIBM)
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_COREUTILS),y)
+define LYNIS_STAT_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_STAT)
+endef
+endif
+
+define LYNIS_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PGREP)
+	$(LYNIS_AWK_BUSYBOX_CONFIG_FIXUPS)
+	$(LYNIS_STAT_BUSYBOX_CONFIG_FIXUPS)
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_lynis.py b/support/testing/tests/package/test_lynis.py
new file mode 100644
index 000000000..bed4023e6
--- /dev/null
+++ b/support/testing/tests/package/test_lynis.py
@@ -0,0 +1,26 @@
+import os
+
+import infra.basetest
+
+
+class TestLynis(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_LYNIS=y
+        """
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("which awk")
+        self.assertRunOk("which stat")
+        self.assertRunOk("which zgrep")
+        self.assertRunOk("lynis show version", timeout=90)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
