Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B80AD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22AFB60B55;
	Sun,  7 Dec 2025 16:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kh7UWOWcnURv; Sun,  7 Dec 2025 16:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FCE660BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123358;
	bh=e8e8SJtbZsBOtkfOZ7c4l3w7HKWyDJdOJRpfKcxlufA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T6QlkiUvNT57N0pERiK0U6QPxNW6Bu0vClRVocDKjR3b7T2MeimkuKAUr0nr7nTbX
	 ZrbbSzLZRjVdg0y7gz2bU2m124dCHpEG2foAckId1FEdkpw5cJpjT+HYzzaWqA2Y+o
	 OhrcDoMFqEGj5sNstGXLqh7l7mE1CMmnZzaZxtq/pBbe70blzQwW74DIj8tdZWbB6p
	 e0F81kQX2aabSYTGALq4Ye/hq8Q5+VS54ORsJvF0xAKaS8ZCy7qDukSQj2swPiYiH/
	 rESHbOJOft+q7IS6vwhmr8BhCqbBocQphDhVOuJ8a8/64ixdZUeuYLHuPUl1Gu/j2J
	 0jofWpnVcVtNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FCE660BD0;
	Sun,  7 Dec 2025 16:02:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D0A2151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4131E822B5
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqjuw-kJD2_Q for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80051822BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80051822BF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DBD185DB7; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:05:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cf00a0a1a1dcdc331f0d4b249d9aa867f773a780
X-Git-Newrev: 48cf8ab8b101e87ffe20b51e8a82757ea9ccb356
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.7DBD185DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmodplug: fix cmake
 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=48cf8ab8b101e87ffe20b51e8a82757ea9ccb356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../libmodplug/0002-Fix-build-with-cmake-4.patch   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/libmodplug/0002-Fix-build-with-cmake-4.patch b/package/libmodplug/0002-Fix-build-with-cmake-4.patch
new file mode 100644
index 0000000000..7c75d510c2
--- /dev/null
+++ b/package/libmodplug/0002-Fix-build-with-cmake-4.patch
@@ -0,0 +1,36 @@
+From a133c89548383f88fe0d0da618ef3c06c7f08f22 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 2 Dec 2025 18:00:15 +0100
+Subject: [PATCH] Fix build with cmake 4
+
+Fixes build error with cmake 4.20:
+
+CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: https://github.com/Konstanty/libmodplug/pull/101
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d9fd20d..9f9c94f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.12)
+ 
+ project(libmodplug)
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
