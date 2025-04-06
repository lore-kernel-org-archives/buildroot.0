Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDCBC36002
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 15:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D279A607A5;
	Sun,  6 Apr 2025 15:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_2kmRP5pVmM; Sun,  6 Apr 2025 15:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9C360BD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9C360BD6;
	Sun,  6 Apr 2025 15:46:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 826601F1
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 15:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 688A04038B
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 15:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pASRqifrziOq for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 15:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DA9E4038C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DA9E4038C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DA9E4038C
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 15:46:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DBB9CB00579;
 Sun,  6 Apr 2025 17:46:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun,  6 Apr 2025 17:46:19 +0200
Message-ID: <20250406154619.66634-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743954389;
 bh=x47+5eIJz5bI/FBcuYduTfzAkRA1ImvjWX7PEAD5pkE=;
 h=From:To:Cc:Subject:Date:From;
 b=lVnCtvAEq9MLFfcuwT804jpY2oVIYjH+aSO8xqyANrZvbDTuNPwaWh/ljthwj3Qer
 fQrn0LEqfuTWT+jI6g9IhANSsCFNXhxG2Ane5Kwha3p/V5HMJxqtV60Lfca1UIYhtY
 YaxjNllonuc5k0Kd3F3BH/5nAVnrJbegIeDWOI5Q39cN8OLPt6RrlsDxeqqC8QxA9o
 Xd3uXoXg8CgRcx5jXTZ1ZzhSH2aSDIYWUhYB5EjTA8ISfL5Zy+KLZuMFm4x7jRozXU
 Df8E7+NkLA5rCCc3C9Tn8ww44KXUKtfG5ixWu8Dx2FVmPVP6b8uZmcOpbmU5lD3GeS
 W7NcIRurtQMOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lVnCtvAE
Subject: [Buildroot] [PATCH 1/1] package/optee-test: fix license hash
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
