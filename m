Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A983C433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 16:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B41E8151E;
	Sun,  8 May 2022 16:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qj7bzzyIcw4R; Sun,  8 May 2022 16:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226338143B;
	Sun,  8 May 2022 16:45:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7B21BF406
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 16:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1545B40904
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 16:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNyWcf4dOY1e for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 16:45:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4805408E5
 for <buildroot@buildroot.org>; Sun,  8 May 2022 16:45:45 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w4so16421651wrg.12
 for <buildroot@buildroot.org>; Sun, 08 May 2022 09:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lxpOFHZ5VDKHAJI2vsTT8u+ui6a8gWm7nxDyZF9i7Tg=;
 b=fn7/pQZcdYVZ6wRgtTgUD9JEiQcO7YRl9eLZk0AHN5HI+9cJ5Rp+xTzbHgzCnToq/u
 EualXW2z27EyTx0L0OdqtsFtA+cN0ZTY4uNBS9idgoLzb9+q8lG39SegMnvp8c3j2S2X
 fJAtcJ1AOXcxRilgeG2UoC1jzCcG5W0FPdHQQYwb3YR/ZrjK9NnG3Hhf78TCuVo/48sN
 CB2hvEHoQH1bT6Bn81Id3F+vDjyebULQhiM6ykl9Tr6El+N4tMrAq06n7RCF+JPYFB1G
 ebB8UQZAnEpehJVZFb5nDYyuJvdPNXQqoiaGxhBvuKD2n7qcfSE7Rh0Ml/0zjaQAoMMY
 RS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lxpOFHZ5VDKHAJI2vsTT8u+ui6a8gWm7nxDyZF9i7Tg=;
 b=4UQpxdmczGc0nULWyNq7EpbwISFSDrn7iQss8k09qNm63TpMN/uoDWYkPguCv1JPuL
 HHo86rSiO+RkfpYE4MgcDtmKSBSJyq1oylwxIRJKfBrYB9uzZeaDoOR8nrVmvhczcD8k
 kW0UoQLfalclY2XwYrFoPPhJNIdS8YGvr1uXABntdoA0gzwTJR7D/MfMJA7ZXr6XFxNv
 naEMG89FoL3IMTv47SrPmRHmqJgQ2K0p4/isSXdE9InTePYD/LEl05gDmoMRzneeJJ03
 Jd4x63b5mfk0glUsiuAgeoMZUTl9Ur0rXeFH+jgjo32z44e6ff700Onq2oswbxjweIHd
 rxyw==
X-Gm-Message-State: AOAM53203XsW/RwX8rgq/vvuxwYUt2i5HQWcgPERHhGrOsuciCUlLZ8S
 IX7a5zartOUrG3lqvN+0t14YpD5NOKk=
X-Google-Smtp-Source: ABdhPJzNvZUggrUwlSXBHVgyqPPFt0eAUg4S6MDnBORhmXFku2D96a0EazEUmHworC05XF43bIlhyg==
X-Received: by 2002:a5d:68c6:0:b0:20a:d654:6cae with SMTP id
 p6-20020a5d68c6000000b0020ad6546caemr10264629wrw.564.1652028343653; 
 Sun, 08 May 2022 09:45:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e20-20020adf9bd4000000b0020c61af5e1fsm9164407wrc.51.2022.05.08.09.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 09:45:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 18:43:32 +0200
Message-Id: <20220508164332.571101-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: fix CVE-2022-1304
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

An out-of-bounds read/write vulnerability was found in e2fsprogs 1.46.5.
This issue leads to a segmentation fault and possibly arbitrary code
execution via a specially crafted filesystem.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-sanity-check-to-extent-manipulation.patch | 59 +++++++++++++++++++
 package/e2fsprogs/e2fsprogs.mk                |  3 +
 2 files changed, 62 insertions(+)
 create mode 100644 package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch

diff --git a/package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch b/package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
new file mode 100644
index 0000000000..b5299a2a78
--- /dev/null
+++ b/package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
@@ -0,0 +1,59 @@
+From ab51d587bb9b229b1fade1afd02e1574c1ba5c76 Mon Sep 17 00:00:00 2001
+From: Lukas Czerner <lczerner@redhat.com>
+Date: Thu, 21 Apr 2022 19:31:48 +0200
+Subject: libext2fs: add sanity check to extent manipulation
+
+It is possible to have a corrupted extent tree in such a way that a leaf
+node contains zero extents in it. Currently if that happens and we try
+to traverse the tree we can end up accessing wrong data, or possibly
+even uninitialized memory. Make sure we don't do that.
+
+Additionally make sure that we have a sane number of bytes passed to
+memmove() in ext2fs_extent_delete().
+
+Note that e2fsck is currently unable to spot and fix such corruption in
+pass1.
+
+Signed-off-by: Lukas Czerner <lczerner@redhat.com>
+Reported-by: Nils Bars <nils_bars@t-online.de>
+Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=2068113
+Addresses: CVE-2022-1304
+Addresses-Debian-Bug: #1010263
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/ext2fs/extent.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/ext2fs/extent.c b/lib/ext2fs/extent.c
+index b324c7b0..1a206a16 100644
+--- a/lib/ext2fs/extent.c
++++ b/lib/ext2fs/extent.c
+@@ -495,6 +495,10 @@ retry:
+ 			ext2fs_le16_to_cpu(eh->eh_entries);
+ 		newpath->max_entries = ext2fs_le16_to_cpu(eh->eh_max);
+ 
++		/* Make sure there is at least one extent present */
++		if (newpath->left <= 0)
++			return EXT2_ET_EXTENT_NO_DOWN;
++
+ 		if (path->left > 0) {
+ 			ix++;
+ 			newpath->end_blk = ext2fs_le32_to_cpu(ix->ei_block);
+@@ -1630,6 +1634,10 @@ errcode_t ext2fs_extent_delete(ext2_extent_handle_t handle, int flags)
+ 
+ 	cp = path->curr;
+ 
++	/* Sanity check before memmove() */
++	if (path->left < 0)
++		return EXT2_ET_EXTENT_LEAF_BAD;
++
+ 	if (path->left) {
+ 		memmove(cp, cp + sizeof(struct ext3_extent_idx),
+ 			path->left * sizeof(struct ext3_extent_idx));
+-- 
+cgit 
+
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index cd70e3a034..39c9e07644 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -12,6 +12,9 @@ E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_CPE_ID_VENDOR = e2fsprogs_project
 E2FSPROGS_INSTALL_STAGING = YES
 
+# 0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
+E2FSPROGS_IGNORE_CVES += CVE-2022-1304
+
 # Use libblkid and libuuid from util-linux for host and target packages.
 # This prevents overriding them with e2fsprogs' ones, which may cause
 # problems for other packages.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
