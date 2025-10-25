Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E94CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 19:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8F740A0B;
	Sat, 25 Oct 2025 19:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVdqr2MW0R_Z; Sat, 25 Oct 2025 19:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36FB740A0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FB740A0D;
	Sat, 25 Oct 2025 19:05:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4B1343F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 19:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5F5E81275;
 Sat, 25 Oct 2025 19:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZNEi0yZfpg4; Sat, 25 Oct 2025 19:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.184.2.64;
 helo=mx1a.swcp.com; envelope-from=hudson@swcp.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C71581195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C71581195
Received: from mx1a.swcp.com (mx1a.swcp.com [216.184.2.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C71581195
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 19:05:41 +0000 (UTC)
Received: from ame3.swcp.com (ame3.swcp.com [216.184.2.120])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 59PJ5eT6004459
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:05:40 -0600
Received-SPF: pass (ame3.swcp.com: domain of hudson@swcp.com designates
 216.184.2.83 as permitted sender) receiver=ame3.swcp.com;
 client-ip=216.184.2.83; helo=hachi.swcp.com; envelope-from=hudson@swcp.com;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
DKIM-Filter: OpenDKIM Filter v2.10.3 ame3.swcp.com 59PJ5dw4054858
Received: from hachi.swcp.com (hachi.swcp.com [216.184.2.83])
 by ame3.swcp.com (8.17.2/8.17.1) with ESMTPS id 59PJ5dw4054858
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:05:39 -0600 (MDT)
 (envelope-from hudson@swcp.com)
Received: from hachi.swcp.com (localhost [127.0.0.1])
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTP id
 59PJ5dwC3612833
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:05:39 -0600
Received: (from hudson@localhost)
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Submit) id 59PJ5dNV3612832
 for buildroot@buildroot.org; Sat, 25 Oct 2025 13:05:39 -0600
Date: Sat, 25 Oct 2025 13:05:39 -0600
To: buildroot@buildroot.org
Message-ID: <aP0fg9gNzZ0xspy0@hachi.swcp.com>
References: <aP0fWpti-9PiGKxn@hachi.swcp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aP0fWpti-9PiGKxn@hachi.swcp.com>
X-Scanned-By: MIMEDefang 2.86
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4
 (ame3.swcp.com [216.184.2.127]); Sat, 25 Oct 2025 13:05:39 -0600 (MDT)
X-Virus-Scanned: clamav-milter 1.2.1 at ame3
X-Virus-Status: Clean
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=trmm.net
Subject: [Buildroot] [PATCH 1/2] package/nqptp: Add version 1.2.4
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
From: Trammell Hudson via buildroot <buildroot@buildroot.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the Not Quite PTP timing library necessary for
AirPlay2 support with shairport-sync.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 package/Config.in        |  1 +
 package/nqptp/Config.in  |  6 ++++++
 package/nqptp/S90nqptp   | 24 ++++++++++++++++++++++++
 package/nqptp/nqptp.hash |  3 +++
 package/nqptp/nqptp.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 package/nqptp/Config.in
 create mode 100644 package/nqptp/S90nqptp
 create mode 100644 package/nqptp/nqptp.hash
 create mode 100644 package/nqptp/nqptp.mk

diff --git a/package/Config.in b/package/Config.in
index 161d61728b..b67da80231 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2603,6 +2603,7 @@ endif
 	source "package/nload/Config.in"
 	source "package/nmap/Config.in"
 	source "package/noip/Config.in"
+	source "package/nqptp/Config.in"
 	source "package/ntp/Config.in"
 	source "package/ntpsec/Config.in"
 	source "package/nuttcp/Config.in"
diff --git a/package/nqptp/Config.in b/package/nqptp/Config.in
new file mode 100644
index 0000000000..cddb12e4d0
--- /dev/null
+++ b/package/nqptp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NQPTP
+	bool "NQPTP"
+	help
+	  Not Quite PTP for shairport-sync AirPlay 2 support.
+	  https://github.com/mikebrady/shairport-sync
+
diff --git a/package/nqptp/S90nqptp b/package/nqptp/S90nqptp
new file mode 100644
index 0000000000..41dbb4749a
--- /dev/null
+++ b/package/nqptp/S90nqptp
@@ -0,0 +1,24 @@
+#! /bin/sh
+
+case "$1" in
+    start)
+	printf "Starting nqptp: "
+	start-stop-daemon -S -q -b --exec /usr/bin/nqptp
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+    stop)
+	printf "Stopping shairport-sync: "
+	start-stop-daemon -K -q --exec /usr/bin/nqptp \
+		-p /var/run/nqptp/nqptp.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+    restart)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+	;;
+esac
diff --git a/package/nqptp/nqptp.hash b/package/nqptp/nqptp.hash
new file mode 100644
index 0000000000..a1b686c1a9
--- /dev/null
+++ b/package/nqptp/nqptp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1df1d5edd5b713010d6495b3abca4c1cf4ad8fa6029df0abeb9e4de8e0eb707a  nqptp-1.2.4.tar.gz
+sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/nqptp/nqptp.mk b/package/nqptp/nqptp.mk
new file mode 100644
index 0000000000..11dac9f10e
--- /dev/null
+++ b/package/nqptp/nqptp.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# nqptp
+#
+################################################################################
+
+NQPTP_VERSION = 1.2.4
+NQPTP_SITE = $(call github,mikebrady,nqptp,$(NQPTP_VERSION))
+
+NQPTP_LICENSE = MIT, BSD-3-Clause
+NQPTP_LICENSE_FILES = LICENSES
+NQPTP_DEPENDENCIES = libconfig host-pkgconf
+
+# git clone, no configure
+NQPTP_AUTORECONF = YES
+
+NQPTP_CONF_OPTS = 
+
+#NQPTP_CONF_ENV += LIBS="$(NQPTP_CONF_LIBS)"
+
+define NQPTP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nqptp \
+		$(TARGET_DIR)/usr/bin/nqptp
+endef
+
+define NQPTP_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/nqptp/S90nqptp \
+		$(TARGET_DIR)/etc/init.d/S90nqptp
+endef
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
