Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91600C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 21:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C8C24EBBA;
	Tue, 23 Jan 2024 21:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8C24EBBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6EQh1vRvelNH; Tue, 23 Jan 2024 21:40:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E3D4EBC0;
	Tue, 23 Jan 2024 21:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E3D4EBC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1551BF362
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A785F60E3E
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A785F60E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OrAzGOptpUj0 for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 21:23:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDB016160D
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 21:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDB016160D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADBD78645B; Tue, 23 Jan 2024 21:23:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 22:22:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c7118cea4d9b780e1f6f838a70c5b8a0b96eaec
X-Git-Newrev: 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2
X-Patchwork-Hint: ignore
Message-Id: <20240123212355.ADBD78645B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: fix build failure with host
 gcc 13.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=04dfeff6242516a1061973fc7af2cc9c5e3dd4e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With gcc version >= 13.x stdint.h must be explicitly included according to
[0] so backport a commit to explicitly include stdint.h.

[0]: https://gcc.gnu.org/gcc-13/porting_to.html

Fixes:
still not happened

Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
