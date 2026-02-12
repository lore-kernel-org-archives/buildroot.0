Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FDBEEA868
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 22:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED6B381E36;
	Thu, 12 Feb 2026 22:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwYPtWDPMyB3; Thu, 12 Feb 2026 22:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DBA882209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770935712;
	bh=me58ckzO7TP5FAzGChRza81PQtt3IrkyzzxZnX/KSNs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=THwhW0CkcxTiKL8jpQ+WZoQWKeezb/twk/qmLsrlKG5Fr9a5vAd1tVQxq6FmhQcL8
	 q/f2GegwqvwwiqyVQ+AFE48WK95TZWG4segIggFusPPAH0I/i8Zj7y8olO97/NeU+C
	 E9vcHT9jJheO8VG2oP6otFswc2P22zu8JAeNisFQrORq1Yty1g4T2Yr106c1Hq7mYA
	 iok6YZWELBZywb3i6vwQds2IJSnHU9JIW34828zau1yOXR+Nu6aUcuDbnXekYUuD0O
	 tJSATT2cHJEcGPYAMdoFkM5CBzDOAjH9t7ikn3vbJm/UP0Gs7xSMierhkMMJm5/g0a
	 cUrJTgY/kN4Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DBA882209;
	Thu, 12 Feb 2026 22:35:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E9123D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 042F94103D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGTay_4ouz9l for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 22:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A2A4103B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22A2A4103B
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:35:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1385785E22; Thu, 12 Feb 2026 22:35:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 23:34:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8798806f7e283e7da256357883de18bc79e4079
X-Git-Newrev: 7c85f3adf4a844967a1f6f3d585e911861e98297
X-Patchwork-Hint: ignore
Message-Id: <20260212223509.1385785E22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5288780149501389386=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5288780149501389386==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c85f3adf4a844967a1f6f3d585e911861e98297
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Introduce the openscap package. openscap is a command line tool allowing
to scan a system configuration to perform security compliance checks.
The tool consumes XCCDF and OVAL files to perform system evaluation
against a list of policies.

The package provides both a target and a host build configuration, as it
is needed on both sides:
- it is needed on the host to allow building the security policy files
  to be embedded on the target
- it is needed on the target to actually parse and evaluate those
  security policy files.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
[Thomas:
- Drop dependency on openssl, apparently not needed
- Depend on gcrypt if !nss, as either can be used
- Add missing dependency on libxslt]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/openscap/Config.in     | 24 ++++++++++++++
 package/openscap/openscap.hash |  3 ++
 package/openscap/openscap.mk   | 75 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 104 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6478cdad0b..9e983ae113 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -156,6 +156,7 @@ F:	package/zabbix/
 
 N: 	Alexis Lothoré <alexis.lothore@bootlin.com>
 F:	package/libxmlsec1/
+F:	package/openscap/
 F: 	package/python-scp/
 
 N:	Alistair Francis <alistair@alistair23.me>
diff --git a/package/Config.in b/package/Config.in
index 93d15975cb..371a1c33e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2290,6 +2290,7 @@ menu "Security"
 	source "package/libselinux/Config.in"
 	source "package/libsemanage/Config.in"
 	source "package/libsepol/Config.in"
+	source "package/openscap/Config.in"
 	source "package/safeclib/Config.in"
 	source "package/softhsm2/Config.in"
 endmenu
diff --git a/package/openscap/Config.in b/package/openscap/Config.in
new file mode 100644
index 0000000000..317055c753
--- /dev/null
+++ b/package/openscap/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_OPENSCAP
+	bool "openscap"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgcrypt
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_LIBCURL
+	# In theory should build without crypto, but in practice it
+	# doesn't: https://github.com/OpenSCAP/openscap/issues/2310
+	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_LIBXMLSEC1
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UTF
+	help
+	  The purpose of this project is to create security policy
+	  content for various platforms
+
+	  https://www.open-scap.org/
+	  https://github.com/OpenSCAP/openscap
+
+comment "openscap needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS
diff --git a/package/openscap/openscap.hash b/package/openscap/openscap.hash
new file mode 100644
index 0000000000..e98631372d
--- /dev/null
+++ b/package/openscap/openscap.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6e61913fca3a74d310d7cf9354973eeaefa42be909ae649af1df48c3c08bc6ff  openscap-1.3.12.tar.gz
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/openscap/openscap.mk b/package/openscap/openscap.mk
new file mode 100644
index 0000000000..20427524d7
--- /dev/null
+++ b/package/openscap/openscap.mk
@@ -0,0 +1,75 @@
+################################################################################
+#
+# openscap
+#
+################################################################################
+
+OPENSCAP_VERSION = 1.3.12
+OPENSCAP_SITE = https://github.com/OpenSCAP/openscap/releases/download/$(OPENSCAP_VERSION)
+OPENSCAP_LICENSE = LGPL-2.1+
+OPENSCAP_LICENSE_FILES = COPYING
+OPENSCAP_SUPPORTS_IN_SOURCE_BUILD = NO
+OPENSCAP_INSTALL_STAGING = YES
+
+OPENSCAP_DEPENDENCIES = \
+	host-pkgconf \
+	libcurl \
+	libxml2 \
+	libxmlsec1 \
+	libxslt \
+	pcre
+
+HOST_OPENSCAP_DEPENDENCIES = \
+	host-pkgconf \
+	host-libcurl \
+	host-libgcrypt \
+	host-libxml2 \
+	host-libxmlsec1 \
+	host-libxslt \
+	host-pcre
+
+OPENSCAP_CONF_OPTS = \
+	-DENABLE_OSCAP_UTIL=ON \
+	-DENABLE_OSCAP_UTIL_DOCKER=OFF \
+	-DENABLE_OSCAP_UTIL_CHROOT=OFF \
+	-DENABLE_OSCAP_UTIL_PODMAN=OFF \
+	-DENABLE_OSCAP_UTIL_VM=OFF \
+	-DENABLE_PROBES_WINDOWS=OFF \
+	-DENABLE_TESTS=OFF \
+	-DWITH_CRYPTO=gcrypt \
+	-DENABLE_PYTHON3=OFF
+
+HOST_OPENSCAP_CONF_OPTS = \
+	-DENABLE_OSCAP_UTIL=ON \
+	-DENABLE_OSCAP_UTIL_DOCKER=OFF \
+	-DENABLE_OSCAP_UTIL_CHROOT=OFF \
+	-DENABLE_OSCAP_UTIL_PODMAN=OFF \
+	-DENABLE_OSCAP_UTIL_VM=OFF \
+	-DENABLE_PROBES_WINDOWS=OFF \
+	-DENABLE_TESTS=OFF \
+	-DWITH_CRYPTO=gcrypt \
+	-DENABLE_PYTHON3=OFF
+
+ifeq ($(BR2_PACKAGE_ACL),y)
+OPENSCAP_DEPENDENCIES += acl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+OPENSCAP_DEPENDENCIES += libcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+OPENSCAP_DEPENDENCIES += libgcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+OPENSCAP_DEPENDENCIES += libnss
+endif
+
+ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+OPENSCAP_DEPENDENCIES += musl-fts
+OPENSCAP_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))

--===============5288780149501389386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5288780149501389386==--
