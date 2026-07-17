Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E50C44524
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051B340A2F;
	Fri, 17 Jul 2026 15:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMXUwxLq6eCp; Fri, 17 Jul 2026 15:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9E940B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303170;
	bh=zySqf8vAXc5UQ8d+Td2n6KSQJ1BjJHplpDNlRSYHdj0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hj3xMCfxTqAhcKTPGvSJVr4ODoa0mEdYptNMyhQexUGOV1iLaN/g7knpZMymhyL7o
	 IoajQ06Buh8KH/dzk0JhzUX2dB48ApLCleBhrIHyULcLlJzzwBBACvXOiNF8ww7qGU
	 0oeKsL8jFCQ8t3KFU82b26KZB/VZqU33I5hyKpaSN5yf4XHOeR1b5eEyEjOzZm5Hel
	 Xo81gTXdw0uyfzrRSqKY5bOpav79wLeyJ8HrHJnZUZbCqVXmpOocyPgGIu1M5RMd28
	 BHiEPx7xaOH6yu+hO+wn5Ee8/VKNAVmSBwM4XZcb3eW6EJiS8WLS66UCGkZ7fWLZBY
	 V8iC2h68+V5Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE9E940B00;
	Fri, 17 Jul 2026 15:46:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9603536E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9395C40626
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njeuTCIN-3As for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 396E640A51
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 396E640A51
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0665288E52; Fri, 17 Jul 2026 15:45:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:09:31 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 264695881dcd5ae963fac8ce41ea912a8b9abf42
X-Git-Newrev: 9531c823cdd52854d9ea803691577cb0869d6304
X-Patchwork-Hint: ignore
Message-Id: <20260717154511.0665288E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/igt-gpu-tools:
 fix musl build
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
Content-Type: multipart/mixed; boundary="===============1533219402713343766=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1533219402713343766==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9531c823cdd52854d9ea803691577cb0869d6304
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Buildroot commit f9a91bf60e35617157b950eea05fc6f6144d650c bumped the
package to version 2.3 that includes upstream commit
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/6a8b33e353627187f1b530f33c4bd3f5282883f0
which makes use of PATH_MAX causing build errors on musl.

Fixes:
https://autobuild.buildroot.net/results/42a/42a6e9d9652c1eb97c8c49aed75d210bf2afc066/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 781d14e63a838d7b90c4fe75f091bebf1d5d58a6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ..._gpu_frequency-include-limits.h-to-fix-mu.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/igt-gpu-tools/0001-tools-intel_gpu_frequency-include-limits.h-to-fix-mu.patch b/package/igt-gpu-tools/0001-tools-intel_gpu_frequency-include-limits.h-to-fix-mu.patch
new file mode 100644
index 0000000000..1d818dcc22
--- /dev/null
+++ b/package/igt-gpu-tools/0001-tools-intel_gpu_frequency-include-limits.h-to-fix-mu.patch
@@ -0,0 +1,36 @@
+From 48a177958a9ecff8f7cee379affb2f35984b58a9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 10 Jul 2026 20:34:01 +0200
+Subject: [PATCH] tools/intel_gpu_frequency: include limits.h to fix musl build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build error seen with musl-based toolchains:
+
+../tools/intel_gpu_frequency.c:90:19: error:
+ ‘PATH_MAX’ undeclared (first use in this function)
+   90 |         char path[PATH_MAX];
+
+Upstream: https://patchwork.freedesktop.org/patch/739159/?series=170207&rev=1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ tools/intel_gpu_frequency.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
+index 6316c2e58..7df7f331d 100644
+--- a/tools/intel_gpu_frequency.c
++++ b/tools/intel_gpu_frequency.c
+@@ -25,6 +25,7 @@
+ #include <dirent.h>
+ #include <fcntl.h>
+ #include <getopt.h>
++#include <limits.h>
+ #include <stdio.h>
+ #include <time.h>
+ #include <unistd.h>
+-- 
+2.47.3
+

--===============1533219402713343766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1533219402713343766==--
