Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14561606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kGKYOKtK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1BD680BBC;
	Wed, 28 Oct 2026 15:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XODVgjaeVc1I; Wed, 28 Oct 2026 15:54:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8BC7080BCC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793202876;
	b=Y/aLgWyj2LUpOndus14aSkjsWYjxLo8Rjj8yyWS0Bmm9kelY/zqZuPqSDwiXprOS/kRo
	 Vi3IWY8Koa1VlFfFaFEYInjPG9KV2UeKyAY7r4pt8QYxw9lg978JDde6NUiGOmw7l/9Rr
	 x0P7FP9JByO07Ra++XV3s4i7/T61wtZ1f8lpybYtGEf2xSnBoX7nDHo9BvaTt4yQxJ7HF
	 6sIx54g7wopvTbKPxfdX1+/W2WYuNWjLf0uSfZ8t8jaWc8+e6/65kcz8Ps7bo7NTVDqWB
	 sN1fFHqtN94EAQecbpOPpUgkN3geDtGMMNgKiGD23jjBs8bzb2QB4Cano/pS5y34Tdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793202876;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SFKerYXzo8qs81H8BDT10tegvkqgHWQBpMDudEjZq0c=;
	b=c+uPBtqPoQl7467xC1bU8+K2ECy325AFtaLMgNu6Tf/GObcfLXFyD/XSVnvCZsVwBN98
	 EWCkHb3FjAO1x0IekUJ3CPpgi6cdyDZWT2isnV0chqbVmuzF0GOOIygt98GqtaIuJMpcC
	 KB2obSbTepdgNn/6+/cA5eZAU9qeAdYx8EMUnmz0HPdcASDpRm33TnrZSj3tpBPtD2dE6
	 BuQoJGSPRrN4gVcfrDTps3NT/JuwqGH3xp6S5zc2bb1IO4DM8HIkrKHUuMPKwiIeM5ppi
	 Uc0y5EOxgbabAj5DG4oGHDmtiXSQ4aETse8KiSfAKuVnd2tgFlDI8SgCDYc5uJoMO7A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793202876;
	bh=SFKerYXzo8qs81H8BDT10tegvkqgHWQBpMDudEjZq0c=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kGKYOKtKgougGchUycocOlhJfqDH8LREodaE0zkpmIxWID1wass5W5p6OH2l0IIOB
	 GR0yGV6tI+F+Yt3xn3Dory0OWOfdYrI8KKxiQ+XyAtwv+tA0O2E5peZQBJM+wmA0tZ
	 5/S8QndikgUcdOxlC0MCTIkCJnBkBdjOvHh7gltmzOqeEr8I2B+eFUZFaajnYN9gZg
	 ssfKMxYADPswsV1baCRKbtXQkG4sPoccH+JJsJrwyiDwgKhUJOX5LGlNBXhINsRe/+
	 cOfvoNwQuFDVENJmizDPk6FdD0hMGbnATPlNwRgkkpx0XdgsoIuOEDQQTAWWXrDmFW
	 Tf3T78+YcKf0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BC7080BCC;
	Wed, 28 Oct 2026 15:54:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 393D14D1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A9F680BCC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41Dg8LRfzpuQ for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 15:54:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7367980BBC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793202874;
 b=CsMQY+ctHJ93lEwYIpNcm41uTQMcAL27XiJUPQ8RayPTSxSmk1OayDTJbP1jFqNfw98f
 +MhZYg8Di1sG/5YkEUFkfkmq8TNaWcS8jkVquqgYSAB7H4vhm94KDy5Gl/NRpHYon1XId
 l/1SHUYBPcoBk5Y9/z1OfepsgomzyzJJ+HyggOfbsgBj72YmhVWApnDilb5w+wqZWaXXG
 hfkh5RCJqRVXBU0HZ2BBKwlLEor7W5D6JhBKUTkd+Qq/IdYoc/iPkwDpIQyKFZbsRsB6a
 2gQgo1hdpJAI84SPOY1ZslEExQHOc+BFFmFcBrzwhYn12IIwEgisj/GfO1qSP8+ASgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793202874;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=MEYCCDdbP0sxSLsGtChgw+OS95gL/QQm9d9wU39eeFQ=;
 b=g9I/RoMUp2hMtICz8/ROHJ8PrdSHdavufcNihuhLdmRlaJAg6+ZdiHwAI1tqJklQdNs5
 mCznP1uCdOICFO5zzMqikx6jlM92bXC7LG0Ti2O+T3xR/JgW5jHkVjSRuHFhlE5C5mUTb
 +XHOn1WuWh2bXQLdxrR9hFdaINdfpefjL077QZIg6DTKdMW3uSqU5NUoPUaLSjXOs2FE1
 qqlzD4eV4t6Llsj2Uacx+YqpvNhZsOnOWKHwHMbzUtWmQl8iF5JcIVadbSdhBbbxeyi/f
 D/Glu2rHoUEqdvET5JBudvbW16Azz/0QLCuLvjJvc7PIgD4gu1zOGuBHalcBnF3tvrA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CJybeMsh; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7367980BBC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:54:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1wYngT3Oto-00wDuO; Wed, 28
 Oct 2026 16:54:26 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 28 Oct 2026 16:54:08 +0100
Message-ID: <20261028155409.3271339-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Sgw+epqxT6fqSYDLqMkpIOhXpYrPMXJHDCj+ppqOEpWT45J2l2s
 58oSgGCRgeuo94BQO3rN7IJVEpe+rdIjpetlo1ry2RBCY5wj+6bxAugXvxypJyaYuifJ2a2
 rS6fD6JU7uqTjHomQlxKloptGTgSD5XhjtT6h6rJnXssqcOSR6NBKJjazH8Lflma3IMn6st
 lsnfhAVebAPAqKhebSJ3g==
UI-OutboundReport: notjunk:1;M01:P0:d49dLM2D/Dk=;u8uqsYbXauyMjbRjNvXIKe4IYWh
 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
 LCvohzy7qZKy6RxyHBiBn493yQy93OJZT96WQ==
Subject: [Buildroot] [PATCH v2 1/2] package/systemd/systemd-libudev: new
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Some packages that may be in the dependency chain of systemd
(depending on configuration) depend on libudev, at least for optional
features. An example is lvm2: It needs libudev to allow using udev's
built-in "blkid" implementation, instead of calling "blkid -o udev",
which Busybox's blkid does not support.

However, lvm2 is a dependency of cryptsetup (because it provides
libdevmapper), and cryptsetup is a dependency of systemd if enabled,
creating a loop if the virtual libudev package is provided by the main
systemd package.

Create a bootstrap package for systemd-libudev, which installs only
libudev and its development header and pkgconf file to staging, so
packages that need libudev can be built before systemd. The libudev
installed to the target is still provided by the main systemd package.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* set SYSTEMD_LIBUDEV_DL_SUBDIR = systemd to avoid duplicate downloads

 package/systemd/Config.in                     |   7 +-
 package/systemd/systemd-libudev/Config.in     |  21 ++
 .../systemd-libudev/systemd-libudev.hash      |   1 +
 .../systemd-libudev/systemd-libudev.mk        | 196 ++++++++++++++++++
 package/systemd/systemd.mk                    |  11 +-
 5 files changed, 229 insertions(+), 7 deletions(-)
 create mode 100644 package/systemd/systemd-libudev/Config.in
 create mode 120000 package/systemd/systemd-libudev/systemd-libudev.hash
 create mode 100644 package/systemd/systemd-libudev/systemd-libudev.mk

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 4c19a884b4..75b9a12464 100644
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
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBXCRYPT
@@ -108,9 +108,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
-config BR2_PACKAGE_PROVIDES_LIBUDEV
-	default "systemd"
-
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
@@ -636,3 +633,5 @@ config BR2_PACKAGE_SYSTEMD_VMSPAWN
 	  https://www.freedesktop.org/software/systemd/man/systemd-vmspawn.html
 
 endif
+
+source "package/systemd/systemd-libudev/Config.in"
diff --git a/package/systemd/systemd-libudev/Config.in b/package/systemd/systemd-libudev/Config.in
new file mode 100644
index 0000000000..d9c2687500
--- /dev/null
+++ b/package/systemd/systemd-libudev/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_SYSTEMD_LIBUDEV
+	bool
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_PACKAGE_HAS_LIBUDEV
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBXCRYPT
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
index 0000000000..1812f9d632
--- /dev/null
+++ b/package/systemd/systemd-libudev/systemd-libudev.mk
@@ -0,0 +1,196 @@
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
+	libcap \
+	libxcrypt \
+	util-linux-libs \
+	$(TARGET_NLS_DEPENDENCIES)
+SYSTEMD_LIBUDEV_PROVIDES = libudev
+SYSTEMD_LIBUDEV_CFLAGS = $(SYSTEMD_CFLAGS)
+
+# Disable everything that can be disabled, we only need libudev.
+SYSTEMD_LIBUDEV_CONF_OPTS = \
+	-Dsplit-bin=true \
+	--prefix=/usr \
+	--libdir=lib \
+	--sysconfdir=/etc \
+	--localstatedir=/var \
+	-Dcreate-log-dirs=false \
+	-Dvcs-tag=false \
+	-Dmode=release \
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
+	-Dbzip2=disabled \
+	-Dcoredump=false \
+	-Dcreate-log-dirs=false \
+	-Ddbus-interfaces-dir=no \
+	-Ddbus=disabled \
+	-Ddefault-compression='auto' \
+	-Ddefault-dns-over-tls=no \
+	-Ddefault-dnssec=no \
+	-Ddefault-locale='C.UTF-8' \
+	-Ddefault-user-shell=/bin/sh \
+	-Ddns-over-tls=false \
+	-Defi=false \
+	-Delfutils=disabled \
+	-Denvironment-d=false \
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
+	-Dhostnamed=false \
+	-Dhtml=disabled \
+	-Dhwdb=false \
+	-Didn=false \
+	-Dima=false \
+	-Dimportd=disabled \
+	-Dinitrd=false \
+	-Dinstall-tests=false \
+	-Dipe=false \
+	-Dkernel-install=false \
+	-Dkexec-path=/usr/sbin/kexec \
+	-Dkmod-path=/usr/bin/kmod \
+	-Dldconfig=false \
+	-Dlibarchive=disabled \
+	-Dlibcryptsetup-plugins=disabled \
+	-Dlibcryptsetup=disabled \
+	-Dlibcurl=disabled \
+	-Dlibfido2=disabled \
+	-Dlibidn2=disabled \
+	-Dlibidn=disabled \
+	-Dlibiptc=disabled \
+	-Dlibmount=enabled \
+	-Dloadkeys-path=/usr/bin/loadkeys \
+	-Dlocaled=false \
+	-Dlog-message-verification=disabled \
+	-Dlogind=false \
+	-Dlz4=disabled \
+	-Dmachined=false \
+	-Dman=disabled \
+	-Dmicrohttpd=disabled \
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
+	-Dstoragetm=false \
+	-Dsulogin-path=/usr/sbin/sulogin \
+	-Dsysext=false \
+	-Dsystem-gid-max=999 \
+	-Dsystem-uid-max=999 \
+	-Dsysupdate=disabled \
+	-Dsysupdated=disabled \
+	-Dsysusers=false \
+	-Dsysvinit-path= \
+	-Dsysvrcnd-path= \
+	-Dtests=false \
+	-Dtimedated=false \
+	-Dtimesyncd=false \
+	-Dtmpfiles=false \
+	-Dtpm2=false \
+	-Dtpm=false \
+	-Dukify=disabled \
+	-Dumount-path=/usr/bin/umount \
+	-Durlify=false \
+	-Duserdb=false \
+	-Dutmp=false \
+	-Dvconsole=false \
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
index 346d034822..246b2880c0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -10,8 +10,10 @@
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
@@ -58,11 +60,12 @@ SYSTEMD_DEPENDENCIES = \
 	libcap \
 	libxcrypt \
 	util-linux-libs \
+	systemd-libudev \
 	$(TARGET_NLS_DEPENDENCIES)
 
 SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
-SYSTEMD_PROVIDES = libudev udev
+SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
 	-Dcreate-log-dirs=false \
@@ -1041,3 +1044,5 @@ HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
 
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
