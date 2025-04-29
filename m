Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061C8C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC2A845FA;
	Mon, 19 May 2025 10:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfwPPo5FXg-y; Mon, 19 May 2025 10:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEEDC845FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEEDC845FB;
	Mon, 19 May 2025 10:58:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2806BD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 286A14148E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1aMfkIAmSWg for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D672412CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D672412CA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BDF8872E7; Mon, 19 May 2025 10:39:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Apr 2025 21:50:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d4e5b293d87b491815ec58d6c0405893681e0722
X-Git-Newrev: 972bbabdcb785932c94a2908368a3e0473aef8bf
X-Patchwork-Hint: ignore
Message-Id: <20250519103958.3BDF8872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-examples: bump
 to 4.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=972bbabdcb785932c94a2908368a3e0473aef8bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update optee-examples to the latest tagged release

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/optee-examples/Config.in           | 4 ++--
 package/optee-examples/optee-examples.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 222beb2af1..702adc84db 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
-	bool "4.5.0"
+	bool "4.6.0"
 	help
 	  Use the latest release tag from the optee-examples official
 	  Git repository.
@@ -72,7 +72,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
-	default "4.5.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	default "4.6.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_EXAMPLES
diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 5a12bb22ba..54b98868d7 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3fcf1f9eab8d094f898bbb3e2a69a0ca321765f39c832749fdb571a21063bcfc  optee-examples-4.5.0.tar.gz
+sha256  6891390aefa2046d500d3ffec05c327d7763e89645b2e99ef2330b561ba645f5  optee-examples-4.6.0.tar.gz
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
