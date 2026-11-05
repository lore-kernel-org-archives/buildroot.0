Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9985D606A33B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nfV81KAf
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED8A440858;
	Thu,  5 Nov 2026 10:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZhJkN_UfH3r; Thu,  5 Nov 2026 10:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1AFAF4084E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793873297;
	b=RSSLA55W4HFzBgyorudVsCTVoF6rqr3XzEpavGCdPcD0a1md/5TkPNRwEhVZ9oDBwkZE
	 kHMK4r4A+5Vol9U/oEw/wSmZEAszZ3Iu/cB94TqDcG/mC6LjElO0wffY0R3vM79oXFNpx
	 NehjnEvdTvYGB+fzP3VlZrOVn8bkUxVcElUXiwyLvocKHUESxl9xLZZqkWThtYbVUglTP
	 +Rca3zwW+Zl0O9VDIYMfbXQJzRSwW8PcA9G5EiC4e0e/gNIvYcywjdInCm5LOK6QUXV+I
	 I3sOGedzAXDqE2doVEyCuWebUAweTJfYIUlGu0gIIWqudaptSSxJ9go23KnsAlsjFxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793873297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cZctKaiT92ljoXnxN2uXsWg5Wqyb+baVWvYw1KLgoqM=;
	b=si/QrLwHLjejY0mcVuLIrew20qlVlUfg1FgfYtoQuwFltZBzgSMB5uQrt24eQ2dPkexX
	 lDHt5vPMzzfYxSYLsF1QAQp7KjOv7/IGIJZxxxLcsIFb3m5OTHIxYhoTlz/b+sgNmtUYh
	 jwgBVVxBS+BDaFFqGuZkDU3fItKIU6y1jQeKX7GCRqBLnxtfFiBaw+vamRcBXt/lQM1yT
	 KL8W0+wi+KsB0SglOBCgE2iq1py8mawtGXHD8jA5BCSi3/SyTtqeSdQmeLHPtgRbzVWDY
	 d7yu81nMosj+/Scc/4dCw+ZVo3UMy1aj/LW8x3Jq5jZRSubEwBkIe2lhNZ5smVxd9AQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793873297;
	bh=cZctKaiT92ljoXnxN2uXsWg5Wqyb+baVWvYw1KLgoqM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=nfV81KAf1On18qB6oq32F2Vwd32YUzCMPRCcSUTAN5ReXgqa4YHW5j4rSkWlwHgYT
	 qE91odu0oGwe9fO9ajHhd0caZ0nN0L3iHO8x4tOHknbsHmAr4lZBsNDmCuvdz+JOY4
	 ywPx1GJ+O1csM6v7UKEq+o08KHH0SU4pHUaXIPc3qwEiQELC4ugCpYBOTV8Kh6XiNU
	 n4y029bs6ECYG94qVCCkUL+47w1h35GjyZ+lVTk24qgY5gPzim2ODPB8mZFW9esR9h
	 xgV1gZWzw4chFrCSJ9eZGUtI6PPufKoIvgpYerm8G6eYugQUsLdQ9mfXgQVJvAqxTa
	 dlw/px7rVdfQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AFAF4084E;
	Thu,  5 Nov 2026 10:08:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3BC92AC
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0B3A6080C
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76fyT3Rp327A for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 10:08:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE99C606A7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE99C606A7
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:08:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1wSh4p12vc-00ylRw; Thu, 05
 Nov 2026 11:08:03 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  5 Nov 2026 11:07:36 +0100
Message-ID: <20261105100736.3688772-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZDDZLgAEsz+wASyL+NN666xplW7x3vGDepwF9hcAcARe193htXm
 vErhxQ1DR9O3yZfmrvX/kY/ioiSV9go8DEwBPlhTxsTIhR1KkrXa2rd8RVOKVy1/TW8LXaj
 z8c+SOYL/46i5jE5UWYqq302YwFSOvZy3NmXj8GLHca9hwyhYgRW4Yj7yih6NpkKUwVpJOB
 T5QP4HpGmONlVQrO/1m5A==
UI-OutboundReport: notjunk:1;M01:P0:CBhH8T2YZq0=;m0S52R69W1Ciy3jgyjY9Y6p0AK8
 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
Subject: [Buildroot] [PATCH 1/1] package/systemd: support building for musl
 target
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

Set -Dlibc= according to the selected target C library. When building
for musl, libucontext is required, and libxcrypt (which requires
glibc) is not. Some systemd features are not available on musl,
notably all NSS integrations (because there is no NSS), disable them
when building with musl.

The option to build systemd with musl has been added in v259. Since
v261 musl >=1.2.6 is required, so toolchains with old musl versions
will not work.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
This patch only enables building systemd for a musl target, building
host-systemd on a musl host has additional requirements that require a
bunch of additional patches.

 package/systemd/Config.in  |  9 ++++++---
 package/systemd/systemd.mk | 31 ++++++++++++++++++++++++++-----
 system/Config.in           |  6 +++---
 3 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7fd05be41b..6c7d16911b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -19,7 +19,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # kmod
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || (BR2_TOOLCHAIN_USES_MUSL && BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
@@ -29,7 +29,8 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
-	select BR2_PACKAGE_LIBXCRYPT
+	select BR2_PACKAGE_LIBUCONTEXT if BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
@@ -353,7 +354,8 @@ config BR2_PACKAGE_SYSTEMD_NSRESOURCED
 
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
-	default y
+	default y if BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  nss-myhostname is a plug-in module for the GNU Name Service
 	  Switch (NSS) functionality of the GNU C Library (glibc),
@@ -574,6 +576,7 @@ config BR2_PACKAGE_SYSTEMD_USERDB
 
 config BR2_PACKAGE_SYSTEMD_UTMP
 	bool "enable utmp support"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  systemd-update-utmp-runlevel.service is a service that writes
 	  SysV runlevel changes to utmp and wtmp, as well as the audit
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 05aefb40cc..090be8b233 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -57,7 +57,6 @@ SYSTEMD_DEPENDENCIES = \
 	host-gperf \
 	host-python-jinja2 \
 	kmod \
-	libxcrypt \
 	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
@@ -90,7 +89,6 @@ SYSTEMD_CONF_OPTS = \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
-	-Dlibc=glibc \
 	-Dlibcrypt=enabled \
 	-Dlibfido2=disabled \
 	-Dlibmount=enabled \
@@ -101,7 +99,6 @@ SYSTEMD_CONF_OPTS = \
 	-Dmode=release \
 	-Dmount-path=/usr/bin/mount \
 	-Dnspawn-locale='C.UTF-8' \
-	-Dnss-systemd=true \
 	-Dpasswdqc=disabled \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
@@ -130,6 +127,18 @@ ifeq ($(BR2_OPTIMIZE_FAST),y)
 SYSTEMD_CFLAGS += -O3 -fno-finite-math-only
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+SYSTEMD_CONF_OPTS += \
+	-Dlibc=musl \
+	-Dnss-systemd=false
+SYSTEMD_DEPENDENCIES += libucontext
+else
+SYSTEMD_CONF_OPTS += \
+	-Dlibc=glibc \
+	-Dnss-systemd=true
+SYSTEMD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 SYSTEMD_JOURNALD_PERMISSIONS = /var/log/journal d 2755 root systemd-journal - - - - -
 endif
@@ -445,8 +454,13 @@ SYSTEMD_CONF_OPTS += -Dlogind=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
-SYSTEMD_CONF_OPTS += -Dmachined=true -Dnss-mymachines=enabled
+SYSTEMD_CONF_OPTS += -Dmachined=true
 SYSTEMD_MACHINED_PERMISSIONS = /var/lib/machines d 700 0 0 - - - - -
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+SYSTEMD_CONF_OPTS += -Dnss-mymachines=disabled
+else
+SYSTEMD_CONF_OPTS += -Dnss-mymachines=enabled
+endif
 else
 SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=disabled
 endif
@@ -594,8 +608,13 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
 endef
-SYSTEMD_CONF_OPTS += -Dnss-resolve=enabled -Dresolve=true
+SYSTEMD_CONF_OPTS += -Dresolve=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - systemd Resolver
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+SYSTEMD_CONF_OPTS += -Dnss-resolve=disabled
+else
+SYSTEMD_CONF_OPTS += -Dnss-resolve=enabled
+endif
 else
 SYSTEMD_CONF_OPTS += -Dnss-resolve=disabled -Dresolve=false
 endif
@@ -719,6 +738,7 @@ define SYSTEMD_USERS
 	$(SYSTEMD_POLKIT_USER)
 endef
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 define SYSTEMD_INSTALL_NSSCONFIG_HOOK
 	$(SED) '/^passwd:/ {/systemd/! s/$$/ systemd/}' \
 		-e '/^group:/ {/systemd/! s/$$/ [SUCCESS=merge] systemd/}' \
@@ -733,6 +753,7 @@ define SYSTEMD_INSTALL_NSSCONFIG_HOOK
 			-e '/^hosts:/ {/mymachines/! s/^\(hosts:[[:space:]]*\)/\1mymachines /}' ) \
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
+endif
 
 SYSTEMD_TARGET_FINALIZE_HOOKS += \
 	SYSTEMD_INSTALL_NSSCONFIG_HOOK \
diff --git a/system/Config.in b/system/Config.in
index baac35be14..6e774995ca 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -120,7 +120,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
@@ -129,10 +129,10 @@ config BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.14, host and target gcc >= 8"
+comment "systemd needs a glibc or musl toolchain w/ SSP, headers >= 5.14, host and target gcc >= 8"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
