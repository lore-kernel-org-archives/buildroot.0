Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1251D606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NWWJpiQm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8CD640802;
	Thu,  5 Nov 2026 07:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skOUFBnBDs33; Thu,  5 Nov 2026 07:29:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0228B40830
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793863761;
	b=pW8xCxpIKQCZHovMRbCOTXZNS8CmfDlOE0w+KkZlTv4AUihqrORE2v+lDJqTQBGeclry
	 /PnmFBUAWS4CyuBwKiKG+bqOfA9pDZ9HOW9kGTPM9xBpXgemvgkIgvNzUAOoamu8IuUMA
	 NCUOCBY9zehrdYAcPq0qY/v+qmBj7DJf5mmBGVP4E9UCitvxWbuihszx8Zsu0/k3Nvndm
	 KEXKzIdZgKuu65ha500l1Z22eLRfOMxBME0ywJ0pQyTvZ/wLmaymlKRYIWLk+BhRwyKCZ
	 eeylYDxjuLGc/TjGphXFFq5KJRLNJgSyDrsTMSlDZJbG7VJhcgwSZCifUZmeqYENn8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793863761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eWkNlwTD17YgPBBRbi6ZMgk9Utv/SdTVkStUc0bpTL0=;
	b=pv2cXJB8kNBjKnBIcz9Zvvwww2NnSX6OYeSuOXYd8k6UL454NPKrPii97TeXbsh2gEWK
	 OAP20vxbLUYiW+Y8PRVOJWfm4i9XTmaSuf29UmvAvuey8R9T9l3mYhRroaNMLYpNJF+A0
	 V0OaQz+YJviKTssZvPSsRqSJTJLMzGK4AldL3t+t5n+OpK3+zcrRgIWh15hOHen+EWvPV
	 S1KD6jnok5VkNYDYNBvN7vgCy+kHO6wcBJerqEeHd5fImpubGQAStshcmzDvAu1hoBxOV
	 1+NnNKfFcG5rBLHmfFu47BPv8kEbajxQ4bDQSJFx2GAmvXWb7uyOGQB9UxPQxPgmdMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793863761;
	bh=eWkNlwTD17YgPBBRbi6ZMgk9Utv/SdTVkStUc0bpTL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NWWJpiQmOb2w08fckqR99OCrbQAqi9pZgTfAt8tassBpr4jzWTTulOlkDvpbjXzo5
	 6m2b4u9OwgvaHmb6taWXJ7Yy/Eyxw5pLgXGQ/6X9IRFdjcUuofVunCZ4P178yF0C1U
	 fMRMB/4mAzrutS7D2oDjSc1D/Gl1livAf6yVOZ8OZnGOWFg2SjNcMJRRlQuTSFoEyx
	 DM2SRteB94Ct7ExNeTlMfeQPj/eNqbbEH5Mzw6h1MQqcvyMgUdZxs9cUT7EVXB/WB0
	 hDSdRyqz8ORfDlW/BarEGZJYHveIzKu7BuITMUVmvXlHD5pnoOA6jNEAmeC7ORItoV
	 SAHiL9u0RVxwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0228B40830;
	Thu,  5 Nov 2026 07:29:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64DF7362
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C843607D5
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_QRdmbZ7t_2 for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 13788606F7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13788606F7
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 031A89DF84; Thu,  5 Nov 2026 07:27:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 08:28:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59349bdd0ffca2b5ccf289e6a4e0d36622c7ba6a
X-Git-Newrev: 34c6f77f89aee44e4e324646c3700c79442e2f8c
X-Patchwork-Hint: ignore
Message-Id: <20261105072742.031A89DF84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: bump to version 5.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34c6f77f89aee44e4e324646c3700c79442e2f8c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Starting with Mender version 4, the program is rewritten from Go to C++ using
CMake.

The current package provided by Buildroot is 3.5.3, which is quite old, having
been released on 12/6/2024. Since then, several changes have occurred,
necessitating a substantially large patch with many changes all at once.

The following is a list of changes:

MAJOR:
  - Mender is now a C++ project
  - Mender depends on systemd
  - Drops sysvinit support
  - Mender is split into two binaries:
      - mender-authd
      - mender-updated

MINOR:

  - Drop the 0001-openssl-v4-update.patch.
  - Add 0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch
    Which allowd building without OpenSSL engine support.

    This patch is tested against OpenSSL 4.0.2 which is not yet applied
    to the master branch.

  - The following busyboxy options are required by the rootfs module and are
    enabled by default:
    - flock
    - stat
    - stat_format
    - sync_fancy
    - wget
    - wget_https
    - wget_openssl
      Note: While sync_fancy isn't strictly necessary, enabling this feature
            prevents several messages about sync ignoring all arguments.

  - New dependencies are as follows:
    - boost
    - dbus
    - libarchive
    - libglib2
    - lmdb
    - openssl
    - systemd
    - yaml-cpp

The configs/mender_x86_64_efi_defconfig file is updated to
use systemd by default.

Mender is configured with -DBUILD_SHARED_LIBS=OFF as the bundled
libyaml and tiny-process-library .so files are not installed when
-DBUILD_SHARED_LIBS=ON is selected.

The support/testing/tests/package/test_mender.py is updated:
  - Uses systemd
  - Bumped kernel version to 6.18.59
  - Adds a simple network as mender-authd requires network-online.target
  - Drops sysvinit tests

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/mender/x86_64/linux.config                   |  11 ++
 configs/mender_x86_64_efi_defconfig                |   7 +-
 package/mender/0001-openssl-v4-update.patch        | 191 ---------------------
 ...crypto-platform-openssl-crypto.cpp-fix-bu.patch |  69 ++++++++
 package/mender/Config.in                           |  39 +++--
 package/mender/S42mender                           |  44 -----
 package/mender/mender-client.service               |  13 --
 package/mender/mender.hash                         |  52 ++----
 package/mender/mender.mk                           | 146 ++++++++--------
 package/mender/server.crt                          |  22 ---
 support/testing/tests/package/test_mender.py       |  96 ++++++-----
 11 files changed, 249 insertions(+), 441 deletions(-)

diff --git a/board/mender/x86_64/linux.config b/board/mender/x86_64/linux.config
index b758c6d45a..f980ec39ab 100644
--- a/board/mender/x86_64/linux.config
+++ b/board/mender/x86_64/linux.config
@@ -1,4 +1,8 @@
 CONFIG_SYSVIPC=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_USER_NS=y
 CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
@@ -15,18 +19,22 @@ CONFIG_NETFILTER_XTABLES_LEGACY=y
 CONFIG_IP_NF_IPTABLES_LEGACY=y
 CONFIG_IP_NF_IPTABLES=y
 CONFIG_IP_NF_FILTER=y
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_FQ_CODEL=y
 CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
 CONFIG_PCI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DMI_SYSFS=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_VIRTIO=y
 CONFIG_ATA=y
 CONFIG_NETDEVICES=y
 CONFIG_VIRTIO_NET=y
+CONFIG_E1000E=y
 CONFIG_ATH9K=m
 CONFIG_ATH9K_HTC=m
 CONFIG_CARL9170=m
@@ -57,8 +65,11 @@ CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
 CONFIG_EXT4_FS=y
+CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_SQUASHFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index f10a461770..9cd68e5f62 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -1,7 +1,6 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
-BR2_INIT_SYSV=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_INIT_SYSTEMD=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
@@ -42,7 +41,7 @@ BR2_PACKAGE_MENDER_GRUBENV=y
 BR2_PACKAGE_MENDER_GRUBENV_DEFINES="board/mender/x86_64/mender_grubenv_defines"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_GRUB2=y
 BR2_TARGET_GRUB2_X86_64_EFI=y
diff --git a/package/mender/0001-openssl-v4-update.patch b/package/mender/0001-openssl-v4-update.patch
deleted file mode 100644
index 65443614d5..0000000000
--- a/package/mender/0001-openssl-v4-update.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-Description: Fix build compatibility with OpenSSL 4.0
- Include <openssl/x509v3.h> in hostname.c and hostname.go before checking
- #ifndef X509_CHECK_FLAG_ALWAYS_CHECK_SUBJECT, preventing fallback to
- legacy OpenSSL < 1.0.2 code that attempts to directly access opaque
- ASN1_STRING fields.
- Also add preprocessor guards around deprecated protocol methods
- (SSLv3_method, TLSv1_method, TLSv1_1_method, TLSv1_2_method) in shim.c
- and ENGINE functions (ENGINE_by_id, ENGINE_init, ENGINE_free,
- ENGINE_finish, ENGINE_load_private_key, ENGINE_load_builtin_engines)
- in shim.c, shim.h, engine.go, key.go to prevent implicit declaration
- and undefined reference errors when building against OpenSSL 4.0.
-Author: Frank Heimes <frank.heimes@canonical.com>
-
-Downloaded from Ubuntu:
-https://git.launchpad.net/ubuntu/+source/golang-github-mendersoftware-openssl/tree/debian/patches/0004-openssl-v4-update.patch?h=applied/ubuntu/stonking-devel
-
-Upstream: not applicable, upstream moved to c++ in newer versions
-
-[Bernd: rebased for vendored download by buildroot infra]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-
-diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/engine.go mender-3.5.3/vendor/github.com/mendersoftware/openssl/engine.go
---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/engine.go	2024-05-24 12:07:27.000000000 +0200
-+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/engine.go	2026-09-20 18:37:50.270612314 +0200
-@@ -15,6 +15,7 @@
- package openssl
- 
- /*
-+#include "shim.h"
- #include "openssl/engine.h"
- */
- import "C"
-@@ -33,18 +34,18 @@
- 	cname := C.CString(name)
- 	defer C.free(unsafe.Pointer(cname))
- 	e := &Engine{
--		e: C.ENGINE_by_id(cname),
-+		e: C.X_ENGINE_by_id(cname),
- 	}
- 	if e.e == nil {
- 		return nil, fmt.Errorf("engine %s missing", name)
- 	}
--	if C.ENGINE_init(e.e) == 0 {
--		C.ENGINE_free(e.e)
-+	if C.X_ENGINE_init(e.e) == 0 {
-+		C.X_ENGINE_free(e.e)
- 		return nil, fmt.Errorf("engine %s not initialized", name)
- 	}
- 	runtime.SetFinalizer(e, func(e *Engine) {
--		C.ENGINE_finish(e.e)
--		C.ENGINE_free(e.e)
-+		C.X_ENGINE_finish(e.e)
-+		C.X_ENGINE_free(e.e)
- 	})
- 	return e, nil
- }
-diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/hostname.c mender-3.5.3/vendor/github.com/mendersoftware/openssl/hostname.c
---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/hostname.c	2024-05-24 12:07:27.000000000 +0200
-+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/hostname.c	2026-09-20 18:32:37.854514981 +0200
-@@ -6,6 +6,7 @@
-  */
- 
- #include <openssl/x509.h>
-+#include <openssl/x509v3.h>
- 
- #ifndef X509_CHECK_FLAG_ALWAYS_CHECK_SUBJECT
- 
-diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/key.go mender-3.5.3/vendor/github.com/mendersoftware/openssl/key.go
---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/key.go	2024-05-24 12:07:27.000000000 +0200
-+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/key.go	2026-09-20 18:38:13.462370202 +0200
-@@ -303,7 +303,7 @@
- 	keyID := C.CString(id)
- 	defer C.free(unsafe.Pointer(keyID))
- 
--	key := C.ENGINE_load_private_key(e.e, keyID, nil, nil)
-+	key := C.X_ENGINE_load_private_key(e.e, keyID, nil, nil)
- 	if key == nil {
- 		return nil, errors.New("cannot load private key, ENGINE_load_private_key error")
- 	}
-diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.c mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.c
---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.c	2024-05-24 12:07:27.000000000 +0200
-+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.c	2026-09-20 18:36:02.855038372 +0200
-@@ -382,7 +382,9 @@
- 	int rc = 0;
- 
- 	OPENSSL_config(NULL);
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
- 	ENGINE_load_builtin_engines();
-+#endif
- 	SSL_load_error_strings();
- 	SSL_library_init();
- 	OpenSSL_add_all_algorithms();
-@@ -403,6 +405,46 @@
- 	return 0;
- }
- 
-+ENGINE *X_ENGINE_by_id(const char *id) {
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
-+	return ENGINE_by_id(id);
-+#else
-+	return NULL;
-+#endif
-+}
-+
-+int X_ENGINE_init(ENGINE *e) {
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
-+	return ENGINE_init(e);
-+#else
-+	return 0;
-+#endif
-+}
-+
-+int X_ENGINE_free(ENGINE *e) {
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
-+	return ENGINE_free(e);
-+#else
-+	return 0;
-+#endif
-+}
-+
-+int X_ENGINE_finish(ENGINE *e) {
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
-+	return ENGINE_finish(e);
-+#else
-+	return 0;
-+#endif
-+}
-+
-+EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char *key_id, UI_METHOD *ui_method, void *callback_data) {
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
-+	return ENGINE_load_private_key(e, key_id, ui_method, callback_data);
-+#else
-+	return NULL;
-+#endif
-+}
-+
- void * X_OPENSSL_malloc(size_t size) {
- 	return OPENSSL_malloc(size);
- }
-@@ -480,7 +522,7 @@
- }
- 
- const SSL_METHOD *X_SSLv3_method() {
--#ifndef OPENSSL_NO_SSL3_METHOD
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_SSL3_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
- 	return SSLv3_method();
- #else
- 	return NULL;
-@@ -488,11 +530,15 @@
- }
- 
- const SSL_METHOD *X_TLSv1_method() {
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_TLS1_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
- 	return TLSv1_method();
-+#else
-+	return NULL;
-+#endif
- }
- 
- const SSL_METHOD *X_TLSv1_1_method() {
--#if defined(TLS1_1_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX)
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && defined(TLS1_1_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX) && !defined(OPENSSL_NO_TLS1_1_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
- 	return TLSv1_1_method();
- #else
- 	return NULL;
-@@ -500,7 +546,7 @@
- }
- 
- const SSL_METHOD *X_TLSv1_2_method() {
--#if defined(TLS1_2_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX)
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L && defined(TLS1_2_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX) && !defined(OPENSSL_NO_TLS1_2_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
- 	return TLSv1_2_method();
- #else
- 	return NULL;
-diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.h mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.h
---- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.h	2024-05-24 12:07:27.000000000 +0200
-+++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.h	2026-09-20 18:38:33.117854985 +0200
-@@ -40,6 +40,13 @@
- /* shim  methods */
- extern int X_shim_init();
- 
-+/* Engine methods */
-+extern ENGINE *X_ENGINE_by_id(const char *id);
-+extern int X_ENGINE_init(ENGINE *e);
-+extern int X_ENGINE_free(ENGINE *e);
-+extern int X_ENGINE_finish(ENGINE *e);
-+extern EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char *key_id, UI_METHOD *ui_method, void *callback_data);
-+
- /* Library methods */
- extern void X_OPENSSL_free(void *ref);
- extern void *X_OPENSSL_malloc(size_t size);
diff --git a/package/mender/0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch b/package/mender/0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch
new file mode 100644
index 0000000000..e596f1b5f3
--- /dev/null
+++ b/package/mender/0001-src-common-crypto-platform-openssl-crypto.cpp-fix-bu.patch
@@ -0,0 +1,69 @@
+From dcc218c6857e080e760b4a9c04acc79390151eb3 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Wed, 28 Oct 2026 12:07:07 +0100
+Subject: [PATCH] src/common/crypto/platform/openssl/crypto.cpp: fix build
+ without engine support
+
+OpenSSL 4.0 removed ENGINE support entirely and always defines
+OPENSSL_NO_ENGINE. Its engine.h still declares the ENGINE_* functions
+for source compatibility, but only provides stub definitions when
+OPENSSL_ENGINE_STUBS is defined, so linking mender-auth fails with:
+
+  undefined reference to `ENGINE_by_id'
+  undefined reference to `ENGINE_free'
+  undefined reference to `ENGINE_init'
+  undefined reference to `ENGINE_load_builtin_engines'
+  undefined reference to `ENGINE_load_private_key'
+
+The same happens with OpenSSL 3.x configured with no-engine.
+
+Guard the ENGINE calls with OPENSSL_NO_ENGINE, and return an error
+from LoadFromHSMEngine() when an SSL engine is configured but not
+available.
+
+Upstream: https://github.com/mendersoftware/mender/pull/2037
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ src/common/crypto/platform/openssl/crypto.cpp | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/common/crypto/platform/openssl/crypto.cpp b/src/common/crypto/platform/openssl/crypto.cpp
+index b31e6c8..5f6a4b9 100644
+--- a/src/common/crypto/platform/openssl/crypto.cpp
++++ b/src/common/crypto/platform/openssl/crypto.cpp
+@@ -103,9 +103,11 @@ auto bn_free = [](BIGNUM *bn) {
+ 	}
+ };
+ auto engine_free_func = [](ENGINE *e) {
++#ifndef OPENSSL_NO_ENGINE
+ 	if (e) {
+ 		ENGINE_free(e);
+ 	}
++#endif // OPENSSL_NO_ENGINE
+ };
+ 
+ auto password_callback = [](char *buf, int size, int rwflag, void *u) {
+@@ -153,6 +155,12 @@ string GetOpenSSLErrorMessage() {
+ }
+ 
+ ExpectedPrivateKey LoadFromHSMEngine(const Args &args) {
++#ifdef OPENSSL_NO_ENGINE
++	return expected::unexpected(MakeError(
++		SetupError,
++		"Failed to get the " + args.ssl_engine
++			+ " engine. OpenSSL was built without engine support"));
++#else
+ 	log::Trace("Loading the private key from HSM");
+ 
+ 	ENGINE_load_builtin_engines();
+@@ -190,6 +198,7 @@ ExpectedPrivateKey LoadFromHSMEngine(const Args &args) {
+ 	auto handle = unique_ptr<OpenSSLResourceHandle, void (*)(OpenSSLResourceHandle *)>(
+ 		new OpenSSLResourceHandle {std::move(engine)}, resource_handle_free_func);
+ 	return std::make_unique<PrivateKey>(std::move(private_key), std::move(handle));
++#endif // OPENSSL_NO_ENGINE
+ }
+ 
+ #ifdef MENDER_CRYPTO_OPENSSL_LEGACY
+-- 
+2.56.0
+
diff --git a/package/mender/Config.in b/package/mender/Config.in
index c9b9d0b757..8f16e2312f 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -1,9 +1,20 @@
 config BR2_PACKAGE_MENDER
 	bool "mender"
-	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_HOST_GO
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # (bundled yaml-cpp)
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-log
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-log
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # boost, libarchive, libglib2
+	depends on BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_LOG
+	select BR2_PACKAGE_CA_CERTIFICATES
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LMDB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES
@@ -21,16 +32,13 @@ config BR2_PACKAGE_MENDER
 	    - uboot-tools must be selected.
 	    - fw_printenv must be functional on the device.
 	  The Mender Uboot patches are at:
-	  https://github.com/mendersoftware/meta-mender/
+	  https://github.com/mendersoftware/meta-mender/tree/master/meta-mender-core/recipes-bsp/u-boot/patches
 
 	  For more information on Manual U-Boot integration, see:
-	  https://docs.mender.io/2.6/system-updates-yocto-project/board-integration/bootloader-support/u-boot/manual-u-boot-integration
+	  https://docs.mender.io/3.4/system-updates-yocto-project/board-integration/bootloader-support/u-boot/manual-u-boot-integration
 
 	  For systems using Grub2 as the bootloader:
 	    - Mender depends on the mender-grubenv package.
-	    - The mender-grubenv package provides a fw_printenv script,
-	      which is not compatible with the uboot-tools fw_printenv
-	      script.
 
 	  The mender project recommends using uboot to load Grub2 as a
 	  secondary bootloader whenever possible. Using Grub2 as a
@@ -39,7 +47,12 @@ config BR2_PACKAGE_MENDER
 
 	  https://github.com/mendersoftware/mender
 
-comment "mender needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "mender needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
+
+comment "mender needs a toolchain w/ C++, NPTL, wchar, not affected by GCC bug 64735"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/mender/S42mender b/package/mender/S42mender
deleted file mode 100644
index 70116ed4eb..0000000000
--- a/package/mender/S42mender
+++ /dev/null
@@ -1,44 +0,0 @@
-#!/bin/sh
-#
-# Starts mender service.
-#
-DAEMON="mender"
-DAEMON_PATH="/usr/bin/mender"
-PIDFILE="/var/run/${DAEMON}.pid"
-DAEMON_ARGS="daemon"
-
-start() {
-	printf "Starting mender service: "
-	umask 077
-	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${DAEMON_ARGS}
-	status=$?
-	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
-}
-
-stop() {
-	printf "Stopping mender service: "
-	start-stop-daemon -Kqp "$PIDFILE"
-	status=$?
-	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
-}
-restart() {
-	stop
-	start
-}
-
-case "$1" in
-	start)
-		start
-		;;
-	stop)
-		stop
-		;;
-	restart|reload)
-		restart
-		;;
-	*)
-		echo "Usage: $0 {start|stop|reload|restart}"
-		exit 1
-esac
-
-exit $?
diff --git a/package/mender/mender-client.service b/package/mender/mender-client.service
deleted file mode 100644
index 47e439993c..0000000000
--- a/package/mender/mender-client.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Mender OTA update service
-After=systemd-resolved.service
-
-[Service]
-Type=idle
-User=root
-Group=root
-ExecStart=/usr/bin/mender daemon
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 17fe08c827..1aa8fb63bd 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,47 +1,27 @@
 # Locally computed:
-sha256  35e369759b8d4f012153e538b5daf1e0cebe842205811e708332c5a092270ac5  mender-3.5.3-go2.tar.gz
+sha256  436ae559358f29c672b98ca77b953936ba6ef51455466fb5ed0ced7ae77fc226  mender-5.2.0.tar.gz
+sha256  4d3409e4f8f7f3b9de5da7fee7c03e36a2381a02b2e318702485fc993a735cc9  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
-sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a  vendor/github.com/mendersoftware/mender-artifact/LICENSE
-sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/mendersoftware/openssl/LICENSE
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
-sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
+sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
 #
-# BSD 2 Clause license.
-sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
-sha256  e4646a82a976369d7ae8f6ed5c11d35dc0af18433a8ccc24c85b459ad8b95128  vendor/github.com/godbus/dbus/LICENSE
-sha256  2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/github.com/gorilla/websocket/LICENSE
+# MIT clause license
+sha256  d64d1b4d948aa7751cfb613c02dc246aab7b358d760053e6580f01affe946906  src/common/vendor/json/LICENSE.MIT
+sha256  7920c8620b1e073a79a667c44f9149c25724eb9f0f6b220b3c8d9564e2d40a43  src/common/vendor/json/docs/mkdocs/docs/home/license.md
+sha256  2aefa40fa7e1c0fab18fbad5b15b02406eea1399d3cca42cc1012b65b4a56f74  src/common/vendor/tiny-process-library/LICENSE
+sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  src/common/vendor/yaml-cpp/LICENSE
 #
-# BSD 3 Clause license.
-sha256  0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d87cf  vendor/github.com/klauspost/compress/LICENSE
-sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
-sha256  0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d0c2a03e  vendor/github.com/bmatsuo/lmdb-go/LICENSE.md
-sha256  87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680a3d918b  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/term/LICENSE
+# UNLICENSE
+sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  src/common/vendor/lmdbxx/UNLICENSE
 #
-# ISC license.
-sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
+# CC0 1.0 Universal
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  src/common/vendor/expected/COPYING
 #
-# MIT license.
-sha256  6d2de1cde19c4d2bd8bcd9aaa1d581f4cfa3db9cf71896140330eaa2f2687685  vendor/github.com/klauspost/pgzip/LICENSE
-sha256  f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/github.com/klauspost/compress/internal/snapref/LICENSE
-sha256  f566a9f97bacdaf00d9f21dd991e81dc11201c4e016c86b470799429a1c9a79c  vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt
-sha256  5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212  vendor/github.com/klauspost/cpuid/v2/LICENSE
-sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
-sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
-sha256  ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/github.com/ungerik/go-sysfs/LICENSE
-sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/v2/LICENSE
-sha256  b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/github.com/stretchr/objx/LICENSE
-sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
-sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor/github.com/mattn/go-isatty/LICENSE
+# Boost Software License
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  src/common/vendor/optional-lite/LICENSE.txt
 #
-# OpenLDAP Public License
-sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
-
-# sha256 of all the vendor licenses combined
-sha256  86407bd98d5ea7fb0f09ab771c3333e975d06565b809a2dd95f864dc1e3a09b3  LIC_FILES_CHKSUM.sha256
+# BSD-3
+sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/common/vendor/yaml-cpp/test/googletest-1.16.0/LICENSE
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 76dc28d547..e20fec8aa9 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,107 +4,107 @@
 #
 ################################################################################
 
-MENDER_VERSION = 3.5.3
-MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
-MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
+MENDER_VERSION = 5.2.0
+MENDER_SITE = https://github.com/mendersoftware/mender/releases/download/$(MENDER_VERSION)
+MENDER_LICENSE = Apache-2.0, BSL-1.0, BSD-3-Clause, CC0-1.0, MIT, Unlicense
 MENDER_CPE_ID_VENDOR = northern.tech
-# CVE-2024-46948 only affects mender-server
-MENDER_IGNORE_CVES = CVE-2024-46948
 
 # Vendor license paths generated with:
 #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
 MENDER_LICENSE_FILES = \
 	LICENSE \
 	LIC_FILES_CHKSUM.sha256 \
-	vendor/github.com/mendersoftware/mender-artifact/LICENSE \
-	vendor/github.com/mendersoftware/openssl/LICENSE \
-	vendor/github.com/minio/sha256-simd/LICENSE \
-	vendor/github.com/mendersoftware/progressbar/LICENSE \
-	vendor/github.com/pkg/errors/LICENSE \
-	vendor/github.com/godbus/dbus/LICENSE \
-	vendor/github.com/gorilla/websocket/LICENSE \
-	vendor/github.com/klauspost/compress/LICENSE \
-	vendor/github.com/pmezard/go-difflib/LICENSE \
-	vendor/golang.org/x/sys/LICENSE \
-	vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
-	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
-	vendor/golang.org/x/term/LICENSE \
-	vendor/github.com/davecgh/go-spew/LICENSE \
-	vendor/github.com/klauspost/pgzip/LICENSE \
-	vendor/github.com/klauspost/compress/internal/snapref/LICENSE \
-	vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt \
-	vendor/github.com/klauspost/cpuid/v2/LICENSE \
-	vendor/github.com/sirupsen/logrus/LICENSE \
-	vendor/github.com/stretchr/testify/LICENSE \
-	vendor/github.com/ungerik/go-sysfs/LICENSE \
-	vendor/github.com/urfave/cli/v2/LICENSE \
-	vendor/github.com/stretchr/objx/LICENSE \
-	vendor/gopkg.in/yaml.v3/LICENSE \
-	vendor/github.com/mattn/go-isatty/LICENSE \
-	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
-
-MENDER_DEPENDENCIES = host-pkgconf openssl
-
-MENDER_LDFLAGS = -X github.com/mendersoftware/mender/conf.Version=$(MENDER_VERSION)
-
-MENDER_UPDATE_MODULES_FILES = directory single-file
+	src/common/vendor/json/LICENSE.MIT \
+	src/common/vendor/json/docs/mkdocs/docs/home/license.md \
+	src/common/vendor/tiny-process-library/LICENSE \
+	src/common/vendor/yaml-cpp/LICENSE \
+	src/common/vendor/lmdbxx/UNLICENSE \
+	src/common/vendor/expected/COPYING \
+	src/common/vendor/optional-lite/LICENSE.txt \
+	src/common/vendor/yaml-cpp/test/googletest-1.16.0/LICENSE
+
+MENDER_DEPENDENCIES += \
+	host-pkgconf \
+	boost \
+	dbus \
+	libarchive \
+	libglib2 \
+	lmdb \
+	openssl \
+	systemd
+
+MENDER_INSTALL_TARGET_OPTS = \
+	install-bin \
+	install-dbus \
+	install-dbus-service-files \
+	install-identity-scripts \
+	install-inventory-network-scripts \
+	install-inventory-scripts \
+	install-modules \
+	install-rootfs-image-module \
+	install-systemd
 
 define MENDER_INSTALL_CONFIG_FILES
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
-	echo -n "3" > $(TARGET_DIR)/etc/mender/scripts/version
-
 	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
-	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/server.crt \
-		$(TARGET_DIR)/etc/mender/server.crt
 
-	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
-		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
-	$(foreach f,bootloader-integration hostinfo network os rootfs-type, \
-		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
-			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
-	)
+	$(INSTALL) -D -m 0644 $(@D)/support/demo.crt \
+		$(TARGET_DIR)/etc/mender/server.crt
 
 	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
 			$(TARGET_DIR)/etc/mender/device_type
 
-	mkdir -p $(TARGET_DIR)/var/lib/mender
-	$(foreach f,$(MENDER_UPDATE_MODULES_FILES), \
-		$(INSTALL) -D -m 0755 $(@D)/support/modules/$(notdir $(f)) \
-			$(TARGET_DIR)/usr/share/mender/modules/v3/$(notdir $(f))
-	)
+	mkdir -p $(TARGET_DIR)/var/lib
 endef
-
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
 
+# The vendored tiny-process-library and yaml-cpp are built as part of
+# mender but never installed, so always link them statically.
+MENDER_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=OFF \
+	-DMENDER_EMBED_MENDER_AUTH=OFF \
+	-DMENDER_USE_DBUS=ON \
+	-DMENDER_VERSION=$(MENDER_VERSION)
+
+ifeq ($(BR2_PACKAGE_GZIP),y)
+MENDER_DEPENDENCIES += gzip
+MENDER_CONF_OPTS += -DMENDER_ARTIFACT_GZIP_COMPRESSION=ON
+else
+MENDER_CONF_OPTS += -DMENDER_ARTIFACT_GZIP_COMPRESSION=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 MENDER_DEPENDENCIES += xz
+MENDER_CONF_OPTS += -DMENDER_ARTIFACT_LZMA_COMPRESSION=ON
 else
-MENDER_TAGS += nolzma
+MENDER_CONF_OPTS += -DMENDER_ARTIFACT_LZMA_COMPRESSION=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)
-MENDER_DEPENDENCIES += libglib2
-define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
-	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
-		$(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
-
-	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.UpdateManager.conf \
-		$(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
-endef
-MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+MENDER_DEPENDENCIES += zstd
+MENDER_CONF_OPTS += -DMENDER_ARTIFACT_ZSTD_COMPRESSION=ON
 else
-MENDER_TAGS += nodbus
+MENDER_CONF_OPTS += -DMENDER_ARTIFACT_ZSTD_COMPRESSION=OFF
 endif
 
-define MENDER_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender-client.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/mender-client.service
+define MENDER_INSTALL_MODULES_GEN
+	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install-modules-gen
+endef
+MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_MODULES_GEN
+
+define MENDER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) $(MENDER_INSTALL_TARGET_OPTS)
 endef
 
-define MENDER_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 $(MENDER_PKGDIR)/S42mender \
-		$(TARGET_DIR)/etc/init.d/S42mender
+# Needed for rootfs-image-module
+define  MENDER_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FLOCK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_STAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_STAT_FORMAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_SYNC_FANCY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WGET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_WGET_HTTPS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_WGET_OPENSSL)
 endef
 
-$(eval $(golang-package))
+$(eval $(cmake-package))
diff --git a/package/mender/server.crt b/package/mender/server.crt
deleted file mode 100644
index 79a57e15e7..0000000000
--- a/package/mender/server.crt
+++ /dev/null
@@ -1,22 +0,0 @@
------BEGIN CERTIFICATE-----
-MIIBfTCCASOgAwIBAgIJAJOS76a0qWuZMAoGCCqGSM49BAMCMBsxGTAXBgNVBAMM
-EGRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1MjQ2
-WjAbMRkwFwYDVQQDDBBkb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0CAQYIKoZI
-zj0DAQcDQgAE7AVYis6MWGPGQYU1/tlLEnskRifDIhvkRb8Y4nQPekRkLkiBYYT3
-iJ46wHrnejbHaLstU9GRdKWOmOuU6HGdO6NQME4wHQYDVR0OBBYEFGOIU4q++Vz8
-9HuT1jg9V+wFeJcyMB8GA1UdIwQYMBaAFGOIU4q++Vz89HuT1jg9V+wFeJcyMAwG
-A1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIhAPLnEeWPNeN7eDCEYRitBfyO
-X1yf2kzOm4ohBE5GY9gzAiBCq7HOSkzQDkelmQCCCpGXf/UwYNgQJjSoeGfk0j1a
-TQ==
------END CERTIFICATE-----
------BEGIN CERTIFICATE-----
-MIIBhDCCASmgAwIBAgIJALQrf4QDot4IMAoGCCqGSM49BAMCMB4xHDAaBgNVBAMM
-E3MzLmRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1
-MjQ2WjAeMRwwGgYDVQQDDBNzMy5kb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0C
-AQYIKoZIzj0DAQcDQgAEEc/Y3T+l3DvINePkpvVZORMIdHVs29jgsl48ia7z/NRX
-HlKtKxVGJyFN5Y7sBZeLgBYH3F4Bo3KfmxI7ad0tI6NQME4wHQYDVR0OBBYEFIUm
-cip00QZYpe4ULflbGNJan+Y9MB8GA1UdIwQYMBaAFIUmcip00QZYpe4ULflbGNJa
-n+Y9MAwGA1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSQAwRgIhANHij9VZBDHOUPaC
-pFiagnWnYL2HBR72W1xTKQbrLLTXAiEAvpwA4HzSnGmLd3010+jqQuMRHArN5WaX
-h0fy7niBbIQ=
------END CERTIFICATE-----
diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
index 14440c9527..44196d6a96 100644
--- a/support/testing/tests/package/test_mender.py
+++ b/support/testing/tests/package/test_mender.py
@@ -3,45 +3,69 @@ import os
 import infra.basetest
 
 
+# gitlab-runner: large
 class TestMenderInfra(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
-             """
-             BR2_PACKAGE_MENDER=y
-             BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
-             BR2_TARGET_ROOTFS_CPIO=y
-             BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
-             BR2_ROOTFS_OVERLAY="{}"
-             """.format(
-                 infra.filepath("tests/package/test_mender/post-build.sh"),
-                 # overlay to add a fake 'fw_printenv', used by Mender
-                 infra.filepath("tests/package/test_mender/rootfs-overlay"))
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
+    # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+    # needed by mender. This config also uses an ext4 rootfs as
+    # the default 128MB is too small for an image with mender and systemd.
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
+        BR2_INIT_SYSTEMD=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.59"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
+        BR2_PACKAGE_MENDER=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           infra.filepath("tests/package/test_mender/post-build.sh"),
+           # overlay to add a fake 'fw_printenv', used by Mender
+           infra.filepath("tests/package/test_mender/rootfs-overlay"))
 
     def base_test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5", kernel="builtin",
-                           options=["-initrd", cpio_file])
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(arch="x86_64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyS0 net.ifnames=0"],
+                           options=["-cpu", "Nehalem",
+                                    "-m", "256M",
+                                    "-net", "nic,model=virtio",
+                                    "-net", "user",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
         self.emulator.login()
 
     def run_mender_test(self):
-        self.assertRunOk("ps aux | egrep [m]ender")
+
+        # mender-authd requires systemd-resolved.service to be up,
+        # so wait for eth0 to get its DHCP address before querying.
+        cmd = "while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done"
+        self.assertRunOk(cmd, timeout=30)
+
+        output, _ = self.emulator.run("systemctl is-active mender-updated")
+        self.assertEqual(output[0], "active")
 
         # Check if a simple Mender command is correctly executed
-        self.assertRunOk("mender -log-level debug show-artifact")
-        self.assertRunOk("mender -log-level debug show-artifact | grep 'RUNTIME_TEST_ARTIFACT_NAME'")
-        cmd = "mender show-artifact 2>&1 | grep -i 'err'"  # Check if no 'error' among the traces
+        self.assertRunOk("mender-update --log-level debug show-artifact")
+        self.assertRunOk("mender-update --log-level debug show-artifact | grep 'RUNTIME_TEST_ARTIFACT_NAME'")
+        cmd = "mender-update show-artifact 2>&1 | grep -i 'err'"  # Check if no 'error' among the traces
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
 
 
-class TestMenderRW(TestMenderInfra):
-    def test_run(self):
-        TestMenderInfra.base_test_run(self)
-
-        # Check if the Daemon is running
-        self.assertRunOk("ls /var/run/mender.pid")
-        self.run_mender_test()
-
-
 class TestMenderRO(TestMenderInfra):
     config = \
         """
@@ -51,22 +75,4 @@ class TestMenderRO(TestMenderInfra):
 
     def test_run(self):
         TestMenderInfra.base_test_run(self)
-
-        # Check if the Daemon is running
-        self.assertRunOk("ls /var/run/mender.pid")
-        self.run_mender_test()
-
-
-# gitlab-runner: large
-class TestMenderSystemd(TestMenderInfra):
-    config = \
-        """
-        {}
-        BR2_INIT_SYSTEMD=y
-        """.format(TestMenderInfra.config)
-
-    def test_run(self):
-        TestMenderInfra.base_test_run(self)
-        output, _ = self.emulator.run("systemctl is-active mender-client")
-        self.assertEqual(output[0], "active")
         self.run_mender_test()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
