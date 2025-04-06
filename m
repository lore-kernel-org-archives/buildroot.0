Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E645AC3601A
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 10:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D90040995;
	Sun,  6 Apr 2025 10:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiRPYcgcDhZr; Sun,  6 Apr 2025 10:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D66BB409FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D66BB409FC;
	Sun,  6 Apr 2025 10:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2F5E1F1
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 10:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B95DC409F0
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 10:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QNndM2Iu9tq for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 10:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C674094E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11C674094E
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 10:20:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F374F83C2A; Sun,  6 Apr 2025 10:20:05 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Apr 2025 11:23:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70035cbb1e9223a703317c6e466a7216158bcf2f
X-Git-Newrev: 8c2b2314df768a0add1fe45a9ad7dbcf2192d26f
X-Patchwork-Hint: ignore
Message-Id: <20250406102005.F374F83C2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-test: bump to 4.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c2b2314df768a0add1fe45a9ad7dbcf2192d26f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update optee-test to the latest tagged release

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
[Julien: move package archive hash to the "Locally computed" section]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/optee-test/Config.in       | 4 ++--
 package/optee-test/optee-test.hash | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index 03b532e338..c01e3c06a7 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -48,7 +48,7 @@ config BR2_PACKAGE_OPTEE_TEST_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_TEST_LATEST
-	bool "4.3.0"
+	bool "4.5.0"
 	help
 	  Use the latest release tag from the optee-test official Git
 	  repository.
@@ -77,7 +77,7 @@ config BR2_PACKAGE_OPTEE_TEST_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_TEST_AS_OS
-	default "4.3.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
+	default "4.5.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_TEST
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 5922487a62..ba2cbaaa15 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,3 @@
-# From https://github.com/OP-TEE/optee_test/archive/4.3.0/optee-test-4.3.0.tar.gz
-sha256  7bb181b74be88593df48321b816837acaad8e4d45e883f25a2e039978e5ec415  optee-test-4.3.0.tar.gz
 # Locally computed
+sha256  cda3a4280a919cc6cd3cd3060e8c176cd42b968a9008305a6881e1fd433a6f1e  optee-test-4.5.0.tar.gz
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
