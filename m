Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C736D3B7E7
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4102E60D5C;
	Sun,  7 Dec 2025 16:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M85s7Ff2orhg; Sun,  7 Dec 2025 16:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4593160D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123365;
	bh=v9hLMOEf3686SwTuI36PlvDb509eqBZkprGuCU0lFI8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jlsWnUF4W6PDMsHO/QkDXEIX1DJk4TncNWR1FHxFHgrIZj07HonmRzHGEi17PZ0OG
	 JwarhPwp0XofYOQgTJTg9zvJWgYChdlydr66QYRNij8s6fSo74mkmPxJY9ZTdL2ywT
	 xnqcMQuiBMYJtZ+9JwFrthpSbDDMZXLYhSvPrhkiJIjQLuglssCC6FwVTeHVrtPLP3
	 rkqMOhbGyZ5tK3q30XKO7xs4s62inkTFH2MkTJmQJEtYSeiVIgZ+LK89zRY1lKF9H+
	 QkHvTjv9OXZ4mJ6Ffc4tQRmwf7Nw0vJSTBG4Dm9nIh/38uSKr9sfVIJW0Qx2a2phwh
	 Vxsu7QUyjoZnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4593160D5E;
	Sun,  7 Dec 2025 16:02:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 394BAE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2E7A822C6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FToLurA2dxpp for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7920822CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7920822CB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B52C885DB7; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:43:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ee507df7c9bbed54a2c3b4deac7fc9ab151a7c7
X-Git-Newrev: 955e3ff9717907120cb717fca7fbd8faa77fd1e0
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.B52C885DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/websocketpp: fix cmake
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

commit: https://git.buildroot.net/buildroot/commit/?id=955e3ff9717907120cb717fca7fbd8faa77fd1e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...002-Update-minimum-required-CMake-version.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/websocketpp/0002-Update-minimum-required-CMake-version.patch b/package/websocketpp/0002-Update-minimum-required-CMake-version.patch
new file mode 100644
index 0000000000..da8e7e1da4
--- /dev/null
+++ b/package/websocketpp/0002-Update-minimum-required-CMake-version.patch
@@ -0,0 +1,26 @@
+From deb0a334471362608958ce59a6b0bcd3e5b73c24 Mon Sep 17 00:00:00 2001
+From: Alexander Bock <mail@alexanderbock.eu>
+Date: Mon, 31 Mar 2025 22:04:07 +0200
+Subject: [PATCH] Update minimum required CMake version to comply with CMake
+ 4.0
+
+Upstream: https://github.com/zaphoyd/websocketpp/commit/deb0a334471362608958ce59a6b0bcd3e5b73c24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4f93e243a..92990c7dc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ ############ Setup project and cmake
+ # Minimum cmake requirement. We should require a quite recent
+ # cmake for the dependency find macros etc. to be up to date.
+-cmake_minimum_required (VERSION 2.8.8)
++cmake_minimum_required (VERSION 3.10)
+ 
+ ############ Paths
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
