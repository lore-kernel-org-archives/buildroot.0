Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B24CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:30:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC4A760F39
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC4A760F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 826A160B28;
	Wed, 27 Oct 2021 20:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id scNYNeRTSsQ6; Wed, 27 Oct 2021 20:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA7C2607AF;
	Wed, 27 Oct 2021 20:30:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 203221BF9CB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D32760B20
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afNoNb13jW7P for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 643D0605E9
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 12DED8903F; Wed, 27 Oct 2021 20:27:04 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:28:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a694f050cbdb2558af1515ea4aba32f3a5bb3d84
X-Git-Newrev: 404ce934fd36cc71ffa65f5ee1f1509a1f53239a
X-Patchwork-Hint: ignore
Message-Id: <20211027202704.12DED8903F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: bump to version
 3.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=404ce934fd36cc71ffa65f5ee1f1509a1f53239a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Client package version to OP-TEE release 3.15.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/optee-client/optee-client.hash | 4 ++--
 package/optee-client/optee-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 5d14f1023c..3ae06f2afb 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.13.0/optee-client-3.13.0.tar.gz
-sha256 2ec6f05f833dce458f0358104e83e28e9a7643b81cfd96db32a7a1fadcc1e3af  optee-client-3.13.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.15.0/optee-client-3.15.0.tar.gz
+sha256 e1ea6c953e3584248d7a62050813e5ac0f0112933447954c44236a233a4cbba5  optee-client-3.15.0.tar.gz
 # Locally computed
 sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index b73e76775e..20147c89a8 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.13.0
+OPTEE_CLIENT_VERSION = 3.15.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
