Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F48C606A328
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 18:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bYitrFMF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 547D580893;
	Wed,  4 Nov 2026 18:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiHv4A2GdUR0; Wed,  4 Nov 2026 18:04:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6A76C820B2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793815419;
	b=IUhXD/XBiyxFYHok26yZoFY4lgJ83e9xmLJv+y9d7EtD/Ehe6DJTukxhl0QlGhheoRcP
	 gfun/qvo6jfpaU/PRetKLnOn7XwD6Im3vzQljIqRFcF0x/7HZVSOnM++A2RXY2Q6EyNxo
	 TW9BGIn+WN7oX02/6iBUsU3azpNYEljQCDpURr8sdRKLEHYGQWrA9XCfVRyS1jMJwis3s
	 jg7jpYv/dDBBexQotF1rN1F2RHmriYdWwllqFEWNXRK84EZqmy1W1dIaAXUAhBrxoOBZ+
	 Funo9225my1XxTYxdzs06zXDt/bwuO8F3/CVbZr/JFaBCS3sLMg6ihVJanC9kco/i/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AXbB+o2C4ERo3PLtc4YxXVro2WE+AbujrGMsyMw9byA=;
	b=ESY8mcX1IkJK8nIGFKrmf/StwCBo/wOf1QBWHa41MGnN3sxaYSsTxj2TbCwOpkZ9Ahdm
	 Z58BxtSexWZtQqHDvse4O/jrNZ05ChuAxfwd+A+v2KD2daFCCPKqBzeUlcnpkLbeoNW4j
	 ZjqMr+Fp+iOlgPuT00JIFPAlLGQK0Cvhb3Yf+t1+2cTBNTkxZSReAzL/dWPUziMNSFj/L
	 Hk+sGyXWzy9VoxhEmOEGB2ucuwho6v/cTf7v41shQFBY3Iw8k6OJzvRo3pfSNpwbabtBP
	 Ws8L4M9k3KiW8mHkF3PXqhbJtDjz/lZH1GEjUmTs+/pTf2+/s9tnavUovuhLKAUdPrA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793815419;
	bh=AXbB+o2C4ERo3PLtc4YxXVro2WE+AbujrGMsyMw9byA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bYitrFMF11zjlfnjEVRk2RXxaD1Ibw+P9CghPqlQGJwez8SV5fGuWvLYA6HhdKTlE
	 lraQx1kwlgODsvaM3Szr4DFyERjJSvuesCq+p3Qm++LguEpURAtfpjBqL9O9femU6T
	 iKQC/7cNu3O6V7eY0Lvewrz6phuk+VoFXr2ogs5ZDQVJnyqEn1IMb9UCRNvtTrpWFe
	 a8NHJNAIXProDjnjSNCfRAD/Del5isC5BCBl9/EWdHsQT0N5gdGY6onmVLK0L4gYYZ
	 PXs69dC20HMqEevKSHS3t2iTphI588PAQljXEVYDi7Yw4ay73l9gmm6uCsJO5NpiuV
	 a5C+p2d6OLcAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A76C820B2;
	Wed,  4 Nov 2026 18:03:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA243177D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB808416FC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTbAh-7PrhQT for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 18:03:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8E68040FAA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E68040FAA
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEFB59DC83; Wed,  4 Nov 2026 18:01:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 19:01:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62fd1257ea99a36c43426b7a441db84164e8650c
X-Git-Newrev: 7c0c0c5d131d5e5b8b7a1c7fd1e966d68d664653
X-Patchwork-Hint: ignore
Message-Id: <20261104180139.BEFB59DC83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump version to 259.10
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c0c0c5d131d5e5b8b7a1c7fd1e966d68d664653
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes relevant for packaging:
* iptables/libiptc is no longer supported, only nftables. The libiptc
  feature flag is deprecated and has no effect, remove it and the
  optional dependency. Note that nftables support needs no dependency,
  only kernel support [1].
* systemd no longer links against libcap, remove the dependency.
* `run0 --empower` uses a new "empower" system group, which allows
  privileged access to polkit actions without running as root. Create
  the group if polkit support is enabled.

New meson options:
* swapon-path
* swapoff-path
* agetty-path
* journal-storage-default, note that "persistent" is the new
  default, changed from the previous (non-configurable) "auto"
* libc, set to "glibc" for now (see below)
* empower-gid, not set like other gid soft-fix options
* tpm2-nvpcr-base, not set. The default is based on a range assignment
  to the systemd project, also setting the default 0x01d10200 would be
  confusing because Meson does not accept integer options as hex.

Systemd 259 also added "incomplete" musl support, that is not enabled
as part of this version bump. Also note that while the release notes
contain a list with several increased minimum dependency versions,
these are warnings for version 260, not actually relevant to this
update.

Please see the upstream NEWS file for other changes [2].

[1] https://github.com/systemd/systemd/commit/715a70e7218710d6a6c033e9157bf97fdf5d8ede
[2] https://github.com/systemd/systemd/blob/v259.10/NEWS

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/systemd/Config.in    |  1 -
 package/systemd/systemd.hash |  2 +-
 package/systemd/systemd.mk   | 20 +++++++++-----------
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 4c19a884b4..6b1298069a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -29,7 +29,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
-	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBXCRYPT
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBS
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index cb652998cd..7164af23e5 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  5062da9c9b0b6fd3ed0efaa2c6ec37be2e634c6e516abd6275ee42f85282c891  systemd-258.12.tar.gz
+sha256  f9a3f1e21e4dd78717bad0888638954467a55d73cab44a2c7a75c5bed47ef814  systemd-259.10.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4476b92886..5787decec8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 258.12
+SYSTEMD_VERSION = 259.10
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -55,7 +55,6 @@ SYSTEMD_DEPENDENCIES = \
 	host-gperf \
 	host-python-jinja2 \
 	kmod \
-	libcap \
 	libxcrypt \
 	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
@@ -65,6 +64,7 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 SYSTEMD_PROVIDES = libudev udev
 
 SYSTEMD_CONF_OPTS = \
+	-Dagetty-path=/usr/bin/agetty \
 	-Dbpf-framework=disabled \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
@@ -78,9 +78,11 @@ SYSTEMD_CONF_OPTS = \
 	-Dima=false \
 	-Dinstall-tests=false \
 	-Dipe=false \
+	-Djournal-storage-default=persistent \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
+	-Dlibc=glibc \
 	-Dlibfido2=disabled \
 	-Dlibmount=enabled \
 	-Dlink-boot-shared=true \
@@ -97,6 +99,8 @@ SYSTEMD_CONF_OPTS = \
 	-Dsetfont-path=/usr/bin/setfont \
 	-Dsplit-bin=true \
 	-Dsulogin-path=/usr/sbin/sulogin \
+	-Dswapoff-path=/usr/sbin/swapoff \
+	-Dswapon-path=/usr/sbin/swapon \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
 	-Dsysupdated=disabled \
@@ -174,13 +178,6 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_IPTABLES),y)
-SYSTEMD_DEPENDENCIES += iptables
-SYSTEMD_CONF_OPTS += -Dlibiptc=enabled
-else
-SYSTEMD_CONF_OPTS += -Dlibiptc=disabled
-endif
-
 # Both options can't be selected at the same time so prefer libidn2
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 SYSTEMD_DEPENDENCIES += libidn2
@@ -539,6 +536,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
 SYSTEMD_CONF_OPTS += -Dpolkit=enabled
 SYSTEMD_DEPENDENCIES += polkit
+SYSTEMD_POLKIT_USER = - - empower -1 * - - - Privileged access to polkit actions
 else
 SYSTEMD_CONF_OPTS += -Dpolkit=disabled
 endif
@@ -709,6 +707,7 @@ define SYSTEMD_USERS
 	$(SYSTEMD_NETWORKD_USER)
 	$(SYSTEMD_RESOLVED_USER)
 	$(SYSTEMD_TIMESYNCD_USER)
+	$(SYSTEMD_POLKIT_USER)
 endef
 
 define SYSTEMD_INSTALL_NSSCONFIG_HOOK
@@ -935,13 +934,13 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dkmod=disabled \
 	-Dldconfig=false \
 	-Dlibarchive=disabled \
+	-Dlibc=glibc \
 	-Dlibcryptsetup-plugins=disabled \
 	-Dlibcryptsetup=disabled \
 	-Dlibcurl=disabled \
 	-Dlibfido2=disabled \
 	-Dlibidn2=disabled \
 	-Dlibidn=disabled \
-	-Dlibiptc=disabled \
 	-Dlibmount=enabled \
 	-Dlocaled=false \
 	-Dlog-message-verification=disabled \
@@ -1009,7 +1008,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	host-util-linux \
 	host-patchelf \
-	host-libcap \
 	host-libxcrypt \
 	host-gperf \
 	host-python-jinja2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
