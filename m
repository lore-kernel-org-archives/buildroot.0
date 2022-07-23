Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C18C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EC2384B26;
	Sat, 23 Jul 2022 08:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EC2384B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sn-VDupxHQn0; Sat, 23 Jul 2022 08:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4DDF84B23;
	Sat, 23 Jul 2022 08:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4DDF84B23
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C76F1BF957
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1191A617B7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1191A617B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUttfTEk6TQG for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:49:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 349BB61AB2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 349BB61AB2
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B4483842C4; Sat, 23 Jul 2022 08:36:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 10:34:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb284ba92c754ca3c0b7f133b1804ed00e3ed244
X-Git-Newrev: f6b291499e04dda0dd8cabc9679da3ee13260085
X-Patchwork-Hint: ignore
Message-Id: <20220723083612.B4483842C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: bump to version
 3.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6b291499e04dda0dd8cabc9679da3ee13260085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps OP-TEE Client package version to OP-TEE release 3.18.0.
Removes patch that has been merged between OP-TEE tags 3.17.0 and 3.18.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ant-src-tee_supplicant.c-fix-build-withou.patch | 39 ----------------------
 package/optee-client/optee-client.hash             |  4 +--
 package/optee-client/optee-client.mk               |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch b/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch
deleted file mode 100644
index e41c9138ee..0000000000
--- a/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f2a7c942393c6383ac89d9264999cd9c93a70b80 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 14 May 2022 19:33:57 +0200
-Subject: [PATCH] tee-supplicant/src/tee_supplicant.c: fix build without
- plugins
-
-Fix the following build failure with CFG_TEE_SUPP_PLUGINS != y raised
-since version 3.17.0 and commit [1].
-
-/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.17.0/tee-supplicant/src/tee_supplicant.c:104:22: error: 'TEE_PLUGIN_LOAD_PATH' undeclared here (not in a function); did you mean 'TEEC_LOAD_PATH'?
-  104 |  .plugin_load_path = TEE_PLUGIN_LOAD_PATH,
-      |                      ^~~~~~~~~~~~~~~~~~~~
-      |                      TEEC_LOAD_PATH
-
-Link: [1] https://github.com/OP-TEE/optee_client/commit/876b1ae719e12890ddd96e85cd4e9862dab46448
-Fixes: http://autobuild.buildroot.org/results/384e0ca894dbc0ec72cea76141de890f1ce484db
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
-Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/OP-TEE/optee_client/commit/f2a7c942393c6383ac89d9264999cd9c93a70b80]
----
- tee-supplicant/src/tee_supplicant.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tee-supplicant/src/tee_supplicant.c b/tee-supplicant/src/tee_supplicant.c
-index 7b186ed9..53c29a26 100644
---- a/tee-supplicant/src/tee_supplicant.c
-+++ b/tee-supplicant/src/tee_supplicant.c
-@@ -101,7 +101,9 @@ static struct tee_shm *shm_head;
- 
- struct tee_supplicant_params supplicant_params = {
- 	.ta_dir = "optee_armtz",
-+#ifdef TEE_PLUGIN_LOAD_PATH
- 	.plugin_load_path = TEE_PLUGIN_LOAD_PATH,
-+#endif
- 	.fs_parent_path  = TEE_FS_PARENT_PATH,
- };
- 
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index d2efb1043a..8e55bf5725 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.17.0/optee-client-3.17.0.tar.gz
-sha256  bf62ceaac59e8a650abf7632e702b5929335f4974f3173f8c51900cb0f91660f  optee-client-3.17.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.18.0/optee-client-3.18.0.tar.gz
+sha256  ecc0f04fdd5398aa52fea50427fbd624f7f90274aec7bbf2cc8a5bd16758202b  optee-client-3.18.0.tar.gz
 # Locally computed
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index aaf072b40f..252841ba10 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.17.0
+OPTEE_CLIENT_VERSION = 3.18.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
