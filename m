Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CC9CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 13:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A67974272B;
	Fri,  1 May 2026 13:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDheUDxQpY6t; Fri,  1 May 2026 13:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFF11426E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777641050;
	bh=lojezfSyVil0vsm0azocurIGrQ5u/0Z5wy7/ovpAxgg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=dxsBRPfbu4eKWz3pQW1c29nkTUFEfr52g3pOkGXsnpzFzDbcPKQZtiVpx41ClueM0
	 6WjFJVzql7/cPeYcouOnw+YRow2b6o0kgS/DcOz1bsUjuvWLRmR/SwfUzpA5Vr34MB
	 aw5lS5HEB6zYGH/tsjJL7PZ8XLiXTQO2QV/8NjeJF48NSrtYmnAZTA0xjtRc5D6VgJ
	 KFc2aRYXU4hBRrCSdU4izoOJcZfvT7CMHmanWi8AUUys8F6yUlbUkJUncd+4KXuyt4
	 V129UK8kn2SwnD70S5VA8rzTYuiE6pUHEOeGlTAsvVCZCeRfWVx+09NK8s5SC5Nh/B
	 OAtO5mMVQTTTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF11426E9;
	Fri,  1 May 2026 13:10:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7639313
 for <buildroot@buildroot.org>; Fri,  1 May 2026 13:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB59261B12
 for <buildroot@buildroot.org>; Fri,  1 May 2026 13:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hc4quNaUMrtx for <buildroot@buildroot.org>;
 Fri,  1 May 2026 13:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60CDE61AED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60CDE61AED
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60CDE61AED
 for <buildroot@buildroot.org>; Fri,  1 May 2026 13:10:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH9Y-1vkZLz2S8y-00oOMg; Fri, 01
 May 2026 15:10:43 +0200
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 15:10:29 +0200
Message-ID: <20260501131030.1109367-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:z48RIVbGQpiW350ANRs9tdZEc4gsG24UEcuTEIEZXmHeoXT4uIf
 rvCtrf/ifou9j9PIRr489RgDEvWUpaNAljNPjkp6ncEIGqMDjCfMn0XgSUnC5qr/ArXhqGs
 eTtmteLkpLHgxyJDjeI4HPqqZ/e0kfIm8JPpDSOE/wxBI2gNjOxy9HN9Uoaol/eN6IUI7Gh
 5PlvCyhByAa4l8TcSeb7Q==
UI-OutboundReport: notjunk:1;M01:P0:5ASDGFWLtC8=;Dbwsg1UFn0JhfqAVU2Fdv/B6Xsj
 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
 mvz9fxkD3O1Bdpw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777641043; x=1778245843; i=fiona.klute@gmx.de;
 bh=YHn3SZkNyGY5SNgdYXlmI1CdnAo0lr2tB2eBUeIyhyU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NY99AvZJ4+TwZqLdckcguOypcz1yTfbrvRB+kYaagQ3UCuetwN/r4xzLltEbmbNf
 cc9AbHkWeickHV766YBgDV+UuSLzn8tycAo1NInhTNi4UzrURRK5/0szGMybQ+dvM
 gMvMhpSSa+vFpTWdcUjCThwN7bnwcxn8WU+kFJxokEqdhD/f1gTS3mmzyG/RTfOJa
 6ZIOw9OALNaL/UXFBGCxlJGHE42+x0pGG/pW2GXDlN/9pGm80B1JSo2XohxI+WPpx
 n/Rvth3sm7zzKbatAfdNedqCNfSi3SSEUeIPAmg4RTamB0Uv0jPJ7TTNXGPcwaHaM
 RFq3cSukBaC3kpx/bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=NY99AvZJ
Subject: [Buildroot] [PATCH v2 1/2] package/kmod: switch to Meson build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream changelog for version 34 states that the next major
version will drop the Autotools build, and the 34 series is meant for
distros to switch.

Notable changes in the Buildroot package:

* The Meson build handles symlink install, so we can drop the post
  install hooks.

* The previous point also means that host-kmod now installs the full
  set of tools.

* Explicitly disable openssl support in host-kmod tools. It is enabled
  by default and the build fails if OpenSSL cannot be found. In the
  autotools build it was not explicitly set.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* simplify merged-usr handling, merged-bin does not need special
  treatment
* add a comment explaining why non-merged usr needs a different sbindir

v1: https://patchwork.ozlabs.org/project/buildroot/patch/20260425085657.474422-5-fiona.klute@gmx.de/

 package/kmod/kmod.mk | 82 ++++++++++++++++----------------------------
 1 file changed, 30 insertions(+), 52 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index bcf65fd9be..0901afc872 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -17,43 +17,43 @@ KMOD_LICENSE_FILES = libkmod/COPYING
 
 KMOD_CPE_ID_VENDOR = kernel
 
-# static linking not supported, see
-# https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
-KMOD_CONF_OPTS = --disable-static --enable-shared
-
-KMOD_CONF_OPTS += --disable-manpages
-HOST_KMOD_CONF_OPTS = --disable-manpages
+KMOD_CONF_OPTS = -Dmanpages=false
+HOST_KMOD_CONF_OPTS = -Dmanpages=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
-KMOD_CONF_OPTS += --with-bashcompletiondir=/usr/share/bash-completion/completions
+KMOD_CONF_OPTS += -Dbashcompletiondir=/usr/share/bash-completion/completions
+else
+KMOD_CONF_OPTS += -Dbashcompletiondir=no
 endif
 
+KMOD_CONF_OPTS += -Dfishcompletiondir=no -Dzshcompletiondir=no
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
-KMOD_CONF_OPTS += --with-zlib
+KMOD_CONF_OPTS += -Dzlib=enabled
 else
-KMOD_CONF_OPTS += --without-zlib
+KMOD_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 KMOD_DEPENDENCIES += zstd
-KMOD_CONF_OPTS += --with-zstd
+KMOD_CONF_OPTS += -Dzstd=enabled
 else
-KMOD_CONF_OPTS += --without-zstd
+KMOD_CONF_OPTS += -Dzstd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 KMOD_DEPENDENCIES += xz
-KMOD_CONF_OPTS += --with-xz
+KMOD_CONF_OPTS += -Dxz=enabled
 else
-KMOD_CONF_OPTS += --without-xz
+KMOD_CONF_OPTS += -Dxz=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 KMOD_DEPENDENCIES += openssl
-KMOD_CONF_OPTS += --with-openssl
+KMOD_CONF_OPTS += -Dopenssl=enabled
 else
-KMOD_CONF_OPTS += --without-openssl
+KMOD_CONF_OPTS += -Dopenssl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
@@ -62,61 +62,39 @@ ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 KMOD_LICENSE += , GPL-2.0+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
-# /sbin is really /usr/sbin with merged /usr, and /usr/sbin is
-# really /usr/bin with merged-bin, so adjust relative symlink
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
-KMOD_BIN_PATH = kmod
-KMOD_SBIN_DIR = bin
-else
-KMOD_BIN_PATH = ../bin/kmod
-KMOD_SBIN_DIR = sbin
-endif
-else
-KMOD_BIN_PATH = ../usr/bin/kmod
-KMOD_SBIN_DIR = sbin
+ifeq ($(BR2_ROOTFS_MERGED_USR),)
+# Busybox would install its modutils symlinks to /sbin, so kmod needs
+# to do the same to take priority (Busybox won't overwrite them, see
+# its install-noclobber).
+KMOD_CONF_OPTS += -Dsbindir=/sbin
 endif
 
-define KMOD_INSTALL_TOOLS
-	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
-		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/$(KMOD_SBIN_DIR)/$$i; \
-	done
-endef
-
-KMOD_POST_INSTALL_TARGET_HOOKS += KMOD_INSTALL_TOOLS
 else
-KMOD_CONF_OPTS += --disable-tools
+KMOD_CONF_OPTS += -Dtools=false
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_KMOD_GZ),y)
 HOST_KMOD_DEPENDENCIES += host-zlib
-HOST_KMOD_CONF_OPTS += --with-zlib
+HOST_KMOD_CONF_OPTS += -Dzlib=enabled
 else
-HOST_KMOD_CONF_OPTS += --without-zlib
+HOST_KMOD_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_KMOD_ZSTD),y)
 HOST_KMOD_DEPENDENCIES += host-zstd
-HOST_KMOD_CONF_OPTS += --with-zstd
+HOST_KMOD_CONF_OPTS += -Dzstd=enabled
 else
-HOST_KMOD_CONF_OPTS += --without-zstd
+HOST_KMOD_CONF_OPTS += -Dzstd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_KMOD_XZ),y)
 HOST_KMOD_DEPENDENCIES += host-xz
-HOST_KMOD_CONF_OPTS += --with-xz
+HOST_KMOD_CONF_OPTS += -Dxz=enabled
 else
-HOST_KMOD_CONF_OPTS += --without-xz
+HOST_KMOD_CONF_OPTS += -Dxz=disabled
 endif
 
-# We only install depmod, since that's the only tool used for the
-# host.
-define HOST_KMOD_INSTALL_TOOLS
-	mkdir -p $(HOST_DIR)/sbin/
-	ln -sf ../bin/kmod $(HOST_DIR)/sbin/depmod
-endef
-
-HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
+HOST_KMOD_CONF_OPTS += -Dopenssl=disabled
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
