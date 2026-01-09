Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69C3D29DE7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD3E382D12;
	Tue, 13 Jan 2026 19:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTrIq4BD3hIC; Tue, 13 Jan 2026 19:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B0B383218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333004;
	bh=da8EvNSAVPigEn0GO+uaTnvRQPoL5tUts/RCYCGNfIE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cwDWU3HfoJY0dGsG5Wq6A9ih6h3+hbMMcM5YpChxvCKcUTkpes7k5LjVxwgQzMR4k
	 Ea/Kf+aIabiP+TwPzXV4TxlPq/4tmasyPwUaNSRlxDj1a48n9v/yHtDIB8S7k2XwG0
	 3N3w4imt5ojrsBUQHu8ULHjNWh9MBNJPEGDwmoacU96gZ2Efk5lf1ZvsQfyVPDd2y2
	 BdDoU8odqPRm9AjI/GqAOKpAMXgk76qxdv1uxQRCP7BKMqq+UNj27ZWqHt0EjVrBpm
	 UZjA5I8QBrPrW3lUDn6PVM3GVih1REOD/2WLPewQ8aWHN3HBjBETYcLSO3Y2G4jrDM
	 vXC1uaN1nXk9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0B383218;
	Tue, 13 Jan 2026 19:36:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06638231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6C9882CA5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58FGVXd1F3AZ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ABE282BED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ABE282BED
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48F4E8123D; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:17:12 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b33e415990ab4e119bd2938c18321dc2a6dc3e66
X-Git-Newrev: 3d13a6de73459a9b468f484ce04b97d50ccc8f00
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.48F4E8123D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt5/qt5webkit:
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
Content-Type: multipart/mixed; boundary="===============1791709970232252273=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1791709970232252273==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3d13a6de73459a9b468f484ce04b97d50ccc8f00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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

--===============1791709970232252273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1791709970232252273==--
