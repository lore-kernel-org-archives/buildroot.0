Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C882C369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 12:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92B7160B91;
	Sat, 12 Apr 2025 12:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARMS6ZGnvIvt; Sat, 12 Apr 2025 12:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43B46071A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A43B46071A;
	Sat, 12 Apr 2025 12:12:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB57108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F96640F5E
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zvlu1nlX8mr7 for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 12:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9592040FAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9592040FAC
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:12:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83F6384460; Sat, 12 Apr 2025 12:12:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Apr 2025 14:09:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11315d478782ef89a621518acaad9c2c39ad3b81
X-Git-Newrev: 726150b0e666bd6ce052bb631ac6034c6a2dd13e
X-Patchwork-Hint: ignore
Message-Id: <20250412121219.83F6384460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-test: fix license hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=726150b0e666bd6ce052bb631ac6034c6a2dd13e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] updated optee-test version but forgot to update
the license hash which was changed upstream in [2] to include
copies of the GPL-2.0 and BSD-2-Clause license files. While at
it, this commit also include those two new files in the license
hash file.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/8c2b2314df768a0add1fe45a9ad7dbcf2192d26f
[2] https://github.com/OP-TEE/optee_test/commit/a748f5fcd9ec8a574dc86a5aa56d05bc6ac174e7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/optee-test/optee-test.hash | 4 +++-
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index ba2cbaaa15..3192c72b93 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,3 +1,5 @@
 # Locally computed
 sha256  cda3a4280a919cc6cd3cd3060e8c176cd42b968a9008305a6881e1fd433a6f1e  optee-test-4.5.0.tar.gz
-sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
+sha256  2b36458cd0292200e406a608efe7dfda17aae39646a86b730a2776b61d0fa410  LICENSE-BSD
+sha256  a094472b51f57d0403953d087e410793519cb6f3a7cea2be34eb44e09a426a73  LICENSE-GPL
+sha256  a562ab14c307d0e02b7bf6f1bdb0d1cf789409e6375a500e15dc7a0503e5c2c3  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index c250639d06..23874b51b9 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -6,7 +6,7 @@
 
 OPTEE_TEST_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
-OPTEE_TEST_LICENSE_FILES = LICENSE.md
+OPTEE_TEST_LICENSE_FILES = LICENSE-BSD LICENSE-GPL LICENSE.md
 
 ifeq ($(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL),y)
 OPTEE_TEST_TARBALL = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
