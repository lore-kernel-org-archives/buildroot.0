Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201CA60A3836
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bZ6MLucl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2554407EE;
	Tue, 20 Oct 2026 09:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gzd3FFjXILp; Tue, 20 Oct 2026 09:37:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BBA28407F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792489038;
	b=Y/ttmBWlIuXkxhpX4da/9mc5vrS3wEHFiqjdhepM0L+M6Y6/9LRU83WrDbfmBqjeAkgI
	 sNtozzdK0Bpnz9m9sFcNXPiFQPJstexAMn6sVvyX9FvVPVLrKyFcCYx6uum+nt0uT1rp5
	 8DFl3nrnCL3L9CmNoibqINmfmptw+j5rD0EPho9QHOtMUkYcsjjP+vPnJSJhG20dSOnOZ
	 o6CxCXhhdxjH1OIhiaPoRU10F/SJJPFwfxitKKzzwR0fhNmov15lWjAjseDIxvZ3yKlSk
	 3T7nozNzr9CIbfcGbJE7KK4Cd0FPJo9RPdNP5joLEwm1JstCyp9hi1R9gvotikB9UtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792489038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fGUlQULO85utPmCP8T3e7uJGs9+9pIsWxsufscJtsAo=;
	b=j5373aGR6iAmnK8aLUMBMimAP2bAOTKS+s+mGiC1lnlHGx867bBdnPmsDno6mJxdP5fL
	 YLbf1h2BWACaCFkA5zGC60sLXoVLSeS2OOrdOtatDQ5OIWnzYOnpfueAuVTFU/hteOnd9
	 DEoCaRGNt59dOHRxTgDM4kqMYWfcRY4oA85J+T+VgGJVEiaQFDM2OQdf+bANw/HTNkHaZ
	 fbXdF7nrRgFEgBwUfl/9SP44V8S0+DhSwDDEoe3ZkYQF/MKKwRbPEc3W+QK9EqiXAsnoV
	 RbU9Rhsj5k6Rp0BWuFgzy4kib4iEx81fjc2gPsyCOS/92PCzQ1FcIbERriwOQfuMvtg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792489038;
	bh=fGUlQULO85utPmCP8T3e7uJGs9+9pIsWxsufscJtsAo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bZ6MLuclKXTRS5gZDLCyPjdxI4aEkVgUh5mf9Mb19nYkCsGLTc0/Mom+vQcdRFK9c
	 akfL0LiSWAEdoHzynswxIXfVHVYlZ/d6qe5tfJmpZNPo7XihdnVoEUkiLccd+wiMsS
	 8aPVhVEroWfYbUs09X18UmEm4AgSDxyz9bf95DOPtnWSUJjkWNGuerqFdshCibdyhH
	 F5wBsw542d08jZuK/Oq+w2dt54JxvmhGRjcSmgbQzZ7YOjsjTPo49XEZkuinQaqZcr
	 0vzLKASJMa/5J8KRZosuwpmhQWmWh1zyciA3XDD+W4seeTGrE6jOIQqgSLebipPla8
	 ihZr8zTGtOyTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBA28407F4;
	Tue, 20 Oct 2026 09:37:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44375765
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 295F540820
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3iEIPjnk4V2 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 09:37:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 40352407EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792489035;
 b=MwBChz6TzzKUyUz/ZUGm4z6WDBcnHf+bLJvmtuBVPAxXsGUXZX2CYub6ASi0ZHLIexHz
 hvfx7HudhTzyyOJFAToWHRu03loMXy/VyFqeX6lVsom9aGHOtH6RJ7blWdQeMGQEDeSpB
 Qkx8Hzxqkkk40G1suXHjHdphj/kjcVIgSCMI9a32lQNrtEiCQOCxUK7dWiD4K9AoxDmFY
 AC7eWD16bcUwLZL4VxW9lWZ+xRQZlkm9d8vJnjXCJgHYWvhFVd5NIDnoifPL4DlXlYwea
 +HCH+2g2yGshMquTGteepGKePQ6b4O5M9h2OFYg4yQhnXJGLmM6C4+UIItcqk/r7AAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792489035;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kfPufMiEpMrND2zjHlg8jjLHEEq54FpXvo1H7N6oRyw=;
 b=gyJkCDYkRT8dymRrL4Ay2FBwXYTNvNPMpk4PcTupWBbYkuuHNz2aSjiuq+ap2/vGlcd1
 Sv+X5X1Am2JdbA803ZQfhT/CX8h0tRmmpcgBPI6wA1dxZHCvJ9iCFQAkMs9O6UlarCZhX
 +cplw6dTlqnzqKD7MLETbGkIkHeL6g8REwCToE/FhZBNHabQkQM43mDgMrEmzLeU0W1f/
 eIZsa2/kflsl3cl2RnuSZc/yifR9eRH+l74NOOLwNhPMWkSnVLl8fXQQcdqOQdaSydypl
 E2Ay1iVI2iLvoHwIKlvAMBWBrsvucMqmbj5HG4/z3KSeQIgEFQMO6v8GCmxbL7GCTNA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40352407EE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:37:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F073996EA; Tue, 20 Oct 2026 09:35:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 11:23:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81bec84bfce986a49b799384c3d0c540fda5367c
X-Git-Newrev: 3ae7d01d6a17c9714fa803d953d8116cfb36b860
X-Patchwork-Hint: ignore
Message-Id: <20261020093552.3F073996EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rmtfs: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ae7d01d6a17c9714fa803d953d8116cfb36b860
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

rmtfs serves the EFS partitions of the modem of Qualcomm SoCs (modemst1,
modemst2, fsg, fsc) over QRTR and the rmtfs shared memory; without it
the modem firmware stalls during its boot.

The tarball ships the QMI encoders pre-generated, so the qmic code
generator is not needed; the .c/.h files are touched before the build
so make does not try to regenerate them. The sysv init script starts
the daemon with -P (EFS partitions by GPT label) and skips when there is
no rmtfs shared memory; RMTFS_ARGS can be overridden in
/etc/default/rmtfs (e.g. -s to let rmtfs start the modem). With systemd
the upstream unit and udev rule are installed.

Tested on an Arduino UNO Q (Qualcomm QRB2210): with sysv init the modem
boots, its EFS is served from the modemst1/modemst2/fsg partitions and
its WLAN firmware comes up.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/rmtfs/Config.in  | 17 ++++++++++++++
 package/rmtfs/S45rmtfs   | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/rmtfs/rmtfs.hash |  3 +++
 package/rmtfs/rmtfs.mk   | 45 +++++++++++++++++++++++++++++++++++++
 6 files changed, 125 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2152dddb92..ad87efc0cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1497,6 +1497,7 @@ F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
 F:	package/qrtr/
+F:	package/rmtfs/
 
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
diff --git a/package/Config.in b/package/Config.in
index 6353c17b7e..2bca7d6acb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -594,6 +594,7 @@ endmenu
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
+	source "package/rmtfs/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
 	source "package/rockchip-rkbin/Config.in"
diff --git a/package/rmtfs/Config.in b/package/rmtfs/Config.in
new file mode 100644
index 0000000000..9a27f9c373
--- /dev/null
+++ b/package/rmtfs/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_RMTFS
+	bool "rmtfs"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # qrtr
+	select BR2_PACKAGE_QRTR
+	help
+	  Remote file system service for the modem of Qualcomm SoCs:
+	  serves the modem's EFS partitions (modemst1, modemst2, fsg,
+	  fsc) over QRTR and the rmtfs shared memory. Without it the
+	  modem firmware stalls at boot.
+
+	  https://github.com/linux-msm/rmtfs
+
+comment "rmtfs needs udev /dev management and a toolchain w/ threads, headers >= 4.15"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
diff --git a/package/rmtfs/S45rmtfs b/package/rmtfs/S45rmtfs
new file mode 100644
index 0000000000..4e110c0ae2
--- /dev/null
+++ b/package/rmtfs/S45rmtfs
@@ -0,0 +1,58 @@
+#!/bin/sh
+
+DAEMON="rmtfs"
+PIDFILE="/var/run/$DAEMON.pid"
+# -P: find the EFS partitions by GPT label; add -s to let rmtfs also
+# start the modem remoteproc, -r for read-only EFS.
+RMTFS_ARGS="-P"
+
+# shellcheck disable=SC1090
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# No rmtfs shared memory: not a Qualcomm modem, nothing to serve
+	if [ ! -e /dev/qcom_rmtfs_mem1 ]; then
+		echo "SKIP"
+		return 0
+	fi
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- $RMTFS_ARGS
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
diff --git a/package/rmtfs/rmtfs.hash b/package/rmtfs/rmtfs.hash
new file mode 100644
index 0000000000..680926947f
--- /dev/null
+++ b/package/rmtfs/rmtfs.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4b6c398806a1046e2256a685d592833de0f37b7245b8adc4797e1791f0e117ee  rmtfs-1.3.tar.gz
+sha256  1e1e2972bd05841b6a009bd6f7aef9d847f9a2b721d1a308340e642faa2482cd  LICENSE
diff --git a/package/rmtfs/rmtfs.mk b/package/rmtfs/rmtfs.mk
new file mode 100644
index 0000000000..3fd21063d1
--- /dev/null
+++ b/package/rmtfs/rmtfs.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# rmtfs
+#
+################################################################################
+
+RMTFS_VERSION = 1.3
+RMTFS_SITE = $(call github,linux-msm,rmtfs,v$(RMTFS_VERSION))
+RMTFS_LICENSE = BSD-3-Clause
+RMTFS_LICENSE_FILES = LICENSE
+RMTFS_DEPENDENCIES = qrtr udev
+
+# qmi_rmtfs.c/.h are shipped pre-generated: keep make from regenerating
+# them with qmic, which is not packaged, when the tarball timestamps make
+# qmi_rmtfs.qmi look newer.
+define RMTFS_TOUCH_GENERATED
+	touch $(@D)/qmi_rmtfs.c $(@D)/qmi_rmtfs.h
+endef
+RMTFS_PRE_BUILD_HOOKS += RMTFS_TOUCH_GENERATED
+
+# The Makefile appends the libraries to LDFLAGS, which a command-line
+# LDFLAGS would override.
+define RMTFS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		LDFLAGS="$(TARGET_LDFLAGS) -lqrtr -ludev -lpthread" \
+		-C $(@D) rmtfs rmtfs.service prefix=/usr
+endef
+
+define RMTFS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/rmtfs $(TARGET_DIR)/usr/bin/rmtfs
+endef
+
+define RMTFS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(RMTFS_PKGDIR)/S45rmtfs \
+		$(TARGET_DIR)/etc/init.d/S45rmtfs
+endef
+
+define RMTFS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/rmtfs.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/rmtfs.service
+	$(INSTALL) -D -m 0644 $(@D)/rmtfs.rules \
+		$(TARGET_DIR)/usr/lib/udev/rules.d/rmtfs.rules
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
