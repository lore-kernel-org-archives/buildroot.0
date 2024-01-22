Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA45C46CD2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 22:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99D2940133;
	Mon, 22 Jan 2024 22:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99D2940133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNvZrXDODCnV; Mon, 22 Jan 2024 22:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B689140279;
	Mon, 22 Jan 2024 22:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B689140279
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70FBF1BF853
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5734A60C15
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5734A60C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhFApa4U55fm for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 22:30:43 +0000 (UTC)
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 243D660BC6
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 22:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243D660BC6
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S2oQrP4UxJ99xS2oRrtYFd; Mon, 22 Jan 2024 23:30:39 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 23:30:37 +0100
Message-Id: <20240122223037.889955-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEUMbjmbR3ISgadnIBEqWqibOAq4QIVz2JjIwIBIdyUQRwuJm7HBw3WfUPlG65TRJr6EWJ6tnp6kWeRihB1ZaEIf8nJm9vjo32PnsZEHvVOSTw2H//tG
 ehvOVykSe49NlOo3gwx4WLuN3DxyFGm5MJ1KILge3lMOAwq6hXyKsmdXd+O6aCGXB+0b1FI4M576up2B9ocR55Bajal7EjfY3/dAk3G4ArvGCrjeN8Az8MJY
 Q8mux3gUVIa+or/Y0b8nvD2jSOPdh9BhJmHQPpeXoGQRZg3ZJi+tN90+339HmsyxbvGBhwZgRAFJiLRZz9GsCIiTscwMib13B2UtGdK9J0Tj6iMGfkSDxtvl
 o86Yp/omAXnbnrcUosl9lJCDH++lDyAPIr6Ot9JULFW76/e97nM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705962639; bh=hJeou/gKj5P/D2aQG/Ys6shN9I8cbTYrEkqdVODa6uY=;
 h=From:To:Subject:Date:MIME-Version;
 b=TP/ve+eUDgE+74v103RsU7hEUCk4C8PabbPvFRigkj2RWNJVA7RkHW7fi/QIY5KtP
 KRPtMBxe/KTU0Cxco5f0Olo3eTmDGUGueovgsqn0zHNPXQU3u+ZlRY5rJJiKB+MC6B
 ftaeWFaMXBH8Si7hwW3BM/0AUDPgbKvgB54Fl8q/b90Od7wSMQ65JqN4Tm5E7icKiu
 kCJppgffxfiXRNp7hn+7j+X8K5IiyugDumfSwZIciw9LP1eID1N5mjlt2uZM42ok2Y
 RqoCeLxYPO7r2/ISE4SiInl9m2bDDmZsw1Hf2fsC/e7IJzdCZRxOsT5vRu3WdyxKiD
 vfizfPshMHu7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TP/ve+eU
Subject: [Buildroot] [PATCH] package/uuu: fix build failure with host gcc
 13.x
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

With gcc version >= 13.x stdint.h must be explicitly included according to
[0] so add local patch to explicitly include stdint.h.

[0]: https://gcc.gnu.org/gcc-13/porting_to.html

Fixes:
still not happened

Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/uuu/0001-Fix-missing-references.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/uuu/0001-Fix-missing-references.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
