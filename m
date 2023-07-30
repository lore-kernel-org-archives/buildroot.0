Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759E9EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13B6F60804;
	Sun, 30 Jul 2023 21:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B6F60804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piIYM78uWGha; Sun, 30 Jul 2023 21:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D392661021;
	Sun, 30 Jul 2023 21:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D392661021
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E06AD1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B993D416BC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B993D416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzxEevAKmvRm for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:41:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8FB541686
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8FB541686
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A498883D3B; Sun, 30 Jul 2023 21:41:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 23:41:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47a3eb132d22d7b21dd98d987f43a297615b4fa6
X-Git-Newrev: 71b5ea4030a25f84375a5e23d0eae6cf49ffe5a8
X-Patchwork-Hint: ignore
Message-Id: <20230730214155.A498883D3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sam-ba: drop 32bit host lib
 requirement
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71b5ea4030a25f84375a5e23d0eae6cf49ffe5a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current versions of sam-ba are 64bit only.

objdump -p $(HOST_DIR)/bin/sam-ba
$(HOST_DIR)/bin/sam-ba: file format elf64-x86-64

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                     | 2 +-
 package/sam-ba/Config.in.host | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 0d7641633c..670e199c0b 100644
--- a/Config.in
+++ b/Config.in
@@ -65,7 +65,7 @@ config BR2_NEEDS_HOST_JAVA
 
 # Hidden boolean selected by pre-built packages for x86, when they
 # need to run on x86-64 machines (example: pre-built external
-# toolchains, binary tools like SAM-BA, etc.).
+# toolchains, binary tools, etc.).
 config BR2_HOSTARCH_NEEDS_IA32_LIBS
 	bool
 
diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index 1967f33ab3..cd11e8633e 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_HOST_SAM_BA
 	bool "host sam-ba"
 	depends on BR2_HOSTARCH = "x86_64"
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Atmel SAM-BA software provides an open set of tools for
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
