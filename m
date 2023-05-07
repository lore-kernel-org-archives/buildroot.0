Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B74CC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 101F940639;
	Sun,  7 May 2023 21:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 101F940639
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9yoj3k61bMx; Sun,  7 May 2023 21:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21CA140642;
	Sun,  7 May 2023 21:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21CA140642
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 589F31BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D3D740642
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D3D740642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ajh4x2s4smEG for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:43:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA53E400D6
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA53E400D6
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:43:22 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout02.t-online.de (Postfix) with SMTP id 0604A24D0E;
 Sun,  7 May 2023 23:43:19 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvmA2-18Fzk10; Sun, 7 May 2023 23:43:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvmA1-0006xu-2j;
 Sun, 07 May 2023 23:43:17 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 23:43:15 +0200
Message-Id: <20230507214317.409305-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507214317.409305-1-bernd.kuhls@t-online.de>
References: <20230507214317.409305-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683495798-96FFAC52-3CA81C71/0/0 CLEAN NORMAL
X-TOI-MSGID: 0ee9ff8e-93e6-4483-bb27-100de4249a77
Subject: [Buildroot] [PATCH 3/5] package/kodi-inputstream-adaptive: fix
 build with gcc-13
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...de-missing-cstdint-to-support-gcc-13.patch | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch

diff --git a/package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch
new file mode 100644
index 0000000000..ca4a363182
--- /dev/null
+++ b/package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch
@@ -0,0 +1,103 @@
+From 7b5c284e63c1d6327db7551a0646cffcbaf9410f Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 26 Apr 2023 15:47:17 +0000
+Subject: [PATCH] include missing <cstdint> to support gcc-13
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Upstream: https://github.com/xbmc/inputstream.adaptive/commit/7b5c284e63c1d6327db7551a0646cffcbaf9410f
+[Bernd: backported from Omega branch]
+---
+ src/Iaes_decrypter.h        | 3 ++-
+ src/SSD_dll.h               | 1 +
+ src/utils/FileUtils.h       | 1 +
+ src/utils/PropertiesUtils.h | 1 +
+ src/utils/StringUtils.h     | 1 +
+ src/utils/Utils.h           | 1 +
+ src/utils/XMLUtils.h        | 1 +
+ 7 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/Iaes_decrypter.h b/src/Iaes_decrypter.h
+index 7fdf6046d..da992be95 100644
+--- a/src/Iaes_decrypter.h
++++ b/src/Iaes_decrypter.h
+@@ -10,6 +10,7 @@
+ 
+ #include <bento4/Ap4Types.h>
+ 
++#include <cstdint>
+ #include <string>
+ 
+ class IAESDecrypter
+@@ -31,4 +32,4 @@ class IAESDecrypter
+ 
+ private:
+   std::string m_licenseKey;
+-};
+\ No newline at end of file
++};
+diff --git a/src/SSD_dll.h b/src/SSD_dll.h
+index 4b2b70c1a..d23fcbe45 100644
+--- a/src/SSD_dll.h
++++ b/src/SSD_dll.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <stdarg.h> // va_list, va_start, va_arg, va_end
+ #include <string_view>
+ 
+diff --git a/src/utils/FileUtils.h b/src/utils/FileUtils.h
+index 40745b0d4..0924d8ff7 100644
+--- a/src/utils/FileUtils.h
++++ b/src/utils/FileUtils.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <string_view>
+ 
+diff --git a/src/utils/PropertiesUtils.h b/src/utils/PropertiesUtils.h
+index dee3e0a16..a658b835c 100644
+--- a/src/utils/PropertiesUtils.h
++++ b/src/utils/PropertiesUtils.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <map>
+ #include <string>
+ #include <utility>
+diff --git a/src/utils/StringUtils.h b/src/utils/StringUtils.h
+index 3f841a274..f209546fa 100644
+--- a/src/utils/StringUtils.h
++++ b/src/utils/StringUtils.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <string_view>
+ #include <vector>
+diff --git a/src/utils/Utils.h b/src/utils/Utils.h
+index 4966ece63..472a328c4 100644
+--- a/src/utils/Utils.h
++++ b/src/utils/Utils.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <map>
+ #include <string>
+ #include <string_view>
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
