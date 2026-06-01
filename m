Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E28CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5179409C8;
	Mon,  1 Jun 2026 19:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUNE1H21p2vm; Mon,  1 Jun 2026 19:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 759A6409D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780343099;
	bh=gTbrmPL7IDmI93UKqNO+whI9KJGf54DU7BeIjirz780=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JV121+EdgEuKMXgHTdMI1m32iXWqqasuw5FkWFxBwOC6YWiQa4/sWIrh+Cn/Wq3fl
	 5AOBSxqkVo6ItUMLStHK4LQILEk7allu0sish5FTtMmUJn2cMSxt4BFG9RQH9pqhRG
	 KP1KOwRCiQ8mRABe6rg4XjxaW9gnOiathQXGA2Kvy6ChqLiH8RO5N00kX3I2N83uKn
	 UrOstK5SHZJFT2mn+9PYDYpRAu1SZv9b3wm4/oI/fhOv/kvZlFaMAHTLtj9eU5uaE3
	 ldKonW4k45cgDx2OlN8UHooPPs9qB2NEKKoPZYvMtxW+ZqW+TVesxKLGW5mpm3qLZv
	 TQ3LZxPRal64Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 759A6409D3;
	Mon,  1 Jun 2026 19:44:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB384D3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCC0A409C8
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNh6T0j1TwwJ for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1E0409D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF1E0409D3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:44:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B462286EEA; Mon,  1 Jun 2026 19:44:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 21:36:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fab50ed3b1532037fa67582a6b47ac4084daaa88
X-Git-Newrev: 66544e0e48a24e59522d99cf3dac7c1e497c5e35
X-Patchwork-Hint: ignore
Message-Id: <20260601194442.B462286EEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ptpd2: remove package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66544e0e48a24e59522d99cf3dac7c1e497c5e35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The package has no active upstream:
https://github.com/ptpd/ptpd/issues/100

The last upstream commit dates back to 2019.

The package causes numerous build errors with newer toolchains so we
remove it from buildroot.

Fixes:
https://autobuild.buildroot.net/results/9ef/9efbc2f6a53e6739481c3371b8b9705897e20950/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                |  4 --
 Config.in.legacy                                   |  7 ++++
 package/Config.in                                  |  1 -
 package/ptpd2/0001-musl.patch                      | 15 -------
 ...d5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch | 46 ----------------------
 ...-25-Removing-type-U64-from-net-snmp-relat.patch | 28 -------------
 package/ptpd2/Config.in                            |  8 ----
 package/ptpd2/S65ptpd2                             | 29 --------------
 package/ptpd2/ptpd2.hash                           |  3 --
 package/ptpd2/ptpd2.mk                             | 37 -----------------
 package/ptpd2/ptpd2.service                        | 10 -----
 11 files changed, 7 insertions(+), 181 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7e813c370d..b4e7919c07 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -759,10 +759,6 @@ package/prosody/0002-add-pidfile.patch lib_patch.Upstream
 package/prosody/S50prosody Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/proxychains-ng/0001-add-configure-check-for-non-POSIX-compliant-getnameinfo-signature.patch lib_patch.Upstream
 package/ptpd/S65ptpd Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/ptpd2/0001-musl.patch lib_patch.Upstream
-package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch lib_patch.Upstream
-package/ptpd2/0003-Solve-issue-25-Removing-type-U64-from-net-snmp-relat.patch lib_patch.Upstream
-package/ptpd2/S65ptpd2 Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/pulseaudio/0001-shm.c-use-_Static_assert-instead-of-static_assert-fo.patch lib_patch.Upstream
 package/pulseaudio/S50pulseaudio lib_sysv.ConsecutiveEmptyLines lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index aa8437e28f..a36e331593 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_PTPD2
+	bool "ptpd2 removed"
+	select BR2_LEGACY
+	help
+	  ptpd2 was no longer maintained upstream, so it has been
+	  dropped.
+
 config BR2_PACKAGE_LIBHDHOMERUN
 	bool "libhdhomerun"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 7e69d025e0..630662477b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2587,7 +2587,6 @@ endif
 	source "package/prosody/Config.in"
 	source "package/proxychains-ng/Config.in"
 	source "package/ptpd/Config.in"
-	source "package/ptpd2/Config.in"
 	source "package/pure-ftpd/Config.in"
 	source "package/putty/Config.in"
 	source "package/radvd/Config.in"
diff --git a/package/ptpd2/0001-musl.patch b/package/ptpd2/0001-musl.patch
deleted file mode 100644
index 2e214b2188..0000000000
--- a/package/ptpd2/0001-musl.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix musl build
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr ptpd-ptpd-2.3.1.org/src/dep/net.c ptpd-ptpd-2.3.1/src/dep/net.c
---- ptpd-ptpd-2.3.1.org/src/dep/net.c	2015-06-29 17:13:29.000000000 +0200
-+++ ptpd-ptpd-2.3.1/src/dep/net.c	2016-01-24 00:35:44.509860065 +0100
-@@ -82,7 +82,6 @@
- #ifdef SO_TIMESTAMPING
- #include <linux/net_tstamp.h>
- #include <linux/sockios.h>
--#include <linux/ethtool.h>
- #endif /* SO_TIMESTAMPING */
- 
- /**
diff --git a/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch b/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch
deleted file mode 100644
index e655ff3354..0000000000
--- a/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From af1d16d90ff273413a57cd02689f4fb005403609 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Fri, 31 Aug 2018 18:46:56 +0200
-Subject: [PATCH] ntp_isc_md5: rename EVP_MD_CTX into PTPD_EVP_MD_CTX
-
-EVP_MD_CTX can conflict with openssl that defines a completely different
-typedef with same name.
-
-Since this typedef is used only twice in the entire ptpd,
-substitute EVP_MD_CTX with PTPD_EVP_MD_CTX.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- src/dep/ntpengine/ntp_isc_md5.c | 2 +-
- src/dep/ntpengine/ntp_isc_md5.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/dep/ntpengine/ntp_isc_md5.c b/src/dep/ntpengine/ntp_isc_md5.c
-index 850d004..3216de8 100644
---- a/src/dep/ntpengine/ntp_isc_md5.c
-+++ b/src/dep/ntpengine/ntp_isc_md5.c
-@@ -262,7 +262,7 @@ MD5authencrypt(
- {
- 	u_char	digest[64];
- 	u_int	len;
--	EVP_MD_CTX ctx;
-+	PTPD_EVP_MD_CTX ctx;
-         pkt[length / 4] = htonl(keyid); 
- 	EVP_DigestInit(&ctx);
- 	EVP_DigestUpdate(&ctx, (u_char *)key, (u_int)strlen(key));
-diff --git a/src/dep/ntpengine/ntp_isc_md5.h b/src/dep/ntpengine/ntp_isc_md5.h
-index fa6e2ee..236c0e4 100644
---- a/src/dep/ntpengine/ntp_isc_md5.h
-+++ b/src/dep/ntpengine/ntp_isc_md5.h
-@@ -80,7 +80,7 @@ isc_md5_final(isc_md5_t *ctx, unsigned char *digest);
- # define MD5Init(c)             isc_md5_init(c)
- # define MD5Update(c, p, s)     isc_md5_update(c, p, s)
- # define MD5Final(d, c)         isc_md5_final((c), (d)) /* swapped */
--  typedef MD5_CTX                       EVP_MD_CTX;
-+  typedef MD5_CTX                       PTPD_EVP_MD_CTX;
- # define EVP_DigestInit(c)              MD5Init(c)
- # define EVP_DigestUpdate(c, p, s)      MD5Update(c, p, s)
- # define EVP_DigestFinal(c, d, pdl)     \
--- 
-2.14.4
-
diff --git a/package/ptpd2/0003-Solve-issue-25-Removing-type-U64-from-net-snmp-relat.patch b/package/ptpd2/0003-Solve-issue-25-Removing-type-U64-from-net-snmp-relat.patch
deleted file mode 100644
index f952755d36..0000000000
--- a/package/ptpd2/0003-Solve-issue-25-Removing-type-U64-from-net-snmp-relat.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 84157b11e8f27318f7291823c657f6313c3b60af Mon Sep 17 00:00:00 2001
-From: Jan Breuer <jan.breuer@jaybee.cz>
-Date: Tue, 12 Jul 2016 18:07:08 +0200
-Subject: [PATCH] Solve issue #25 - Removing type U64 from net-snmp related
- code
-
-[Thomas: Backport to 2.3.1.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/dep/snmp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/dep/snmp.c b/src/dep/snmp.c
-index 5c08aaa..3086c86 100644
---- a/src/dep/snmp.c
-+++ b/src/dep/snmp.c
-@@ -221,7 +221,7 @@ snmpHeaderIndexBest(struct snmpHeaderIndex *idx)
- 
- #define SNMP_LOCAL_VARIABLES			\
- 	static unsigned long long_ret;		\
--	static U64 counter64_ret;		\
-+	static struct counter64 counter64_ret;	\
- 	static uint32_t ipaddr;			\
- 	Integer64 bigint;			\
- 	struct snmpHeaderIndex idx;		\
--- 
-2.14.4
-
diff --git a/package/ptpd2/Config.in b/package/ptpd2/Config.in
deleted file mode 100644
index 406276af35..0000000000
--- a/package/ptpd2/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PTPD2
-	bool "ptpd2"
-	select BR2_PACKAGE_LIBPCAP
-	help
-	  The PTP daemon (PTPd) implements the Precision Time protocol
-	  (PTP) as defined by the IEEE-1588-2008.
-
-	  https://github.com/ptpd/ptpd
diff --git a/package/ptpd2/S65ptpd2 b/package/ptpd2/S65ptpd2
deleted file mode 100644
index f815cb5a7b..0000000000
--- a/package/ptpd2/S65ptpd2
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/sh
-#
-# Start ptpd2
-#
-
-case "$1" in
-  start)
-	printf "Starting ptpd2: "
-	start-stop-daemon -S -q -x /usr/sbin/ptpd2 -- -g
-	if [ $? != 0 ]; then
-		echo "FAILED"
-		exit 1
-	else
-		echo "OK"
-	fi
-	;;
-  stop)
-	printf "Stopping ptpd2: "
-	start-stop-daemon -K -q -x /usr/sbin/ptpd2
-	echo "OK"
-	;;
-  restart|reload)
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/ptpd2/ptpd2.hash b/package/ptpd2/ptpd2.hash
deleted file mode 100644
index b29ce2a0d3..0000000000
--- a/package/ptpd2/ptpd2.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  267ad61d09d97069acec5d4878dceda20d0ddbebd27557d80230847848cee6c2  ptpd2-2.3.1.tar.gz
-sha256  5e101ac565a8e74ef4efbf7e0c95ef9333e00618c05dbf5fb4ed50a5bab1ff09  COPYRIGHT
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
deleted file mode 100644
index 0de336464d..0000000000
--- a/package/ptpd2/ptpd2.mk
+++ /dev/null
@@ -1,37 +0,0 @@
-################################################################################
-#
-# ptpd2
-#
-################################################################################
-
-PTPD2_VERSION = 2.3.1
-PTPD2_SITE = $(call github,ptpd,ptpd,ptpd-$(PTPD2_VERSION))
-PTPD2_DEPENDENCIES = libpcap
-PTPD2_CONF_OPTS = --with-pcap-config=$(STAGING_DIR)/usr/bin/pcap-config
-# configure not shipped
-PTPD2_AUTORECONF = YES
-PTPD2_LICENSE = BSD-2-Clause
-PTPD2_LICENSE_FILES = COPYRIGHT
-
-ifeq ($(BR2_STATIC_LIBS),y)
-PTPD2_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
-endif
-
-ifeq ($(BR2_PACKAGE_NETSNMP),y)
-PTPD2_CONF_ENV += ac_cv_path_PATH_NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
-PTPD2_DEPENDENCIES += netsnmp
-else
-PTPD2_CONF_OPTS += --disable-snmp
-endif
-
-define PTPD2_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/ptpd2/S65ptpd2 \
-		$(TARGET_DIR)/etc/init.d/S65ptpd2
-endef
-
-define PTPD2_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/ptpd2/ptpd2.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/ptpd2.service
-endef
-
-$(eval $(autotools-package))
diff --git a/package/ptpd2/ptpd2.service b/package/ptpd2/ptpd2.service
deleted file mode 100644
index 66e71ce0a4..0000000000
--- a/package/ptpd2/ptpd2.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Precision Time Protocol daemon
-After=syslog.target network.target
-
-[Service]
-ExecStart=/usr/sbin/ptpd2 -C -g
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
