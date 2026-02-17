Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA0DE68143
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 08:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9975A60ECA;
	Tue, 17 Feb 2026 08:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuBRj_06zSu3; Tue, 17 Feb 2026 08:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52AE560EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771318176;
	bh=lCW/Us7lO/VcFYR2QrY0gmZDjaBsgNwN6c1HY+JHIIc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B29IsXFWyEVx60qX1ER58kYXPuvl6TVNVeiknvBM2DtLsg4jZYIA6w4qbbutD3Z6+
	 KCoVaE7VJ+g9DH48VCmNyopLS8yj2XYCrVseueJhoWqUTkVweBGkLjVgVnNTU2A5s0
	 ViLH3qHsvyZs7UE7e/HCGGj+QNT8WmBC8CuWRL9UmVIxrcrC3nkOtfsAujZigSxJiJ
	 dNWVSI83ce2j233DCsYhccMS8wCeo7MH6pdwtNCujYoyC1PumB7WsGFUaKyNjfQDSS
	 qNPCwV0evEpLYXUoFjqkFigELIFlIuogspB58NucGZI4ut9SrOuYy7ElkIDSAjbw3F
	 BoavJ1YsxZ9Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52AE560EB6;
	Tue, 17 Feb 2026 08:49:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2980D206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AF1860EAF
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XI4WrJMo9sza for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 08:49:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F02CE60EB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02CE60EB6
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 08:49:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B960E86F89; Tue, 17 Feb 2026 08:49:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 09:45:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41eb6620f42fda2c0e38b6a7b122e59b136e02b0
X-Git-Newrev: c38d7326e093f45252c01e241d0faf6b04023e02
X-Patchwork-Hint: ignore
Message-Id: <20260217084933.B960E86F89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump to 258.3
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2033729252863176152=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2033729252863176152==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c38d7326e093f45252c01e241d0faf6b04023e02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Removed patch that fixed building with libseccomp and old kernel headers
as systemd has fixed that upstream now.

Notable changes:
  - Add -Dlibmount=enabled to host and target build. Disabling this
    option disables building most of systemd's tools apart from
    libsystemd.

  - remove gcrypt and gnutls from dependencies and build options.
    openssl is the only supported crypto library now.

  - Disable nspawn build for host variant and add a Config.in option
    for the target variant.

  - systemd now requires kernel >= 5.4 while the recommended kernel
    version moved to >=5.7. This make systemd depend on
    BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4, removing various dependencies
    on older kernel header versions from sub options.

  - The sha256sum of LICENSES/README.md changed due to various
    license clarification, removal of some vendored files as well as
    changing some file paths. Licensing did not actually change.

For changelog, see:
https://github.com/systemd/systemd/blob/v258.3/NEWS

Tested with `./support/testing/run-tests tests.init.test_systemd`
All tests passed

One of the tests now needs a bigger rootfs size.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Peter: fix check-package warnings]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...omp-only-add-bpf-syscall-to-seccomp-allow.patch | 46 ----------------------
 package/systemd/Config.in                          | 40 +++++++++----------
 package/systemd/systemd.hash                       |  4 +-
 package/systemd/systemd.mk                         | 33 ++++++----------
 support/testing/tests/init/test_systemd.py         |  1 +
 system/Config.in                                   | 10 ++---
 6 files changed, 39 insertions(+), 95 deletions(-)

diff --git a/package/systemd/0001-nspawn-seccomp-only-add-bpf-syscall-to-seccomp-allow.patch b/package/systemd/0001-nspawn-seccomp-only-add-bpf-syscall-to-seccomp-allow.patch
deleted file mode 100644
index 4a74083391..0000000000
--- a/package/systemd/0001-nspawn-seccomp-only-add-bpf-syscall-to-seccomp-allow.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e6ab723c96b91e7c4c495fcef0654102fac26570 Mon Sep 17 00:00:00 2001
-From: Marcus Hoffmann <bubu@bubu1.eu>
-Date: Mon, 2 Feb 2026 18:26:19 +0100
-Subject: [PATCH] nspawn-seccomp: only add bpf syscall to seccomp allowlist if
- headers define CAP_BPF
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When building systemd with kernel headers < 5.8 (which added CAP_BPF) it fails with:
-
-  ../src/nspawn/nspawn-seccomp.c: In function ‘add_syscall_filters’:
-  ../src/nspawn/nspawn-seccomp.c:114:19: error: ‘CAP_BPF’ undeclared (first use in this function)
-    114 |                 { CAP_BPF,            "bpf",                         },
-        |                   ^~~~~~~
-  ../src/nspawn/nspawn-seccomp.c:114:19: note: each undeclared identifier is reported only once for each function it appears in
-
-If the kernel headers don't define CAP_BPF, it's likely that the running
-kernel doesn't know about this capability either, so we can assume that
-we'd never allow this syscall anyway.
-
-So if CAP_BPF isn't defined, just skip this allow_list entry entirely.
-
-Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
-Upstream: N/A - fixed in systemd >= 258 by introducing vendored kernel headers for this use-casea
----
- src/nspawn/nspawn-seccomp.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/nspawn/nspawn-seccomp.c b/src/nspawn/nspawn-seccomp.c
-index 6956689ab5..aaac6085b6 100644
---- a/src/nspawn/nspawn-seccomp.c
-+++ b/src/nspawn/nspawn-seccomp.c
-@@ -108,7 +108,9 @@ static int add_syscall_filters(
-                 { CAP_SYS_BOOT,       "reboot"                       },
-                 { CAP_SYSLOG,         "syslog"                       },
-                 { CAP_SYS_TTY_CONFIG, "vhangup"                      },
-+#ifdef CAP_BPF
-                 { CAP_BPF,            "bpf",                         },
-+# endif
- 
-                 /*
-                  * The following syscalls and groups are knowingly excluded:
--- 
-2.52.0
-
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 931134911a..62dc3f5ad0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -21,7 +21,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
@@ -54,13 +54,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  an elaborate transactional dependency-based service control
 	  logic.  It can work as a drop-in replacement for sysvinit.
 
-	  Kernel versions below 5.4 ("recommended baseline") have
+	  Kernel versions below 5.7 ("recommended baseline") have
 	  significant gaps in functionality and are not recommended
-	  for use with this version of systemd. (e.g. lack race-free
-	  process tracking by pidfd, systemd-networkd, and new mount
-	  API support).
+	  for use with this version of systemd.
 
-	  Systemd requires a Linux kernel >= 3.15 with the following
+	  Systemd requires a Linux kernel >= 5.4 with the following
 	  options enabled:
 
 	  - CONFIG_DEVTMPFS
@@ -94,10 +92,10 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  The selection of other packages will enable some features:
 
 	  - acl package will add support for multi-seat.
-	  - xz and/or l4 packages will add compression support in
-	    journal and coredump.
+	  - bzip, lz4, xz,and/or zstd packages will add compression
+	    support in journal and coredump.
 	  - libcurl package will add support for systemd-journal-upload.
-	  - libgcrypt package will add support for journal sealing and
+	  - openssl package will add support for journal sealing and
 	    DNSSEC verification in resolved.
 
 	  Notice that systemd selects the fsck wrapper from util-linux
@@ -246,7 +244,6 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # fscrypt_key
 	select BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -257,11 +254,11 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-homed.service.html
 
-comment "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
+comment "homed support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
@@ -285,9 +282,8 @@ config BR2_PACKAGE_SYSTEMD_HWDB
 
 config BR2_PACKAGE_SYSTEMD_IMPORTD
 	bool "enable import daemon"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_ZLIB
 	help
@@ -336,6 +332,14 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
 
+config BR2_PACKAGE_SYSTEMD_NSPAWN
+	bool "enable nspawn"
+	help
+	  systemd-nspawn is a tool to spawn a command or OS in
+	  a lightweight container.
+
+	  https://www.freedesktop.org/software/systemd/man/latest/systemd-nspawn.html
+
 config BR2_PACKAGE_SYSTEMD_NSRESOURCED
 	bool "enable nsresourced"
 	help
@@ -358,8 +362,7 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
-	default y if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	default y
 	help
 	  systemd-networkd is a system service that manages networks.
 	  It detects and configures network devices as they appear, as
@@ -370,9 +373,6 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
-comment "systemd-networkd needs a toolchain with kernel headers >= 5.4"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
-
 config BR2_PACKAGE_SYSTEMD_OOMD
 	bool "enable out-of-memory killer"
 	help
@@ -481,8 +481,6 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  Control Kernel, a minimal approach to Access Control
 	  implemented as a kernel LSM.
 
-	  This feature requires a kernel >= 3.8.
-
 	  When this feature is enabled, Systemd mounts smackfs and
 	  manages security labels for sockets.
 
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index d68950f934..193c6b5eb0 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  5a2f477e6268630f6e2829c7bb3e442017549798a4122635817934eaa0c6ac10  systemd-257.10.tar.gz
+sha256  a800facc2effb509bff67700ce1224da96a36fb658e29e03c843fb74fa1edbdc  systemd-258.3.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
@@ -13,4 +13,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  768ecb25cb1e6e41672fc655571f45ba46a3f03fcbc6ab56c7a09ac5928eb37b  LICENSES/README.md
+sha256  bce1d2e9bad517b493168b37604c5d02a7fb638b4d1b9fc730adafa06c603456  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6ab6586009..7ed777b6e4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 257.10
+SYSTEMD_VERSION = 258.3
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -107,7 +107,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dbpf-framework=disabled \
 	-Dvmlinux-h=disabled \
 	-Dumount-path=/usr/bin/umount \
-	-Dxenctrl=disabled
+	-Dxenctrl=disabled \
+	-Dlibmount=enabled
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_OPTIMIZE_FAST),y)
@@ -267,13 +268,6 @@ else
 SYSTEMD_CONF_OPTS += -Dlibcurl=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-SYSTEMD_DEPENDENCIES += libgcrypt
-SYSTEMD_CONF_OPTS += -Dgcrypt=enabled
-else
-SYSTEMD_CONF_OPTS += -Dgcrypt=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 SYSTEMD_DEPENDENCIES += p11-kit
 SYSTEMD_CONF_OPTS += -Dp11kit=enabled
@@ -567,6 +561,12 @@ else
 SYSTEMD_CONF_OPTS += -Dsysupdate=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_NSPAWN),y)
+SYSTEMD_CONF_OPTS += -Dnspawn=enabled
+else
+SYSTEMD_CONF_OPTS += -Dnspawn=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
@@ -595,22 +595,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 SYSTEMD_CONF_OPTS += \
-	-Dgnutls=disabled \
-	-Dopenssl=enabled \
 	-Ddns-over-tls=openssl \
 	-Ddefault-dns-over-tls=opportunistic
 SYSTEMD_DEPENDENCIES += openssl
-else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-SYSTEMD_CONF_OPTS += \
-	-Dgnutls=enabled \
-	-Dopenssl=disabled \
-	-Ddns-over-tls=gnutls \
-	-Ddefault-dns-over-tls=opportunistic
-SYSTEMD_DEPENDENCIES += gnutls
 else
 SYSTEMD_CONF_OPTS += \
-	-Dgnutls=disabled \
-	-Dopenssl=disabled \
 	-Ddns-over-tls=false \
 	-Ddefault-dns-over-tls=no
 endif
@@ -1015,7 +1004,9 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dp11kit=disabled \
 	-Dlibfido2=disabled \
 	-Dpcre2=disabled \
-	-Dsysupdated=disabled
+	-Dsysupdated=disabled \
+	-Dnspawn=disabled \
+	-Dlibmount=enabled
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 7fdd5d1798..41545cbeed 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -210,6 +210,7 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
         BR2_PACKAGE_SYSTEMD_SYSUSERS=y
         BR2_PACKAGE_SYSTEMD_VCONSOLE=y
         BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
         """
 
     def test_run(self):
diff --git a/system/Config.in b/system/Config.in
index 8f2dde59e7..f4788cd72e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -123,24 +123,24 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 8"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.4, host and target gcc >= 8"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_HOST_GCC_AT_LEAST_8
 
-comment "systemd highly recommends Linux >= 4.15"
+comment "systemd highly recommends Linux >= 5.7"
 	depends on BR2_INIT_SYSTEMD
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
 
 comment "Special purpose (read help)"
 

--===============2033729252863176152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2033729252863176152==--
