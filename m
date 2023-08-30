Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C26C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED14B4183E;
	Wed, 30 Aug 2023 22:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED14B4183E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2IlFMB6CrNS; Wed, 30 Aug 2023 22:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18DF0418B1;
	Wed, 30 Aug 2023 22:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18DF0418B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C606F1BF98D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F547821FB
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F547821FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDn4h8LYknDC for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:32:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B432480A47
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B432480A47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4187866D8; Wed, 30 Aug 2023 22:32:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 00:25:17 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4d292bc080f42c0b74cb4363e25d024743675793
X-Git-Newrev: 7df514e36734fe05fc725a07eacaf129a58512da
X-Patchwork-Hint: ignore
Message-Id: <20230830223233.A4187866D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sam-ba: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=7df514e36734fe05fc725a07eacaf129a58512da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
