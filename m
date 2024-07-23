Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B39C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AD66402BC;
	Tue, 23 Jul 2024 08:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQKr1-oDPMmc; Tue, 23 Jul 2024 08:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CABC409E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CABC409E5;
	Tue, 23 Jul 2024 08:51:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BF4B1BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 457F380EA0
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6Ej5EnuiPzu for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C33180E86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C33180E86
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 656FA87174; Tue, 23 Jul 2024 08:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:51:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e30d507cbb42e9f061aac93310aef98a02d06eca
X-Git-Newrev: 280a045705a065bd67114e31561209ffd0e1ba90
X-Patchwork-Hint: ignore
Message-Id: <20240723085131.656FA87174@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: bump to 4.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=280a045705a065bd67114e31561209ffd0e1ba90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest version of optee-client

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-client/optee-client.hash | 4 ++--
 package/optee-client/optee-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index b0c6dfcb5e..8904c930ee 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/4.2.0/optee-client-4.2.0.tar.gz
-sha256  ba0dad79cec2dabb7b6a6d3e391804f0184863ee9810e90bf97a392d3c1ad5eb  optee-client-4.2.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/4.3.0/optee-client-4.3.0.tar.gz
+sha256  a9a91bdb433df795c87a6d15198effbd648e3671ae611f2a3f8b41229d61cce0  optee-client-4.3.0.tar.gz
 # Locally computed
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 6600a9c4fc..c1813cd9b1 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 4.2.0
+OPTEE_CLIENT_VERSION = 4.3.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
