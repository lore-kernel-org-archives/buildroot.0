Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767F4CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 399214129E;
	Tue, 16 Sep 2025 20:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7fuvgOJjF9a; Tue, 16 Sep 2025 20:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 567F44129F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 567F44129F;
	Tue, 16 Sep 2025 20:44:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 328C912D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C9FE400F9
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTqRGk-P5tQ3 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56FC2404FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56FC2404FF
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5267484C9B; Tue, 16 Sep 2025 20:44:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:42:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89882782411608e1fc8f9072324a4276b9b4699e
X-Git-Newrev: 6615c1bed8224a5f1018989b2ab10d38496d0e46
X-Patchwork-Hint: ignore
Message-Id: <20250916204447.5267484C9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apitrace: remove stale patch
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6615c1bed8224a5f1018989b2ab10d38496d0e46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Running the command:

    make apitrace-patch

fails with error:

    Applying 0003-Explicit-header-stdint.patch using patch:
    patching file frametrim/ft_dependecyobject.hpp
    Reversed (or previously applied) patch detected!  Skipping patch.
    1 out of 1 hunk ignored -- saving rejects to file frametrim/ft_dependecyobject.hpp.rej
    patching file retrace/metric_writer.cpp
    Reversed (or previously applied) patch detected!  Skipping patch.
    1 out of 1 hunk ignored -- saving rejects to file retrace/metric_writer.cpp.rej

Commit [1] "package/apitrace: fix build with GCC 15.x" introduced a
package patch in the branch master while Buildroot was in RC cycle.
This same commit was cherry-picked in [2] in the branch "next" to also
apply cleanly the patch for commit [3] "package/apitrace: bump to
version 13".

The merge commit [4] kept the apitrace package patch
"0003-Explicit-header-stdint.patch".

This commit fixes the issue by removing this stale patch.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a4b0913280b95b62cd74fdc5ff0b25e3afa2c529
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/bf55f4713e1ba877183b9e31469df5d3823ec4c0
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/aec2f2ddc44d037ad21c9a061475459dd9f3d3a1
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/0af159ae2b0363a90b8c5432cd4cb9bfd3476c5a

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apitrace/0003-Explicit-header-stdint.patch | 42 ----------------------
 1 file changed, 42 deletions(-)

diff --git a/package/apitrace/0003-Explicit-header-stdint.patch b/package/apitrace/0003-Explicit-header-stdint.patch
deleted file mode 100644
index efd7522314..0000000000
--- a/package/apitrace/0003-Explicit-header-stdint.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3cc8956995d6d702a2c3ef0d7f91500c6accbfad Mon Sep 17 00:00:00 2001
-From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
-Date: Fri, 21 Mar 2025 05:02:23 +0000
-Subject: [PATCH] Explicit header: stdint
-
-Fix building with GCC-15. It no longer includes it by default.
-
-Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
-Upstream: 952bad1469ea747012bdc48c48993bd5f13eec04
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- frametrim/ft_dependecyobject.hpp | 1 +
- retrace/metric_writer.cpp        | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/frametrim/ft_dependecyobject.hpp b/frametrim/ft_dependecyobject.hpp
-index cf1885f1..53b910d0 100644
---- a/frametrim/ft_dependecyobject.hpp
-+++ b/frametrim/ft_dependecyobject.hpp
-@@ -28,6 +28,7 @@
- #pragma once
- 
- #include "ft_tracecall.hpp"
-+#include <stdint.h>
- 
- namespace frametrim {
- 
-diff --git a/retrace/metric_writer.cpp b/retrace/metric_writer.cpp
-index e923ed1d..4e4ce748 100644
---- a/retrace/metric_writer.cpp
-+++ b/retrace/metric_writer.cpp
-@@ -24,6 +24,7 @@
-  **************************************************************************/
- 
- #include <iostream>
-+#include <stdint.h>
- 
- #include "metric_writer.hpp"
- 
--- 
-2.50.1
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
