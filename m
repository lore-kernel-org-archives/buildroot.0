Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3332BD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBFDD60B6F;
	Sun,  7 Dec 2025 16:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxftXZgaFxzL; Sun,  7 Dec 2025 16:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFEC960762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123351;
	bh=0mI6UeDUyxflS67vwjilu5GC2tVKmru6KM/iezvzc/Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i8oFfrKIZ+oGrTBeFhDD2V+tN8DwjHVHXD0/6FpQFKPVb6AEI6PudXIFC6t9bw/sm
	 6R4rPKudrB/6XsBAT57kSUP99mGz8QsZ1tiJNPk5UUj3oc+y0lAg7rkBq/0XiyHuGm
	 Fqa5DKFQrm/kjYWxXd/va8ZMEG+9pIRRXFd3JeCEtNAPV0ftqvNjRJRAfVqTgEmX0C
	 j5lul2Fpg29cL5DoXSsRipMOA2TKz4xnmDriiXFLkJYsBljG4hH/rLOs8qLknfMwP3
	 YAFonMSK3BQIMLjyQo6gZWh/svQHx8Du4JT69m1jEprpsD/3TSkaNPvrnP7DXo6Kng
	 GUhOAdb2h0vGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFEC960762;
	Sun,  7 Dec 2025 16:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30B97376
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1297B822CC
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9e0HMBzqJU87 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF36822B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BF36822B4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4979986715; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:23:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c7770112edc91a8cafb8a96e65ff4db01c402686
X-Git-Newrev: e3dce54d9cea599ca9d43868f9d19902e6caacb1
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.4979986715@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flare-game: fix cmake
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3dce54d9cea599ca9d43868f9d19902e6caacb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Minimum-CMake-version-3.5.patch           | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/flare-game/0001-Minimum-CMake-version-3.5.patch b/package/flare-game/0001-Minimum-CMake-version-3.5.patch
new file mode 100644
index 0000000000..934dcddc74
--- /dev/null
+++ b/package/flare-game/0001-Minimum-CMake-version-3.5.patch
@@ -0,0 +1,26 @@
+From 5b61dfd69f4ecbaca6439caa9ae41b3168e4d21a Mon Sep 17 00:00:00 2001
+From: Justin Jacobs <jajdorkster@gmail.com>
+Date: Sat, 5 Apr 2025 18:31:03 -0400
+Subject: [PATCH] Minimum CMake version = 3.5
+
+From the CMake 4.0 release notes:
+> Compatibility with versions of CMake older than 3.5 has been removed.
+
+Upstream: https://github.com/flareteam/flare-game/commit/5b61dfd69f4ecbaca6439caa9ae41b3168e4d21a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d98c2ae5f..9c1750552 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ Project (Flare-Game LANGUAGES NONE)
+-cmake_minimum_required (VERSION 2.8.12)
++cmake_minimum_required (VERSION 3.5)
+ 
+ Set (PACKAGE "FLARE-GAME")
+ Set (VERSION "1.14")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
