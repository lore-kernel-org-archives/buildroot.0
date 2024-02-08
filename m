Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F1EC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 12:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43A656FAC5;
	Thu,  8 Feb 2024 12:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFq_IlOVegyR; Thu,  8 Feb 2024 12:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26C916FACE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C916FACE;
	Thu,  8 Feb 2024 12:58:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2E41BF403
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 12:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB24442CE2
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 12:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7euejraFSbao for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 12:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2073E42CCC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2073E42CCC
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 12:58:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D3CA87565; Thu,  8 Feb 2024 12:58:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Feb 2024 13:52:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74682e07df455aa49a637ebbda580df969e64ccf
X-Git-Newrev: de3684f57df79c19eba34dac98418ceeaccd03db
X-Patchwork-Hint: ignore
Message-Id: <20240208125807.0D3CA87565@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: security bump to
 version 2.42.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=de3684f57df79c19eba34dac98418ceeaccd03db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

https://webkitgtk.org/security/WSA-2024-0001.html

- CVE-2024-23222: Processing maliciously crafted web content may lead to
  arbitrary code execution.  Apple is aware of a report that this issue may
  have been exploited.  Description: A type confusion issue was addressed
  with improved checks.

- CVE-2024-23206: A maliciously crafted webpage may be able to fingerprint
  the user.  Description: An access issue was addressed with improved access
  restrictions.

- CVE-2024-23213: Processing web content may lead to arbitrary code execution.
  Description: The issue was addressed with improved memory handling.

- CVE-2023-40414: Processing web content may lead to arbitrary code
  execution.  Description: A use-after-free issue was addressed with
  improved memory management.

- CVE-2023-42833: Processing web content may lead to arbitrary code execution.
  Description: A correctness issue was addressed with improved checks.

- CVE-2014-1745: Processing a file may lead to a denial-of-service or
  potentially disclose memory contents.  Description: The issue was
  addressed with improved checks.

https://webkitgtk.org/security/WSA-2023-0012.html

- CVE-2023-42883: Processing a SVG image may lead to a denial-of-service.
  Description: The issue was addressed with improved memory handling.

- CVE-2023-42890: Processing web content may lead to arbitrary code
  execution.  Description: The issue was addressed with improved memory
  handling.

https://webkitgtk.org/security/WSA-2023-0011.html

- CVE-2023-42916: Processing web content may disclose sensitive information.
  Apple is aware of a report that this issue may have been actively
  exploited.  Description: An out-of-bounds read was addressed with improved
  input validation.

- CVE-2023-42917: Processing web content may lead to arbitrary code
  execution.  Apple is aware of a report that this issue may have been
  actively exploited.  Description: A memory corruption vulnerability was
  addressed with improved locking.

Add an upstream post-2.42.5 patch to fix an issue with an invalid backport
causing a build issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...LowLevelInterpreter.cpp-339-21-error-t6-w.patch | 39 ++++++++++++++++++++++
 package/webkitgtk/webkitgtk.hash                   |  6 ++--
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch b/package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
new file mode 100644
index 0000000000..c9667fedbd
--- /dev/null
+++ b/package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
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
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
+2.39.2
+
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 59782732c3..ac4799d4cf 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.42.2.tar.xz.sums
-sha1  05bec6a824e46f043b865478735bc8395249510e  webkitgtk-2.42.2.tar.xz
-sha256  5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118  webkitgtk-2.42.2.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.42.5.tar.xz.sums
+sha1  c3ffb2beaac56f1089029f2254482f48d9e3db37  webkitgtk-2.42.5.tar.xz
+sha256  b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749  webkitgtk-2.42.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 611d7f65d3..075a36654f 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.42.2
+WEBKITGTK_VERSION = 2.42.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
