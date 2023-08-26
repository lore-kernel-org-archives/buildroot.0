Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7ABC83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F082241B4C;
	Sat, 26 Aug 2023 18:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F082241B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRUm3HYOIhAt; Sat, 26 Aug 2023 18:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C683841908;
	Sat, 26 Aug 2023 18:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C683841908
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5D71BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1653641718
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1653641718
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vd-VHf2Lq8l8 for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:15:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6994416D6
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6994416D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4A53862D6; Sat, 26 Aug 2023 18:15:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 20:08:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5cc09213364cc6f8262efbb223c8559c98173c7a
X-Git-Newrev: 43d5fad3e55f08f3b6f21c4996160976e5bec308
X-Patchwork-Hint: ignore
Message-Id: <20230826181546.A4A53862D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/kodi-inputstream-adaptive: bump version to 20.3.12-Nexus
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43d5fad3e55f08f3b6f21c4996160976e5bec308
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patch which is now included in upstream release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...include-missing-cstdint-to-support-gcc-13.patch | 103 ---------------------
 .../kodi-inputstream-adaptive.hash                 |   2 +-
 .../kodi-inputstream-adaptive.mk                   |   2 +-
 3 files changed, 2 insertions(+), 105 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch
deleted file mode 100644
index ca4a363182..0000000000
--- a/package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 7b5c284e63c1d6327db7551a0646cffcbaf9410f Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 26 Apr 2023 15:47:17 +0000
-Subject: [PATCH] include missing <cstdint> to support gcc-13
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
-included [1]. Explicitly include it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Upstream: https://github.com/xbmc/inputstream.adaptive/commit/7b5c284e63c1d6327db7551a0646cffcbaf9410f
-[Bernd: backported from Omega branch]
----
- src/Iaes_decrypter.h        | 3 ++-
- src/SSD_dll.h               | 1 +
- src/utils/FileUtils.h       | 1 +
- src/utils/PropertiesUtils.h | 1 +
- src/utils/StringUtils.h     | 1 +
- src/utils/Utils.h           | 1 +
- src/utils/XMLUtils.h        | 1 +
- 7 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/src/Iaes_decrypter.h b/src/Iaes_decrypter.h
-index 7fdf6046d..da992be95 100644
---- a/src/Iaes_decrypter.h
-+++ b/src/Iaes_decrypter.h
-@@ -10,6 +10,7 @@
- 
- #include <bento4/Ap4Types.h>
- 
-+#include <cstdint>
- #include <string>
- 
- class IAESDecrypter
-@@ -31,4 +32,4 @@ class IAESDecrypter
- 
- private:
-   std::string m_licenseKey;
--};
-\ No newline at end of file
-+};
-diff --git a/src/SSD_dll.h b/src/SSD_dll.h
-index 4b2b70c1a..d23fcbe45 100644
---- a/src/SSD_dll.h
-+++ b/src/SSD_dll.h
-@@ -8,6 +8,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <stdarg.h> // va_list, va_start, va_arg, va_end
- #include <string_view>
- 
-diff --git a/src/utils/FileUtils.h b/src/utils/FileUtils.h
-index 40745b0d4..0924d8ff7 100644
---- a/src/utils/FileUtils.h
-+++ b/src/utils/FileUtils.h
-@@ -8,6 +8,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- #include <string_view>
- 
-diff --git a/src/utils/PropertiesUtils.h b/src/utils/PropertiesUtils.h
-index dee3e0a16..a658b835c 100644
---- a/src/utils/PropertiesUtils.h
-+++ b/src/utils/PropertiesUtils.h
-@@ -8,6 +8,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <map>
- #include <string>
- #include <utility>
-diff --git a/src/utils/StringUtils.h b/src/utils/StringUtils.h
-index 3f841a274..f209546fa 100644
---- a/src/utils/StringUtils.h
-+++ b/src/utils/StringUtils.h
-@@ -8,6 +8,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- #include <string_view>
- #include <vector>
-diff --git a/src/utils/Utils.h b/src/utils/Utils.h
-index 4966ece63..472a328c4 100644
---- a/src/utils/Utils.h
-+++ b/src/utils/Utils.h
-@@ -8,6 +8,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <map>
- #include <string>
- #include <string_view>
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index b29a0af148..2c130fbbdf 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  ed266d2a51efcd0952cfacc8549350282dce07f7c0e885eeb41d662f123e12a6  kodi-inputstream-adaptive-20.3.11-Nexus.tar.gz
+sha256  da21f6c765c208e4ba0fd8958954fe5681b393fc432d7b139946847214535228  kodi-inputstream-adaptive-20.3.12-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 6b11532b0e..ebcf9e10d3 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.11-Nexus
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.12-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
