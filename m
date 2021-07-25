Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7001CC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C682E60E77
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C682E60E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A5A76070E;
	Sun, 25 Jul 2021 21:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAA2YefqBMVW; Sun, 25 Jul 2021 21:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAFE66069D;
	Sun, 25 Jul 2021 21:08:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B84631BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A71F2831F5
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ghmSEQ4pFiM for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:08:03 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id E17E78308A
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:08:02 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7lF1m0hOrnxSq7lF1mlwYG; Sun, 25 Jul 2021 23:00:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627246855; bh=FVoN+IEZgYS3PsDmlBxh3RNSNi4n3CGb0IGRHPi7LAk=;
 h=From:To:Subject:Date:MIME-Version;
 b=XSIs4rUgCoy2xVyrVbikxeFxNohAWjxJdhGsmeUKho7mVr+XLi5kEe+MJ+pquTelP
 QkxXJiuXeGSqcoreS4IA9crZdveTN9Ti1X/lwtVb9I4ks9owtI69s1nccEQ9sSwWRs
 Kr7ajrpEtvPsjzNMQLfIyFYkz8foe14BQhnVyxLmxaEG5TkZhSBNfTWzQhvcQg0VKq
 mOLhTpoDGGEmFMzgrJhbhxLpv4TxnNZq9REIa3QUarJLb0oCkDByDpUbcsS1hi2KSv
 /yUOddMbFBZ6wWZtiwdGxWG+O79lbgChwHQpIQW7yrV/bXMPgfcabe/BUqWStmQ+7v
 TzCclgOGGl7ZQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:00:54 +0200
Message-Id: <20210725210054.1534823-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH2h+br8mtkT489bMLN9NfblZw10RyscAvQj3Fr1LvvHIAeEXghQtE3VtbKcNKrUxWNIZqL/U2p19j5NjNkNzx987oDM3YZO/XvPexVvfrYj/pUJf88J
 JvB00BlqvEvG7aTq3MmATlfgOgYn+RPprW+fUBjkSdLrn3XOVJLp+nPVgpuFB9nkj/moK0TJfuQZ6xoh4SPc02FUzmlAeEFkdKADvLKLGT5Vbc4Ss9j5Qn0G
 l8k2tsUrDjqWJSODtoVk6WnyiC5rqHDMIK5PHon/+NUOvdc3o/V5H+eYoc2bJ+Nq
Subject: [Buildroot] [PATCH] package/nfs-utils: fix printfs format build
 failure on 64-bits platforms
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add 2 pending upstream patches that have been pointed to nfs-utils
maintainer to be committed soon. They both fix the build failure on 64-bits
where time_t is assumed to be a long long when passed to printf("%ld"), but
that is not always true, so in these patches the author(Petr) uses PRIu64
tag.

Fixes:
http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
---
 ...nfsdcltrack-sqlite-Fix-printf-format.patch | 51 +++++++++++++++++++
 ...rack-nfsdcltrack.c-Fix-printf-format.patch | 47 +++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch
 create mode 100644 package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch

diff --git a/package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch b/package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch
new file mode 100644
index 0000000000..85ca33a4fd
--- /dev/null
+++ b/package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch
@@ -0,0 +1,51 @@
+From d05ba5335e869bcd68c0def795c55fd5037914e3 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel () gmail ! com>
+Date: Thu, 22 Jul 2021 16:15:44 +0000
+Subject: [PATCH] nfsdcltrack/sqlite: Fix printf format
+
+sqlite.c: In function 'sqlite_remove_unreclaimed':
+sqlite.c:547:71: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'time_t' {aka 'long long int'} [-Werror=format=]
+  547 |  ret = snprintf(buf, sizeof(buf), "DELETE FROM clients WHERE time < %ld",
+      |                                                                     ~~^
+      |                                                                       |
+      |                                                                       long int
+      |                                                                     %lld
+  548 |    grace_start);
+      |    ~~~~~~~~~~~
+      |    |
+      |    time_t {aka long long int}
+
+Found in Buildroot riscv32 build.
+
+Link: http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/build-end.log
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ utils/nfsdcltrack/sqlite.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/utils/nfsdcltrack/sqlite.c b/utils/nfsdcltrack/sqlite.c
+index f79aebb3..cea4a411 100644
+--- a/utils/nfsdcltrack/sqlite.c
++++ b/utils/nfsdcltrack/sqlite.c
+@@ -46,6 +46,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <fcntl.h>
++#include <inttypes.h>
+ #include <unistd.h>
+ #include <sqlite3.h>
+ #include <linux/limits.h>
+@@ -544,7 +545,7 @@ sqlite_remove_unreclaimed(time_t grace_start)
+ 	int ret;
+ 	char *err = NULL;
+ 
+-	ret = snprintf(buf, sizeof(buf), "DELETE FROM clients WHERE time < %ld",
++	ret = snprintf(buf, sizeof(buf), "DELETE FROM clients WHERE time < %"PRIu64,
+ 			grace_start);
+ 	if (ret < 0) {
+ 		return ret;
+-- 
+2.25.1
+
diff --git a/package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch b/package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch
new file mode 100644
index 0000000000..acfc6ed71f
--- /dev/null
+++ b/package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch
@@ -0,0 +1,47 @@
+From 14eb2cae4fca95609ae4efde2444fd0a5ddfca04 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel () gmail ! com>
+Date: Thu, 22 Jul 2021 16:15:45 +0000
+Subject: [PATCH] nfsdcltrack/nfsdcltrack.c: Fix printf format
+
+nfsdcltrack.c: In function 'cltrack_gracedone':
+nfsdcltrack.c:528:47: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'time_t' {aka 'long long int'} [-Werror=format=]
+  528 |  xlog(D_GENERAL, "%s: grace done. gracetime=%ld", __func__, gracetime);
+      |                                             ~~^             ~~~~~~~~~
+      |                                               |             |
+      |                                               long int      time_t {aka long long int}
+      |                                             %lld
+
+Found in Buildroot riscv32 build.
+
+Link: http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/build-end.log
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ utils/nfsdcltrack/nfsdcltrack.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/utils/nfsdcltrack/nfsdcltrack.c b/utils/nfsdcltrack/nfsdcltrack.c
+index e926f1c0..0b37c094 100644
+--- a/utils/nfsdcltrack/nfsdcltrack.c
++++ b/utils/nfsdcltrack/nfsdcltrack.c
+@@ -33,6 +33,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <fcntl.h>
++#include <inttypes.h>
+ #include <unistd.h>
+ #include <libgen.h>
+ #include <sys/inotify.h>
+@@ -525,7 +526,7 @@ cltrack_gracedone(const char *timestr)
+ 	if (*tail)
+ 		return -EINVAL;
+ 
+-	xlog(D_GENERAL, "%s: grace done. gracetime=%ld", __func__, gracetime);
++	xlog(D_GENERAL, "%s: grace done. gracetime=%"PRIu64, __func__, gracetime);
+ 
+ 	ret = sqlite_remove_unreclaimed(gracetime);
+ 
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
