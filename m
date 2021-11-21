Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45B4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 09:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EBD88102A;
	Sun, 21 Nov 2021 09:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cNhyPXDEsFsC; Sun, 21 Nov 2021 09:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E15180DDE;
	Sun, 21 Nov 2021 09:45:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6A021BF2EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 09:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3F9380DDE
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 09:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaL5G92EB81l for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 09:45:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA35380BEB
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:45:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so2182484wmc.2
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 01:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5UPh0+Y00KhwfjMVvOMsNG/qDocYpMaglKTALs/eQCA=;
 b=HR6eiPhIJNew5IkgfUGhsBXK1uVqNjpBg8b8HeUK+FbNya6Kbcu1EYA7Qc5I8hjjsu
 CWvx2yX4G0dGm1wse+Ujl9rixk7gveRP7jzyd246RTDj5iUF76FuG/H8JBJQ8qKl9G1t
 VnRMz04RmvbqsraHWJhq2ak67NeEfZvn/s3UEI2wgFt4oCVaFF1MYimvNa3o5yjl507X
 2bxp+o2T3EXcFzWqDj9aZ+Wg7zOmzX7goIZ3huj584uE7bjMyeiyIokyeBjCgKtl5wEZ
 V31asU71m1B2+L9+pDwfF58jsAiNFyRQlyWwESlDDS6A0V1uESHNRTQnNQNIphDG7IyC
 7ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5UPh0+Y00KhwfjMVvOMsNG/qDocYpMaglKTALs/eQCA=;
 b=YZZr+7s7juWiOKCtvJwetgdnuclCeiFYuwwjGwQKTmadVZT/ozo33QGW0ComlXgWCU
 DQDi97CjyAjQpIl7yZ3oAvpvSU0Xb0ane6x2KEE1gU7DI/K+Pjd2fDRy8OvKr8a3KoSZ
 nJ+McuFLAB3IPpvuOpzBuhAr2EZsF89tOZxAUiWh6eGsQH2qbLfHTpvrR5Q/ouK3WPgm
 PJuEgmiOq6c2iI5zGHGCshS8mEZRMdxVsG1PpUtTOyBYHoo45M/zoFVdXXRTqrfi0xBt
 5XhCMEXJvtlHfJE8gNSmhOwIjM+UihaGlEFVDjRLifwukBrrufsYiCKReoGLYeC/Prmt
 pBrQ==
X-Gm-Message-State: AOAM532OmnZDWSSbafYRzHnHlofTdGGCQdIQDSw7/oLqqmYqCcI563S6
 lbxCChKRjG2e1rfgMpODhgj/RTZNfj0=
X-Google-Smtp-Source: ABdhPJwh+7+UYKvyQ5zpOe9zq/j0rL1K1GSmH+pv8PF1pk4Ob9Oe1IBWxKweukTaLrZ+gmonpcrfsQ==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr17624938wmc.152.1637487910617; 
 Sun, 21 Nov 2021 01:45:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z11sm5264795wrt.58.2021.11.21.01.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 01:45:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 10:42:54 +0100
Message-Id: <20211121094254.3425966-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix mount -a
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14351

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...cache-as-probed-if-sys-not-available.patch | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch

diff --git a/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch b/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
new file mode 100644
index 0000000000..bfc8f60834
--- /dev/null
+++ b/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
@@ -0,0 +1,141 @@
+From 84d38ae3eca523ef990cb848563cc63de25266e6 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Fri, 19 Nov 2021 14:19:03 +0100
+Subject: [PATCH] libblkid: don't mark cache as "probed" if /sys not available
+
+For "mount --all" we need to read the cache more than once in a short
+time. The library checks the delay between probes, and if the delay is
+too short, it does not read devices. This is a problem on boot when there
+are no /sys, and the cache is empty. In this case, we need to check
+for /sys until it's available constantly.
+
+https://github.com/util-linux/util-linux/issues/1492
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+[Retrieved from:
+https://github.com/util-linux/util-linux/commit/84d38ae3eca523ef990cb848563cc63de25266e6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libblkid/src/devname.c | 26 +++++++++++++++++---------
+ libblkid/src/resolve.c |  2 +-
+ libblkid/src/tag.c     |  8 +++++---
+ 3 files changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/libblkid/src/devname.c b/libblkid/src/devname.c
+index 90a8245fc9..9a173e3489 100644
+--- a/libblkid/src/devname.c
++++ b/libblkid/src/devname.c
+@@ -429,6 +429,8 @@ sysfs_probe_all(blkid_cache cache, int only_if_new, int only_removable)
+ 	if (!sysfs)
+ 		return -BLKID_ERR_SYSFS;
+ 
++	DBG(DEVNAME, ul_debug(" probe /sys/block"));
++
+ 	/* scan /sys/block */
+ 	while ((dev = xreaddir(sysfs))) {
+ 		DIR *dir = NULL;
+@@ -533,14 +535,18 @@ sysfs_probe_all(blkid_cache cache, int only_if_new, int only_removable)
+ /*
+  * Read the device data for all available block devices in the system.
+  */
+-static int probe_all(blkid_cache cache, int only_if_new)
++static int probe_all(blkid_cache cache, int only_if_new, int update_interval)
+ {
++	int rc;
++
+ 	if (!cache)
+ 		return -BLKID_ERR_PARAM;
+ 
+ 	if (cache->bic_flags & BLKID_BIC_FL_PROBED &&
+-	    time(NULL) - cache->bic_time < BLKID_PROBE_INTERVAL)
++	    time(NULL) - cache->bic_time < BLKID_PROBE_INTERVAL) {
++		DBG(PROBE, ul_debug("don't re-probe [delay < %d]", BLKID_PROBE_INTERVAL));
+ 		return 0;
++	}
+ 
+ 	blkid_read_cache(cache);
+ #ifdef VG_DIR
+@@ -548,7 +554,13 @@ static int probe_all(blkid_cache cache, int only_if_new)
+ #endif
+ 	ubi_probe_all(cache, only_if_new);
+ 
+-	sysfs_probe_all(cache, only_if_new, 0);
++	rc = sysfs_probe_all(cache, only_if_new, 0);
++
++	/* Don't mark the change as "probed" if /sys not avalable */
++	if (update_interval && rc == 0) {
++		cache->bic_time = time(NULL);
++		cache->bic_flags |= BLKID_BIC_FL_PROBED;
++	}
+ 
+ 	blkid_flush_cache(cache);
+ 	return 0;
+@@ -567,11 +579,7 @@ int blkid_probe_all(blkid_cache cache)
+ 	int ret;
+ 
+ 	DBG(PROBE, ul_debug("Begin blkid_probe_all()"));
+-	ret = probe_all(cache, 0);
+-	if (ret == 0) {
+-		cache->bic_time = time(NULL);
+-		cache->bic_flags |= BLKID_BIC_FL_PROBED;
+-	}
++	ret = probe_all(cache, 0, 1);
+ 	DBG(PROBE, ul_debug("End blkid_probe_all() [rc=%d]", ret));
+ 	return ret;
+ }
+@@ -589,7 +597,7 @@ int blkid_probe_all_new(blkid_cache cache)
+ 	int ret;
+ 
+ 	DBG(PROBE, ul_debug("Begin blkid_probe_all_new()"));
+-	ret = probe_all(cache, 1);
++	ret = probe_all(cache, 1, 0);
+ 	DBG(PROBE, ul_debug("End blkid_probe_all_new() [rc=%d]", ret));
+ 	return ret;
+ }
+diff --git a/libblkid/src/resolve.c b/libblkid/src/resolve.c
+index 641b022860..16653fa8e1 100644
+--- a/libblkid/src/resolve.c
++++ b/libblkid/src/resolve.c
+@@ -32,7 +32,7 @@ char *blkid_get_tag_value(blkid_cache cache, const char *tagname,
+ 	blkid_cache c = cache;
+ 	char *ret = NULL;
+ 
+-	DBG(TAG, ul_debug("looking for %s on %s", tagname, devname));
++	DBG(TAG, ul_debug("looking for tag %s on %s device", tagname, devname));
+ 
+ 	if (!devname)
+ 		return NULL;
+diff --git a/libblkid/src/tag.c b/libblkid/src/tag.c
+index 390a648648..178336505f 100644
+--- a/libblkid/src/tag.c
++++ b/libblkid/src/tag.c
+@@ -326,14 +326,14 @@ blkid_dev blkid_find_dev_with_tag(blkid_cache cache,
+ 	blkid_dev	dev;
+ 	int		pri;
+ 	struct list_head *p;
+-	int		probe_new = 0;
++	int		probe_new = 0, probe_all = 0;
+ 
+ 	if (!cache || !type || !value)
+ 		return NULL;
+ 
+ 	blkid_read_cache(cache);
+ 
+-	DBG(TAG, ul_debug("looking for %s=%s in cache", type, value));
++	DBG(TAG, ul_debug("looking for tag %s=%s in cache", type, value));
+ 
+ try_again:
+ 	pri = -1;
+@@ -366,9 +366,11 @@ blkid_dev blkid_find_dev_with_tag(blkid_cache cache,
+ 		goto try_again;
+ 	}
+ 
+-	if (!dev && !(cache->bic_flags & BLKID_BIC_FL_PROBED)) {
++	if (!dev && !probe_all
++	    && !(cache->bic_flags & BLKID_BIC_FL_PROBED)) {
+ 		if (blkid_probe_all(cache) < 0)
+ 			return NULL;
++		probe_all++;
+ 		goto try_again;
+ 	}
+ 	return dev;
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
