Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67629CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 18:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22463427C6;
	Sun, 31 May 2026 18:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjJzgoKEpUsm; Sun, 31 May 2026 18:10:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCEA042566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780251037;
	bh=gZxSt389dZJ2eeNlLHPDp2nZ1IjowxkzHs8l+sHaeDg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=H0OLRxorHPuqQqCZsJqZjQuh4IJGEeFYEjU80MhYt+VLuCYXspNCbUrhxK6HPPP7u
	 Ywzj/WJcB84GokmJtuKspgCT+oVPUmIQVghKaM0VxjCUD7I3WL1nhG3jjpQhqKV8mr
	 psqBQgGJ7+PrmhUs6WvtP5ZU5jvZu3ePZV44+QIJYM1rvjDVQnT84/yIU38Rf+x8Lq
	 azepf4DJUxqTXGuTyXPMWz0RZsy8shpeZ1c2FMQ/bQIjsx6kZSVH1G9OxvxlEPoPFE
	 eFbn4drnGPKUHcC2tH9aWkRyORvSRnZDXSkC3nPJn/IWKWA1xlwfYQKZdQ38mswaDN
	 AU4R2ZwTelPlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCEA042566;
	Sun, 31 May 2026 18:10:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E2E5257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 18:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F81E60F42
 for <buildroot@buildroot.org>; Sun, 31 May 2026 18:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dP6djHP-g2FI for <buildroot@buildroot.org>;
 Sun, 31 May 2026 18:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 797EC60F3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 797EC60F3D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 797EC60F3D
 for <buildroot@buildroot.org>; Sun, 31 May 2026 18:10:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42jK-1wTkcJ34CW-005ZN5; Sun, 31
 May 2026 20:10:31 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 31 May 2026 18:10:25 +0000
Message-ID: <20260531181025.25800-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:s/QjZgW0xuECAr4SZnGjyC67frRyXUaQyKPm3e2vbgciLVZB0cH
 O0E4BbE4BLt9eoXhNvCiep+oSfvUl634g9yr8q5lWSCaVlS1ZLYwuxHhubnJRiS1tf+BNEn
 U17w7T/ZFE5a9PUhaYqk/hg1a/jncTuTOvtlz0//sA4W6emQB3pSpl2Sdv5szsyaKIejJfa
 Wq4CYXOSWP2edRhnj8Ihg==
UI-OutboundReport: notjunk:1;M01:P0:kV9aeT1kfX8=;3dOJGolImUazUf4CVaBPg+lruIP
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1780251031; x=1780855831; i=and@gmx.li;
 bh=ZVQhdr9t/JKhrrhP1vz5SHh84y8uR0+/Hhx24Nq4dgM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hGcJevWtq8GQQeq8XZdJTBadwBxRJLJDDHm8eho1j1zCpNdUF1GbnX3/pVPzXESW
 Z0itbf6Z7NV4DmkzYJyEHb0e0Yv7BhtpqF6bOL4AZuZ+SrXe78OmUlOlLJmD7EFL4
 I7JOzyuGN+WJH7hifmPzVnFltYbVTIPTNjrabWP6N8NYuWGAzrRSgjJjYaG4G+W0z
 0LnuFMCshPVvCLcJfATG2eJVtkziwkM+8LtEL6AIRKqA74KL/OBJLBlwQ5X00pTOO
 20cxEWeI/UFqXmP8wSJMK/iGusTZCgafOnX5hOQi+a9d4oJJgyjkXo8rVbxhhQ71m
 aWGU7dNDwpaUCrB/dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=hGcJevWt
Subject: [Buildroot] [PATCH/next v2 1/1] package/cryptsetup: add argon2
 implementation choice
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support argon2 implementation choice for less dependency and lightweight builds.

The internal reference implementation may be slower, set default to system libargon2

(configure: Argon2 bundled (slow) reference implementation will be used, please consider to use system library with --enable-libargon2)

Signed-off-by: Andreas Mohr <and@gmx.li>
---
Changes v1->v2:
- forgot to remove main BR2_PACKAGE_LIBARGON2
---
 package/cryptsetup/Config.in     | 26 +++++++++++++++++++++++++-
 package/cryptsetup/cryptsetup.mk | 15 +++++++++++++--
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 00424af8b8..a27987144f 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -11,13 +11,37 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_JSON_C
-	select BR2_PACKAGE_LIBARGON2
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
 
 	  https://gitlab.com/cryptsetup/cryptsetup
 
+if BR2_PACKAGE_CRYPTSETUP
+
+choice
+	prompt "argon2 support"
+	default BR2_PACKAGE_CRYPTSETUP_SUPPORT_ARGON2_SYSTEM
+	help
+	  Use cryptsetup internal reference implementation to save space on embedded systems.
+
+config BR2_PACKAGE_CRYPTSETUP_SUPPORT_ARGON2_SYSTEM
+	bool "system library (default)"
+	select BR2_PACKAGE_LIBARGON2
+
+config BR2_PACKAGE_CRYPTSETUP_SUPPORT_ARGON2_INTERNAL_SSE
+	bool "internal reference/SSE implementation (slower)"
+
+config BR2_PACKAGE_CRYPTSETUP_SUPPORT_ARGON2_INTERNAL
+	bool "internal reference implementation (even slower)"
+
+config BR2_PACKAGE_CRYPTSETUP_SUPPORT_ARGON2_NONE
+	bool "none (not recommended for LUKS2)"
+
+endchoice
+
+endif # BR2_PACKAGE_CRYPTSETUP
+
 comment "cryptsetup needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 758d8ef403..daa3bc3264 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -9,7 +9,7 @@ CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-	lvm2 popt host-pkgconf json-c libargon2 \
+	lvm2 popt host-pkgconf json-c \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
 	$(TARGET_NLS_DEPENDENCIES)
 CRYPTSETUP_LICENSE = Apache-2.0, CC-BY-SA-4.0, GPL-2.0+ (programs), LGPL-2.1+ (library)
@@ -23,7 +23,18 @@ CRYPTSETUP_CPE_ID_VALID = YES
 CRYPTSETUP_INSTALL_STAGING = YES
 
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
-CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2 --disable-asciidoc
+CRYPTSETUP_CONF_OPTS += --enable-blkid --disable-asciidoc
+
+ifeq ($(BR2_PACKAGE_CRYPTSETUP_SUPPORT_ARGON2_SYSTEM),y)
+CRYPTSETUP_DEPENDENCIES += libargon2
+CRYPTSETUP_CONF_OPTS += --enable-libargon2 --disable-internal-argon2
+else ifeq ($(BR2_PACKAGE_CRYPTSETUP_SUPPORT_ARGON2_INTERNAL_SSE),y)
+CRYPTSETUP_CONF_OPTS += --disable-libargon2 --enable-internal-sse-argon2
+else ifeq ($(BR2_PACKAGE_CRYPTSETUP_SUPPORT_ARGON2_INTERNAL),y)
+CRYPTSETUP_CONF_OPTS += --disable-libargon2 --enable-internal-argon2
+else ifeq ($(BR2_PACKAGE_CRYPTSETUP_SUPPORT_ARGON2_NONE),y)
+CRYPTSETUP_CONF_OPTS += --disable-libargon2 --disable-internal-argon2
+endif
 
 # cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt,
 # nettle, libnss or kernel crypto modules instead
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
