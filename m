Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC65C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:13:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A1960F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47A1960F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 255D64235B;
	Wed,  4 Aug 2021 00:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oj7Gp3YBvjlu; Wed,  4 Aug 2021 00:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C29D422B8;
	Wed,  4 Aug 2021 00:13:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55E651BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 064FF40F82
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCLkGBV0bE5i for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDEFA40EF3
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 21E50878D7; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 21:41:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2da43f20acbe84e55b6d6253d7fb127a0c5f0ae8
X-Git-Newrev: 5e590ede9447507aa99ba233ff71ae55f7c59f59
X-Patchwork-Hint: ignore
Message-Id: <20210803211011.21E50878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-client: bump to
 version 3.13.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5e590ede9447507aa99ba233ff71ae55f7c59f59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump OP-TEE Client package version to OP-TEE release 3.13.0.

Remove patch since addressed in that release.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-libckteec-add-missing-unistd.h-for-gid_t.patch | 31 ----------------------
 package/optee-client/optee-client.hash             |  4 +--
 package/optee-client/optee-client.mk               |  2 +-
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/package/optee-client/0001-libckteec-add-missing-unistd.h-for-gid_t.patch b/package/optee-client/0001-libckteec-add-missing-unistd.h-for-gid_t.patch
deleted file mode 100644
index 534f1d3bee..0000000000
--- a/package/optee-client/0001-libckteec-add-missing-unistd.h-for-gid_t.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6b908687d37dc4e5c00df90058990da034506628 Mon Sep 17 00:00:00 2001
-From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Tue, 9 Mar 2021 11:52:32 +0100
-Subject: [PATCH 1/1] libckteec: add missing <unistd.h> for gid_t
-
-Include missing unistd.h to support type gid_t. This change fixes [1].
-
-Link: [1] http://autobuild.buildroot.net/results/34b9946e6d59112a7eead304933534ad4739a84c/build-end.log
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
-Acked-by: Jerome Forissier <jerome@forissier.org>
-[yann.morin.1998@free.fr: actual backport now that upstream applied it]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- libckteec/src/invoke_ta.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libckteec/src/invoke_ta.c b/libckteec/src/invoke_ta.c
-index 6236719..70575d0 100644
---- a/libckteec/src/invoke_ta.c
-+++ b/libckteec/src/invoke_ta.c
-@@ -18,6 +18,7 @@
- #include <sys/types.h>
- #include <tee_client_api.h>
- #include <teec_trace.h>
-+#include <unistd.h>
- 
- #include "ck_helpers.h"
- #include "invoke_ta.h"
--- 
-2.25.1
-
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 253c29e22a..5d14f1023c 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.12.0/optee-client-3.12.0.tar.gz
-sha256 f75c45b40147217fa8f4a2ae1e4c06b24eb45d35167854fa9ad3ec3d6a73e858  optee-client-3.12.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.13.0/optee-client-3.13.0.tar.gz
+sha256 2ec6f05f833dce458f0358104e83e28e9a7643b81cfd96db32a7a1fadcc1e3af  optee-client-3.13.0.tar.gz
 # Locally computed
 sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 22f205e407..b73e76775e 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.12.0
+OPTEE_CLIENT_VERSION = 3.13.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
