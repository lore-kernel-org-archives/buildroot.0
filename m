Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88624C47DDF
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 11:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28420405CE;
	Thu,  1 Feb 2024 11:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28420405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mrdk37mSopec; Thu,  1 Feb 2024 11:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF45C435E0;
	Thu,  1 Feb 2024 11:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF45C435E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 239681BF2AB
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B26B8176D
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B26B8176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahd0oe6SIL99 for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3416081A50
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3416081A50
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20F4486704; Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Feb 2024 12:01:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0694cef47b4942447fa8532f55e11e5fcae48f2b
X-Git-Newrev: dbe037dc9998155373b0a96687c55982f9c1a536
X-Patchwork-Hint: ignore
Message-Id: <20240201110345.20F4486704@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: security bump to version
 2.11.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dbe037dc9998155373b0a96687c55982f9c1a536
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2024-22211
- Update Upstream tag in patches

https://github.com/FreeRDP/FreeRDP/blob/2.11.5/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                   | 3 ---
 package/freerdp/0001-Fix-variable-declaration-in-loop.patch           | 3 +--
 package/freerdp/0002-Fixed-variable-declaration-in-loop.patch         | 3 +--
 .../freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch | 2 +-
 package/freerdp/freerdp.hash                                          | 4 ++--
 package/freerdp/freerdp.mk                                            | 2 +-
 6 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 55a55752a2..a95aaf262c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -415,9 +415,6 @@ package/flite/0001-fix-alsa-static.patch Upstream
 package/fltk/0001-disable-tests.patch Upstream
 package/fluxbox/0001-fixes-bug-1138.patch Upstream
 package/freeradius-client/0001-fix-for-nettle.patch Upstream
-package/freerdp/0001-Fix-variable-declaration-in-loop.patch Upstream
-package/freerdp/0002-Fixed-variable-declaration-in-loop.patch Upstream
-package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch Upstream
 package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch Upstream
 package/freescale-imx/imx-kobs/0002-Fix-build-for-recent-toolchains.patch Upstream
 package/freescale-imx/imx-uuc/S80imx-uuc Indent Shellcheck Variables
diff --git a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
index a391e42ee6..799a92734b 100644
--- a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
+++ b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
@@ -3,8 +3,7 @@ From: Armin Novak <armin.novak@thincast.com>
 Date: Wed, 16 Sep 2020 09:30:37 +0200
 Subject: [PATCH] Fix variable declaration in loop
 
-[Retrieved from:
-https://github.com/FreeRDP/FreeRDP/commit/ddde652460350b962d32036981ff8ed77ed2f1ed]
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/ddde652460350b962d32036981ff8ed77ed2f1ed
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  client/X11/xf_graphics.c | 3 ++-
diff --git a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
index 14e1d6c8f4..1a4e899430 100644
--- a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
+++ b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
@@ -3,8 +3,7 @@ From: akallabeth <akallabeth@posteo.net>
 Date: Tue, 22 Sep 2020 07:43:56 +0200
 Subject: [PATCH] Fixed variable declaration in loop
 
-[Retrieved from:
-https://github.com/FreeRDP/FreeRDP/commit/4f8a48d96e472e43a5f856c449f61669792ce9fa]
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/4f8a48d96e472e43a5f856c449f61669792ce9fa
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  client/X11/xf_graphics.c | 4 ++--
diff --git a/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch b/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
index d8dfe13d1b..63434e58f7 100644
--- a/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
+++ b/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
@@ -16,7 +16,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/31e770a330158035e24b7b952bec0030138482b7
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/FreeRDP/FreeRDP/pull/7205]
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/0976cce458f2281cef6e8c417daf4bbd22bcc087
 ---
  winpr/include/winpr/file.h | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 02268f55ea..daf933e0af 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.11.0.tar.gz.sha256
-sha256  8d08e638df21e67c3761462b4efb9e596576f58bd6886f902e6021cdd17d396e  freerdp-2.11.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.11.5.tar.gz.sha256
+sha256  70785ad9934d75aed1734f8918a05aff95788e58e53081e84651106b24303dc2  freerdp-2.11.5.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 6f71ef796f..29b33f61c3 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.11.0
+FREERDP_VERSION = 2.11.5
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
