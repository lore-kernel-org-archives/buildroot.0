Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6286DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 09:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F06F4424A7;
	Tue, 19 Apr 2022 09:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QzcIglPlVPL9; Tue, 19 Apr 2022 09:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994FB41855;
	Tue, 19 Apr 2022 09:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71C1C1BF299
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FCDD831D6
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gp_WSBf7kavq for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 09:22:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37AB4842D1
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:22:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 676C2C235B
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:22:07 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D237EE000F;
 Tue, 19 Apr 2022 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650360123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdLc7DasBSl/IkFXrb9j+Cvbjp4lS4WUG+ZqUM104S4=;
 b=St4jwCC+vLZfHBVsdtIcKkmovDOHLf01AwWVnNpdevGbcd4OeQF/Z/xN3y3dgoTC0+v6/f
 Ll9xSddnI9zXKMq9u/FORBYyv87DNNxUgvopreGYXnNcLiZaNKOsEUkzLo/wFcI4w23oU1
 DtBzxAn/LcCTL3xKmxWUq3fpWOkMmSjEXEKfFCSpVdKalGNgvgV+J11y6birBfi64ixjzA
 o7hMwN8RS8ZKpaq0M5+HndvBnGePPrdkGQxBq5ZMYAWBRYff1wiOyiku8tdR7yPwsCp+GQ
 EHdYthTPMKDQjZqHsRIP15WOOwJIOiCPYeKqTt/B6Paz5LqSOYfQJfi9CyKmDA==
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 11:21:51 +0200
Message-Id: <20220419092151.91638-3-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419092151.91638-1-thomas.perrot@bootlin.com>
References: <20220419092151.91638-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/imx-cst: add new package
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
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/imx-cst/Config.in.host |  8 +++++++
 package/imx-cst/imx-cst.hash   |  3 +++
 package/imx-cst/imx-cst.mk     | 42 ++++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/imx-cst/Config.in.host
 create mode 100644 package/imx-cst/imx-cst.hash
 create mode 100644 package/imx-cst/imx-cst.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e26cee2d776a..ce744986a573 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2767,6 +2767,7 @@ F:	package/xorcurses/
 
 N:	Thomas Perrot <thomas.perrot@bootlin.com>
 F:	package/byacc
+F:	package/imx-cst
 
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
index 000000000000..453d1e5a9c4d
--- /dev/null
+++ b/package/imx-cst/imx-cst.mk
@@ -0,0 +1,42 @@
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
+define HOST_IMX_CST_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		OSTYPE=linux64 \
+		ENCRYPTION=yes \
+		COPTIONS="$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS) -lcrypto" \
+		PWD=$(@D)/code/cst \
+		CC="$(CC) -I../../code/common/hdr \
+			-I../../code/back_end/hdr \
+			-I../../code/srktool/hdr \
+			-I../../code/front_end/hdr \
+			-I../../code/convlb/hdr" \
+		LD=$(CC) \
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
