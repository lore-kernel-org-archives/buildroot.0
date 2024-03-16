Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5543C54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B845041772;
	Sat, 16 Mar 2024 22:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbwkaV9V71Wh; Sat, 16 Mar 2024 22:34:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 820B040AB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 820B040AB9;
	Sat, 16 Mar 2024 22:34:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9647B1BF3D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 664FA4012F
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kv2UcgJJoSuM for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A52740199
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A52740199
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58F8D825C6; Sat, 16 Mar 2024 22:34:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 23:28:24 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: b43d5954f774b5a9e6ee939c7f5567fbe154c84b
X-Git-Newrev: 05d22772de38b4d6a92212dd9ecd2440525d7dfd
X-Patchwork-Hint: ignore
Message-Id: <20240316223440.58F8D825C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/wpewebkit:
 security bump to version 2.42.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=05d22772de38b4d6a92212dd9ecd2440525d7dfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes the following security issues:

https://wpewebkit.org/security/WSA-2024-0001.html

- CVE-2024-23222: Processing maliciously crafted web content may lead to
  arbitrary code execution. Apple is aware of a report that this issue
  may have been exploited. Description: A type confusion issue was
  addressed with improved checks.

- CVE-2024-23206: A maliciously crafted webpage may be able to
  fingerprint the user. Description: An access issue was addressed with
  improved access restrictions.

- CVE-2024-23213: Processing web content may lead to arbitrary code
  execution. Description: The issue was addressed with improved memory
  handling.

Add an upstream post-2.42.5 patch to fix an issue with an invalid
backport causing a build issue.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5275e141259c95b03fc288035c128224a1405646)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...LowLevelInterpreter.cpp-339-21-error-t6-w.patch | 39 ++++++++++++++++++++++
 package/wpewebkit/wpewebkit.hash                   |  6 ++--
 package/wpewebkit/wpewebkit.mk                     |  3 +-
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch b/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
new file mode 100644
index 0000000000..a15d9e647f
--- /dev/null
+++ b/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
@@ -0,0 +1,39 @@
+From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 5 Feb 2024 11:00:49 -0600
+Subject: [PATCH] =?UTF-8?q?[GTK]=20[2.42.5]=20LowLevelInterpreter.cpp:339:?=
+ =?UTF-8?q?21:=20error:=20=E2=80=98t6=E2=80=99=20was=20not=20declared=20in?=
+ =?UTF-8?q?=20this=20scope=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid?=
+ =?UTF-8?q?=3D268739?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Unreviewed build fix. Seems a backport went badly, and we didn't notice
+because the code is architecture-specific.
+
+* Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:
+(JSC::CLoop::execute):
+
+Upstream: https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+---
+ Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+index 5064ead6cd2e..9a2e2653b121 100644
+--- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
++++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+     UNUSED_VARIABLE(t2);
+     UNUSED_VARIABLE(t3);
+     UNUSED_VARIABLE(t5);
+-    UNUSED_VARIABLE(t6);
+-    UNUSED_VARIABLE(t7);
+
+     struct StackPointerScope {
+         StackPointerScope(CLoopStack& stack)
+--
+2.43.1
+
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 322e494c36..71e41bb1dd 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,6 +1,6 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.42.4.tar.xz.sums
-sha1  34da38e9554586154c83fdbb5c20e353b6d97277  wpewebkit-2.42.4.tar.xz
-sha256  8836040a3687581970b47a232b713e7023c080d5613427f52db619c29fb253a4  wpewebkit-2.42.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.42.5.tar.xz.sums
+sha1  50a18f43452520e9f34f84c04bc0166af655ffff  wpewebkit-2.42.5.tar.xz
+sha256  4dbab6c5e6dc0c65a3d7dffc1c2390be5f9abd423faf983fe3a55fe081df0532  wpewebkit-2.42.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 13143efb38..442709848a 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.42.4
+# The middle number is even for stable releases, odd for development ones.
+WPEWEBKIT_VERSION = 2.42.5
 WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
