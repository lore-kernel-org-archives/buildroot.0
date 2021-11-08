Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1CAC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B41761075
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B41761075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02D4F402D2;
	Mon,  8 Nov 2021 16:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uc8X-qoLPWMx; Mon,  8 Nov 2021 16:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8452402DB;
	Mon,  8 Nov 2021 16:09:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E0491BF977
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AAE96061B
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aL4KkJ4h3KUY for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C11AF6062F
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 22A118B6B9; Mon,  8 Nov 2021 16:03:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 16:07:15 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7aad3812c340da001bbf173c4883bde0086d0eba
X-Git-Newrev: 957c0e2e19f8e812f6a9fd93b42f123bb5966d86
X-Patchwork-Hint: ignore
Message-Id: <20211108160318.22A118B6B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/dahdi-linux: bump
 to 5c840cf43838e0690873e73409491c392333b3b8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=957c0e2e19f8e812f6a9fd93b42f123bb5966d86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Fix build with kernel >= 5.4 thanks to
  https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=commit;h=45ac6a30f922f4eef54c0120c2a537794b20cf5c
- Fix build with kernel >= 5.6 thanks to
  https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=commit;h=34b9c77c9ab2794d4e912461e4c1080c4b1f6184
- Fix typo in dahdi-linux.mk
- Remove deprecated note about kernel >= 4.0 in Config.in
- Add patch to fix build failure with 32-bits kernels raised since
  https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=commit;h=ffcd08205c71dcb0e060836359418bef20f07ffa
- Update indentation in hash file (two spaces)

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14311

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8402b5263fd7f1a77128374485053e1bd2a3f667)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-build-with-32-bits-kernel.patch       | 144 +++++++++++++++++++++
 package/dahdi-linux/Config.in                      |   4 -
 package/dahdi-linux/dahdi-linux.hash               |   6 +-
 package/dahdi-linux/dahdi-linux.mk                 |   6 +-
 4 files changed, 149 insertions(+), 11 deletions(-)

diff --git a/package/dahdi-linux/0002-fix-build-with-32-bits-kernel.patch b/package/dahdi-linux/0002-fix-build-with-32-bits-kernel.patch
new file mode 100644
index 0000000000..ddaf6b4e7a
--- /dev/null
+++ b/package/dahdi-linux/0002-fix-build-with-32-bits-kernel.patch
@@ -0,0 +1,144 @@
+From aa74fa2fb5acf54bd46ad4c1b10e0a23a2cb3d25 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 4 Nov 2021 18:45:11 +0100
+Subject: [PATCH] fix build with 32-bits kernel
+
+Use div_s64 or div_s64_rem to fix the following build failure on 32-bits
+kernels:
+
+ERROR: modpost: "__divdi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xpp_usb.ko] undefined!
+ERROR: modpost: "__udivdi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xpp_usb.ko] undefined!
+ERROR: modpost: "__moddi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xpp.ko] undefined!
+ERROR: modpost: "__divdi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xpp.ko] undefined!
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ drivers/dahdi/xpp/xbus-core.c    |  9 ++++++---
+ drivers/dahdi/xpp/xbus-pcm.c     |  4 ++--
+ drivers/dahdi/xpp/xbus-sysfs.c   |  2 +-
+ drivers/dahdi/xpp/xframe_queue.c | 15 ++++++++++-----
+ drivers/dahdi/xpp/xpp_usb.c      |  2 +-
+ 5 files changed, 20 insertions(+), 12 deletions(-)
+
+diff --git a/drivers/dahdi/xpp/xbus-core.c b/drivers/dahdi/xpp/xbus-core.c
+index fc4ce7b..b1d1fd7 100644
+--- a/drivers/dahdi/xpp/xbus-core.c
++++ b/drivers/dahdi/xpp/xbus-core.c
+@@ -1754,11 +1754,14 @@ out:
+ 
+ static void xbus_fill_proc_queue(struct seq_file *sfile, struct xframe_queue *q)
+ {
++	s64 msec = 0;
++	s32 rem = 0;
++
++	msec = div_s64_rem(q->worst_lag_usec, 1000, &rem);
+ 	seq_printf(sfile,
+-		"%-15s: counts %3d, %3d, %3d worst %3d, overflows %3d worst_lag %02lld.%lld ms\n",
++		"%-15s: counts %3d, %3d, %3d worst %3d, overflows %3d worst_lag %02lld.%d ms\n",
+ 		q->name, q->steady_state_count, q->count, q->max_count,
+-		q->worst_count, q->overflows, q->worst_lag_usec / 1000,
+-		q->worst_lag_usec % 1000);
++		q->worst_count, q->overflows, msec, rem);
+ 	xframe_queue_clearstats(q);
+ }
+ 
+diff --git a/drivers/dahdi/xpp/xbus-pcm.c b/drivers/dahdi/xpp/xbus-pcm.c
+index 8bb2fe7..e690ce7 100644
+--- a/drivers/dahdi/xpp/xbus-pcm.c
++++ b/drivers/dahdi/xpp/xbus-pcm.c
+@@ -129,7 +129,7 @@ static int xpp_ticker_step(struct xpp_ticker *ticker, const ktime_t t)
+ 		usec = ktime_us_delta(ticker->last_sample,
+ 					ticker->first_sample);
+ 		ticker->first_sample = ticker->last_sample;
+-		ticker->tick_period = usec / ticker->cycle;
++		ticker->tick_period = div_s64(usec, ticker->cycle);
+ 		cycled = 1;
+ 	}
+ 	ticker->count++;
+@@ -497,7 +497,7 @@ static void send_drift(xbus_t *xbus, int drift)
+ 	XBUS_DBG(SYNC, xbus,
+ 		 "%sDRIFT adjust %s (%d) (last update %lld seconds ago)\n",
+ 		 (disable_pll_sync) ? "Fake " : "", msg, drift,
+-		 msec_delta / MSEC_PER_SEC);
++		 div_s64(msec_delta, MSEC_PER_SEC));
+ 	if (!disable_pll_sync)
+ 		CALL_PROTO(GLOBAL, SYNC_SOURCE, xbus, NULL, SYNC_MODE_PLL,
+ 			   drift);
+diff --git a/drivers/dahdi/xpp/xbus-sysfs.c b/drivers/dahdi/xpp/xbus-sysfs.c
+index d8c11dc..35180d9 100644
+--- a/drivers/dahdi/xpp/xbus-sysfs.c
++++ b/drivers/dahdi/xpp/xbus-sysfs.c
+@@ -249,7 +249,7 @@ static DEVICE_ATTR_READER(driftinfo_show, dev, buf)
+ 	/*
+ 	 * Calculate lost ticks time
+ 	 */
+-	seconds = ktime_ms_delta(now, di->last_lost_tick) / 1000;
++	seconds = div_s64(ktime_ms_delta(now, di->last_lost_tick), 1000);
+ 	minutes = seconds / 60;
+ 	seconds = seconds % 60;
+ 	hours = minutes / 60;
+diff --git a/drivers/dahdi/xpp/xframe_queue.c b/drivers/dahdi/xpp/xframe_queue.c
+index e986083..8e5e508 100644
+--- a/drivers/dahdi/xpp/xframe_queue.c
++++ b/drivers/dahdi/xpp/xframe_queue.c
+@@ -35,15 +35,18 @@ static void __xframe_dump_queue(struct xframe_queue *q)
+ 	int i = 0;
+ 	char prefix[30];
+ 	ktime_t now = ktime_get();
++	s64 msec = 0;
++	s32 rem = 0;
+ 
+ 	printk(KERN_DEBUG "%s: dump queue '%s' (first packet in each frame)\n",
+ 	       THIS_MODULE->name, q->name);
+ 	list_for_each_entry_reverse(xframe, &q->head, frame_list) {
+ 		xpacket_t *pack = (xpacket_t *)&xframe->packets[0];
+ 		s64 usec = ktime_us_delta(now, xframe->kt_queued);
++		msec = div_s64_rem(usec, 1000, &rem);
+ 
+-		snprintf(prefix, ARRAY_SIZE(prefix), "  %3d> %5lld.%03lld msec",
+-			 i++, usec / 1000, usec % 1000);
++		snprintf(prefix, ARRAY_SIZE(prefix), "  %3d> %5lld.%03d msec",
++			 i++, msec, rem);
+ 		dump_packet(prefix, pack, 1);
+ 	}
+ }
+@@ -52,6 +55,8 @@ static bool __xframe_enqueue(struct xframe_queue *q, xframe_t *xframe)
+ {
+ 	int ret = 1;
+ 	static int overflow_cnt;
++	s64 msec = 0;
++	s32 rem = 0;
+ 
+ 	if (unlikely(q->disabled)) {
+ 		ret = 0;
+@@ -60,11 +65,11 @@ static bool __xframe_enqueue(struct xframe_queue *q, xframe_t *xframe)
+ 	if (q->count >= q->max_count) {
+ 		q->overflows++;
+ 		if ((overflow_cnt++ % 1000) < 5) {
+-			NOTICE("Overflow of %-15s: counts %3d, %3d, %3d worst %3d, overflows %3d worst_lag %02lld.%lld ms\n",
++			msec = div_s64_rem(q->worst_lag_usec, 1000, &rem);
++			NOTICE("Overflow of %-15s: counts %3d, %3d, %3d worst %3d, overflows %3d worst_lag %02lld.%d ms\n",
+ 			     q->name, q->steady_state_count, q->count,
+ 			     q->max_count, q->worst_count, q->overflows,
+-			     q->worst_lag_usec / 1000,
+-			     q->worst_lag_usec % 1000);
++			     msec, rem);
+ 			__xframe_dump_queue(q);
+ 		}
+ 		ret = 0;
+diff --git a/drivers/dahdi/xpp/xpp_usb.c b/drivers/dahdi/xpp/xpp_usb.c
+index 1a591b1..3741457 100644
+--- a/drivers/dahdi/xpp/xpp_usb.c
++++ b/drivers/dahdi/xpp/xpp_usb.c
+@@ -882,7 +882,7 @@ static void xpp_send_callback(struct urb *urb)
+ 		usec = 0; /* System clock jumped */
+ 	if (usec > xusb->max_tx_delay)
+ 		xusb->max_tx_delay = usec;
+-	i = usec / USEC_BUCKET;
++	i = div_s64(usec, USEC_BUCKET);
+ 	if (i >= NUM_BUCKETS)
+ 		i = NUM_BUCKETS - 1;
+ 	xusb->usb_tx_delay[i]++;
+-- 
+2.33.0
+
diff --git a/package/dahdi-linux/Config.in b/package/dahdi-linux/Config.in
index ea9fc00db2..7b6ce79422 100644
--- a/package/dahdi-linux/Config.in
+++ b/package/dahdi-linux/Config.in
@@ -11,9 +11,5 @@ config BR2_PACKAGE_DAHDI_LINUX
 
 	  http://www.asterisk.org/downloads/dahdi
 
-	  Note: DAHDI Linux drivers won't build on a kernel v4.0 or more
-	  recent, because they use internals that have been removed in
-	  v4.0.
-
 comment "dahdi-linux needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/dahdi-linux/dahdi-linux.hash b/package/dahdi-linux/dahdi-linux.hash
index 1847a4da4c..7a4c688061 100644
--- a/package/dahdi-linux/dahdi-linux.hash
+++ b/package/dahdi-linux/dahdi-linux.hash
@@ -1,7 +1,5 @@
-# sha1 from: http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases
-# sha256 locally computed
-sha1    9827f0afc625e293021b81daf94ec054145c975b  dahdi-linux-3.0.0.tar.gz
-sha256  02a8a680d20a3e243f37259edc3554ab9a488595a28562c45c33da3792d12caa  dahdi-linux-3.0.0.tar.gz
+# Locally computed
+sha256  3faf127ee3f1fad0195c56d00b7bf2708ec8a54bf3c31edd827fd9beb47e0a51  dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8-br1.tar.gz
 
 # Firmware files have no upstream hash, so sha56 locally computed
 sha256  3ff26cf80555fd7470b43a87c51d03c1db2a75abcd4561d79f69b6c48298e4a1  dahdi-fwload-vpmadt032-1.25.0.tar.gz
diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
index cb1d692e94..b9d5911953 100644
--- a/package/dahdi-linux/dahdi-linux.mk
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-DAHDI_LINUX_VERSION = 3.0.0
-DAHDI_LINUX_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases
+DAHDI_LINUX_VERSION = 5c840cf43838e0690873e73409491c392333b3b8
+DAHDI_LINUX_SITE = git://git.asterisk.org/dahdi/linux.git
 
-# We need to download all thoe firmware blobs ourselves, otherwise
+# We need to download all those firmware blobs ourselves, otherwise
 # dahdi-linux will try to download them at install time.
 DAHDI_LINUX_FW_SITE = http://downloads.digium.com/pub/telephony/firmware/releases
 DAHDI_LINUX_FW_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
