Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E6CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:43:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8D8A60E78
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8D8A60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C694401E5;
	Wed,  4 Aug 2021 00:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0yAVl8uKPhMC; Wed,  4 Aug 2021 00:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DF3C40624;
	Wed,  4 Aug 2021 00:43:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29BF81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D61A40F74
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-p6HDDn6_Qu for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C812E40F80
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 25F8783553; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f1775574b86635f96409cf76bed2f9b0e5d7fc7c
X-Git-Newrev: 5c788892102f0e22c9b5694facca0576b09f5ef4
X-Patchwork-Hint: ignore
Message-Id: <20210803211020.25F8783553@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fio: bump version to
 3.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c788892102f0e22c9b5694facca0576b09f5ef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patches which were applied upstream.

Upstream added optional support for libnfs:
https://git.kernel.dk/cgit/fio/commit/?id=9326926bef943245c244eb0e6129ae046a3719a9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-t-io_uring-don-t-use-rand48_r-variants.patch | 49 ----------------------
 ...002-Makefile-fix-build-of-io_uring-on-sh4.patch | 33 ---------------
 package/fio/fio.hash                               |  2 +-
 package/fio/fio.mk                                 |  6 ++-
 4 files changed, 6 insertions(+), 84 deletions(-)

diff --git a/package/fio/0001-t-io_uring-don-t-use-rand48_r-variants.patch b/package/fio/0001-t-io_uring-don-t-use-rand48_r-variants.patch
deleted file mode 100644
index 8d6830ac81..0000000000
--- a/package/fio/0001-t-io_uring-don-t-use-rand48_r-variants.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5e8865c0e08861558c1253c521dc9098d0c773ee Mon Sep 17 00:00:00 2001
-From: Jens Axboe <axboe@kernel.dk>
-Date: Mon, 16 Mar 2020 08:30:36 -0600
-Subject: [PATCH] t/io_uring: don't use *rand48_r() variants
-
-Not available on all platforms.
-
-Signed-off-by: Jens Axboe <axboe@kernel.dk>
-
-[Patch from upstream
-https://github.com/axboe/fio/commit/5e8865c0e08861558c1253c521dc9098d0c773ee]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- t/io_uring.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/t/io_uring.c b/t/io_uring.c
-index e84a2b6b..d48db1e9 100644
---- a/t/io_uring.c
-+++ b/t/io_uring.c
-@@ -63,7 +63,6 @@ struct file {
- struct submitter {
- 	pthread_t thread;
- 	int ring_fd;
--	struct drand48_data rand;
- 	struct io_sq_ring sq_ring;
- 	struct io_uring_sqe *sqes;
- 	struct io_cq_ring cq_ring;
-@@ -170,7 +169,7 @@ static void init_io(struct submitter *s, unsigned index)
- 	}
- 	f->pending_ios++;
- 
--	lrand48_r(&s->rand, &r);
-+	r = lrand48();
- 	offset = (r % (f->max_blocks - 1)) * BS;
- 
- 	if (register_files) {
-@@ -286,7 +285,7 @@ static void *submitter_fn(void *data)
- 
- 	printf("submitter=%d\n", gettid());
- 
--	srand48_r(pthread_self(), &s->rand);
-+	srand48(pthread_self());
- 
- 	prepped = 0;
- 	do {
--- 
-2.20.1
-
diff --git a/package/fio/0002-Makefile-fix-build-of-io_uring-on-sh4.patch b/package/fio/0002-Makefile-fix-build-of-io_uring-on-sh4.patch
deleted file mode 100644
index 69bda93d37..0000000000
--- a/package/fio/0002-Makefile-fix-build-of-io_uring-on-sh4.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e1985f9097f37748efdc29239eb3fb6a00b12f27 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 23 May 2020 19:07:40 +0200
-Subject: [PATCH] Makefile: fix build of io_uring on sh4
-
-SuperH compile currently fails with:
-
-/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/8.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: t/io_uring.o: in function `submitter_fn':
-/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/fio-3.19/t/io_uring.c:131: undefined reference to `arch_flags'
-/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/8.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/fio-3.19/t/io_uring.c:367: undefined reference to `arch_flags'
-collect2: error: ld returned 1 exit status
-
-Fix that by ensuring we have a stub arch.o with the necessary arch flags
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/axboe/fio/commit/e1985f9097f37748efdc29239eb3fb6a00b12f27]
----
- Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile b/Makefile
-index f1e984f5f..e39621954 100644
---- a/Makefile
-+++ b/Makefile
-@@ -283,6 +283,7 @@ T_PIPE_ASYNC_OBJS = t/read-to-pipe-async.o
- T_PIPE_ASYNC_PROGS = t/read-to-pipe-async
- 
- T_IOU_RING_OBJS = t/io_uring.o
-+T_IOU_RING_OBJS += t/arch.o
- T_IOU_RING_PROGS = t/io_uring
- 
- T_MEMLOCK_OBJS = t/memlock.o
diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index d95deb20b0..88319e4cc0 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  a2f885834900f554127718716338914791f5d72800b6f9e3edf173b94b5a2e4e  fio-3.19.tar.gz
+sha256  da9826f07a003656ea070d359c90f752db8c3216ced9ff865242eed1a1db93bc  fio-3.27.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 3ddd74eda4..12e2b2ab7c 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.19
+FIO_VERSION = 3.27
 FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
@@ -13,6 +13,10 @@ ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNFS),y)
+FIO_DEPENDENCIES += libnfs
+endif
+
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 FIO_DEPENDENCIES += numactl
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
