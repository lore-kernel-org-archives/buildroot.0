Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD244CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 18:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F9C760F8E;
	Sun, 31 May 2026 18:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Li1d6UvpwVUq; Sun, 31 May 2026 18:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B2460F97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780253381;
	bh=D74/oxvKeeL54aVga64L1zFZnmH8xtMWnKffsNz4HYE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=swqw7bIHC3linVvmAFag7YL+7Fba32FKkFqHiNxms4FnnvysmcsnNapcaBfkOQr09
	 oIutIJpgZkuGjmU90Mt3XVNjOV+jtOur5ud2eVBlWGW/GRiFIHEbZQnGI0Yn4ZZjNU
	 Hztdv1Ga+u/6EoVjFQQJsWd1yzYz67bkbj26alGACjR3zF2Y9ghWqneezYD5JRZK2c
	 NxEYXB52K7wuWjA/e4A7sqkOvjvPhqJ919jck6Avm4nw7PTvNVTZ8xQT2qmz3ttRdd
	 JT599OHb74KoRs0RJjylVCP26URBOoSSy6qB3GbZ2v4v8y+bXY/y9pCC60negoU1wS
	 fnoQMZtCtveuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B2460F97;
	Sun, 31 May 2026 18:49:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77E04257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 18:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69C0060F97
 for <buildroot@buildroot.org>; Sun, 31 May 2026 18:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmayDQhvq9ME for <buildroot@buildroot.org>;
 Sun, 31 May 2026 18:49:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD84F60F8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD84F60F8E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD84F60F8E
 for <buildroot@buildroot.org>; Sun, 31 May 2026 18:49:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMuX-1whK0P0QC1-00K3Qb; Sun, 31
 May 2026 20:49:36 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 31 May 2026 18:49:31 +0000
Message-ID: <20260531184931.27838-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Lt0Nx3RZby5iYFNFxbBlzrypf5x428D+rgzVtAWPbfyF2GFRxvR
 6anIkuATtDeGdvTwVYUDaJwOiu09ymT8r+dKDClBW4LJAJ4/J7iRiF/fUZ/JIPI2eY48p01
 WlKzOm4U/TNbqniDJuoNOV9fOMumyIsZC9s2fR+c7lZOzj4EAxf7yjxe/zGb9MrT3nnHnI3
 pM6nL15AV0lXH0Bsn+4Mw==
UI-OutboundReport: notjunk:1;M01:P0:mUqlMtJckBQ=;h9RhFCmWDBs9P4zHDIhdno2c+I7
 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
 6NQ9bAG+ew+7vK54ZWcbNHEYID+Mq4mlbXHJd2v
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1780253376; x=1780858176; i=and@gmx.li;
 bh=4vbopkZ6ttIpXFtAtjkXJeeETTBbtni1Zb8IznEaBYo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ENpjtcI8vbkOG4FB1nbfxHMmuH0S6JFzgACc+NH7pyDBA3Ju5aUNxvKVvPeflqzX
 HENgqqy0XOVGjnITEJ6Z1OrSTv01JZPzMRqepFSXkj8aW9Rl7wBenn1EWtAp19fwx
 CH78RuHWeQXxRQgEef/wiYsdCMI/xQvSlQ++M/36FABgAnG4l39Z6AQOtf3Ip9/Zk
 5PXLs/8R5tCWenTyutntDH1x3oEAW7+kv/Lq1hASngsoYswzPDzJei6oED83/kbYv
 vRwdKGn1fXGpfxGelanq/uTnO44hYN6sV+suKA00HCegd6E3XFbY/eTr3w0DmYukB
 /cB9oGW9xch/TLCYxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=ENpjtcI8
Subject: [Buildroot] [PATCH/next v3 1/1] package/cryptsetup: add argon2
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
Changes v2->v3:
- set default LUKS2 pbkdf to pbkdf2 if argon2 is not available

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
index 758d8ef403..ad19e0a24e 100644
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
+CRYPTSETUP_CONF_OPTS += --disable-libargon2 --disable-internal-argon2 --with-luks2-pbkdf=pbkdf2
+endif
 
 # cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt,
 # nettle, libnss or kernel crypto modules instead
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
