Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A608D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B9F60B25;
	Sun,  7 Dec 2025 17:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LnXYBrmL_-O; Sun,  7 Dec 2025 17:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B13460BB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126883;
	bh=gSeGnpWD9hCvRjWqNtSQ1s4CaJDMpQqkBiRWh2q6d2s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RZPPB9I1nlJpl7JasSSI43uLSCYt8jYO7KqmdPCmb8np0b+eecXQdDBWhc3MQ5Uky
	 j+HvBUZMoOthu0s1Kl8+hfw5yKvVcBPzSuUkA0IVqQy6D1kJf3yI8mzVasl6WeLTGd
	 EJFRMMVSn1oWQZ7pxHjkztCFPASe0l40SyUpZ8CMbT9FPZ2qwqRGbwpvS0zISLXZGH
	 V0WmC8OcCG4eyA7L6DPhzdr4As4R2VHuefKkpezrj3L6L/V0Ghr6R4DGRhKhGV93M3
	 U/ibydK1Wvv1ZQdyDJwqNSr6htBB9v6yPANlneSC8ZKbjtN5RzTG3FOU5bxNdFJ43E
	 61EDrhAjKSjmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B13460BB9;
	Sun,  7 Dec 2025 17:01:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D1FBE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF5F860B62
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pcr5hfDr5Vki for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74DA60B70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B74DA60B70
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B31BB867B4; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 92fb5e03ce13dc5bd659c1ea099db7a991c5b98b
X-Git-Newrev: 3d26ce283bb6ce3f991344444eea11fac687afc0
X-Patchwork-Hint: ignore
Message-Id: <20251207170112.B31BB867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ympd: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d26ce283bb6ce3f991344444eea11fac687afc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0003-bump-required-cmake-version-to-3.10.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/ympd/0003-bump-required-cmake-version-to-3.10.patch b/package/ympd/0003-bump-required-cmake-version-to-3.10.patch
new file mode 100644
index 0000000000..72a1966d77
--- /dev/null
+++ b/package/ympd/0003-bump-required-cmake-version-to-3.10.patch
@@ -0,0 +1,22 @@
+From 5c5862071e7ae982de6f39c9d1679dc496f38a20 Mon Sep 17 00:00:00 2001
+From: "Felix J. Ogris" <fjo@core7.intra.ogris.net>
+Date: Fri, 20 Jun 2025 15:10:38 +0200
+Subject: [PATCH] bump required cmake version to 3.10
+
+Upstream: https://github.com/notandy/ympd/pull/199
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 02ee5141d..a8ee3730d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.10)
+ 
+ project (ympd C)
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
