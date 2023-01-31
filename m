Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DBAC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8F24EB9A;
	Mon, 20 Feb 2023 23:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC8F24EB9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjZRYhNly4tK; Mon, 20 Feb 2023 23:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC06A4EBA1;
	Mon, 20 Feb 2023 23:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC06A4EBA1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3E61BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8952641791
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8952641791
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HakeRg7vxD9f for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9635641788
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9635641788
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 926038648F; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 23:34:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 039dfca25290c4cebe1b7d859a03944598f4c104
X-Git-Newrev: dedbc69022ba0beaf259463ac8082c86776f7e88
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.926038648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fluent-bit: only
 require a C compiler
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

commit: https://git.buildroot.net/buildroot/commit/?id=dedbc69022ba0beaf259463ac8082c86776f7e88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
- http://autobuild.buildroot.net/results/007/007c7c69e54b8ff663891da4535e2e95d40c42a2/build-end.log
- http://autobuild.buildroot.net/results/ede/ede6f9fb67c0c26ff02e71a3d20e3d4344ea59f0/build-end.log

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Peter: replace by upstream patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-CMakeLists.txt-only-require-a-C-compiler.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch b/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..e71bcf0c0d
--- /dev/null
+++ b/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch
@@ -0,0 +1,27 @@
+From 7bcb502ebdcd647d6b83c972805e734ad522eb1a Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Mon, 30 Jan 2023 09:10:37 +0100
+Subject: [PATCH] CMakeLists.txt: only require a C compiler
+
+Fluent-bit is mostly written in C,
+so don't require CXX in the top-level project.
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a7adb02de..3ff7360d8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 3.12)
+-project(fluent-bit)
++project(fluent-bit C)
+ 
+ # CMP0069 ensures that LTO is enabled for all compilers
+ cmake_policy(SET CMP0069 NEW)
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
