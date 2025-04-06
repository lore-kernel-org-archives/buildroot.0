Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35029C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B3360F80;
	Mon, 19 May 2025 10:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BrxsOYkoO43; Mon, 19 May 2025 10:47:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29FB1616EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29FB1616EA;
	Mon, 19 May 2025 10:47:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BC1AE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 844BA41246
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12AbjP8skOku for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8131D40DB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8131D40DB2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DE0383B63; Mon, 19 May 2025 10:39:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Apr 2025 11:23:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 280162a468dd6bc88e428636a4c3c47d58b0042e
X-Git-Newrev: 70035cbb1e9223a703317c6e466a7216158bcf2f
X-Patchwork-Hint: ignore
Message-Id: <20250519103947.7DE0383B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-examples: bump
 to 4.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70035cbb1e9223a703317c6e466a7216158bcf2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update optee-examples to the latest tagged release

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
[Julien: move package archive hash to the "Locally computed" section]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/optee-examples/Config.in           | 4 ++--
 package/optee-examples/optee-examples.hash | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 5c5b0ce5ba..222beb2af1 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
-	bool "4.3.0"
+	bool "4.5.0"
 	help
 	  Use the latest release tag from the optee-examples official
 	  Git repository.
@@ -72,7 +72,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
-	default "4.3.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	default "4.5.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_EXAMPLES
diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index a6ecd2caec..5a12bb22ba 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,3 @@
-# From https://github.com/linaro-swg/optee_examples/archive/4.3.0/optee-examples-4.3.0.tar.gz
-sha256  ee1576617365b5fe9d20d72c16cf6b39159eb79b1401189bd37a91ef03371820  optee-examples-4.3.0.tar.gz
 # Locally computed
+sha256  3fcf1f9eab8d094f898bbb3e2a69a0ca321765f39c832749fdb571a21063bcfc  optee-examples-4.5.0.tar.gz
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
