Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26289C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 08:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA29B83449;
	Wed, 20 Apr 2022 08:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FFOPplY0JNqA; Wed, 20 Apr 2022 08:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C977483227;
	Wed, 20 Apr 2022 08:39:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3A1B1BF319
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E177282BC3
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXLljIBDFQvN for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 08:39:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A95E782B3E
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 08:39:34 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 564B5E0012;
 Wed, 20 Apr 2022 08:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650443973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbF6Rvf8drEGueuJ7GmB4ZUNWFI0Kc6/22bkIuA9CfY=;
 b=dFF/K9JTrmfn54daqKScu46Ra7+yvEB6omGlD2ZDBccLrldlN+4gNs0Oy5jmo20Mrvn3Ji
 0qXEx1oTQJuY1O+YPNn0hJU4Bvwsb7mv2mmqi1KKapU6dY3O/H/DHN0M9p+qA+VaoJNDzg
 Z7vpakGvuSEm5qP2mbx/sEnnEQpq3qNyihBiGXih5vxtRbUSYNHhZPR42tNL15dk7Y9B5D
 CvSF1qqgqaqHyEdUzrZpcZEzcrAC83NTTUIf7pbr4llzqMOt9hsHREZgQ4tiivQF249PuW
 W3VNi644P/GPr9/wIVe/XrWemx4kEAkEKJJd25A5QSlchyi7W4/fdwDpqMd9XA==
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 10:39:23 +0200
Message-Id: <20220420083923.3875405-2-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420083923.3875405-1-thomas.perrot@bootlin.com>
References: <20220420083923.3875405-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/imx-cst: new package
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
- - Add a trailing slash
  - Preserve CFLAGS and LDFLAGS

 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/imx-cst/Config.in.host |  8 ++++++
 package/imx-cst/imx-cst.hash   |  3 +++
 package/imx-cst/imx-cst.mk     | 49 ++++++++++++++++++++++++++++++++++
 5 files changed, 62 insertions(+)
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
index 000000000000..c91dfb602cbf
--- /dev/null
+++ b/package/imx-cst/imx-cst.mk
@@ -0,0 +1,49 @@
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
+ifneq ($(filter %64,$(HOSTARCH)),)
+HOST_IMX_CST_OSTYPE = linux64
+else
+HOST_IMX_CST_OSTYPE = linux32
+endif
+
+# We don't use HOST_CONFIGURE_OPTS when building cst, because we need
+# to preserve the CFLAGS/LDFLAGS used by their Makefile.
+define HOST_IMX_CST_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) \
+		OSTYPE=$(HOST_IMX_CST_OSTYPE) \
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
