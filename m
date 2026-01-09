Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A55D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A72AB83E54;
	Tue, 13 Jan 2026 19:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4L-Bj09ET2kY; Tue, 13 Jan 2026 19:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C251883E6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333267;
	bh=9pTAsZtF7rLiAMt1dlO7/jN9/51BrJS2kb77ITixrvo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Obx1E90SwjKwnqIobCuGL4+D8GPY/yA7vAMhNMcQ2GmKU3wTlLU5JdOi1fFiM1DI6
	 M8daVvJZScTrYmO8JohVONswPHSmY9e4pZHtgZnzV1TcDHV6rtogihSXuyzBnlVueq
	 OfxHk0JGIjXXaGdNIXgrO2J6iciq0KR2zApqpGYgacFVtlRYqIJzPnzAY05LSZnqXP
	 6RDpztuAdB3ZIemwvsl5yk5S8vXz1QKoDr6/j6bl5FV2Y/B130seCkb0MQQHJzFuqP
	 qXSFZgVz8qH/xNehtAh7HEVgydTHocJLw2lV78qrCbWccbjwyJD5Y/mvEKRei8RdDg
	 AJlzCcoJhxFVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C251883E6E;
	Tue, 13 Jan 2026 19:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 127EE1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E627482A72
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8xBB9nI4Scg for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6A182E9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B6A182E9C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 186B48256D; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:17:15 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c2ce12fabce9e9edac5d0c4a4d266eb62b6bb591
X-Git-Newrev: 30236c972dda5f94a34acc1a875a1c7076c91efe
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.186B48256D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/qt5/qt5webkit:
 add patch to fix missing <cstdint> include
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
Content-Type: multipart/mixed; boundary="===============2722048261460021174=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2722048261460021174==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=30236c972dda5f94a34acc1a875a1c7076c91efe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

It is not clear which change introduce this breakage, but we suspect
it is related to GCC 14.x. In any case, the fix does no harm and is
good to backport to 2025.02.x.

Fixes:

/home/thomas/buildroot/br/output-all/build/qt5webkit-5.212.0-alpha4/Source/ThirdParty/ANGLE/src/common/mathutil.h:575:8: error: ‘uint32_t’ does not name a type
  575 | inline uint32_t RotL(uint32_t x, int8_t r)
      |        ^~~~~~~~
/home/thomas/buildroot/br/output-all/build/qt5webkit-5.212.0-alpha4/Source/ThirdParty/ANGLE/src/common/mathutil.h:19:1: note: ‘uint32_t’ is defined in header ‘<cstdint>’; this is probably fixable by adding ‘#include <cstdint>’
   18 | #include <stdlib.h>
  +++ |+#include <cstdint>
   19 |

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d10726a1a1c60f934ef7022d188eb231ea174fb0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...dParty-ANGLE-src-common-mathutil.h-includ.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/qt5/qt5webkit/0012-Source-ThirdParty-ANGLE-src-common-mathutil.h-includ.patch b/package/qt5/qt5webkit/0012-Source-ThirdParty-ANGLE-src-common-mathutil.h-includ.patch
new file mode 100644
index 0000000000..e53024a4bd
--- /dev/null
+++ b/package/qt5/qt5webkit/0012-Source-ThirdParty-ANGLE-src-common-mathutil.h-includ.patch
@@ -0,0 +1,45 @@
+From 05c5aec722ebd750ec3404444f945154c266b62d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 28 Dec 2025 15:51:26 +0100
+Subject: [PATCH] Source/ThirdParty/ANGLE/src/common/mathutil.h: include
+ missing header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+/home/thomas/buildroot/br/output-all/build/qt5webkit-5.212.0-alpha4/Source/ThirdParty/ANGLE/src/common/mathutil.h:575:8: error: ‘uint32_t’ does not name a type
+  575 | inline uint32_t RotL(uint32_t x, int8_t r)
+      |        ^~~~~~~~
+/home/thomas/buildroot/br/output-all/build/qt5webkit-5.212.0-alpha4/Source/ThirdParty/ANGLE/src/common/mathutil.h:19:1: note: ‘uint32_t’ is defined in header ‘<cstdint>’; this is probably fixable by adding ‘#include <cstdint>’
+   18 | #include <stdlib.h>
+  +++ |+#include <cstdint>
+   19 |
+
+Taken from Fedora, also used on Arch Linux:
+
+  https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/qtwebkit-cstdint.patch
+  https://aur.archlinux.org/packages/qt5-webkit
+
+Upstream: dead, N/A
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Source/ThirdParty/ANGLE/src/common/mathutil.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/ThirdParty/ANGLE/src/common/mathutil.h b/Source/ThirdParty/ANGLE/src/common/mathutil.h
+index 7959da8bdcbc..c86afd61e103 100644
+--- a/Source/ThirdParty/ANGLE/src/common/mathutil.h
++++ b/Source/ThirdParty/ANGLE/src/common/mathutil.h
+@@ -16,6 +16,7 @@
+ #include <algorithm>
+ #include <string.h>
+ #include <stdlib.h>
++#include <cstdint>
+ 
+ namespace gl
+ {
+-- 
+2.52.0
+

--===============2722048261460021174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2722048261460021174==--
