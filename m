Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88861606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FJ4lGXRQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F8A4084F;
	Thu,  5 Nov 2026 13:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pHxBtuvolo9; Thu,  5 Nov 2026 13:17:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F3F1440877
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793884625;
	b=PCpZvtZhmN60rzLs6KF+3HKbsUfotPUYZYisxCKpetXeYP5fiUyzpWKPXPBWsR5MQxxl
	 An80Gp9i0zLtSE94shz3QwpsBTLY84JprmohlF0srVC60Ffjw1qSwTN/jeGqr1eBUUrvQ
	 BQkWLxfjD+txnq7dQOJkYlMQ1V1pwEhvQXg+2ERywxHl20m9AVdUphfI/NNGlxTZLcZec
	 4l5gvntKzj+KGP8uPmEdgIdrNy03xR/5cJqDBxIfcyRctNqmL9/sQQabVwUzkEpSfxEkY
	 hYm2L8gkZEhRtMXco1VqyD6NrUqQxirCzZpesz/wAqOuk1KJG9Zkve7UmymQdhkWDnQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793884625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yLsd/rbkRAv9TKHacyDLpkScZmMwScGdPhQ+MXJgZyI=;
	b=XZJCdUwJdlMiUIRvGPV5U6KH5e5tcLwooYOb5fludYMvQYuMDDHOEYmyNxbbv+yBkB3B
	 w2iWhdbPwkzBfUSWC39rE7+RW7Rl5b27Rw0TEc3Aoq9TEWQ/EDbK9fbOpbY5UPO7JXv6C
	 hB5FrwfVaN82RyKd2CxO/R2/8OmZi/Gi0Qs/bUUX2s/U993Inynzytg0Jv9Gyn0GxyI0i
	 qW2891wxo/2lm5AGaVyKu/SlPYX/Xh4kUErq8UrzIZ/D8Q8s+OK6PEd6Xab6pgvJk5Gjp
	 CNs9yzy0KYaglf29ZPYfsWrEq0u+Ff7dF1tNii7AFwMxeq06IigoTTYL6Qpr9/z0OLQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793884625;
	bh=yLsd/rbkRAv9TKHacyDLpkScZmMwScGdPhQ+MXJgZyI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FJ4lGXRQS0JFmjzFrj0K+yZhHkzjoHZs3cd5mDLGiQoMCQ+w5wNPhwX92iY5VMOBI
	 D33ZV8KdX3JiBbv7EcBz6MbejeoYEHKZK9CZhrRE/cF01orb1yoySPhtVGP6re9De2
	 cmItoVDkRRiqyRE9Sa0TPSjY6hy5KFzz5OJXg9XcXA/MfHveehMX51f8wsHgB5HPQ4
	 FvPr7+3L+uphFH9GMy+W0ljBJJNrYn5ebtFmc/UYnN+6s25Cz62AtXVyVKMueN3/KW
	 XrTDgaexGHitC6LgJWllY9Yr80zsMwRNFC6hKR00Gzw/HNVR74VdNwnj+eZzJPfXxq
	 4+HKS8JKcVVIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F1440877;
	Thu,  5 Nov 2026 13:17:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81EDC34D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 737EB81134
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yd-aekGh3oAr for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:17:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 90152810F7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90152810F7
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:17:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1we7Vo3XLi-00mu3K; Thu, 05
 Nov 2026 14:16:47 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu,  5 Nov 2026 14:16:37 +0100
Message-ID: <20261105131639.3779778-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:n8CJQIK0M12zSRo4vhR2P8weE4GLlcOdNPnzr55vH6DEu9nCcM2
 41BRckQN+V4gSHk3efOs+mjoDyVhXEJC4HEC0diOZ8hyXTsXHWESOMjQ97NeVwJbhk02/8C
 5y7OWMP2kUugHSK4Q611MEbjcIEBfqrouazLrGjCBiWRhgBP0GOZ41xBMrcrrUxRgonyMUe
 MMhMLN6qD+I6tR1mKf/5A==
UI-OutboundReport: notjunk:1;M01:P0:1Nqkpp+7/jw=;7BwR0QwUctB1yVS0V/6KrIcsNvS
 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
 uVSQ5LzKuUEeDRQr/s2LzhFuCLEJIpI=
Subject: [Buildroot] [PATCH v4 1/3] package/systemd/systemd-libudev: new
 bootstrap subpackage
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Some packages that may be in the dependency chain of systemd
(depending on configuration) depend on libudev, at least for optional
features. An example is lvm2: It needs libudev to synchronize with
udev events, and to allow using udev's built-in "blkid"
implementation, instead of calling "blkid -o udev", which Busybox's
blkid does not support.

However, lvm2 is a dependency of cryptsetup (because it provides
libdevmapper), and cryptsetup is a dependency of systemd if enabled,
creating a loop if the virtual libudev package is provided by the main
systemd package.

Create a bootstrap package for systemd-libudev, which installs only
libudev, its development header, and pkgconf file to staging, so
packages that need libudev can be built before systemd. The libudev
installed to the target is still provided by the main systemd package.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v3 -> v4:
* require kernel headers >=5.14, matching systemd v261.4 bump

v3: https://patchwork.buildroot.org/project/buildroot/patch/20261030205033.839644-1-fiona.klute@gmx.de/

Changes v2 -> v3:
* rebase on "Update systemd to current stable" series
* mention udev synchronization in commit message

Changes v1 -> v2:
* set SYSTEMD_LIBUDEV_DL_SUBDIR = systemd to avoid duplicate downloads

 package/systemd/Config.in                     |   7 +-
 package/systemd/systemd-libudev/Config.in     |  19 ++
 .../systemd-libudev/systemd-libudev.hash      |   1 +
 .../systemd-libudev/systemd-libudev.mk        | 197 ++++++++++++++++++
 package/systemd/systemd.mk                    |  11 +-
 5 files changed, 228 insertions(+), 7 deletions(-)
 create mode 100644 package/systemd/systemd-libudev/Config.in
 create mode 120000 package/systemd/systemd-libudev/systemd-libudev.hash
 create mode 100644 package/systemd/systemd-libudev/systemd-libudev.mk

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7fd05be41b..872790ac6b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,8 +26,8 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_ROOTFS_MERGED_BIN
-	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_SYSTEMD_LIBUDEV # bootstrap subpackage
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBXCRYPT
 	select BR2_PACKAGE_UTIL_LINUX
@@ -107,9 +107,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
-config BR2_PACKAGE_PROVIDES_LIBUDEV
-	default "systemd"
-
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
@@ -635,3 +632,5 @@ config BR2_PACKAGE_SYSTEMD_VMSPAWN
 	  https://www.freedesktop.org/software/systemd/man/systemd-vmspawn.html
 
 endif
+
+source "package/systemd/systemd-libudev/Config.in"
diff --git a/package/systemd/systemd-libudev/Config.in b/package/systemd/systemd-libudev/Config.in
new file mode 100644
index 0000000000..0ebd1492bd
--- /dev/null
+++ b/package/systemd/systemd-libudev/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_SYSTEMD_LIBUDEV
+	bool
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_PACKAGE_HAS_LIBUDEV
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+
+if BR2_PACKAGE_SYSTEMD_LIBUDEV
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd-libudev"
+
+endif
diff --git a/package/systemd/systemd-libudev/systemd-libudev.hash b/package/systemd/systemd-libudev/systemd-libudev.hash
new file mode 120000
index 0000000000..c5f620b916
--- /dev/null
+++ b/package/systemd/systemd-libudev/systemd-libudev.hash
@@ -0,0 +1 @@
+../systemd.hash
\ No newline at end of file
diff --git a/package/systemd/systemd-libudev/systemd-libudev.mk b/package/systemd/systemd-libudev/systemd-libudev.mk
new file mode 100644
index 0000000000..ee41d977c8
--- /dev/null
+++ b/package/systemd/systemd-libudev/systemd-libudev.mk
@@ -0,0 +1,197 @@
+################################################################################
+#
+# systemd-libudev
+#
+################################################################################
+
+# Some packages that may be in the dependency tree of systemd
+# (e.g. lvm2, via cryptsetup) need libudev to build. This package
+# installs libudev only to STAGING_DIR to break the dependency loop.
+SYSTEMD_LIBUDEV_VERSION = $(SYSTEMD_VERSION)
+SYSTEMD_LIBUDEV_SOURCE = $(SYSTEMD_SOURCE)
+SYSTEMD_LIBUDEV_SITE = $(SYSTEMD_SITE)
+SYSTEMD_LIBUDEV_DL_SUBDIR = systemd
+SYSTEMD_LIBUDEV_LICENSE = $(SYSTEMD_LICENSE)
+SYSTEMD_LIBUDEV_LICENSE_FILES = $(SYSTEMD_LICENSE_FILES)
+SYSTEMD_LIBUDEV_INSTALL_STAGING = YES
+SYSTEMD_LIBUDEV_INSTALL_TARGET = NO
+SYSTEMD_LIBUDEV_DEPENDENCIES = \
+	$(BR2_COREUTILS_HOST_DEPENDENCY) \
+	host-gperf \
+	host-python-jinja2 \
+	util-linux-libs \
+	$(TARGET_NLS_DEPENDENCIES)
+SYSTEMD_LIBUDEV_PROVIDES = libudev
+SYSTEMD_LIBUDEV_CFLAGS = $(SYSTEMD_CFLAGS)
+
+# Disable everything that can be disabled, we only need libudev.
+SYSTEMD_LIBUDEV_CONF_OPTS = \
+	-Dacl=disabled \
+	-Dadm-group=false \
+	-Danalyze=false \
+	-Dapparmor=disabled \
+	-Daudit=disabled \
+	-Dbacklight=false \
+	-Dbinfmt=false \
+	-Dblkid=enabled \
+	-Dbootloader=disabled \
+	-Dbpf-framework=disabled \
+	-Dbuild-static=false \
+	-Dbzip2=disabled \
+	-Dcompat-sysv-interfaces=false \
+	-Dcoredump=false \
+	-Dcreate-log-dirs=false \
+	-Ddbus-interfaces-dir=no \
+	-Ddbus=disabled \
+	-Ddefault-compression='auto' \
+	-Ddefault-dns-over-tls=no \
+	-Ddefault-dnssec=no \
+	-Ddefault-locale='C.UTF-8' \
+	-Ddefault-user-shell=/bin/sh \
+	-Ddlopen-tests=false \
+	-Ddns-over-tls=false \
+	-Defi=false \
+	-Delfutils=disabled \
+	-Denvironment-d=false \
+	-Dfallback-default-target=graphical.target \
+	-Dfdisk=disabled \
+	-Dfirst-boot-full-preset=false \
+	-Dfirstboot=false \
+	-Dfuzz-tests=false \
+	-Dgcrypt=disabled \
+	-Dglib=disabled \
+	-Dgnutls=disabled \
+	-Dgshadow=false \
+	-Dhibernate=false \
+	-Dhomed=disabled \
+	-Dhostname-wordlist=false \
+	-Dhostnamed=false \
+	-Dhtml=disabled \
+	-Dhwdb=false \
+	-Didn=false \
+	-Dima=false \
+	-Dimds=disabled \
+	-Dimportd=disabled \
+	-Dinitrd=false \
+	-Dinstall-tests=false \
+	-Dipe=false \
+	-Dkernel-install=false \
+	-Dkexec-path=/usr/sbin/kexec \
+	-Dkmod-path=/usr/bin/kmod \
+	-Dldconfig=false \
+	-Dlibarchive=disabled \
+	-Dlibc=glibc \
+	-Dlibcrypt=disabled \
+	-Dlibcryptsetup-plugins=disabled \
+	-Dlibcryptsetup=disabled \
+	-Dlibcurl=disabled \
+	-Dlibfido2=disabled \
+	-Dlibidn2=disabled \
+	-Dlibmount=enabled \
+	-Dloadkeys-path=/usr/bin/loadkeys \
+	-Dlocaled=false \
+	-Dlog-message-verification=disabled \
+	-Dlogind=false \
+	-Dlz4=disabled \
+	-Dmachined=false \
+	-Dman=disabled \
+	-Dmicrohttpd=disabled \
+	-Dmode=release \
+	-Dmount-path=/usr/bin/mount \
+	-Dmountfsd=false \
+	-Dnetworkd=false \
+	-Dnologin-path=/bin/false \
+	-Dnspawn=disabled \
+	-Dnsresourced=false \
+	-Dnss-myhostname=false \
+	-Dnss-mymachines=disabled \
+	-Dnss-resolve=disabled \
+	-Dnss-systemd=false \
+	-Doomd=false \
+	-Dopenssl=disabled \
+	-Dp11kit=disabled \
+	-Dpam=disabled \
+	-Dpasswdqc=disabled \
+	-Dpcre2=disabled \
+	-Dpolkit=disabled \
+	-Dportabled=false \
+	-Dpstore=false \
+	-Dpwquality=disabled \
+	-Dqrencode=disabled \
+	-Dquotacheck=false \
+	-Drandomseed=false \
+	-Dremote=disabled \
+	-Drepart=disabled \
+	-Dresolve=false \
+	-Drfkill=false \
+	-Dseccomp=disabled \
+	-Dselinux=disabled \
+	-Dsetfont-path=/usr/bin/setfont \
+	-Dsmack=false \
+	-Dsplit-bin=true \
+	-Dstandalone-binaries= \
+	-Dstoragetm=false \
+	-Dsulogin-path=/usr/sbin/sulogin \
+	-Dsysext=false \
+	-Dsysinstall=false \
+	-Dsystem-gid-max=999 \
+	-Dsystem-uid-max=999 \
+	-Dsystemd-multicall-binary=false \
+	-Dsysupdate=disabled \
+	-Dsysupdated=disabled \
+	-Dsysusers=false \
+	-Dtests=false \
+	-Dtimedated=false \
+	-Dtimesyncd=false \
+	-Dtmpfiles=false \
+	-Dtpm2=disabled \
+	-Dtpm=false \
+	-Dukify=disabled \
+	-Dumount-path=/usr/bin/umount \
+	-Durlify=false \
+	-Duserdb=false \
+	-Dutmp=false \
+	-Dvar-log-mode=0755 \
+	-Dvconsole=false \
+	-Dvcs-tag=false \
+	-Dvmlinux-h=disabled \
+	-Dvmspawn=disabled \
+	-Dwheel-group=false \
+	-Dxdg-autostart=false \
+	-Dxenctrl=disabled \
+	-Dxkbcommon=disabled \
+	-Dxz=disabled \
+	-Dzlib=disabled \
+	-Dzstd=disabled
+
+ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
+endif
+
+ifeq ($(BR2_PACKAGE_ACL),y)
+SYSTEMD_LIBUDEV_DEPENDENCIES += acl
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dacl=enabled
+else
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dacl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_KMOD),y)
+SYSTEMD_LIBUDEV_DEPENDENCIES += kmod
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dkmod=enabled
+else
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dkmod=disabled
+endif
+
+# Build only libudev, libudev.pc is not part of the pre-defined
+# target.
+SYSTEMD_LIBUDEV_NINJA_OPTS = libudev src/libudev/libudev.pc
+
+define SYSTEMD_LIBUDEV_INSTALL_STAGING_CMDS
+	$(HOST_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(HOST_DIR)/bin/meson install -C $(@D)/buildroot-build --no-rebuild --tags libudev
+	$(INSTALL) -m 0644 -D $(@D)/src/libudev/libudev.h \
+		$(STAGING_DIR)/usr/include/libudev.h
+	$(INSTALL) -m 0644 -D $(@D)/buildroot-build/src/libudev/libudev.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libudev.pc
+endef
+
+$(eval $(meson-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 05aefb40cc..0fd6f6abfd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -12,8 +12,10 @@
 # - If yes, propagate the dependencies to BR2_INIT_SYSTEMD
 # - If the required kernel options have changed, update the Config.in
 #   help text and the list of KCONFIG_ENABLE_OPT.
-# - Check if there are new meson_options. Make sure all options are set
-#   explicitly (usually to default value).
+# - Check if there are new meson_options. Make sure all options are
+#   set explicitly (usually to default value). Same in
+#   package/systemd/systemd-libudev, except options not needed for
+#   libudev should be disabled.
 # - If there are new services:
 #   - create new options for them (if they really are optional);
 #   - create a new _USER if necessary;
@@ -59,11 +61,12 @@ SYSTEMD_DEPENDENCIES = \
 	kmod \
 	libxcrypt \
 	util-linux-libs \
+	systemd-libudev \
 	$(TARGET_NLS_DEPENDENCIES)
 
 SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
-SYSTEMD_PROVIDES = libudev udev
+SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS = \
 	-Dagetty-path=/usr/bin/agetty \
@@ -1068,3 +1071,5 @@ HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
 
 $(eval $(meson-package))
 $(eval $(host-meson-package))
+
+include package/systemd/systemd-libudev/systemd-libudev.mk
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
