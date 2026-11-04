Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F97F606A328
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 18:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dqRvQUXN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56BFD40752;
	Wed,  4 Nov 2026 18:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25cxsS4bkH9h; Wed,  4 Nov 2026 18:03:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8E81440695
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793815421;
	b=H1um6uKNBY1HH2PjzwdsB57UnI+8f0bt2Sl1jfaxfgVAXsS5JzmfxanIQmBJJK+a5eqA
	 4wS2W0eFU9GwktGzOOtjOVPHuEYnk2Dsp2OY4scLkq0ztyaDnZq+Wm9XVxBHCA9RxoYML
	 J7bjsYXZ4dd8DpGUJzRLF11hJgzJeQEqPlFE83tzJWr9raQx/i3vTjfBIBmjk0vHi+2SM
	 uVwXPIs2tUyo6aEur+hf5dvX0E2DO32Z1ap+XIFl4m8FbkLSSAX9354NDuaL4fX/6Uyjj
	 ItQ3+4iZ848Yq8kwKH+OaRfD7TqubW2dph5wABMe0CC2ZXcsT+ViEz3cQnf8OIX6ucQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FHaRNVz3klwS9CzI5Y+JHYjIHZDP16aZ3LHCIf9j2KI=;
	b=m+q3ZF2J7UymVrqmnRcxZJDNTl1Mz0ZE9vJJELB3ctVbiLbnrUGdTTEJwvUeZB7GRnP+
	 8Ib2hi83D7pQYK+XZ3xxHhtZ5Z9ZuLcqG+t9J9n8s4X7dYUzA/hLAloi9kfSMLYELcEWM
	 wiMSBGuD8gg7tEHWpB9yuSnRwpJbx4kTqQjG77RjbmjZADH6g2Od9W+FyChfiGUCjrqDp
	 WpFEZxig+yoZO0trGXkuRAwYDYY4IZ9HggC8cqfoqSE/PmDUFXb8ybvI6y26jTr4JEteH
	 O0gCBSwGHwzUojue1Sut1USU9VTE2+mET6LIMjuFPCQ6H6utDGsjOsFZnJXjQSHWe7g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793815421;
	bh=FHaRNVz3klwS9CzI5Y+JHYjIHZDP16aZ3LHCIf9j2KI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dqRvQUXNAcPksboHruFlPF10ROINV+0oawivkeOaONgI+2WcVkNMq+Vi4hgeKXMvc
	 MN6qGSa9qRb/vTYogtCzB3GKZnvu+Z3YhcaRmluw0KCXvsuyCR2SVo37iDbR4kddhi
	 TzktSTAGLJjUnssXX+z5Xip/NTAxXcXZe8Oy6/opKzT7zbqINCsCinwKal9k/QpuOW
	 63rSAloin82v5IFjyjnaz/ANZVA2msPpbj312RztRujc/pptTYpzMgZmIH2RM0Hsww
	 qKYOXIsi0PEcXHNrLjc6Avf56lbGThkpMPb8oRi/dDo0KhxFYcrBK7ZGmr5Row9r8m
	 JnQ0GC1fwkgnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E81440695;
	Wed,  4 Nov 2026 18:03:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B13C13A7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACEAD41726
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8An9bhFQmNX for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 18:03:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ABF1440B50
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABF1440B50
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2EF99DD56; Wed,  4 Nov 2026 18:01:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 19:01:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c0c0c5d131d5e5b8b7a1c7fd1e966d68d664653
X-Git-Newrev: cc733c00a33d144439accdab0d52b8a4dcf41ff0
X-Patchwork-Hint: ignore
Message-Id: <20261104180139.D2EF99DD56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump version to 260.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc733c00a33d144439accdab0d52b8a4dcf41ff0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes relevant for packaging:
* SysV init script support has been removed, remove the associated
  options "sysvinit-path" and "sysvrcnd-path" ("rc-local" was never
  set).
* Support for libidn has been removed, IDN functionality now requires
  libidn2. The Meson option "libidn" is deprecated and has no
  effect. Remove the optional dependency and config option.
* Required versions of various dependencies have been raised. The
  respective Buildroot packages meet the version requirements, but
  external toolchains with very old glibc versions might not work any
  more.
    * cryptsetup 2.0.1/2.3.0 -> 2.4.0
    * elfutils 0.158 -> 0.177 (NEWS is missing the "0.")
    * libblkid 2.24 -> 2.37
    * libseccomp 2.3.1 -> 2.4.0
    * glibc 2.31 -> 2.34
    * libxcrypt or libcrypt from glibc -> libxcrypt 4.4.0 only
    * OpenSSL 1.1.0 -> 3.0.0
    * Python 3.7.0 -> 3.9.0
* Linux kernel version requirements have been updated, too. Set
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 accordingly.
    * baseline 5.4 -> 5.10
    * recommended baseline 5.7 -> 5.14
    * 6.6 for full functionality

New options:
* "libcrypt" enables libxcrypt support
* "compat-sysv-interfaces" does two things:
    * restore runlevel[0-6].target units that were removed in v258
    * enable installation of legacy.conf for tmpfiles
  Buildroot has its own legacy.conf in package/skeleton-init-systemd
  and there was no need to restore runlevel targets, so disable
  unconditionally.
* "default-oci-registry", used only with importd

Please see the upstream NEWS file for other changes [1]. Note that the
new "report" and "mstack" features mentioned in NEWS do not have
feature flags.

Due to increased kernel version requirements "systemctl status"
reports "Tainted: old-kernel" with the pre-built 5.10 kernel in
support/testing/tests/init/test_systemd.py. Adjust the code to accept
that as long as it is the only taint flag.

Hash of LICENSES/README.md changed due to removal of a SysV-related
script [2].

[1] https://github.com/systemd/systemd/blob/v260.6/NEWS
[2] https://github.com/systemd/systemd/commit/986fee6217051ce1ffdb53de45fdf9d7bae611ce

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/systemd/Config.in                  |  2 +-
 package/systemd/systemd.hash               |  4 ++--
 package/systemd/systemd.mk                 | 22 ++++++++++------------
 support/testing/tests/init/test_systemd.py |  8 ++++++--
 system/Config.in                           | 10 +++++-----
 5 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 6b1298069a..7f3958aed8 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -21,7 +21,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 7164af23e5..91ad68017b 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  f9a3f1e21e4dd78717bad0888638954467a55d73cab44a2c7a75c5bed47ef814  systemd-259.10.tar.gz
+sha256  46f00bb99c02e295cfda58b2fe9c7eac67a06d2ea5895aa80580c718ca3da71d  systemd-260.6.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
@@ -13,4 +13,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  bce1d2e9bad517b493168b37604c5d02a7fb638b4d1b9fc730adafa06c603456  LICENSES/README.md
+sha256  769cad6e4cf7548fe86ccd11f16a922aaacaeaaf885af15d13bf0d6946f58cf9  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5787decec8..7e95e098ff 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 259.10
+SYSTEMD_VERSION = 260.6
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -66,6 +66,7 @@ SYSTEMD_PROVIDES = libudev udev
 SYSTEMD_CONF_OPTS = \
 	-Dagetty-path=/usr/bin/agetty \
 	-Dbpf-framework=disabled \
+	-Dcompat-sysv-interfaces=false \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
 	-Ddbus=disabled \
@@ -83,6 +84,7 @@ SYSTEMD_CONF_OPTS = \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
 	-Dlibc=glibc \
+	-Dlibcrypt=enabled \
 	-Dlibfido2=disabled \
 	-Dlibmount=enabled \
 	-Dlink-boot-shared=true \
@@ -104,8 +106,6 @@ SYSTEMD_CONF_OPTS = \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
 	-Dsysupdated=disabled \
-	-Dsysvinit-path= \
-	-Dsysvrcnd-path= \
 	-Dtests=false \
 	-Dtmpfiles=true \
 	-Dukify=disabled \
@@ -178,15 +178,11 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=disabled
 endif
 
-# Both options can't be selected at the same time so prefer libidn2
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 SYSTEMD_DEPENDENCIES += libidn2
-SYSTEMD_CONF_OPTS += -Dlibidn2=enabled -Dlibidn=disabled
-else ifeq ($(BR2_PACKAGE_LIBIDN),y)
-SYSTEMD_DEPENDENCIES += libidn
-SYSTEMD_CONF_OPTS += -Dlibidn=enabled -Dlibidn2=disabled
+SYSTEMD_CONF_OPTS += -Dlibidn2=enabled
 else
-SYSTEMD_CONF_OPTS += -Dlibidn=disabled -Dlibidn2=disabled
+SYSTEMD_CONF_OPTS += -Dlibidn2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
@@ -445,7 +441,9 @@ SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_IMPORTD),y)
-SYSTEMD_CONF_OPTS += -Dimportd=enabled
+SYSTEMD_CONF_OPTS += \
+	-Dimportd=enabled \
+	-Ddefault-oci-registry=docker.io
 else
 SYSTEMD_CONF_OPTS += -Dimportd=disabled
 endif
@@ -905,6 +903,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dbootloader=disabled \
 	-Dbpf-framework=disabled \
 	-Dbzip2=disabled \
+	-Dcompat-sysv-interfaces=false \
 	-Dcoredump=false \
 	-Dcreate-log-dirs=false \
 	-Dcreate-log-dirs=false \
@@ -935,12 +934,12 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dldconfig=false \
 	-Dlibarchive=disabled \
 	-Dlibc=glibc \
+	-Dlibcrypt=enabled \
 	-Dlibcryptsetup-plugins=disabled \
 	-Dlibcryptsetup=disabled \
 	-Dlibcurl=disabled \
 	-Dlibfido2=disabled \
 	-Dlibidn2=disabled \
-	-Dlibidn=disabled \
 	-Dlibmount=enabled \
 	-Dlocaled=false \
 	-Dlog-message-verification=disabled \
@@ -983,7 +982,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dsysupdate=disabled \
 	-Dsysupdated=disabled \
 	-Dsysusers=false \
-	-Dsysvinit-path='' \
 	-Dtests=false \
 	-Dtimedated=false \
 	-Dtimesyncd=false \
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 60b9c3d032..1112d5e269 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -32,7 +32,7 @@ class InitSystemSystemdBase(InitSystemBase):
         self.check_init("/lib/systemd/systemd")
 
         # Test there is no tainted flag.
-        output, ret = self.emulator.run("systemctl --no-pager status")
+        output, ret = self.emulator.run("NO_COLOR=1 systemctl --no-pager status")
         self.assertEqual(ret, 0, f"'systemctl status' failed with exit code {ret}, with:\n{output}")
         try:
             # 'support-ended' tainted flag is only set based on the
@@ -45,7 +45,11 @@ class InitSystemSystemdBase(InitSystemBase):
                 for line in output
                 if line.strip().startswith("Tainted: ")
             ][0]
-            raise RuntimeError(f"Tainted flags: {tainted_flags}")
+            # The prebuilt kernel is version 5.10, which is the lower
+            # bound for systemd support as of v260. Ignore
+            # "old-kernel" taint as long as it is the only flag.
+            if tainted_flags != "old-kernel":
+                raise RuntimeError(f"Tainted flags: {tainted_flags}")
         except IndexError:
             # No tainted flag \o/
             pass
diff --git a/system/Config.in b/system/Config.in
index f4788cd72e..8d80d04d97 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -123,24 +123,24 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.4, host and target gcc >= 8"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.10, host and target gcc >= 8"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_HOST_GCC_AT_LEAST_8
 
-comment "systemd highly recommends Linux >= 5.7"
+comment "systemd highly recommends Linux >= 5.14"
 	depends on BR2_INIT_SYSTEMD
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 
 comment "Special purpose (read help)"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
