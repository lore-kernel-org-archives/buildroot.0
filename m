Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB0BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 13:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43827605B3;
	Mon, 14 Feb 2022 13:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7O818nmrIcq; Mon, 14 Feb 2022 13:33:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B4CC606E7;
	Mon, 14 Feb 2022 13:33:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 103081BF3B8
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 13:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00807408F9
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 13:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CG06rYyVmXCR for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 13:33:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B30A0408DB
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:33:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id k41so8512476wms.0
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 05:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cS4CoE/DLuLLgE6MSKk1kWxwUtOaL8EJ7Ee+IdD7IAE=;
 b=ebEEWlpKYwdAXv5vwy4zkaIldtkZcXTamJQv6BdisirKDkRTZdqyLnqdyc8mLJ7IiR
 GgcW7azZmwnKpgCCzSzAzJwXW/qUwBOE1l+AuRBg9vjMRuksS0BOMHDuAIeWss15/PJM
 g1ExwInwuiq35I6U2CBdTcFAjkwhTvcJ4clCNy4A9nY7UUpEvTZYF9UePs5q5ppd4ukl
 kQeHL0SGpTrlL2U972UU8dfFUTabAjtch1hF7epIoVjuj33ne6JG4lwt1FwIjEGW18Eg
 qN/kd82Gw4t2HOGeUKvO4IGzZuooWjZuekfr4ZlycMykZDWXLNyd2+71tZ2jZ/FTvwG9
 JMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cS4CoE/DLuLLgE6MSKk1kWxwUtOaL8EJ7Ee+IdD7IAE=;
 b=s8zi4foSwP5Db01cYNf0QK8BRqPF89FZevWXux79iKkkfA+hDY86Iy0JRayOmngVIK
 k82se04ecIKQFWseRF9RMWSH2J54JMe56WQyzRQ3rUazIaTPIqw7gmGkvztu9W4FjteN
 D7bvCbOKoCdcsygDIqGv/N8RUZDdAJzrZ+E+u/hJDeJ01CbUevogNMBIRnNKnpZKqjmw
 zVqEoc/H5IdcDwahoZfsOgehgcsusYROM/kuKmz22uQKAWyYOGgyQBy3D2MrQCGiiUlf
 kEBvPViwjAp9QuCDoevV94nn9VSJZKrnVjIsGUGfW+OYgVBEpMVSZ6ZnTQnocMecmxy+
 eNOQ==
X-Gm-Message-State: AOAM532/i99a7MV4UrrNZvPVfvN81mJlkmQjtY0ctWZXB6rrk6AOyhFV
 m2rj7LfwAYO/OQJvR2pWu4NMj7RnRG0=
X-Google-Smtp-Source: ABdhPJyGcRdYRbj0e2MvGfDcGWgcaXoDFF7rcMGrv2iFmp6c/mtwySkO5Ge8kekdpwV87U8cI3Zrjw==
X-Received: by 2002:a05:600c:511e:: with SMTP id
 o30mr11199998wms.36.1644845606546; 
 Mon, 14 Feb 2022 05:33:26 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id r2sm14814967wmq.24.2022.02.14.05.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:33:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 14:33:48 +0100
Message-Id: <20220214133348.2473221-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix build with glibc
 < 2.25
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with glibc < 2.25 raised since bump to
version 5.63 in commit d4c6cf4b1fc0f34e72ff047e76de53d3634f5184:

plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
 #include <sys/random.h>
                        ^

Fixes:
 - http://autobuild.buildroot.org/results/6b8870d12e0804d6154230a7322c49416c1dc0e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0005-fix-build-with-glibc-2.25.patch      | 285 ++++++++++++++++++
 1 file changed, 285 insertions(+)
 create mode 100644 package/bluez5_utils/0005-fix-build-with-glibc-2.25.patch

diff --git a/package/bluez5_utils/0005-fix-build-with-glibc-2.25.patch b/package/bluez5_utils/0005-fix-build-with-glibc-2.25.patch
new file mode 100644
index 0000000000..13d0d4de4c
--- /dev/null
+++ b/package/bluez5_utils/0005-fix-build-with-glibc-2.25.patch
@@ -0,0 +1,285 @@
+From a90d20109b605e073ae686d54596b68584a7d7fc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 14 Feb 2022 13:37:45 +0100
+Subject: [PATCH] fix build with glibc < 2.25
+
+getrandom and sys/random.h are only available since glibc 2.25:
+https://www.gnu.org/software/gnulib/manual/html_node/sys_002frandom_002eh.html
+resulting in the following build failures since version 5.63 and
+https://git.kernel.org/pub/scm/bluetooth/bluez.git/log/?qt=grep&q=getrandom
+so put back rand() as a fallback:
+
+plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
+ #include <sys/random.h>
+                        ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6b8870d12e0804d6154230a7322c49416c1dc0e2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://patchwork.kernel.org/project/bluetooth/patch/20220214131451.2397549-1-fontaine.fabrice@gmail.com]
+---
+ configure.ac           |  2 ++
+ emulator/le.c          |  7 +++++++
+ emulator/phy.c         |  7 +++++++
+ peripheral/main.c      | 10 ++++++++++
+ plugins/autopair.c     |  6 ++++++
+ profiles/health/hdp.c  | 11 +++++++++++
+ profiles/health/mcap.c | 10 ++++++++++
+ tools/btgatt-server.c  |  6 ++++++
+ 8 files changed, 59 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 07d068a4d..cdd693da3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,6 +54,8 @@ AC_ARG_ENABLE(threads, AS_HELP_STRING([--enable-threads],
+ 
+ AC_CHECK_FUNCS(explicit_bzero)
+ 
++AC_CHECK_FUNCS(getrandom)
++
+ AC_CHECK_FUNCS(rawmemchr)
+ 
+ AC_CHECK_FUNC(signalfd, dummy=yes,
+diff --git a/emulator/le.c b/emulator/le.c
+index f8f313f2c..9ef0636d0 100644
+--- a/emulator/le.c
++++ b/emulator/le.c
+@@ -20,7 +20,9 @@
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <sys/uio.h>
++#ifdef HAVE_GETRANDOM
+ #include <sys/random.h>
++#endif
+ #include <time.h>
+ 
+ #include "lib/bluetooth.h"
+@@ -509,10 +511,15 @@ static unsigned int get_adv_delay(void)
+ 	/* The advertising delay is a pseudo-random value with a range
+ 	 * of 0 ms to 10 ms generated for each advertising event.
+ 	 */
++#ifdef HAVE_GETRANDOM
+ 	if (getrandom(&val, sizeof(val), 0) < 0) {
+ 		/* If it fails to get the random number, use a static value */
+ 		val = 5;
+ 	}
++#else
++	srand(time(NULL));
++	val = rand();
++#endif
+ 
+ 	return (val % 11);
+ }
+diff --git a/emulator/phy.c b/emulator/phy.c
+index 44cace438..e41aaf9c2 100644
+--- a/emulator/phy.c
++++ b/emulator/phy.c
+@@ -19,7 +19,9 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <sys/socket.h>
++#ifdef HAVE_GETRANDOM
+ #include <sys/random.h>
++#endif
+ #include <netinet/in.h>
+ #include <netinet/ip.h>
+ #include <time.h>
+@@ -174,6 +176,7 @@ struct bt_phy *bt_phy_new(void)
+ 	mainloop_add_fd(phy->rx_fd, EPOLLIN, phy_rx_callback, phy, NULL);
+ 
+ 	if (!get_random_bytes(&phy->id, sizeof(phy->id))) {
++#ifdef GAVE_GETRANDOM
+ 		if (getrandom(&phy->id, sizeof(phy->id), 0) < 0) {
+ 			mainloop_remove_fd(phy->rx_fd);
+ 			close(phy->tx_fd);
+@@ -181,6 +184,10 @@ struct bt_phy *bt_phy_new(void)
+ 			free(phy);
+ 			return NULL;
+ 		}
++#else
++		srandom(time(NULL));
++		phy->id = random();
++#endif
+ 	}
+ 
+ 	bt_phy_send(phy, BT_PHY_PKT_NULL, NULL, 0);
+diff --git a/peripheral/main.c b/peripheral/main.c
+index 91adb45fc..542adc330 100644
+--- a/peripheral/main.c
++++ b/peripheral/main.c
+@@ -25,7 +25,9 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/mount.h>
++#ifdef HAVE_GETRANDOM
+ #include <sys/random.h>
++#endif
+ 
+ #ifndef WAIT_ANY
+ #define WAIT_ANY (-1)
+@@ -192,10 +194,18 @@ int main(int argc, char *argv[])
+ 							addr, 6) < 0) {
+ 			printf("Generating new persistent static address\n");
+ 
++#ifdef HAVE_GETRANDOM
+ 			if (getrandom(addr, sizeof(addr), 0) < 0) {
+ 				perror("Failed to get random static address");
+ 				return EXIT_FAILURE;
+ 			}
++#else
++			addr[0] = rand();
++			addr[1] = rand();
++			addr[2] = rand();
++			addr[3] = 0x34;
++			addr[4] = 0x12;
++#endif
+ 			/* Overwrite the MSB to make it a static address */
+ 			addr[5] = 0xc0;
+ 
+diff --git a/plugins/autopair.c b/plugins/autopair.c
+index a75ecebe4..59d65807c 100644
+--- a/plugins/autopair.c
++++ b/plugins/autopair.c
+@@ -17,7 +17,9 @@
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <errno.h>
++#ifdef HAVE_GETRANDOM
+ #include <sys/random.h>
++#endif
+ 
+ #include <glib.h>
+ 
+@@ -131,10 +133,14 @@ static ssize_t autopair_pincb(struct btd_adapter *adapter,
+ 			if (attempt >= 4)
+ 				return 0;
+ 
++#ifdef HAVE_GETRANDOM
+ 			if (getrandom(&val, sizeof(val), 0) < 0) {
+ 				error("Failed to get a random pincode");
+ 				return 0;
+ 			}
++#else
++			val = rand();
++#endif
+ 			snprintf(pinstr, sizeof(pinstr), "%06u",
+ 						val % 1000000);
+ 			*display = true;
+diff --git a/profiles/health/hdp.c b/profiles/health/hdp.c
+index 9d9d1e824..ca59be3e8 100644
+--- a/profiles/health/hdp.c
++++ b/profiles/health/hdp.c
+@@ -16,7 +16,9 @@
+ #include <stdint.h>
+ #include <stdbool.h>
+ #include <unistd.h>
++#ifdef HAVE_GETRANDOM
+ #include <sys/random.h>
++#endif
+ 
+ #include <glib.h>
+ 
+@@ -1485,15 +1487,24 @@ static void destroy_create_dc_data(gpointer data)
+ static void *generate_echo_packet(void)
+ {
+ 	uint8_t *buf;
++#ifndef HAVE_GETRANDOM
++	int i;
++#endif
+ 
+ 	buf = g_malloc(HDP_ECHO_LEN);
+ 	if (!buf)
+ 		return NULL;
+ 
++#ifdef HAVE_GETRANDOM
+ 	if (getrandom(buf, HDP_ECHO_LEN, 0) < 0) {
+ 		g_free(buf);
+ 		return NULL;
+ 	}
++#else
++	srand(time(NULL));
++	for(i = 0; i < HDP_ECHO_LEN; i++)
++		buf[i] = rand() % UINT8_MAX;
++#endif
+ 
+ 	return buf;
+ }
+diff --git a/profiles/health/mcap.c b/profiles/health/mcap.c
+index aad0a08a3..9bd994fda 100644
+--- a/profiles/health/mcap.c
++++ b/profiles/health/mcap.c
+@@ -19,7 +19,9 @@
+ #include <errno.h>
+ #include <unistd.h>
+ #include <time.h>
++#ifdef HAVE_GETRANDOM
+ #include <sys/random.h>
++#endif
+ 
+ #include <glib.h>
+ 
+@@ -1905,11 +1907,15 @@ gboolean mcap_create_mcl(struct mcap_instance *mi,
+ 		mcl->state = MCL_IDLE;
+ 		bacpy(&mcl->addr, addr);
+ 		set_default_cb(mcl);
++#ifdef HAVE_GETRANDOM
+ 		if (getrandom(&val, sizeof(val), 0) < 0) {
+ 			mcap_instance_unref(mcl->mi);
+ 			g_free(mcl);
+ 			return FALSE;
+ 		}
++#else
++		val = rand();
++#endif
+ 		mcl->next_mdl = (val % MCAP_MDLID_FINAL) + 1;
+ 	}
+ 
+@@ -2049,11 +2055,15 @@ static void connect_mcl_event_cb(GIOChannel *chan, GError *gerr,
+ 		mcl->mi = mcap_instance_ref(mi);
+ 		bacpy(&mcl->addr, &dst);
+ 		set_default_cb(mcl);
++#ifdef HAVE_GETRANDOM
+ 		if (getrandom(&val, sizeof(val), 0) < 0) {
+ 			mcap_instance_unref(mcl->mi);
+ 			g_free(mcl);
+ 			goto drop;
+ 		}
++#else
++		val = rand();
++#endif
+ 		mcl->next_mdl = (val % MCAP_MDLID_FINAL) + 1;
+ 	}
+ 
+diff --git a/tools/btgatt-server.c b/tools/btgatt-server.c
+index 15d49a464..6367ccd9d 100644
+--- a/tools/btgatt-server.c
++++ b/tools/btgatt-server.c
+@@ -20,7 +20,9 @@
+ #include <getopt.h>
+ #include <unistd.h>
+ #include <errno.h>
++#ifdef HAVE_GETRANDOM
+ #include <sys/random.h>
++#endif
+ 
+ #include "lib/bluetooth.h"
+ #include "lib/hci.h"
+@@ -287,8 +289,12 @@ static bool hr_msrmt_cb(void *user_data)
+ 	uint32_t cur_ee;
+ 	uint32_t val;
+ 
++#ifdef HAVE_GETRANDOM
+ 	if (getrandom(&val, sizeof(val), 0) < 0)
+ 		return false;
++#else
++	val = rand();
++#endif
+ 
+ 	pdu[0] = 0x06;
+ 	pdu[1] = 90 + (val % 40);
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
