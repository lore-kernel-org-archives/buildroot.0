Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C65C02196
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5498C4144B;
	Mon,  3 Feb 2025 17:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JTigtumdYGH; Mon,  3 Feb 2025 17:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F86241452
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F86241452;
	Mon,  3 Feb 2025 17:44:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9987412A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D9858202B
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ru3M-9jXQ9sZ for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B11DC8201E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B11DC8201E
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:44:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A80FB869AE; Mon,  3 Feb 2025 17:44:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 18:41:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 843cf79ff1687021b3a4fb508e546ad80a22779a
X-Git-Newrev: a92b74c20cfd21830814ec7010144dabab86a0d6
X-Patchwork-Hint: ignore
Message-Id: <20250203174428.A80FB869AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-test: add option to use same
 version as optee-os
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
Content-Type: multipart/mixed; boundary="===============1758482699989942127=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1758482699989942127==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a92b74c20cfd21830814ec7010144dabab86a0d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can select a custom official version for the optee-os package; add an
option to select the same version for optee-test, to easily keep them
synchronized.

Break one unrelated long line in the mean time to keep formatting
harmonious.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Étienne Carrière <etienne.carriere@foss.st.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/optee-test/Config.in | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index a29eb355ac..03b532e338 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -36,10 +36,17 @@ if BR2_PACKAGE_OPTEE_TEST
 
 choice
 	prompt "optee-test version"
-	default BR2_PACKAGE_OPTEE_TEST_LATEST if BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	default BR2_PACKAGE_OPTEE_TEST_AS_OS \
+				if BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
+	default BR2_PACKAGE_OPTEE_TEST_LATEST \
+				if BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	help
 	  Select the version of optee-test you want to use
 
+config BR2_PACKAGE_OPTEE_TEST_AS_OS
+	bool "Same as optee-os being built"
+	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
+
 config BR2_PACKAGE_OPTEE_TEST_LATEST
 	bool "4.3.0"
 	help
@@ -68,6 +75,8 @@ endif
 
 config BR2_PACKAGE_OPTEE_TEST_VERSION
 	string
+	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
+				if BR2_PACKAGE_OPTEE_TEST_AS_OS
 	default "4.3.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
 

--===============1758482699989942127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1758482699989942127==--
