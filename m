Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C908CD6E56
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4474860FBE;
	Sun, 31 May 2026 17:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aseutdZ1L4F; Sun, 31 May 2026 17:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4884A60C12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780250220;
	bh=7qDVNNiOxPf1WNrAO5hpnzqlQb+g0yPM76aV9ZwnQRQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DhUJivdcItOg5fTYFZY7dtOvhDWsbujkOaspCm3WRGf/Gmlj7kV+4/UWwQY5Vm/Jg
	 kecHxOL8zwEBO+gbDi96ae7zna6TvtNojG2hpMPYh9EW0pUV4IIf9tcn/ywvESY9w2
	 2vSq9rmR1RU0JbUjGLKlLGVSa54zv1K73DCBTEj8DDJy3YV4kd5UAIZiaU8E+fJkSS
	 cXJEdvZcZICn2hKzyfAaaappaviefAbJ1MlUZESGOJ6i/tptC0n7U/X3z7ZMK+FQtC
	 +Np7dXmP9OPW0HWWfb72mjOCQFGp07uGBHjBlEkyXSmkdfCNx0YrGONNLiShMQmN0V
	 TWdEd9NBBertQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4884A60C12;
	Sun, 31 May 2026 17:57:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E662F2AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D763240232
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCKq6BQvBc18 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B933401E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B933401E9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B933401E9
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:56:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5GDv-1xSY9S07z3-014Rl4; Sun, 31
 May 2026 19:56:55 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 31 May 2026 17:56:50 +0000
Message-ID: <20260531175650.23525-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZQyr47PcQ+lJ1/3I8JVBnWQAMCdLt4yWQz3iQtKLPhGpTt4n1uI
 DAvk069ECiEQg1hpRcuwqwZ2KY9+Hc9Ghv4r2o85YOosxgfvBAHX+uZXWMoMwGIvYsCQPP2
 xB5Yhf7WeHaD/2gAhV8mWNCAJHsgTH+fnlLWpEj7eVqfZSOygo1tB29q3Hkg/HAGm4+KRJu
 YVje+xltZnMm9JiRefSoQ==
UI-OutboundReport: notjunk:1;M01:P0:OrO/4aLe69Q=;LBWdIxhhQCTo8/MChwBxpwVxxWw
 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
 rmNRX4eM4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1780250215; x=1780855015; i=and@gmx.li;
 bh=b0KrOStrjwWmpFMozVaF6wtAkTefDwDI8JcR0zO/lkU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iX6aQ3FGy/RqPE/SJrcRyGWnCgn2Q9DuTNrloXqQpSsb5uIWCdFAM59epy9vzRgb
 oqNB3HwBiQ+78WGKf0XZVm9CL+CYCaC2cxrhzZaUYfMTcM2SyMxUFB/6lACuiSX2t
 j1iOaK2Xm1GHSA+/nb2nD+ea5R2y69hcbDS/ulRvgfNn4+7Sxs7drFV+GGEiB4hmj
 zG9pFkjab/sR2unujwJxApNBzsPF4mJIPGS30DqcAphTT1T02wTOyurbgsuXj0KE4
 apXr1xfi9ttFSaCv4Ck3WJ0gedceOO60aFW6ujaLQIA7j7/yTO604RolOll1byDiD
 vau8O5Mnep6vzSXNWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=iX6aQ3FG
Subject: [Buildroot] [PATCH/next 1/1] package/cryptsetup: add argon2
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
 package/cryptsetup/Config.in     | 25 +++++++++++++++++++++++++
 package/cryptsetup/cryptsetup.mk | 15 +++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 00424af8b8..304f4bf97f 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -18,6 +18,31 @@ config BR2_PACKAGE_CRYPTSETUP
 
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
