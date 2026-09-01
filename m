Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239B8C624D0
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 19:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CFA80E45;
	Tue,  1 Sep 2026 19:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEeYo9uQ8VPd; Tue,  1 Sep 2026 19:08:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788289717;
	bh=MK2YX9Mit86CZPn/Iz84gaGdja+9XYmuDN40+NBOxQk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q+f3tIJQl8W6V7refZY35+iXiK4vEJe5FBgsyKbfm/+QqE91z1IQ7g6xpM2Jhf0zJ
	 KYoVMDDuPCWfnQZTLeb/8enn9oYv6iXVvHCLlNtnLGq75LigMD+Ev0G4nDn6wUluTt
	 k349z6Ax5VLzkWST7QZHyEZ0sr8vj4mGEEELiR7eP0EsksqiLEoaRfc9LRti5xde7c
	 PLlzO1zc5jZleMItqS5UTU1JKZY0CjPorBKcZSc3XY3booIsvMmEAktqLLJEy/uRHO
	 KcFNlBkD6nXP1tneNzWCRwhn6DX9vFwL8e1bMn1kw3GtDuO1epVRg2tHbKDu93iht9
	 OFlp/uxYmKK/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EBBB80E4A;
	Tue,  1 Sep 2026 19:08:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E2BB3AF
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7447C40249
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kb6mjsFA7hM8 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 19:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9D0D401ED
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:08:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 864E593557; Tue,  1 Sep 2026 19:07:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 21:07:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55a7ece9e53f2de0cd96294efeb38045bbd41bef
X-Git-Newrev: a31afeb8a4c5f964e657f8b5753868eef0303081
X-Patchwork-Hint: ignore
Message-Id: <20260901190736.864E593557@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncmpc: fix build with fmt >= 12.2.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a31afeb8a4c5f964e657f8b5753868eef0303081
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit cc5c36afffd71e6e01a9371f1a7316fc10a8e3f9 bumped fmt to
version 12.2.0 causing build errors with ncmpc which are fixed by adding
an upstream patch.

Fixes:
https://autobuild.buildroot.net/results/b97/b97146ba1b4996b644c564898f5633dd8c0d4b83/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncmpc/0001-support-libfmt-12.2.0.patch | 195 +++++++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/package/ncmpc/0001-support-libfmt-12.2.0.patch b/package/ncmpc/0001-support-libfmt-12.2.0.patch
new file mode 100644
index 0000000000..ec865f2c89
--- /dev/null
+++ b/package/ncmpc/0001-support-libfmt-12.2.0.patch
@@ -0,0 +1,195 @@
+From 0276640641f58936d0862507472b8d231ab23f42 Mon Sep 17 00:00:00 2001
+From: Max Kellermann <max@musicpd.org>
+Date: Fri, 26 Jun 2026 21:26:56 +0200
+Subject: [PATCH] support libfmt 12.2.0
+
+An API change to libfmt 12.2.0 changed the meaning of the <fmt/core.h>
+header to no longer provide fmt::format().
+
+Upstream: https://github.com/MusicPlayerDaemon/ncmpc/commit/b28f4a5987615ac3074440a5ee14ba55f5a03f99
+
+[Bernd: backported to 0.52]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BasicMarquee.cxx     | 2 +-
+ src/ChatPage.cxx         | 3 +--
+ src/FileBrowserPage.cxx  | 1 +
+ src/KeyDefPage.cxx       | 2 ++
+ src/Main.cxx             | 3 +--
+ src/SearchPage.cxx       | 2 ++
+ src/TagListPage.cxx      | 2 ++
+ src/page/FindSupport.cxx | 2 +-
+ src/page/Page.cxx        | 2 ++
+ src/save_playlist.cxx    | 3 +--
+ src/screen.cxx           | 1 +
+ src/screen_client.cxx    | 2 +-
+ 12 files changed, 16 insertions(+), 9 deletions(-)
+
+diff --git a/src/BasicMarquee.cxx b/src/BasicMarquee.cxx
+index f25e33a6..9b887812 100644
+--- a/src/BasicMarquee.cxx
++++ b/src/BasicMarquee.cxx
+@@ -4,7 +4,7 @@
+ #include "BasicMarquee.hxx"
+ #include "util/LocaleString.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <assert.h>
+ #include <string.h>
+diff --git a/src/ChatPage.cxx b/src/ChatPage.cxx
+index 6b1a1587..efc403f7 100644
+--- a/src/ChatPage.cxx
++++ b/src/ChatPage.cxx
+@@ -13,10 +13,9 @@
+ #include "client/mpdclient.hxx"
+ #include "util/StringAPI.hxx"
+ 
++#include <fmt/format.h>
+ #include <mpd/idle.h>
+ 
+-#include <fmt/core.h>
+-
+ #include <string.h>
+ #include <stdlib.h>
+ 
+diff --git a/src/FileBrowserPage.cxx b/src/FileBrowserPage.cxx
+index 0f510fe4..e6231bc1 100644
+--- a/src/FileBrowserPage.cxx
++++ b/src/FileBrowserPage.cxx
+@@ -19,6 +19,7 @@
+ #include "client/mpdclient.hxx"
+ #include "util/UriUtil.hxx"
+ 
++#include <fmt/format.h>
+ #include <mpd/client.h>
+ 
+ #include <string>
+diff --git a/src/KeyDefPage.cxx b/src/KeyDefPage.cxx
+index 123b0182..b5925e9c 100644
+--- a/src/KeyDefPage.cxx
++++ b/src/KeyDefPage.cxx
+@@ -18,6 +18,8 @@
+ #include "ui/TextListRenderer.hxx"
+ #include "util/SPrintf.hxx"
+ 
++#include <fmt/format.h>
++
+ #include <assert.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/src/Main.cxx b/src/Main.cxx
+index 3f0c4da6..cdd8ac98 100644
+--- a/src/Main.cxx
++++ b/src/Main.cxx
+@@ -22,12 +22,11 @@
+ #include "ConfigFile.hxx"
+ #endif
+ 
++#include <fmt/format.h>
+ #include <mpd/client.h>
+ 
+ #include <curses.h>
+ 
+-#include <fmt/core.h>
+-
+ #include <assert.h>
+ #include <stdio.h>
+ #include <string.h>
+diff --git a/src/SearchPage.cxx b/src/SearchPage.cxx
+index 483a92e8..d4de6552 100644
+--- a/src/SearchPage.cxx
++++ b/src/SearchPage.cxx
+@@ -17,6 +17,8 @@
+ #include "client/mpdclient.hxx"
+ #include "util/StringAPI.hxx"
+ 
++#include <fmt/format.h>
++
+ #include <iterator>
+ 
+ #include <string.h>
+diff --git a/src/TagListPage.cxx b/src/TagListPage.cxx
+index bb73cd76..4b5c6fae 100644
+--- a/src/TagListPage.cxx
++++ b/src/TagListPage.cxx
+@@ -11,6 +11,8 @@
+ #include "client/mpdclient.hxx"
+ #include "util/StringUTF8.hxx"
+ 
++#include <fmt/format.h>
++
+ #include <algorithm>
+ 
+ #include <assert.h>
+diff --git a/src/page/FindSupport.cxx b/src/page/FindSupport.cxx
+index 9832dd3b..8664efb5 100644
+--- a/src/page/FindSupport.cxx
++++ b/src/page/FindSupport.cxx
+@@ -11,7 +11,7 @@
+ #include "ui/Options.hxx"
+ #include "co/InvokeTask.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #define FIND_PROMPT  _("Find")
+ #define RFIND_PROMPT _("Find backward")
+diff --git a/src/page/Page.cxx b/src/page/Page.cxx
+index 6576e7b0..5186834c 100644
+--- a/src/page/Page.cxx
++++ b/src/page/Page.cxx
+@@ -6,6 +6,8 @@
+ #include "ui/Window.hxx"
+ #include "util/Exception.hxx"
+ 
++#include <fmt/format.h>
++
+ void
+ Page::OnClose() noexcept
+ {
+diff --git a/src/save_playlist.cxx b/src/save_playlist.cxx
+index cb248c56..b9a2278c 100644
+--- a/src/save_playlist.cxx
++++ b/src/save_playlist.cxx
+@@ -14,10 +14,9 @@
+ #include "client/mpdclient.hxx"
+ #include "co/InvokeTask.hxx"
+ 
++#include <fmt/format.h>
+ #include <mpd/client.h>
+ 
+-#include <fmt/core.h>
+-
+ #include <stdio.h>
+ 
+ #ifndef NCMPC_MINI
+diff --git a/src/screen.cxx b/src/screen.cxx
+index 4a50d4df..1ee0b0f9 100644
+--- a/src/screen.cxx
++++ b/src/screen.cxx
+@@ -28,6 +28,7 @@
+ #include "TabBar.hxx"
+ #endif
+ 
++#include <fmt/format.h>
+ #include <mpd/client.h>
+ 
+ ScreenManager::PageMap::iterator
+diff --git a/src/screen_client.cxx b/src/screen_client.cxx
+index 4466d476..1bbb1c74 100644
+--- a/src/screen_client.cxx
++++ b/src/screen_client.cxx
+@@ -7,7 +7,7 @@
+ #include "charset.hxx"
+ #include "Interface.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ void
+ screen_database_update(Interface &interface, struct mpdclient &c, const char *path)
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
