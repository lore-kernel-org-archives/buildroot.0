Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99761D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3A984004;
	Tue, 13 Jan 2026 19:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRAa8wtFxWKI; Tue, 13 Jan 2026 19:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E5EF84005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333316;
	bh=xp4fnecgbQhn53/dfHebN4d/9UZCbIbeYutY2DBNBIo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bSGIH8VCVhnnAdYYCBlsLGjOF98WA4HFIE27nNh9Y7WRvuC+vZmq82yq1h9dATSdx
	 893WCW3o2JxG48fFadZ3mOXTgrUe7AcQSvYRzNs2eUiM0+YyNDhehGsZYA5yGt0ndt
	 b85PW66TSLC8EVIW7akV8Lkh+ukMkn4lYf+8UxVKaRoZ0A0y8f2JwesSmuPIeJuyKs
	 aVQCCAp8bR93Q/pCjH2VBaTrHeMSYTZN54jXDw3c3jQxx8OiegE7/4Gb/Hlq/AjKem
	 ASICeKQX9yutMb+/E3SrLK1PBtUCYZIugVFby6favLqiotnhP2dpsLD3u0BQQgOaRz
	 St4jJC135ZIHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E5EF84005;
	Tue, 13 Jan 2026 19:41:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 153A22CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A869406DF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6waaWCkeERS for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E926D406DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E926D406DB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E776D86A2D; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:13:43 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 7244ac044279407ca4488f688fb325ddf74d1945
X-Git-Newrev: 3c7ed8125d42178132383cb18b2051a4f762d190
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.E776D86A2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/ledmon: update
 patch to fix musl build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c7ed8125d42178132383cb18b2051a4f762d190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated patch following an upstream review:
https://github.com/md-raid-utilities/ledmon/pull/272#issuecomment-3596495739

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b4668eded3d8087600f3aa67c2d354edfa7ce97e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Include-libgen.h-to-fix-musl-builds.patch | 100 ---------------------
 ...rovide-basename-if-GLIBC-is-not-avialable.patch |  42 +++++++++
 2 files changed, 42 insertions(+), 100 deletions(-)

diff --git a/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch b/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
deleted file mode 100644
index 713aaee020..0000000000
--- a/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 95adecd3cc8e94f9964c34fdf0354c209acce166 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Thu, 27 Nov 2025 21:17:22 +0100
-Subject: [PATCH] Include libgen.h to fix musl builds
-
-Fixes various build errors like
-
-block.c: In function 'block_set_devnode':
-block.c:226:22: error: implicit declaration of function 'basename'
- [-Wimplicit-function-declaration]
-  226 |         char *name = basename(device->sysfs_path);
-
-Upstream: https://github.com/md-raid-utilities/ledmon/pull/272
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: backported upstream PR to v1.1.0]
----
- src/ledctl/ledctl.c | 1 +
- src/ledmon/ledmon.c | 1 +
- src/lib/block.c     | 1 +
- src/lib/npem.c      | 1 +
- src/lib/slot.c      | 1 +
- src/lib/vmdssd.c    | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/src/ledctl/ledctl.c b/src/ledctl/ledctl.c
-index 30adc74..af2ea1b 100644
---- a/src/ledctl/ledctl.c
-+++ b/src/ledctl/ledctl.c
-@@ -5,6 +5,7 @@
- #include <ctype.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- #include <linux/limits.h>
- #include <inttypes.h>
- #include <limits.h>
-diff --git a/src/ledmon/ledmon.c b/src/ledmon/ledmon.c
-index 37ef69a..4644492 100644
---- a/src/ledmon/ledmon.c
-+++ b/src/ledmon/ledmon.c
-@@ -5,6 +5,7 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <getopt.h>
-+#include <libgen.h>
- #include <limits.h>
- #include <signal.h>
- #include <stdint.h>
-diff --git a/src/lib/block.c b/src/lib/block.c
-index 23dc34f..afa7d57 100644
---- a/src/lib/block.c
-+++ b/src/lib/block.c
-@@ -3,6 +3,7 @@
- 
- #include <dirent.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <limits.h>
- #include <stdint.h>
- #include <stdio.h>
-diff --git a/src/lib/npem.c b/src/lib/npem.c
-index bdceee3..f980ba8 100644
---- a/src/lib/npem.c
-+++ b/src/lib/npem.c
-@@ -2,6 +2,7 @@
- // Copyright (C) 2022 Intel Corporation.
- 
- #include <errno.h>
-+#include <libgen.h>
- #include <stdio.h>
- #include <string.h>
- #include <pci/pci.h>
-diff --git a/src/lib/slot.c b/src/lib/slot.c
-index 1044ddf..68e3009 100644
---- a/src/lib/slot.c
-+++ b/src/lib/slot.c
-@@ -1,6 +1,7 @@
- // SPDX-License-Identifier: LGPL-2.1-or-later
- // Copyright (C) 2023 Intel Corporation.
- 
-+#include <libgen.h>
- #include <stdio.h>
- #include <string.h>
- 
-diff --git a/src/lib/vmdssd.c b/src/lib/vmdssd.c
-index 8a6e846..0270a7d 100644
---- a/src/lib/vmdssd.c
-+++ b/src/lib/vmdssd.c
-@@ -2,6 +2,7 @@
- // Copyright (C) 2022 Intel Corporation.
- 
- #include <errno.h>
-+#include <libgen.h>
- #include <limits.h>
- #include <stdlib.h>
- #include <stdint.h>
--- 
-2.47.3
-
diff --git a/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch b/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch
new file mode 100644
index 0000000000..a205f41b6f
--- /dev/null
+++ b/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch
@@ -0,0 +1,42 @@
+From 4c0477bdaef56314eb4df4a432be54cc49238be0 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 1 Dec 2025 19:07:42 +0100
+Subject: [PATCH] libled: provide basename if GLIBC is not avialable
+
+If GNU basename is not avilable, define it. It is safer to use that
+rather than include libgen.h with XPG basename() definition.
+
+Suggested in
+https://github.com/md-raid-utilities/ledmon/pull/272#issuecomment-3596495739
+
+Code copied from
+https://github.com/md-raid-utilities/mdadm/commit/9dbd11e091f84eb0bf9d717283774816c4c4453d
+
+Upstream: https://github.com/md-raid-utilities/ledmon/pull/272
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/libled_internal.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/lib/libled_internal.h b/src/lib/libled_internal.h
+index 2355d30..2061fc2 100644
+--- a/src/lib/libled_internal.h
++++ b/src/lib/libled_internal.h
+@@ -70,4 +70,13 @@ led_status_t device_exclude_pattern_add(struct led_ctx *ctx, const char *path);
+  */
+ void lib_log(struct led_ctx *ctx, enum led_log_level_enum loglevel, const char *buf, ...)
+ 				__attribute__ ((format (printf, 3, 4)));
++
++/*
++ * Ensure GNU basename behavior on GLIBC less systems.
++ */
++#ifndef __GLIBC__
++#define basename(path) \
++       (strrchr((path), '/') ? strrchr((path),'/') + 1 : (path))
++#endif
++
+ #endif
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
