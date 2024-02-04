Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80D3C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 22:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53ECD405F5;
	Sun,  4 Feb 2024 22:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53ECD405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e28FyixZUGjA; Sun,  4 Feb 2024 22:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FFF9405A9;
	Sun,  4 Feb 2024 22:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FFF9405A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9291BF3A8
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9E5F4055F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9E5F4055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7C27ZUpO1W_k for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 22:33:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA707405F5
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 22:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA707405F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E9D18695A; Sun,  4 Feb 2024 22:33:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:35:35 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 892d471112cc8eef69fcd62653fbe51c775ee390
X-Git-Newrev: c423dd4a45b4a9d2b4d8c9a186fcdb1961ddf5cc
X-Patchwork-Hint: ignore
Message-Id: <20240204223330.8E9D18695A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/uuu: fix build
 failure with host gcc 13.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=c423dd4a45b4a9d2b4d8c9a186fcdb1961ddf5cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

With gcc version >= 13.x stdint.h must be explicitly included according to
[0] so backport a commit to explicitly include stdint.h.

[0]: https://gcc.gnu.org/gcc-13/porting_to.html

Fixes:
still not happened

Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uuu/0001-Fix-missing-references.patch | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/uuu/0001-Fix-missing-references.patch b/package/uuu/0001-Fix-missing-references.patch
new file mode 100644
index 0000000000..140c9755c7
--- /dev/null
+++ b/package/uuu/0001-Fix-missing-references.patch
@@ -0,0 +1,40 @@
+From 24fd043225903247f71ac10666d820277c0b10b1 Mon Sep 17 00:00:00 2001
+From: nixgnauhcuy <nixgnauhcuy@gmail.com>
+Date: Tue, 9 May 2023 14:32:33 +0800
+Subject: [PATCH] Fix missing references
+
+Upstream: https://github.com/nxp-imx/mfgtools/commit/24fd043225903247f71ac10666d820277c0b10b1
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ libuuu/libcomm.h | 1 +
+ uuu/buildincmd.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libuuu/libcomm.h b/libuuu/libcomm.h
+index 0afdfa3..38d622d 100644
+--- a/libuuu/libcomm.h
++++ b/libuuu/libcomm.h
+@@ -28,6 +28,7 @@
+ * POSSIBILITY OF SUCH DAMAGE.
+ *
+ */
++#include <stdint.h>
+ #include <string>
+ #include <stdarg.h>
+ #include <locale>
+diff --git a/uuu/buildincmd.h b/uuu/buildincmd.h
+index 9415117..46286cc 100644
+--- a/uuu/buildincmd.h
++++ b/uuu/buildincmd.h
+@@ -31,6 +31,7 @@
+ 
+ #pragma once
+ 
++#include <stdint.h>
+ #include <map>
+ #include <string>
+ #include <vector>
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
