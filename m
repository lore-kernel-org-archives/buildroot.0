Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FACC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:07:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E28C460FA0
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E28C460FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA90060AE1;
	Wed,  4 Aug 2021 00:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDMzBcVR0Hv3; Wed,  4 Aug 2021 00:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF0BF60ADE;
	Wed,  4 Aug 2021 00:07:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 299D71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADFBC40E82
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjrE7KwEsZZi for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B05BA406AB
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 02F958827E; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 4 Jul 2021 16:17:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0f01b69885c43a0e48f3a6604793e4cd4a8da2e6
X-Git-Newrev: ae3700f5797396157a29e2ce42b27c93df3a4665
X-Patchwork-Hint: ignore
Message-Id: <20210803211000.02F958827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/blktrace: bump to
 version 1.3.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ae3700f5797396157a29e2ce42b27c93df3a4665
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Use tar.bz2 tarball
- Update indentation in hash file (two spaces)
- Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...vice-devno-use-PATH_MAX-to-avoid-overflow.patch | 146 ---------------------
 package/blktrace/blktrace.hash                     |   6 +-
 package/blktrace/blktrace.mk                       |   6 +-
 3 files changed, 5 insertions(+), 153 deletions(-)

diff --git a/package/blktrace/0001-btt-make-device-devno-use-PATH_MAX-to-avoid-overflow.patch b/package/blktrace/0001-btt-make-device-devno-use-PATH_MAX-to-avoid-overflow.patch
deleted file mode 100644
index 764410d472..0000000000
--- a/package/blktrace/0001-btt-make-device-devno-use-PATH_MAX-to-avoid-overflow.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From d61ff409cb4dda31386373d706ea0cfb1aaac5b7 Mon Sep 17 00:00:00 2001
-From: Jens Axboe <axboe@kernel.dk>
-Date: Wed, 2 May 2018 10:24:17 -0600
-Subject: btt: make device/devno use PATH_MAX to avoid overflow
-
-Herbo Zhang reports:
-
-I found a bug in blktrace/btt/devmap.c. The code is just as follows:
-
-https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git/tree/btt/devmap.c?id=8349ad2f2d19422a6241f94ea84d696b21de4757
-
-       struct devmap {
-
-struct list_head head;
-char device[32], devno[32];    // #1
-};
-
-LIST_HEAD(all_devmaps);
-
-static int dev_map_add(char *line)
-{
-struct devmap *dmp;
-
-if (strstr(line, "Device") != NULL)
-return 1;
-
-dmp = malloc(sizeof(struct devmap));
-if (sscanf(line, "%s %s", dmp->device, dmp->devno) != 2) {  //#2
-free(dmp);
-return 1;
-}
-
-list_add_tail(&dmp->head, &all_devmaps);
-return 0;
-}
-
-int dev_map_read(char *fname)
-{
-char line[256];   // #3
-FILE *fp = my_fopen(fname, "r");
-
-if (!fp) {
-perror(fname);
-return 1;
-}
-
-while (fscanf(fp, "%255[a-zA-Z0-9 :.,/_-]\n", line) == 1) {
-if (dev_map_add(line))
-break;
-}
-
-fclose(fp);
-return 0;
-}
-
- The line length is 256, but the dmp->device, dmp->devno  max length
-is only 32. We can put strings longer than 32 into dmp->device and
-dmp->devno , and then they will be overflowed.
-
- we can trigger this bug just as follows:
-
- $ python -c "print 'A'*256" > ./test
-    $ btt -M ./test
-
-    *** Error in btt': free(): invalid next size (fast): 0x000055ad7349b250 ***
-    ======= Backtrace: =========
-    /lib/x86_64-linux-gnu/libc.so.6(+0x777e5)[0x7f7f158ce7e5]
-    /lib/x86_64-linux-gnu/libc.so.6(+0x7fe0a)[0x7f7f158d6e0a]
-    /lib/x86_64-linux-gnu/libc.so.6(cfree+0x4c)[0x7f7f158da98c]
-    btt(+0x32e0)[0x55ad7306f2e0]
-    btt(+0x2c5f)[0x55ad7306ec5f]
-    btt(+0x251f)[0x55ad7306e51f]
-    /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf0)[0x7f7f15877830]
-    btt(+0x26b9)[0x55ad7306e6b9]
-    ======= Memory map: ========
-    55ad7306c000-55ad7307f000 r-xp 00000000 08:14 3698139
-      /usr/bin/btt
-    55ad7327e000-55ad7327f000 r--p 00012000 08:14 3698139
-      /usr/bin/btt
-    55ad7327f000-55ad73280000 rw-p 00013000 08:14 3698139
-      /usr/bin/btt
-    55ad73280000-55ad73285000 rw-p 00000000 00:00 0
-    55ad7349a000-55ad734bb000 rw-p 00000000 00:00 0
-      [heap]
-    7f7f10000000-7f7f10021000 rw-p 00000000 00:00 0
-    7f7f10021000-7f7f14000000 ---p 00000000 00:00 0
-    7f7f15640000-7f7f15656000 r-xp 00000000 08:14 14942237
-      /lib/x86_64-linux-gnu/libgcc_s.so.1
-    7f7f15656000-7f7f15855000 ---p 00016000 08:14 14942237
-      /lib/x86_64-linux-gnu/libgcc_s.so.1
-    7f7f15855000-7f7f15856000 r--p 00015000 08:14 14942237
-      /lib/x86_64-linux-gnu/libgcc_s.so.1
-    7f7f15856000-7f7f15857000 rw-p 00016000 08:14 14942237
-      /lib/x86_64-linux-gnu/libgcc_s.so.1
-    7f7f15857000-7f7f15a16000 r-xp 00000000 08:14 14948477
-      /lib/x86_64-linux-gnu/libc-2.23.so
-    7f7f15a16000-7f7f15c16000 ---p 001bf000 08:14 14948477
-      /lib/x86_64-linux-gnu/libc-2.23.so
-    7f7f15c16000-7f7f15c1a000 r--p 001bf000 08:14 14948477
-      /lib/x86_64-linux-gnu/libc-2.23.so
-    7f7f15c1a000-7f7f15c1c000 rw-p 001c3000 08:14 14948477
-      /lib/x86_64-linux-gnu/libc-2.23.so
-    7f7f15c1c000-7f7f15c20000 rw-p 00000000 00:00 0
-    7f7f15c20000-7f7f15c46000 r-xp 00000000 08:14 14948478
-      /lib/x86_64-linux-gnu/ld-2.23.so
-    7f7f15e16000-7f7f15e19000 rw-p 00000000 00:00 0
-    7f7f15e42000-7f7f15e45000 rw-p 00000000 00:00 0
-    7f7f15e45000-7f7f15e46000 r--p 00025000 08:14 14948478
-      /lib/x86_64-linux-gnu/ld-2.23.so
-    7f7f15e46000-7f7f15e47000 rw-p 00026000 08:14 14948478
-      /lib/x86_64-linux-gnu/ld-2.23.so
-    7f7f15e47000-7f7f15e48000 rw-p 00000000 00:00 0
-    7ffdebe5c000-7ffdebe7d000 rw-p 00000000 00:00 0
-      [stack]
-    7ffdebebc000-7ffdebebe000 r--p 00000000 00:00 0
-      [vvar]
-    7ffdebebe000-7ffdebec0000 r-xp 00000000 00:00 0
-      [vdso]
-    ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0
-      [vsyscall]
-    [1]    6272 abort      btt -M test
-
-Signed-off-by: Jens Axboe <axboe@kernel.dk>
-[Retrieved from:
-https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git/commit/?id=d61ff409cb4dda31386373d706ea0cfb1aaac5b7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- btt/devmap.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/btt/devmap.c b/btt/devmap.c
-index 0553a9e..5fc1cb2 100644
---- a/btt/devmap.c
-+++ b/btt/devmap.c
-@@ -23,7 +23,7 @@
- 
- struct devmap {
- 	struct list_head head;
--	char device[32], devno[32];
-+	char device[PATH_MAX], devno[PATH_MAX];
- };
- 
- LIST_HEAD(all_devmaps);
--- 
-cgit 1.2-0.3.lf.el7
-
diff --git a/package/blktrace/blktrace.hash b/package/blktrace/blktrace.hash
index d4f6218486..d279419c9e 100644
--- a/package/blktrace/blktrace.hash
+++ b/package/blktrace/blktrace.hash
@@ -1,6 +1,6 @@
 # From http://brick.kernel.dk/snaps/MD5SUMS
-md5	05abb873b4de96c5e7b2deba80695bf1	blktrace-1.2.0.tar.gz
+md5  aa9bc7d76870d8dae56aa816527e8e15  blktrace-1.3.0.tar.bz2
 
 # Locally computed
-sha256	d14029bc096026dacb206bf115c912dcdb795320b5aba6dff3e46d7f94c5242d	blktrace-1.2.0.tar.gz
-sha256	204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994	COPYING
+sha256  d6deda03862de2bd1b1b9fba729bbb862d9bca795e6aa7f7ca86b656811a70d6  blktrace-1.3.0.tar.bz2
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index 1a5f59bcce..d66a35227e 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -4,16 +4,14 @@
 #
 ################################################################################
 
-BLKTRACE_VERSION = 1.2.0
+BLKTRACE_VERSION = 1.3.0
+BLKTRACE_SOURCE = blktrace-$(BLKTRACE_VERSION).tar.bz2
 BLKTRACE_SITE = http://brick.kernel.dk/snaps
 BLKTRACE_DEPENDENCIES = libaio
 BLKTRACE_LICENSE = GPL-2.0+
 BLKTRACE_LICENSE_FILES = COPYING
 BLKTRACE_CPE_ID_VENDOR = blktrace_project
 
-# 0001-btt-make-device-devno-use-PATH_MAX-to-avoid-overflow.patch
-BLKTRACE_IGNORE_CVES += CVE-2018-10689
-
 define BLKTRACE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
