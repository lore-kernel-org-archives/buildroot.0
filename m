Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E1BC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE193417C2;
	Sun,  7 May 2023 21:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE193417C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkuthlmhmzPz; Sun,  7 May 2023 21:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE01417BE;
	Sun,  7 May 2023 21:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDE01417BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 135071BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEE798174C
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE798174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddld6hUeiuwm for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:43:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E52B816F5
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E52B816F5
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:43:29 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 62AEE1AF05;
 Sun,  7 May 2023 23:43:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvmA2-1dO61S0; Sun, 7 May 2023 23:43:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvmA1-0006xu-31;
 Sun, 07 May 2023 23:43:18 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 23:43:16 +0200
Message-Id: <20230507214317.409305-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507214317.409305-1-bernd.kuhls@t-online.de>
References: <20230507214317.409305-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683495798-98D4DC79-6E8F76F0/0/0 CLEAN NORMAL
X-TOI-MSGID: c3bf7b81-2d8b-4fd6-bda0-d39a0c4bad3c
Subject: [Buildroot] [PATCH 4/5] package/kodi-inputstream-ffmpeg: fix build
 with gcc-13
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
 ...de-missing-cstdint-to-support-gcc-13.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch

diff --git a/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch
new file mode 100644
index 0000000000..65db2b4702
--- /dev/null
+++ b/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch
@@ -0,0 +1,49 @@
+From fd7bd5ad86fd0006ad571a051fa5d5603a47e4b4 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 26 Apr 2023 17:15:00 +0000
+Subject: [PATCH] include missing <cstdint> to support gcc-13
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Upstream: https://github.com/xbmc/inputstream.ffmpegdirect/commit/fd7bd5ad86fd0006ad571a051fa5d5603a47e4b4
+---
+ src/utils/DiskUtils.h | 1 +
+ src/utils/HttpProxy.h | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/utils/DiskUtils.h b/src/utils/DiskUtils.h
+index 79e34268..f900ec58 100644
+--- a/src/utils/DiskUtils.h
++++ b/src/utils/DiskUtils.h
+@@ -7,6 +7,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace ffmpegdirect
+diff --git a/src/utils/HttpProxy.h b/src/utils/HttpProxy.h
+index eb0c99cb..d203ce36 100644
+--- a/src/utils/HttpProxy.h
++++ b/src/utils/HttpProxy.h
+@@ -7,6 +7,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace ffmpegdirect
+@@ -36,4 +37,4 @@ namespace ffmpegdirect
+     std::string m_user;
+     std::string m_password;
+   };
+-} //namespace ffmpegdirect
+\ No newline at end of file
++} //namespace ffmpegdirect
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
