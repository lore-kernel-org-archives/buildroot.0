Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C9CC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38F04416B3;
	Wed, 28 Feb 2024 21:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gancP0DVRiSK; Wed, 28 Feb 2024 21:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DCD5416BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DCD5416BF;
	Wed, 28 Feb 2024 21:25:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19FB01BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 079D38190B
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kKUs6D7qOE0M for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25095817A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25095817A9
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4D8587CA0; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:08:44 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a643262322436a4cb4dd63cbfceed22a0794683b
X-Git-Newrev: f2f446133de49c69f87143ebbaa782d590a265be
X-Patchwork-Hint: ignore
Message-Id: <20240228212548.C4D8587CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/freerdp: security
 bump to version 2.11.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2f446133de49c69f87143ebbaa782d590a265be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Fix CVE-2024-22211
- Update Upstream tag in patches

https://github.com/FreeRDP/FreeRDP/blob/2.11.5/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dbe037dc9998155373b0a96687c55982f9c1a536)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/0001-Fix-variable-declaration-in-loop.patch           | 3 +--
 package/freerdp/0002-Fixed-variable-declaration-in-loop.patch         | 3 +--
 .../freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch | 2 +-
 package/freerdp/freerdp.hash                                          | 4 ++--
 package/freerdp/freerdp.mk                                            | 2 +-
 5 files changed, 6 insertions(+), 8 deletions(-)

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
