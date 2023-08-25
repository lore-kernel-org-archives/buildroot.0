Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6C0EE49A0
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 21:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51C81831D6;
	Fri, 25 Aug 2023 21:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51C81831D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wbYvpnuLm6x; Fri, 25 Aug 2023 21:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 653AC83EAF;
	Fri, 25 Aug 2023 21:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 653AC83EAF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 144F21BF284
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0F2941D87
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F2941D87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08m3jdN0dHR9 for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 21:04:36 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E92141D78
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 21:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E92141D78
Received: from fli4l.lan.fli4l (p5b3a06c4.dip0.t-ipconnect.de [91.58.6.196])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D9E30A4C10F8
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 23:04:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48502)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qZdyd-00026x-1Z
 for buildroot@buildroot.org; Fri, 25 Aug 2023 23:04:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 23:04:19 +0200
Message-Id: <20230825210419.10192-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825210419.10192-1-bernd@kuhls.net>
References: <20230825210419.10192-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692997459;
 bh=T/k4sIid+CQ9CK2JvPAVrvYT/qIJYJ3WFZ4QSVMMmY8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mYwZjhI1AHGvqk4fX7SWyDC4YAVP48o0C9S/cKQEaE0y+CdnxDE5bUCd94A36lSco
 P365N1+LqZrMt+14UyKmKB7c5oU2cHr3tpbI3Ud1bHo2XJg6KiNZgciw18MZk3PyMi
 WyytJ/9vpTWd9eelDdP/LCJWs549JOJKWS9nzoIaDuyn7L2vmDLgamlIy/VApZrj14
 WM7CEJZHf2TeX8eNc4j3ttMHyLobz0bEx2upDe9rFoYvqTJPQ3aha5K7Suc5NL3cBd
 +0pbI0jRxWnKKPpRg4rS3cO/AxTwJZ5NCvXLe0mdLqK6THLHG0JsTbxk9LVOaub4Jc
 KWAeumMT0GFyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=mYwZjhI1
Subject: [Buildroot] [PATCH/next 2/2] package/kodi-inputstream-adaptive:
 bump version to 20.3.12-Nexus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is now included in upstream release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...de-missing-cstdint-to-support-gcc-13.patch | 103 ------------------
 .../kodi-inputstream-adaptive.hash            |   2 +-
 .../kodi-inputstream-adaptive.mk              |   2 +-
 3 files changed, 2 insertions(+), 105 deletions(-)
 delete mode 100644 package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
