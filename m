Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DBEC55822
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF534063A;
	Mon,  3 Aug 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1MSWkuyLN99; Mon,  3 Aug 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0907440625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785785730;
	bh=5YTQh/oh2IM1R2tELJ5FmzP9CHuSeJ2PLUKTTzsRbBc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T3iFEkJ7tFiNxwfPDRhJ81bpN2ogUch9wYlfsf2eWq8FeM/En7g0Z2Jx36WTqqNft
	 2204hQI4fCx0RQQFFvtt2vE0dDIrzdeNxvuL0bQtT1yIJIdy6We6DqH7OR/dIMP6c1
	 G+UA0C08Re1xvMbzoJ/s6RS4DOGSIPOWaQaNYFOqlAtxUMIpKcFyTb3ur18j0nwLv1
	 f97g6k9vBCnl17WD1Vndfon1lMbecnPWkFRZmlNQNx9wHcbiA+kJfvG3ruSo2LkbOc
	 pHdl125MUWEaXaYN8ng4HE8qqiJ7Iv7UFkNMhGx/+f1XuSsdcZkQaZ9FQG/TPwofOK
	 e5hNpqsnYmt2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0907440625;
	Mon,  3 Aug 2026 19:35:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C36F36E
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 331DB606B8
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC-OmfExJrth for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57FF76069F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57FF76069F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9386A8B856; Mon,  3 Aug 2026 19:34:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 21:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 287454a4e2b525dd76b16f3c6ed60a5dedd17dab
X-Git-Newrev: 72ff2ad88d6fd937da12abd4ed59a5fc10d021a0
X-Patchwork-Hint: ignore
Message-Id: <20260803193439.9386A8B856@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hare: new host package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72ff2ad88d6fd937da12abd4ed59a5fc10d021a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                  |  2 +-
 package/Config.in.host      |  1 +
 package/hare/Config.in.host | 14 ++++++++++++++
 package/hare/hare.hash      |  3 +++
 package/hare/hare.mk        | 46 +++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e7e01f3c7f..f9b3ca6278 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1185,7 +1185,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
-F:	package/harec/
+F:	package/hare*
 F:	package/janet/
 F:	package/qbe/
 F:	package/libtomcrypt/
diff --git a/package/Config.in.host b/package/Config.in.host
index df57cc0c17..595caf9e7f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -54,6 +54,7 @@ menu "Host utilities"
 	source "package/gobject-introspection/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
+	source "package/hare/Config.in.host"
 	source "package/imagemagick/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
diff --git a/package/hare/Config.in.host b/package/hare/Config.in.host
new file mode 100644
index 0000000000..a6c53b376f
--- /dev/null
+++ b/package/hare/Config.in.host
@@ -0,0 +1,14 @@
+
+config BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_RISCV_64
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_HOST_HARE
+	bool "host hare"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	help
+	  The Hare programming language
+
+	  https://harelang.org/
diff --git a/package/hare/hare.hash b/package/hare/hare.hash
new file mode 100644
index 0000000000..98aadd8909
--- /dev/null
+++ b/package/hare/hare.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  f76704920a2f457be4d2d6290dc10dcfb7319c1d1990f2305491644383466905  0.26.0.1.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare/hare.mk b/package/hare/hare.mk
new file mode 100644
index 0000000000..88662d3c20
--- /dev/null
+++ b/package/hare/hare.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# hare
+#
+################################################################################
+
+HARE_VERSION = 0.26.0.1
+HARE_SITE = https://git.sr.ht/~sircmpwn/hare/archive
+HARE_SOURCE = $(HARE_VERSION).tar.gz
+HARE_LICENSE = MPL-2.0
+HARE_LICENSE_FILES = COPYING
+
+HOST_HARE_DEPENDENCIES = host-harec host-qbe host-scdoc
+
+ifeq ($(BR2_aarch64),y)
+HOST_HARE_TARGET_ARCH = AARCH64
+else ifeq ($(BR2_RISCV_64),y)
+HOST_HARE_TARGET_ARCH = RISCV64
+else ifeq ($(BR2_x86_64),y)
+HOST_HARE_TARGET_ARCH = X86_64
+endif
+
+HOST_HARE_CONF_OPTS = \
+	ARCH=$(HOSTARCH) \
+	PREFIX="$(HOST_DIR)" \
+	HAREC="$(HOST_DIR)/bin/harec" \
+	QBE="$(HOST_DIR)/bin/qbe" \
+	SCDOC="$(HOST_DIR)/bin/scdoc" \
+	HAREPATH="$(HOST_DIR)/src/hare/stdlib" \
+	$(HOST_HARE_TARGET_ARCH)_AS=$(TARGET_AS) \
+	$(HOST_HARE_TARGET_ARCH)_CC=$(TARGET_CC) \
+	$(HOST_HARE_TARGET_ARCH)_LD=$(TARGET_LD)
+
+define HOST_HARE_CONFIGURE_CMDS
+	cp $(@D)/configs/linux.mk $(@D)/config.mk
+endef
+
+define HOST_HARE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_HARE_CONF_OPTS) all
+endef
+
+define HOST_HARE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_HARE_CONF_OPTS) install
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
