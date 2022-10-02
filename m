Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206F7C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 15:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 783B6409A9;
	Sun,  2 Oct 2022 15:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 783B6409A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_d1suKppWR6; Sun,  2 Oct 2022 15:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 280A6408AE;
	Sun,  2 Oct 2022 15:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 280A6408AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60D291BF3C3
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 15:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3713D408AE
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 15:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3713D408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRryvRacNUnn for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 15:04:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB1C44089C
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB1C44089C
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 15:04:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id e18so5613872wmq.3
 for <buildroot@buildroot.org>; Sun, 02 Oct 2022 08:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=jrTQ4YhOJ25tD/yS9T6g7PwVWZVwuJkiOYFnUGdJwm8=;
 b=cCW/Jn7lIYmgT5nlz8zTyEsL7H3CqtR3lUsNEc1Cl+P+TTAERS7bD+eNzOA972jXAe
 ux72tMy3B8desRgaF4BMMDUaxeeXLgcgM5Jaj6EcSOhVj+ZpkTAqPtc16FUm5XXdJyLJ
 VMC27t65N64SobzQCBwSv96nxSxE3gJFmLifpbtTRaZxGjytga1MgnpFJughWsB82p84
 G66gzeHTwDcmf/wFEWe2pwh663mBhzOoUcEzsb3aOR3c5ASSCbD7yxcXeMXMAqn4E9Vf
 dRJ9MFHzcePz+YrUTr/j7Cp1PUzFC3iJ3bKHwzdyFx3UQeDrfi7XnA0s8X6XKTPGzBD4
 Go3Q==
X-Gm-Message-State: ACrzQf3SAcceHNCej7a55MFYJjf5rZaMNC6z+LHLa/HFN8U+zeNNY/aj
 gNAgeBP7coZT2XV1OQjHzPprqneOh7s=
X-Google-Smtp-Source: AMsMyM6BVVh5ic5rXqD4qDfLKLmTzWxWrs73mZ7Jb3AUxPIb9Y/geAE5Rq2+7hgQVQA7F5+hD2dreA==
X-Received: by 2002:a05:600c:3d93:b0:3b4:c28f:6a2b with SMTP id
 bi19-20020a05600c3d9300b003b4c28f6a2bmr4430513wmb.121.1664723086494; 
 Sun, 02 Oct 2022 08:04:46 -0700 (PDT)
Received: from fedora.. (dh207-98-21.xnet.hr. [88.207.98.21])
 by smtp.googlemail.com with ESMTPSA id
 l6-20020a5d5606000000b00228d52b935asm7732756wrv.71.2022.10.02.08.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 08:04:46 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Oct 2022 17:04:43 +0200
Message-Id: <20221002150443.159058-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=jrTQ4YhOJ25tD/yS9T6g7PwVWZVwuJkiOYFnUGdJwm8=;
 b=SEXx5Omd7e2xSvVoCyEpcTQd1ckP4/TmWxYwC6a+/MNNkABKGyDAAkZlPrIOCnNwx2
 FCIlGAbsu0ZLtGNw1RFwtyngIOlp7NKAvp0aUH1aFySTggpDgqBd4YNKMnu+VlwZpb1I
 kEBc4UES28uqPa/TT4eeptK35J1pXFma/b1Wgx1Ka4qiuZjm6NbSfXiNzMPzG69TpaXA
 vcaJHjtoZoxiPq9bWXKI8vTbo8d1gEKWeXvaJgHhecqxyGVWTtx6jHQsF9WgsZhHrWxo
 fSbnz631aNruJ5z5XCTFRwMzKxvb2UBOYa7gwscC1RugwPAh5caSAkXDy6tS7KBD0pof
 frxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SEXx5Omd
Subject: [Buildroot] [PATCH v2] package/mdio-tools: new package
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
Cc: Robert Marko <robimarko@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mdio-tools are kernel module and accompanying tools for low-level
debugging of devices attached on MDIO bus like PHY-s, switches etc.

Userspace tools provide C22 or C45 reads and writes, benchmarking
and even dedicated Marvell Link Street tools via the included
kernel module.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
* Correct license
* Add host-pkgconf to DEPENDENCIES
* Add minimal required kernel config options
---
 package/Config.in                  |  1 +
 package/mdio-tools/Config.in       |  9 +++++++++
 package/mdio-tools/mdio-tools.hash |  3 +++
 package/mdio-tools/mdio-tools.mk   | 20 ++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/mdio-tools/Config.in
 create mode 100644 package/mdio-tools/mdio-tools.hash
 create mode 100644 package/mdio-tools/mdio-tools.mk

diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..ed41e8bdd4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -536,6 +536,7 @@ endmenu
 	source "package/mbpfan/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/mdevd/Config.in"
+	source "package/mdio-tools/Config.in"
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
new file mode 100644
index 0000000000..feb1e825ac
--- /dev/null
+++ b/package/mdio-tools/Config.in
@@ -0,0 +1,9 @@
+comment "mdio-tools needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_MDIO_TOOLS
+	bool "mdio-tools"
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_LIBMNL
+	help
+	  Low-level debug tools for MDIO devices
diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
new file mode 100644
index 0000000000..0111165f27
--- /dev/null
+++ b/package/mdio-tools/mdio-tools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106  mdio-tools-1.2.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
new file mode 100644
index 0000000000..308a23824b
--- /dev/null
+++ b/package/mdio-tools/mdio-tools.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# mdio-tools
+#
+################################################################################
+
+MDIO_TOOLS_VERSION = 1.2.0
+MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
+MDIO_TOOLS_LICENSE = GPL-2.0
+MDIO_TOOLS_LICENSE_FILES = COPYING
+MDIO_TOOLS_DEPENDENCIES = host-pkgconf libmnl
+
+MDIO_TOOLS_MODULE_SUBDIRS = kernel
+define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
+endef
+
+$(eval $(kernel-module))
+$(eval $(autotools-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
