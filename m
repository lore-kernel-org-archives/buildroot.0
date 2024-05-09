Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E6C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D031841F0B;
	Thu,  9 May 2024 17:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSdqk50TNCVE; Thu,  9 May 2024 17:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4154041F08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4154041F08;
	Thu,  9 May 2024 17:24:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451E31BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1776040461
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4JsB_ltjKJH for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1244440442
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1244440442
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0D9286D44; Thu,  9 May 2024 17:23:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 19:03:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49afbc1a19e66be92a8d91189fd5b321d1fecef4
X-Git-Newrev: d6a84711963b5e4fe12684e6390597333a4fc3ac
X-Patchwork-Hint: ignore
Message-Id: <20240509172344.F0D9286D44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-ffmpegdirect:
 bump version to 21.3.5-Omega
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6a84711963b5e4fe12684e6390597333a4fc3ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in upstream release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...include-missing-cstdint-to-support-gcc-13.patch | 49 ----------------------
 .../kodi-inputstream-ffmpegdirect.hash             |  2 +-
 .../kodi-inputstream-ffmpegdirect.mk               |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch
deleted file mode 100644
index 65db2b4702..0000000000
--- a/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From fd7bd5ad86fd0006ad571a051fa5d5603a47e4b4 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 26 Apr 2023 17:15:00 +0000
-Subject: [PATCH] include missing <cstdint> to support gcc-13
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
-included [1]. Explicitly include it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Upstream: https://github.com/xbmc/inputstream.ffmpegdirect/commit/fd7bd5ad86fd0006ad571a051fa5d5603a47e4b4
----
- src/utils/DiskUtils.h | 1 +
- src/utils/HttpProxy.h | 3 ++-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/utils/DiskUtils.h b/src/utils/DiskUtils.h
-index 79e34268..f900ec58 100644
---- a/src/utils/DiskUtils.h
-+++ b/src/utils/DiskUtils.h
-@@ -7,6 +7,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- 
- namespace ffmpegdirect
-diff --git a/src/utils/HttpProxy.h b/src/utils/HttpProxy.h
-index eb0c99cb..d203ce36 100644
---- a/src/utils/HttpProxy.h
-+++ b/src/utils/HttpProxy.h
-@@ -7,6 +7,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- 
- namespace ffmpegdirect
-@@ -36,4 +37,4 @@ namespace ffmpegdirect
-     std::string m_user;
-     std::string m_password;
-   };
--} //namespace ffmpegdirect
-\ No newline at end of file
-+} //namespace ffmpegdirect
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index 7dbcee6585..536bdc7031 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a849b6b4d5ce740ec3552d244acc4c7a4d64792358428f5154236052473d5734  kodi-inputstream-ffmpegdirect-20.5.0-Nexus.tar.gz
+sha256  b28ccbd489d9b69779fd818ee158f69ebd6fd85b1f0410ffc8098ff0c8665bdc  kodi-inputstream-ffmpegdirect-21.3.5-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index ff66f13e14..d9d46ed768 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 20.5.0-Nexus
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 21.3.5-Omega
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
