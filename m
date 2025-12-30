Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A29EEE01F6
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C059A60A82;
	Tue, 30 Dec 2025 21:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdE_yCMKKY_k; Tue, 30 Dec 2025 21:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EFB660BB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767128789;
	bh=HfPhhPaks/DzM2J3VtxN7P+X+RC8oCBnSigOQr15m9w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nveT1TiKAX8X5YVAQLTUW/pLstuZ31THFkp3oxCYYxLm0b3QcqFrmhY9g7H5bLhG7
	 UqK5M6oIjDTmdfEgou+krx05fHUcc6Nl/RCBmeaVAaEvPtLR878slIq/xWnz1Xsh+b
	 YnqkbAja1YIlftYb4cqT6LtDpRamn16gUn5yvor2HH3P0eslMlwvdXY83qQro1eGqz
	 QxLIdmywqPY/7H5kDFZPVM1wpdAokYpKtgrRarHCbzXbMtdR4SaSiZuXHfhw9iyAja
	 3HHV5r5H6SSoGYJlw+loBi2BLLtBe6MrwdXkQiDRyYRu5dgd/weMxEVrbv2w5/2nI4
	 joxjXi0bOyhqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EFB660BB5;
	Tue, 30 Dec 2025 21:06:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D31AD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86E8E405C0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWPpqlk3IBNs for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC76E405C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC76E405C1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E539187CA7; Tue, 30 Dec 2025 21:06:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 21:51:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ad3afa1916d33d7e60e4385582cf8e73d1e6719
X-Git-Newrev: d10726a1a1c60f934ef7022d188eb231ea174fb0
X-Patchwork-Hint: ignore
Message-Id: <20251230210621.E539187CA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: add patch to fix
 missing <cstdint> include
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2303304415654503338=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2303304415654503338==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d10726a1a1c60f934ef7022d188eb231ea174fb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============2303304415654503338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2303304415654503338==--
