Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25C8C83F15
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63F8341813;
	Wed, 30 Aug 2023 22:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F8341813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4Z8RCu0rwJX; Wed, 30 Aug 2023 22:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79AFA41883;
	Wed, 30 Aug 2023 22:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79AFA41883
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 236F51BF98D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F14FD41839
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F14FD41839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxvSdRXrxY1L for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F709402EB
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F709402EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F5B0866BC; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 00:25:26 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 320dbd06ddfc8bd1257a4904a50139edc610f67f
X-Git-Newrev: 67564d1da2fa738c7d683e0f7cee725b75518aed
X-Patchwork-Hint: ignore
Message-Id: <20230830223119.1F5B0866BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/sam-ba: drop
 32bit host lib requirement
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

commit: https://git.buildroot.net/buildroot/commit/?id=67564d1da2fa738c7d683e0f7cee725b75518aed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Current versions of sam-ba are 64bit only.

objdump -p $(HOST_DIR)/bin/sam-ba
$(HOST_DIR)/bin/sam-ba: file format elf64-x86-64

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 71b5ea4030a25f84375a5e23d0eae6cf49ffe5a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
