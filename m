Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FE6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 10:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E60C741A5A;
	Fri, 22 Apr 2022 10:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRKtiibMADX5; Fri, 22 Apr 2022 10:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7424D41A4C;
	Fri, 22 Apr 2022 10:16:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66D191BF281
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 10:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6023841A4C
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 10:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2R2c_pEEjHm for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 10:15:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F23D241A2F
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 10:15:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 38603C4399
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 10:09:33 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17DDD1BF210;
 Fri, 22 Apr 2022 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650622167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=D+yhOlxkbAobSny5cderLrRY/BzxoF+UwVCHAF12cK4=;
 b=KdBfyBMiPqRcDpKOsf/YP3KYs1Ng/76YZJUzaGxUHO2jvJjmie9YiItX0SHzutdZ/6ZSm4
 OihV4ukjqnRtcx9chbcY/KcinNQR/0+qjUOhir3i/JbYItbNAq+Q0skzLI3+ZNANellgul
 gV5jb68IEXCmccc1q2pN4dVBSZrQGLOFUnG1jzIISmdf9yGX6FUm7MlrnwJnDHcQSfEb3h
 dtN4hVTE6r1rz9lHRish+HrbKvICb8hPQxBMnM+6TbmjRs5iDBbrJg6k6QYgzLegp132gC
 hUkK6XK+4+ATbxwEKVeSCI2O9Vk2CZZgMMLOMc0O6gxlpX1nO3bBLXpMWdhjuQ==
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 12:09:18 +0200
Message-Id: <20220422100918.2818811-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/imx-cst: new package
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
From: Thomas Perrot via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides i.MX Code Signing Tools uses to sign i.MX bootloader
to enable secure boot (HABv4 and AHAB).

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---

Changes v2:
  - Add a trailing slash
  - Preserve CFLAGS and LDFLAGS

Changes v3:
  - Hard code the OSTYPE variable to linux64

 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/imx-cst/Config.in.host |  8 +++++++
 package/imx-cst/imx-cst.hash   |  3 +++
 package/imx-cst/imx-cst.mk     | 43 ++++++++++++++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/imx-cst/Config.in.host
 create mode 100644 package/imx-cst/imx-cst.hash
 create mode 100644 package/imx-cst/imx-cst.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6e49334dcc42..86cb04e54e5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2767,6 +2767,7 @@ F:	package/xorcurses/

 N:	Thomas Perrot <thomas.perrot@bootlin.com>
 F:	package/byacc/
+F:	package/imx-cst/

 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
diff --git a/package/Config.in.host b/package/Config.in.host
index cd1c34b5a3d9..282594b40b8d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -40,6 +40,7 @@ menu "Host utilities"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
+	source "package/imx-cst/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jh71xx-tools/Config.in.host"
diff --git a/package/imx-cst/Config.in.host b/package/imx-cst/Config.in.host
new file mode 100644
index 000000000000..84cb825e59cf
--- /dev/null
+++ b/package/imx-cst/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_IMX_CST
+	bool "host imx-cst"
+	help
+	  I.MX code signing tool provides software code signing
+	  support designed that integrate the HABv4 and AHAB
+	  library.
+
+	  https://www.nxp.com/webapp/sps/download/license.jsp?colCode=IMX_CST_TOOL
diff --git a/package/imx-cst/imx-cst.hash b/package/imx-cst/imx-cst.hash
new file mode 100644
index 000000000000..9c27bfe82038
--- /dev/null
+++ b/package/imx-cst/imx-cst.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2bcc03c7cedba58f7207a72a28e75cfe78007988d68c1095c793cce991c2936e  imx-cst-e2c687a856e6670e753147aacef42d0a3c07891a-br1.tar.gz
+sha256  5dee6f54c636a97b15d7e9dfc8075248c36764b3819828cbc94cbd17c1755fb9  LICENSE.bsd3
diff --git a/package/imx-cst/imx-cst.mk b/package/imx-cst/imx-cst.mk
new file mode 100644
index 000000000000..120f9c5575e1
--- /dev/null
+++ b/package/imx-cst/imx-cst.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# imx-cst
+#
+################################################################################
+
+# debian/3.3.1+dfsg-2
+IMX_CST_SITE = https://gitlab.apertis.org/pkg/imx-code-signing-tool.git
+IMX_CST_SITE_METHOD = git
+IMX_CST_VERSION = e2c687a856e6670e753147aacef42d0a3c07891a
+IMX_CST_LICENSE = BSD-3-Clause
+IMX_CST_LICENSE_FILES = LICENSE.bsd3
+
+HOST_IMX_CST_DEPENDENCIES = host-byacc host-flex host-openssl
+
+# We don't use HOST_CONFIGURE_OPTS when building cst, because we need
+# to preserve the CFLAGS/LDFLAGS used by their Makefile.
+define HOST_IMX_CST_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) \
+		OSTYPE=linux64 \
+		ENCRYPTION=yes \
+		AR="$(HOSTAR)" \
+		CC="$(HOSTCC)" \
+		LD="$(HOSTCC)" \
+		OBJCOPY="$(HOSTOBJCOPY)" \
+		RANLIB="$(HOSTRANLIB)" \
+		EXTRACFLAGS="$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
+		EXTRALDFLAGS="$(HOST_LDFLAGS)" \
+		PWD=$(@D)/code/cst \
+		-C $(@D)/code/cst \
+		build
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		COPTS="$(HOST_CFLAGS) $(HOST_CPPFLAGS) $(HOST_LDFLAGS)" \
+		-C $(@D)/code/hab_csf_parser
+endef
+
+define HOST_IMX_CST_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/code/cst/code/obj.linux64/cst $(HOST_DIR)/bin/cst
+	$(INSTALL) -D -m 755 $(@D)/code/cst/code/obj.linux64/srktool $(HOST_DIR)/bin/srktool
+	$(INSTALL) -D -m 755 $(@D)/code/hab_csf_parser/csf_parser $(HOST_DIR)/bin/csf_parser
+endef
+
+$(eval $(host-generic-package))
--
2.35.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
