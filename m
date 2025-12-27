Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CB3E8FDD0
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6EF9402DB;
	Sat, 27 Dec 2025 11:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Spu7sN04BxAi; Sat, 27 Dec 2025 11:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E116F402E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766834485;
	bh=1oNFh2igSE3lz1XXIUScl/8SNHPmj87boYx3oHyxVCs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Eub/aBROlm5jdZ31GuhTrv9L7epmORG4YuOwdlNW2nNbe5e5KQpzIqvihcmTVu0tX
	 S4AzKnnB6CnTUJUdAmgci5VoXff6kICACMrx0TDTQzXn8iVP3wAjFimrZRRbRAIR+f
	 kYcUTbabVcn5bScXw0UrV3o0I6wcGrA7XAok5lZKZf5TOOLcow1/q+QDAYdmJzCxTl
	 UmfGqCqpNKBjKoy4mAnZIowfM1kbPB7pS01ao1yo+0b/JQYD4drCYg7f5rWQEVNNA2
	 AavWl3Hn84E8CWZpVX35w9gude6PuH+sgWi506OggAuHNnnJGXYDR8kO2nX6FSD/wg
	 90G1Wk9CyrgVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E116F402E4;
	Sat, 27 Dec 2025 11:21:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 530E5EC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 459A880CA0
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czgiAkZjW2nC for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C6E180C9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C6E180C9D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:21:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 888E287693; Sat, 27 Dec 2025 11:21:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 12:14:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0c4b595e0f8cd7415d1c65facd09bf446140f0e
X-Git-Newrev: 5eb9f8aee52c8dc9355f0ab096df9e56e9459f46
X-Patchwork-Hint: ignore
Message-Id: <20251227112123.888E287693@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppdb: fix compatibility with
 CMake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=5eb9f8aee52c8dc9355f0ab096df9e56e9459f46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
  to tell CMake that the project requires at least <min> but has been updated
  to work with policies introduced by <max> or earlier.

  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

We didn't submit the patch upstream, because contrary to cppcms, cppdb
seems completely dead. Last commit is from 2012 at
https://sourceforge.net/p/cppcms/code/HEAD/tree/cppdb/.

There are no known autobuilder failures for this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eLists.txt-fix-compatibility-with-CMake-4.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch b/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
new file mode 100644
index 0000000000..3bba81f563
--- /dev/null
+++ b/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
@@ -0,0 +1,24 @@
+From 27003c60a05dd3921538323a53b1650e289cba8c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 17 Dec 2025 22:27:33 +0100
+Subject: [PATCH] CMakeLists.txt: fix compatibility with CMake 4
+
+Upstream: N/A, dead upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5e81b09..32ff3a6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ project(cppdb)
+ 
+ set(CPPDB_MAJOR 0)
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
