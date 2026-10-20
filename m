Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83973606A322
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ab0Ib+Pv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37586810AA;
	Tue, 20 Oct 2026 09:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0WZfd5SgmpX; Tue, 20 Oct 2026 09:37:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 04972810BE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792489040;
	b=TLlk1hV1sXzs0LOa/8EutcIxNKmOJhnxwus/EU5lKO3QhdChiTdieno2KIAwlSQTQDoF
	 mVmsK7jTVTz9xHM0BEsyUxC8umYGad5ctbvujdwOV5HiO05ziwfwdikhW8rdxjbL1VWsS
	 1JBw1altTdz31He/ywsTsl6mOR1mRiGWr3au/0nc5zMQwDbl5Ba0963Uj9HPMPG5qshHK
	 Ao0nYQ3uXbS0V394LGLLK1VvEzeTrPHT1fbMuiwtTaPwO/jq1Rq/E5w7ltqqveAEjXRlJ
	 +uvYA7AfAAB36Hlmu5KPQgjYUO7T8KomzvsijKvdhwYtLpxO6WFeoEo8fS+Wwv/l3dw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792489040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8xD7CfPtR4uGY6/GARY0pGXOD4tJGbbmCNyZoBNmSLY=;
	b=VWluMyZXrBofX5ygbz06gagldmnsyeJ9Mghf2Y56UKtd3zK6OxW2qVIONiYiNv24cPVd
	 Ob8gMtT00cmpwuAsAKh9ndjwsdGrGlZpS5DIxJsvGcdtgLvSWtgqywKBXpYqzgkAo3JX8
	 1qxXAc9A7HT5hpzsq5mBtSlpd6N4brymkmGRb4V+zudLc+rgOWOOuheS4Lii00fDbgpH/
	 XqxGKgRpEZfLgxq2gMAgjNuNhMcedkWxX2c1DOpV65X/QiSnJ+hdMC0Y3zi/CrA3nqL52
	 ShHWHe7Y3U5exSzKw7M7C6A5vRxRYkemvV0LFAgSYHSC1UroaC1lznP6vq6j33yl6Tg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792489040;
	bh=8xD7CfPtR4uGY6/GARY0pGXOD4tJGbbmCNyZoBNmSLY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ab0Ib+PvAwSjwChVoivYVGnZPG7aZ2YN2BLsV+BuCsMbC0k8iniD0/ZXrezU1FcTI
	 754EuP5b19CWiA7vvZrJ+1ilJ4Vnwpo7/kxODiEQ6M6rnmD+NDJOb0NNZ1C71NIWBN
	 tN8+cRnFX1NeGpQAPhZvwH6YZfWirjyR3udT90OtgVRBad+NSAMSy6F9RRSJDsKMBw
	 E8AInZk2Z8mKpU7XlyaID2mNFXwalvf4IDA5NPq7Qu6+B/NJQiCtmkwbj7JK6nE4CV
	 kBUoXStKovL0bVvPsmFjJtPWr+gcvMvXRMoERiNGblvtnFJG4SShao4waU0pVmgdZH
	 wc/G31aRZYxyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04972810BE;
	Tue, 20 Oct 2026 09:37:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C107765
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 421B9407EE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxLB25ex3aDa for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 09:37:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4A93B407F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792489035;
 b=Jzx3z4wd/YUznykVW6mYccMGBdmopxLAo5SJ0eom5vpWufw+4TaSSJsXhJ+mqbDWUx5p
 7v2S7KS52R78FLZG7q34FKvAvrjTpJFSd+h/Pgre1A0JhtPovLXUOZT/yaOtkzm4EZAJ8
 33D4R97fv5wI3JwoJJ0sD0GOPig30x1sm/IYsmQs2xpBxFoFEYv+nUmRKhm1VBB0SCMk4
 bxW7RIvZCX1qHkpN79G9cnPOu2KYHqQcn66pNsP0iHz04PQS+4xxGxGd9GnyL9OksEzKH
 +KSyN6Y75eVqOZyIxvVdlb3wf4WXnYnoXx9EjxXqPKF20CEEQ5nIshZ1Y3acgTE/Jcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792489035;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GdDj3T6H5dfAG77nxd5JXrUL/PRPJWbc4wYajKBzPjk=;
 b=GUDbcpVbTeMx2GfDVGOLu2Cl9TTrwk+SeVJQyHRsySRe+hmX2m5lZ17zdcKFxmlwVBKP
 Yp9YsRPOwvl85Hx5eJJ6RI8+ifUkPthNLTole08w+QYaexIzQsilLVl0C26QqN3FlBfyr
 Jq1FYuZu9Mk89uohTEL+NiyieZBLC7/6q6k78tvnMe53DnckIMdU45aL2TN35CWkbDpxb
 NP5gCbTDoZk1pOefcAy3pL017sX4XgK8B4bIrshcAGw3tmEip+I6CFkf8+kJiFLzKGjrM
 z6oLEhPCkjnSnEx8CRdp06lsAfv+fM3XDMknAmAu8RO43Bq+qLyMCuRqFBZUoliYpcw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A93B407F4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:37:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C943996EB; Tue, 20 Oct 2026 09:35:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 11:35:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ae7d01d6a17c9714fa803d953d8116cfb36b860
X-Git-Newrev: ad1d1c6dbc4b4d789b0136c814ad0e904dff6db2
X-Patchwork-Hint: ignore
Message-Id: <20261020093552.4C943996EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tqftpserv: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ad1d1c6dbc4b4d789b0136c814ad0e904dff6db2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

tqftpserv is a TFTP server over QRTR: the modem of Qualcomm SoCs fetches
files from Linux through it, e.g. the WLAN firmware (wlanmdsp.mbn) on
SoCs whose WLAN firmware runs on the modem. Files are looked up next to
the remoteproc firmware under /lib/firmware; xz and zstd compressed
files are handled when those libraries are enabled.

The systemd units are installed only with systemd as init; a sysv init
script is provided otherwise.

The patch defines _GNU_SOURCE in translate.c, which calls asprintf():
uClibc-ng declares it only then, so the build failed there (test-pkg,
bootlin-armv5-uclibc). Submitted upstream as well.

Tested on an Arduino UNO Q (Qualcomm QRB2210): the modem fetches
wlanmdsp.mbn through it and the ath10k WLAN interface comes up.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...translate-define-_GNU_SOURCE-for-asprintf.patch | 36 +++++++++++++++
 package/tqftpserv/Config.in                        | 14 ++++++
 package/tqftpserv/S44tqftpserv                     | 51 ++++++++++++++++++++++
 package/tqftpserv/tqftpserv.hash                   |  3 ++
 package/tqftpserv/tqftpserv.mk                     | 32 ++++++++++++++
 7 files changed, 138 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ad87efc0cc..0f52ba2267 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1498,6 +1498,7 @@ F:	toolchain/toolchain-bare-metal-buildroot/
 N:	Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
 F:	package/qrtr/
 F:	package/rmtfs/
+F:	package/tqftpserv/
 
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
diff --git a/package/Config.in b/package/Config.in
index 2bca7d6acb..6615c2b2af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -639,6 +639,7 @@ endmenu
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/tio/Config.in"
+	source "package/tqftpserv/Config.in"
 	source "package/triggerhappy/Config.in"
 	source "package/uboot-bootcount/Config.in"
 	source "package/uboot-tools/Config.in"
diff --git a/package/tqftpserv/0001-translate-define-_GNU_SOURCE-for-asprintf.patch b/package/tqftpserv/0001-translate-define-_GNU_SOURCE-for-asprintf.patch
new file mode 100644
index 0000000000..06829ed9be
--- /dev/null
+++ b/package/tqftpserv/0001-translate-define-_GNU_SOURCE-for-asprintf.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
+Date: Mon, 19 Oct 2026 22:02:59 +0200
+Subject: [PATCH] translate: define _GNU_SOURCE for asprintf()
+
+asprintf() is a GNU extension. glibc and musl declare it in their
+default mode, uClibc-ng only with _GNU_SOURCE, so with uClibc-ng
+translate.c fails to build (an error with GCC 14 and later):
+
+  translate.c:298:15: error: implicit declaration of function 'asprintf'
+
+Define _GNU_SOURCE before the includes, as xz-decompress.c and
+zstd-decompress.c already do.
+
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
+Upstream: https://github.com/linux-msm/tqftpserv/pull/56
+---
+ translate.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/translate.c b/translate.c
+index 246b82d..19fdd48 100644
+--- a/translate.c
++++ b/translate.c
+@@ -2,6 +2,7 @@
+ /*
+  * Copyright (c) 2019, Linaro Ltd.
+  */
++#define _GNU_SOURCE /* asprintf() */
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <dirent.h>
+-- 
+2.53.0
+
diff --git a/package/tqftpserv/Config.in b/package/tqftpserv/Config.in
new file mode 100644
index 0000000000..e1acb03225
--- /dev/null
+++ b/package/tqftpserv/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_TQFTPSERV
+	bool "tqftpserv"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # qrtr
+	select BR2_PACKAGE_QRTR
+	help
+	  TFTP server over QRTR for the remote processors of Qualcomm
+	  SoCs: hands the modem the files it asks for, e.g. the WLAN
+	  firmware, from /lib/firmware. Serves xz or zstd compressed
+	  files when xz or zstd is enabled.
+
+	  https://github.com/linux-msm/tqftpserv
+
+comment "tqftpserv needs a toolchain w/ headers >= 4.15"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
diff --git a/package/tqftpserv/S44tqftpserv b/package/tqftpserv/S44tqftpserv
new file mode 100644
index 0000000000..c719cadd49
--- /dev/null
+++ b/package/tqftpserv/S44tqftpserv
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DAEMON="tqftpserv"
+PIDFILE="/var/run/$DAEMON.pid"
+TQFTPSERV_ARGS=""
+
+# shellcheck disable=SC1090
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- $TQFTPSERV_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+start|stop|restart)
+	"$1";;
+reload)
+	restart;;
+*)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
diff --git a/package/tqftpserv/tqftpserv.hash b/package/tqftpserv/tqftpserv.hash
new file mode 100644
index 0000000000..d7660df608
--- /dev/null
+++ b/package/tqftpserv/tqftpserv.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  87a3845e8f47b42f31d8aaad04c5e0707e391b3954d096aeff6f0a03467dc33f  tqftpserv-1.3.tar.gz
+sha256  a6d7cc7891d16f9c74c9a9c2514805e59bb8758db7690bb7ae065c79cec9515a  LICENSE
diff --git a/package/tqftpserv/tqftpserv.mk b/package/tqftpserv/tqftpserv.mk
new file mode 100644
index 0000000000..a8a6220bb0
--- /dev/null
+++ b/package/tqftpserv/tqftpserv.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# tqftpserv
+#
+################################################################################
+
+TQFTPSERV_VERSION = 1.3
+TQFTPSERV_SITE = $(call github,linux-msm,tqftpserv,v$(TQFTPSERV_VERSION))
+TQFTPSERV_LICENSE = BSD-3-Clause
+TQFTPSERV_LICENSE_FILES = LICENSE
+TQFTPSERV_DEPENDENCIES = qrtr
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+TQFTPSERV_DEPENDENCIES += xz
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+TQFTPSERV_DEPENDENCIES += zstd
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+TQFTPSERV_CONF_OPTS += -Dsystemd-unit-prefix=/usr/lib/systemd/system
+else
+TQFTPSERV_CONF_OPTS += -Dsystemd-unit-prefix=
+endif
+
+define TQFTPSERV_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(TQFTPSERV_PKGDIR)/S44tqftpserv \
+		$(TARGET_DIR)/etc/init.d/S44tqftpserv
+endef
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
