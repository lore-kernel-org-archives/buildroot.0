Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2389CD43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C50BE84183;
	Fri, 12 Dec 2025 07:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLV2YJ0vfLc8; Fri, 12 Dec 2025 07:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94810841DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526308;
	bh=KJFkQNYMy6hUV4FcCQb0RKM2qX82oEv3jdmBQh2NsFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I7KGVvWRVyQVQDW17oTGjEX2J0RAYsy1LeV2EjKfJNyC3O2MFEFDrVR/MsnYRTVF7
	 2WzRoOcwD0O8aiTEodvlus/rWiJWPRj9E2PrDqsV3uPPlvv7i+LMF272iXeEA0/+f+
	 qwnq9ewR3zdzPwkr40BlWOaDDaNwrNP4x8W5BU0Q/r6uTBTyRq0MQIhFt3fHB1PaPs
	 nsawTSLOtOH8SImUd0Yw2xqP7CUP/X3maHUd3FwKjcSnO4/fUiMuVyZ5RzzdHpx0RZ
	 MjFUZardlTlca38DXwMhOZ5d3tdZZ6cqyXkNkEvniSLyndm0qfyZNi29RnbIinVHid
	 2/sMwHv5oz5FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94810841DC;
	Fri, 12 Dec 2025 07:58:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD2EE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9F454112D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1e7dOgkxWlF for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD55B41173
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD55B41173
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC63F869E8; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:43:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ee507df7c9bbed54a2c3b4deac7fc9ab151a7c7
X-Git-Newrev: 955e3ff9717907120cb717fca7fbd8faa77fd1e0
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.DC63F869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/websocketpp: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=955e3ff9717907120cb717fca7fbd8faa77fd1e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
