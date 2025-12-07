Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936D3D4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A29D840CD;
	Fri, 12 Dec 2025 07:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olRJF8vVDyPs; Fri, 12 Dec 2025 07:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C81783F27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526265;
	bh=XW00B8XvnWaixP/IFI8cL8j7/hKgYGin2Or9LgiJ4A0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ruq6jNyjbLzyQ9l6ekpJIxVmbnxJTh3Yn4KCuvsaktzRZ7PD80bRnxyrAEYMeWKft
	 g39KoRT/LLl5VacDIk4BGQHEy/G/kIsOgsEUrZItBXv0g9jUrAVCZx/CwDv3REBFbk
	 Z2CQ0OtUZ+ElG1i6QlyJuSllEGVedtYZNLL7yDK4Jo6mC59aaq8kk6jmM5OJ6ftlvf
	 fRX6r/OHxT0MeNcH+/DNChA3eX1O6RUq6nW2+DHSaXEX0IQN7fPJRgoCS60c1j7h+K
	 7V2+lFtuxQ6bdlV7HS3VK4ZNcD/i5WRHZ7c5d4hq12eVyji5wgcKrwfS09gzCAXdqn
	 x58GAO24ZTF4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C81783F27;
	Fri, 12 Dec 2025 07:57:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12ECC2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 040EA41157
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7hdf9DERDcC for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80AFA41165
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80AFA41165
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FC0A85C4C; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:23:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7770112edc91a8cafb8a96e65ff4db01c402686
X-Git-Newrev: e3dce54d9cea599ca9d43868f9d19902e6caacb1
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.7FC0A85C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flare-game: fix cmake 4
 compatibility
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
