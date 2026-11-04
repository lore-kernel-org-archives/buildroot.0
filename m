Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41108606A328
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LfGoS+Ng
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B72B40940;
	Wed,  4 Nov 2026 18:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StgIj-EbKF6P; Wed,  4 Nov 2026 18:03:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 34F574095D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793815407;
	b=adR6xCHCeVNLCgG2EPnxmxUuc8xS1YH2ic+o+wF0qque3DgKSu2sjyaS74A1CRQFdwPI
	 1EoMnr02usWpBaR3m+uZkKA4DCIfSH7RTiGm+J0/dcotuRiCXeAXLN3xacG3oEGwY9XX6
	 VT4g/yojLPHzao+alIANOUD37ODhAf+EGUIB6j3HRr/G71lVt4A5bVWpQ0aofeFvf5Kc0
	 /vuDnbWklhX1xn8/99UfrCWR5AFV2c9/Y9D8rIkI5BgpQrwYS/lsYpLMFd1tmT8+shu/7
	 EFMzugIceafxv5O9zLPQYrUbOniMNUydcpev0BdZoKmjI4YEE71qNEELVUPcGlFpFMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JqSxFOjYRRePncF0OfNi4zZsC7fQNlUgAGmxErL9cfw=;
	b=evreqb3Cxfoo1ymwCRAsH7p0IxBbtoYLIQqhFtwYuLS5IKiCzroT+1e+UTEs38lWFMj6
	 FRTDkEBsjrpmP2HwD0YRNhGyk+6WdIlwKG0+bdckyYZCECvUlChT/VFG9zKO/A1UwDwjF
	 cT9Ai+0L78xMUUNhvnbee32lPcAaiakBdtYqtDHu/ttEl7tCtkfX86sg9xhiHK5ac2eVm
	 ylNM/3l5SgyPj94rBTn1GFyVpoIEJKYEeZxVGZoWW67a1V86JLC1qAv2L0iJAynuEUyyZ
	 uuM/g7R3JEYwG+r9IjZEEF48F8DRZGrjq1iBeWMb7nZMulfJ12nJwFfEf1bszakDGBw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793815407;
	bh=JqSxFOjYRRePncF0OfNi4zZsC7fQNlUgAGmxErL9cfw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LfGoS+NgHcDqF9t52VHx3wqSIkQL0kxokPCb/Lqed98fFftT3RI97rVRuZh1z/zGM
	 REjuCaY11G6ZkGsC35ruc18rMDMxdzR8u0DzccPyhkznr6/mX6uXvCgAegCX0QMgt/
	 5OXqLt5nIX0uHdDaN9l2LbCKGU/b9oiwQQjn3y3E3i31veQ4zG7oILANC6xA5Q+Gsx
	 r5Wbwt8nZUW0tEilDP8F5mbehXTlbeLFlaqWIqa60ucR73hDtSzNzAODP0UG0UlKP4
	 6ZzzWp37MG+4ZPrdgZzhanH0Ot4cFHl+qy4PS4OLHuSaZVOf++IN2cHONMrGmei2VW
	 lYYEiB+kHaqJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34F574095D;
	Wed,  4 Nov 2026 18:03:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2472177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A412F408DE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xzlPGZzo-xM for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 18:03:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B76A440CE8
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B76A440CE8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E11E39DC83; Wed,  4 Nov 2026 18:01:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 19:01:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc733c00a33d144439accdab0d52b8a4dcf41ff0
X-Git-Newrev: 24cff684345ac6fceee1bfbdc8ef21e981887fae
X-Patchwork-Hint: ignore
Message-Id: <20261104180139.E11E39DC83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump version to 261.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/24cff684345ac6fceee1bfbdc8ef21e981887fae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version adds an IMDS (Cloud "Instance Metadata Service")
subsystem, to recognize running in VMs provided by certain cloud
providers and provide information on the instance. This is left
disabled. The user "systemd-imds" defined in the new
sysusers.d/systemd-imds.conf.in source file is only needed if IMDS is
enabled.

Excerpts from NEWS possibly relevant for other package builds and post
scripts:
* "libsystemd is no longer guaranteed to be linked against libm. [...]
  Consumers that rely on libsystemd transitively pulling in libm
  should link against it themselves." [1]
* "Individual binaries now also embed the dlopen ELF metadata note
  (https://uapi-group.org/specifications/specs/elf_dlopen_metadata/)
  for their dlopen() dependencies, which allows packaging tools to
  reliably discover the set of optional dependencies of a binary,
  [...]" [2]

New options:
* "sysinstall" enables a textual installer/setup tool, disabled
* "imds" enables/disables the new IMDS subsystem, disabled
* "imds-network" has no effect with imds disabled, leave unset
* "systemd-imds-uid" is left unset like other fixed uid options

Building with kernel headers <5.12 fails because the epoll_pwait2 and
mount_setattr syscalls are undefined (either may appear in the error
message depending on build order). Upstream has rejected an issue
about the latter [3] without changing the "minimum baseline", so we
have to conclude only the "recommended baseline" is supported for
building. Update our header requirements accordingly, drop the config
comment about the recommended version because it is now required, and
note it in the update instructions in package/systemd/systemd.mk.

Please see the upstream NEWS file for other changes [4].

Hash of LICENSES/README.md changed due to licence changes (to MIT-0)
[5,6] and renaming [7] of listed files.

[1] https://github.com/systemd/systemd/blob/v261.4/NEWS#L100-L110
[2] https://github.com/systemd/systemd/blob/v261.4/NEWS#L604-L608
[3] https://github.com/systemd/systemd/issues/43575
[4] https://github.com/systemd/systemd/blob/v261.4/NEWS
[5] https://github.com/systemd/systemd/commit/919b8c7c92b120ba986a28882c151777661e97d6
[6] https://github.com/systemd/systemd/commit/b5ee53b6c8235289a9fe2a9223aa6cb99734ce20
[7] https://github.com/systemd/systemd/commit/74d392ed1bab578e901699ee272faa0c8b922128

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/systemd/Config.in    |  2 +-
 package/systemd/systemd.hash |  4 ++--
 package/systemd/systemd.mk   | 10 ++++++++--
 system/Config.in             | 10 +++-------
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7f3958aed8..7fd05be41b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -21,7 +21,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 91ad68017b..16dab511d2 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  46f00bb99c02e295cfda58b2fe9c7eac67a06d2ea5895aa80580c718ca3da71d  systemd-260.6.tar.gz
+sha256  2f78c37c6592dd34b95cca86793f1b8c5b073db35681ef80ea16a73c0c297a9e  systemd-261.4.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
@@ -13,4 +13,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  769cad6e4cf7548fe86ccd11f16a922aaacaeaaf885af15d13bf0d6946f58cf9  LICENSES/README.md
+sha256  a3be270384280249880bd69cab48de68f3e9906b975fb172bc2b83657c43d9a0  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7e95e098ff..e9e3abf26b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -6,7 +6,9 @@
 
 # When updating systemd, take care of the following:
 # - Check if the requirements have changed (see README), in particular
-#   arch and headers
+#   arch and headers. Use the "recommended baseline" to choose
+#   BR2_TOOLCHAIN_HEADERS_AT_LEAST_..., upstream rejects issues about
+#   build failures with older versions.
 # - If yes, propagate the dependencies to BR2_INIT_SYSTEMD
 # - If the required kernel options have changed, update the Config.in
 #   help text and the list of KCONFIG_ENABLE_OPT.
@@ -19,7 +21,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 260.6
+SYSTEMD_VERSION = 261.4
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -77,6 +79,7 @@ SYSTEMD_CONF_OPTS = \
 	-Dfuzz-tests=false \
 	-Didn=true \
 	-Dima=false \
+	-Dimds=disabled \
 	-Dinstall-tests=false \
 	-Dipe=false \
 	-Djournal-storage-default=persistent \
@@ -103,6 +106,7 @@ SYSTEMD_CONF_OPTS = \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dswapoff-path=/usr/sbin/swapoff \
 	-Dswapon-path=/usr/sbin/swapon \
+	-Dsysinstall=false \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
 	-Dsysupdated=disabled \
@@ -926,6 +930,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhwdb=true \
 	-Didn=false \
 	-Dima=false \
+	-Dimds=disabled \
 	-Dimportd=disabled \
 	-Dinitrd=false \
 	-Dinstall-tests=false \
@@ -979,6 +984,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dsplit-bin=true \
 	-Dstoragetm=false \
 	-Dsysext=false \
+	-Dsysinstall=false \
 	-Dsysupdate=disabled \
 	-Dsysupdated=disabled \
 	-Dsysusers=false \
diff --git a/system/Config.in b/system/Config.in
index 8d80d04d97..baac35be14 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -123,25 +123,21 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.10, host and target gcc >= 8"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.14, host and target gcc >= 8"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_HOST_GCC_AT_LEAST_8
 
-comment "systemd highly recommends Linux >= 5.14"
-	depends on BR2_INIT_SYSTEMD
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
-
 comment "Special purpose (read help)"
 
 config BR2_INIT_CATATONIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
