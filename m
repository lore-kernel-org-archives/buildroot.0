Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAE7C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:36:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB49A60F38
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB49A60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 963CA60875;
	Tue,  3 Aug 2021 22:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DB7m__4PCxvq; Tue,  3 Aug 2021 22:35:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3B9606EE;
	Tue,  3 Aug 2021 22:35:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 188A21BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B061540558
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5f_fG4hfWDWg for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C539D40592
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 28C5E87E2D; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 23:21:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0a954d441218daa6bbafb74d30539e6b14f193b8
X-Git-Newrev: f0d37e275a915539a581c4ac7fd066eddc41fc8c
X-Patchwork-Hint: ignore
Message-Id: <20210803211023.28C5E87E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libtalloc: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f0d37e275a915539a581c4ac7fd066eddc41fc8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

talloc is a hierarchical, reference counted memory pool system with destructors.
It is the core memory allocator used in Samba.

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                            |  2 ++
 package/Config.in                     |  1 +
 package/libtalloc/Config.in           | 10 +++++++
 package/libtalloc/libtalloc-cache.txt | 42 +++++++++++++++++++++++++++
 package/libtalloc/libtalloc.hash      |  4 +++
 package/libtalloc/libtalloc.mk        | 53 +++++++++++++++++++++++++++++++++++
 6 files changed, 112 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cc830d4a2a..869f66f028 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -654,6 +654,7 @@ F:	package/x264/
 
 N:	David GOUARIN <dgouarin@gmail.com>
 F:	package/librelp/
+F:	package/libtalloc/
 
 N:	David Lechner <david@lechnology.com>
 F:	board/lego/ev3/
@@ -1788,6 +1789,7 @@ F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/libssh2/
+F:	package/libtalloc/
 F:	package/libqmi/
 F:	package/lighttpd/
 F:	package/logrotate/
diff --git a/package/Config.in b/package/Config.in
index adda6f5be9..5941e35c05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1952,6 +1952,7 @@ menu "Other"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
 	source "package/libspatialindex/Config.in"
+	source "package/libtalloc/Config.in"
 	source "package/libtasn1/Config.in"
 	source "package/libtommath/Config.in"
 	source "package/libtpl/Config.in"
diff --git a/package/libtalloc/Config.in b/package/libtalloc/Config.in
new file mode 100644
index 0000000000..bb671128fb
--- /dev/null
+++ b/package/libtalloc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBTALLOC
+	bool "libtalloc"
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	help
+	  talloc is a hierarchical, reference counted memory pool
+	  system with destructors. It is the core memory allocator
+	  used in Samba.
+
+	  https://talloc.samba.org/talloc/doc/html/index.html
diff --git a/package/libtalloc/libtalloc-cache.txt b/package/libtalloc/libtalloc-cache.txt
new file mode 100644
index 0000000000..a2b44857da
--- /dev/null
+++ b/package/libtalloc/libtalloc-cache.txt
@@ -0,0 +1,42 @@
+Checking simple C program: OK
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking for large file support without additional flags: OK
+Checking for -D_LARGE_FILES: OK
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: OK
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_INCOHERENT_MMAP: NO
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: OK
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether setreuid is available: OK
+Checking whether setresuid is available: OK
+Checking whether seteuid is available: OK
+Checking whether fcntl locking is available: OK
+Checking whether fcntl lock supports open file description locks: OK
+Checking for the maximum value of the 'time_t' type: OK
+Checking whether the realpath function allows a NULL argument: OK
+Checking whether POSIX capabilities are available: OK
+Checking for ftruncate extend: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
+getcwd takes a NULL argument: OK
+Checking uname sysname type: "Linux"
+Checking uname release type: "5.4.0"
+Checking uname version type: "#1 Tue Oct 1 00:00:00 UTC 2020"
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
+Checking errno of iconv for illegal multibyte sequence: "0"
+checking for clnt_create(): OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
new file mode 100644
index 0000000000..9d48a965d0
--- /dev/null
+++ b/package/libtalloc/libtalloc.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz
+sha256  15c2767545d1e43dc35832736253bde5be956f8ffec0474a6d0f70349b646ed3  talloc.h
+sha256  8742f2dad3aaf885c7b4b699c20bfa0e9edeab380689f91a88aa90af03e6947b  pytalloc.h
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
new file mode 100644
index 0000000000..fb382cff76
--- /dev/null
+++ b/package/libtalloc/libtalloc.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# libtalloc
+#
+################################################################################
+
+LIBTALLOC_VERSION = 2.3.1
+LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
+LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
+LIBTALLOC_LICENSE = LGPL-3.0+, GPL-3.0+
+LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h
+LIBTALLOC_INSTALL_STAGING = YES
+
+# --with-libiconv= is unconditionally passed, even if libiconv is not
+# present. Indeed, waf will search for libiconv by default in
+# /usr/local. Because of a bug in some waf python script, /usr/local
+# is then used in many subsequent and unrelated checks, which
+# ultimately causes a failure when BR2_COMPILER_PARANOID_UNSAFE_PATH
+# is set.  However no need to set libiconv as a dependency of
+# libtalloc since it's optional.
+LIBTALLOC_CONF_OPTS += --cross-compile \
+		--cross-answers=$(@D)/cache.txt \
+		--hostcc=gcc \
+		--with-libiconv=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LIBTALLOC_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
+LIBTALLOC_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
+LIBTALLOC_DEPENDENCIES += libtirpc host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBTALLOC_DEPENDENCIES += host-python3 python3
+LIBTALLOC_CONF_ENV += \
+	PYTHON="$(HOST_DIR)/bin/python3" \
+	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
+# There isn't any --enable-python configuration option
+else
+LIBTALLOC_CONF_OPTS += --disable-python
+endif
+
+LIBTALLOC_WAF = ./buildtools/bin/waf
+
+# like samba4, libtalloc uses the waf build system which requires a
+# proper answers file to configure package before build
+define LIBTALLOC_POPULATE_WAF_CACHE
+	$(INSTALL) -m 0644 package/libtalloc/libtalloc-cache.txt $(@D)/cache.txt
+	echo 'Checking uname machine type: $(BR2_ARCH)' >> $(@D)/cache.txt
+endef
+
+LIBTALLOC_PRE_CONFIGURE_HOOKS += LIBTALLOC_POPULATE_WAF_CACHE
+
+$(eval $(waf-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
