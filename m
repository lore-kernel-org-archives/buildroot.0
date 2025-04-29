Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96D1C369DC
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 20:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15A49404E4;
	Tue, 29 Apr 2025 20:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmXVb4ijK8ni; Tue, 29 Apr 2025 20:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BBF640669
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BBF640669;
	Tue, 29 Apr 2025 20:04:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A0011C4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 102A460EE1
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFwGECqDbYAo for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 20:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6405560718
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6405560718
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FD6E86431; Tue, 29 Apr 2025 20:04:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Apr 2025 21:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d521d87ee5fea1d78b93fb5593b2a79e64336a6c
X-Git-Newrev: d4e5b293d87b491815ec58d6c0405893681e0722
X-Patchwork-Hint: ignore
Message-Id: <20250429200444.4FD6E86431@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-test: bump to 4.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4e5b293d87b491815ec58d6c0405893681e0722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update optee-test to the latest tagged release

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/optee-test/Config.in       | 4 ++--
 package/optee-test/optee-test.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index c01e3c06a7..dd1160ea48 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -48,7 +48,7 @@ config BR2_PACKAGE_OPTEE_TEST_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_TEST_LATEST
-	bool "4.5.0"
+	bool "4.6.0"
 	help
 	  Use the latest release tag from the optee-test official Git
 	  repository.
@@ -77,7 +77,7 @@ config BR2_PACKAGE_OPTEE_TEST_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_TEST_AS_OS
-	default "4.5.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
+	default "4.6.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_TEST
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 3192c72b93..058d95e29b 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cda3a4280a919cc6cd3cd3060e8c176cd42b968a9008305a6881e1fd433a6f1e  optee-test-4.5.0.tar.gz
+sha256  db4de73fa955a7db70a64a2c4ad1d2c48ddcb54c369821aba670fec6131a6f61  optee-test-4.6.0.tar.gz
 sha256  2b36458cd0292200e406a608efe7dfda17aae39646a86b730a2776b61d0fa410  LICENSE-BSD
 sha256  a094472b51f57d0403953d087e410793519cb6f3a7cea2be34eb44e09a426a73  LICENSE-GPL
 sha256  a562ab14c307d0e02b7bf6f1bdb0d1cf789409e6375a500e15dc7a0503e5c2c3  LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
