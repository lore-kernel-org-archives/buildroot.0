Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6F3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 23:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A42384DBA;
	Wed, 26 Jan 2022 23:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39VF7TLh3aFQ; Wed, 26 Jan 2022 23:00:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5F0C84DC1;
	Wed, 26 Jan 2022 23:00:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 132111BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 23:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C61A41B40
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 23:00:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2yoqZ2pnTajT for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 23:00:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8644541B3D
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 23:00:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s18so1518994wrv.7
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 15:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sHW3XojR6w39sImC0JIF4QfxE8f8Kom1platLN21Q/8=;
 b=FDW51NrAH8OGc3r7LU84wD7cHSzIPlVsfDkSxZliGRAx/YFl/HAAGfeNaRUD+NBtoC
 /FKyYg3/jSO7mp8/9dp6ETysXjnkdCuj6+fFZvxZOarrDW2Xnf1oo85QkxxG3TUs1gQa
 rTUMG4WXwtXiHvBkTBxDKBx6GNYsApgtTjYSCcNrrbKLTGrTLoeudl1rJJWpuxHOFWjK
 a+stW9ayU149oTVXc89R72UID6fSAt58w9X4Uu0qvtds6ocoS9/rI8UPLFqrxd0Uo9NU
 Ivf3dd9EQINHc5PXfMv9rRMwQntG09lJTnCP5GzMjkMm255hyzcHLEmkdbnkUg/nwgv4
 EgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sHW3XojR6w39sImC0JIF4QfxE8f8Kom1platLN21Q/8=;
 b=sKUlFAwxpeibiFJimc3cMCfp75UZtOcZCM7lc8lnD/9RwpbZSUvSHnlfhviDMCjYL4
 8pFiwwElNdddc1YoAOGkttGjvUfBev2gPcmZK4HHWIOZ+ynlLpJ9s8XjxDJcE/CNng3I
 awo+zbgPAAmIcmB+7uSXTl8EZT0K9lZJjuTtNW2MEe45pqKgkqwAN+7Mq/r9cgS/q/iw
 5IggNrucGKFd1179K7i56DRsp7zN++C6b9DCeClgAd5tPCeq99XBg2q5KH4JekSpUVur
 32rpTeR1SsFPIfRfur009xMnwIk8BEexVjm7PekNILjtqEPiLNNsEDe+bXaV9jOd2MDi
 NWsg==
X-Gm-Message-State: AOAM5320h+c1FyywcFRKzvk/Tj90Gd+Rw6CjN3fhgGOkydBeoJJkTar4
 QUepH1Ak/eLfLj9sbaOHjsF9j2KKQTuR4idR
X-Google-Smtp-Source: ABdhPJxadsX9set3YhOh+yOJ9zrV1s9kmuZ8UXFmQ6G68M6IhgclE9c21ztopz8j2S6X5nEhcIkaEQ==
X-Received: by 2002:a05:6000:1c01:: with SMTP id
 ba1mr681051wrb.28.1643238020747; 
 Wed, 26 Jan 2022 15:00:20 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id i11sm667924wry.102.2022.01.26.15.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 15:00:20 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 00:00:14 +0100
Message-Id: <20220126230014.15420-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20220121
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LTP now builds metadata directory as host target.
It's mandatory, therefore adding HOST_CFLAGS to make (adding to
configure does not work) to avoid adding -mlongcalls -mauto-litpools
for some targets (e.g. bootlin-xtensa-uclibc).

Drop patches from this release.

Refresh 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
(still safe to carry it).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...ysinfo.h-to-fix-build-with-MUSL-libc.patch | 45 ++++++--------
 .../0002-lib-fix-MemAvailable-parsing.patch   | 36 -----------
 ...-lapi-rtnetlink.h-Fix-include-guards.patch | 37 ------------
 ...f_addr.h-and-reuse-it-in-rtnetlink.h.patch | 58 ------------------
 ...0005-lapi-if_addr.h-Define-IFA_FLAGS.patch | 60 -------------------
 package/ltp-testsuite/ltp-testsuite.hash      |  6 +-
 package/ltp-testsuite/ltp-testsuite.mk        |  4 +-
 7 files changed, 23 insertions(+), 223 deletions(-)
 delete mode 100644 package/ltp-testsuite/0002-lib-fix-MemAvailable-parsing.patch
 delete mode 100644 package/ltp-testsuite/0003-lapi-rtnetlink.h-Fix-include-guards.patch
 delete mode 100644 package/ltp-testsuite/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
 delete mode 100644 package/ltp-testsuite/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch

diff --git a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
index a167d938e1..2ceba64ed5 100644
--- a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
+++ b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
@@ -1,4 +1,4 @@
-From bee452dfa2a34ba7df7db677e5673cbdcd23f61e Mon Sep 17 00:00:00 2001
+From f34c6ca3d543968e900d6327d8b5900db63f08ad Mon Sep 17 00:00:00 2001
 From: Petr Vorel <petr.vorel@gmail.com>
 Date: Thu, 1 Oct 2020 23:28:39 +0200
 Subject: [PATCH] lapi: Add sysinfo.h to fix build with MUSL libc
@@ -56,7 +56,7 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 
 diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h
 new file mode 100644
-index 000000000..d0e0e93d7
+index 0000000000..d0e0e93d7f
 --- /dev/null
 +++ b/include/lapi/sysinfo.h
 @@ -0,0 +1,22 @@
@@ -83,7 +83,7 @@ index 000000000..d0e0e93d7
 +
 +#endif /* SYSINFO_H__ */
 diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
-index d99441c86..0d26e9d45 100644
+index d99441c86f..0d26e9d455 100644
 --- a/include/tst_safe_macros.h
 +++ b/include/tst_safe_macros.h
 @@ -12,7 +12,7 @@
@@ -96,44 +96,33 @@ index d99441c86..0d26e9d45 100644
  #include <libgen.h>
  #include <signal.h>
 diff --git a/lib/safe_macros.c b/lib/safe_macros.c
-index a5b6bc504..20d01d304 100644
+index a5b6bc5047..87d922a928 100644
 --- a/lib/safe_macros.c
 +++ b/lib/safe_macros.c
-@@ -11,7 +11,6 @@
+@@ -11,7 +11,7 @@
  #include <sys/wait.h>
  #include <sys/mount.h>
  #include <sys/xattr.h>
 -#include <sys/sysinfo.h>
++#include "lapi/sysinfo.h"
  #include <errno.h>
  #include <fcntl.h>
  #include <libgen.h>
-@@ -23,6 +22,7 @@
- #include <malloc.h>
- #include "test.h"
- #include "safe_macros.h"
-+#include "lapi/sysinfo.h"
- 
- char *safe_basename(const char *file, const int lineno,
- 		    void (*cleanup_fn) (void), char *path)
 diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
-index 69077861f..ae1cad29b 100644
+index 4a49747613..000688f5a3 100644
 --- a/lib/tst_memutils.c
 +++ b/lib/tst_memutils.c
-@@ -5,11 +5,11 @@
- 
+@@ -6,7 +6,7 @@
+ #include <stdio.h>
  #include <unistd.h>
  #include <limits.h>
 -#include <sys/sysinfo.h>
++#include "lapi/sysinfo.h"
  #include <stdlib.h>
  
  #define TST_NO_DEFAULT_MAIN
- #include "tst_test.h"
-+#include "lapi/sysinfo.h"
- 
- #define BLOCKSIZE (16 * 1024 * 1024)
- 
 diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
-index 9676ea4b5..33b2ac822 100644
+index 20cb95191d..3462dc3f82 100644
 --- a/testcases/kernel/mem/mtest01/mtest01.c
 +++ b/testcases/kernel/mem/mtest01/mtest01.c
 @@ -20,7 +20,6 @@
@@ -153,7 +142,7 @@ index 9676ea4b5..33b2ac822 100644
  
  #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
 diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
-index 263b8e78b..4fa52e6ea 100644
+index 263b8e78bf..4fa52e6eae 100644
 --- a/testcases/kernel/syscalls/madvise/madvise06.c
 +++ b/testcases/kernel/syscalls/madvise/madvise06.c
 @@ -46,7 +46,7 @@
@@ -166,7 +155,7 @@ index 263b8e78b..4fa52e6ea 100644
  #include "tst_cgroup.h"
  
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
-index 2ea44a2be..a237345ef 100644
+index 2ea44a2beb..a237345ef7 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
 @@ -69,7 +69,7 @@
@@ -179,7 +168,7 @@ index 2ea44a2be..a237345ef 100644
  #include "test.h"
  
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
-index 7ad0e8bdc..61fa1ab75 100644
+index 7ad0e8bdcf..61fa1ab757 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo02.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
 @@ -65,7 +65,7 @@
@@ -192,7 +181,7 @@ index 7ad0e8bdc..61fa1ab75 100644
  
  #include "test.h"
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
-index af7cb6421..dc5ae65e3 100644
+index af7cb6421e..dc5ae65e35 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
 @@ -13,7 +13,7 @@
@@ -205,7 +194,7 @@ index af7cb6421..dc5ae65e3 100644
  #include "lapi/posix_clocks.h"
  #include "tst_test.h"
 diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
-index 22e7c3638..572701f9f 100644
+index 22e7c36386..572701f9fd 100644
 --- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
 +++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
 @@ -43,7 +43,7 @@
@@ -218,5 +207,5 @@ index 22e7c3638..572701f9f 100644
  
  #include "../testfrmw/testfrmw.h"
 -- 
-2.33.0
+2.34.1
 
diff --git a/package/ltp-testsuite/0002-lib-fix-MemAvailable-parsing.patch b/package/ltp-testsuite/0002-lib-fix-MemAvailable-parsing.patch
deleted file mode 100644
index 4a9a5b2363..0000000000
--- a/package/ltp-testsuite/0002-lib-fix-MemAvailable-parsing.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 29a096fe2bd356f419bd8a8404d5b652c996b92f Mon Sep 17 00:00:00 2001
-From: Ralph Siemsen <ralph.siemsen@linaro.org>
-Date: Mon, 27 Sep 2021 22:18:50 -0400
-Subject: [PATCH] lib: fix MemAvailable parsing
-
-The amount of available memory was not being returned correctly, which
-resulted in tests being executed when they should have been skipped.
-
-Fixes: 8759f4 ("lib: adjust the tmpfs size according to .dev_min_size and MemAvailable")
-Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
-Signed-off-by: Li Wang <liwang@redhat.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[ upstream status: e42149e28 ("lib: fix MemAvailable parsing") ]
----
- lib/tst_memutils.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
-index ae1cad29b..a46de78f5 100644
---- a/lib/tst_memutils.c
-+++ b/lib/tst_memutils.c
-@@ -65,9 +65,9 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
- 
- long long tst_available_mem(void)
- {
--	long long mem_available;
-+	unsigned long long mem_available = 0;
- 
--	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
-+	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %llu",
- 		&mem_available)) {
- 		mem_available = SAFE_READ_MEMINFO("MemFree:")
- 			+ SAFE_READ_MEMINFO("Cached:");
--- 
-2.33.0
-
diff --git a/package/ltp-testsuite/0003-lapi-rtnetlink.h-Fix-include-guards.patch b/package/ltp-testsuite/0003-lapi-rtnetlink.h-Fix-include-guards.patch
deleted file mode 100644
index 056c769feb..0000000000
--- a/package/ltp-testsuite/0003-lapi-rtnetlink.h-Fix-include-guards.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 881709d1e4d1bba5bf8ca365bc058f338bd72dc2 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Wed, 29 Sep 2021 19:38:42 +0200
-Subject: [PATCH] lapi/rtnetlink.h: Fix include guards
-
-Fixes: 5fea0638a ("lapi: Add missing IFA_FLAGS")
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[ upstream status: a2a212cf8 ("lapi/rtnetlink.h: Fix include guards") ]
----
- include/lapi/rtnetlink.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
-index 8a1b5385b..04e9ad51a 100644
---- a/include/lapi/rtnetlink.h
-+++ b/include/lapi/rtnetlink.h
-@@ -1,8 +1,8 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- /* Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com> */
- 
--#ifndef LAPI_IF_ADDR_H__
--# define LAPI_IF_ADDR_H__
-+#ifndef LAPI_RTNETLINK_H__
-+# define LAPI_RTNETLINK_H__
- 
- #include <linux/rtnetlink.h>
- 
-@@ -10,4 +10,4 @@
- # define IFA_FLAGS 8
- #endif
- 
--#endif	/* LAPI_IF_ADDR_H__ */
-+#endif	/* LAPI_RTNETLINK_H__ */
--- 
-2.33.0
-
diff --git a/package/ltp-testsuite/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch b/package/ltp-testsuite/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
deleted file mode 100644
index 4044636e63..0000000000
--- a/package/ltp-testsuite/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From b13440627bd4a9f060a33d400a47a40daa2bc12e Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Wed, 29 Sep 2021 19:37:19 +0200
-Subject: [PATCH] lapi: Create if_addr.h and reuse it in rtnetlink.h
-
-There will be fix in next commit for missing IFA_F_NOPREFIXROUTE which
-requires creating lapi/if_addr.h. Thus move IFA_FLAGS to lapi/if_addr.h,
-as it belongs there and reuse lapi/if_addr.h in lapi/rtnetlink.h just
-like <linux/rtnetlink.h> includes <linux/if_addr.h>.
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[ upstream status: https://lore.kernel.org/ltp/20210930183058.5240-3-petr.vorel@gmail.com/T/#u ]
----
- include/lapi/if_addr.h   | 16 ++++++++++++++++
- include/lapi/rtnetlink.h |  5 +----
- 2 files changed, 17 insertions(+), 4 deletions(-)
- create mode 100644 include/lapi/if_addr.h
-
-diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
-new file mode 100644
-index 000000000..4e50a0a4e
---- /dev/null
-+++ b/include/lapi/if_addr.h
-@@ -0,0 +1,16 @@
-+// SPDX-License-Identifier: GPL-2.0-or-later
-+/*
-+ * Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com>
-+ */
-+
-+#ifndef LAPI_IF_ADDR_H__
-+#define LAPI_IF_ADDR_H__
-+
-+#include <linux/if_addr.h>
-+
-+#ifndef IFA_FLAGS
-+# define IFA_FLAGS 8
-+#endif
-+
-+
-+#endif /* LAPI_IF_ADDR_H__ */
-diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
-index 04e9ad51a..089bf1a0d 100644
---- a/include/lapi/rtnetlink.h
-+++ b/include/lapi/rtnetlink.h
-@@ -5,9 +5,6 @@
- # define LAPI_RTNETLINK_H__
- 
- #include <linux/rtnetlink.h>
--
--#ifndef IFA_FLAGS
--# define IFA_FLAGS 8
--#endif
-+#include "lapi/if_addr.h"
- 
- #endif	/* LAPI_RTNETLINK_H__ */
--- 
-2.33.0
-
diff --git a/package/ltp-testsuite/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch b/package/ltp-testsuite/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
deleted file mode 100644
index b54e052992..0000000000
--- a/package/ltp-testsuite/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 9e357fb4fc00ab9c303e314b85b9ae3836141f81 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Wed, 29 Sep 2021 19:56:29 +0200
-Subject: [PATCH] lapi/if_addr.h: Define IFA_FLAGS
-
-and use it in icmp_rate_limit01.c.
-
-This fixes error on toolchains with very old kernel headers, e.g.
-Buildroot sourcery-arm:
-
-icmp_rate_limit01.c:82:3: error: 'IFA_F_NOPREFIXROUTE' undeclared (first use in this function)
-   IFA_F_NOPREFIXROUTE);
-
-Fixed because IFA_F_NOPREFIXROUTE was added in 3.14 and the oldest
-system we still support is Cent0S 7 with 3.10 kernel.
-
-NOTE: Cent0S 7 is obviously heavily patched thus it contains
-IFA_F_NOPREFIXROUTE and therefore CI build didn't catch this error.
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[ upstream status: https://lore.kernel.org/ltp/20210930183058.5240-4-petr.vorel@gmail.com/T/#u ]
----
- include/lapi/if_addr.h            | 3 +++
- testcases/cve/icmp_rate_limit01.c | 3 ++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
-index 4e50a0a4e..0f7e44784 100644
---- a/include/lapi/if_addr.h
-+++ b/include/lapi/if_addr.h
-@@ -12,5 +12,8 @@
- # define IFA_FLAGS 8
- #endif
- 
-+#ifndef IFA_F_NOPREFIXROUTE
-+# define IFA_F_NOPREFIXROUTE	0x200
-+#endif
- 
- #endif /* LAPI_IF_ADDR_H__ */
-diff --git a/testcases/cve/icmp_rate_limit01.c b/testcases/cve/icmp_rate_limit01.c
-index b3a237b30..3ada32675 100644
---- a/testcases/cve/icmp_rate_limit01.c
-+++ b/testcases/cve/icmp_rate_limit01.c
-@@ -27,11 +27,12 @@
- #include <sys/socket.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
--#include <linux/if_addr.h>
- #include <linux/errqueue.h>
- 
- #include <sched.h>
- #include <limits.h>
-+
-+#include "lapi/if_addr.h"
- #include "tst_test.h"
- #include "tst_netdevice.h"
- 
--- 
-2.33.0
-
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index a9f3cfdfe1..bd648cbfdd 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,5 +1,5 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20210927/ltp-full-20210927.tar.xz.sha1
-sha1 dad7737f609e358c4060cb446b9cae5c026fc137  ltp-full-20210927.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20220121/ltp-full-20220121.tar.xz.sha1
+sha1 211935e901afea1010ec4f70369b782fbee93ed4  ltp-full-20220121.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  779e9e5cc9af4f2b3d4cb32f5439ebd635504d2c4591bf900f0942dac290ed15  ltp-full-20210927.tar.xz
+sha256  ad002520616fac52362229ea0f1bb9d304fc03ff0096ccb5b1820cee9fc8413a  ltp-full-20220121.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index cc6d3c63b6..bc1497e940 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20210927
+LTP_TESTSUITE_VERSION = 20220121
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
@@ -70,6 +70,8 @@ LTP_TESTSUITE_CONF_ENV += \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
+LTP_TESTSUITE_MAKE_ENV += HOST_CFLAGS="$(HOST_CFLAGS)"
+
 # uclibc: bessel support normally not enabled
 LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_UCLIBC) += \
 	testcases/misc/math/float/bessel/ \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
