Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11184E668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 11:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC87580D9C;
	Sat, 20 Dec 2025 11:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnojS7uo-lSO; Sat, 20 Dec 2025 11:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C361B80D78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766231454;
	bh=/HDbxAJcN5FaEgX6ni91BzAfJxh8WS81si3Nt0MN94g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N6FqTnYMOmQjKqsdMAbUPxH/zKHY9eLZBAnsFRPfJOSIcySMnIxSH+3Qk6EU7m7Ug
	 sJjxvazhVvdB8iOu4cT5+DamlNfd0fo3YORdWke8xmgW3ZiAaOeu79k+0CudGg/P/+
	 Fqoe8LiaOoa8UmNhhbwGZy0M4gadvdXvmLoVj5+KGCAHdha7EkdNDOhOVsQWRJDfoP
	 e/k5DywzHL06ZBVkXN59RaPGOz02jOGHbg6VQeT6ECvRrpRENPgBjpc1aqahPWGpjQ
	 iEVFzP0rmCU9NJtPsLgl2Zd+1Y/aNqKZtDwozz+HOhGI5y5B9JzE07GOYXny0l9/61
	 aatMfgq3+cGeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C361B80D78;
	Sat, 20 Dec 2025 11:50:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EEC3119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 412D980D78
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xwPSLw4OXNl for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 11:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64C7580D4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64C7580D4C
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D8EB870DB; Sat, 20 Dec 2025 11:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 12:46:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a2a8c9df4867b1f4ea1f79425367cfb8895a3b7
X-Git-Newrev: 52c753ccab9772a86765bba8268419cb7c5e426d
X-Patchwork-Hint: ignore
Message-Id: <20251220115053.3D8EB870DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to 21.5.18-Omega
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=52c753ccab9772a86765bba8268419cb7c5e426d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes of this bugfix release:
https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.18-Omega

Removed patch 0001 which is included in this release:
https://github.com/xbmc/inputstream.adaptive/commit/a224dc66e93aa0d79152ef283cc7dd2207f7cf7d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-build-with-gcc-15.patch               | 31 ----------------------
 .../kodi-inputstream-adaptive.hash                 |  2 +-
 .../kodi-inputstream-adaptive.mk                   |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch b/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch
deleted file mode 100644
index 79daea00bc..0000000000
--- a/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8ee42c56f1f5f959ce1c66ad4b33235a0b69c774 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 17 May 2025 12:19:09 +0200
-Subject: [PATCH] Fix build with gcc-15
-
-Upstream: not applicable
-
-The code which included uint16_t was removed in the to-be-released
-Piers branch:
-https://github.com/xbmc/inputstream.adaptive/commit/2afe7b8801d2da3059bfb2df0e5a6981fb9e46e9#diff-3dcaf13e4dbb2a79fa703382b7469e3c4ab1f0994928a5c0fca2627b8a9c8eac
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/common/AdaptiveUtils.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/common/AdaptiveUtils.h b/src/common/AdaptiveUtils.h
-index 7563cb86..89812532 100644
---- a/src/common/AdaptiveUtils.h
-+++ b/src/common/AdaptiveUtils.h
-@@ -13,6 +13,7 @@
- #include <memory>
- #include <string_view>
- #include <vector>
-+#include <cstdint>
- 
- // forwards
- class AP4_Movie;
--- 
-2.39.5
-
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index b3bbd1b06c..c2339a3d33 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f07c72cc0aa4b379a41c991adae7ccbb31ba5f94da13e986d84e53b67e332bdc  kodi-inputstream-adaptive-21.5.17-Omega.tar.gz
+sha256  a62ef86fc616c37ff7fa53ff7dfe2a73ee21f48af306a9f82c5bb5fe05245dad  kodi-inputstream-adaptive-21.5.18-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index a886960721..3e0ead12c9 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.17-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.18-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
