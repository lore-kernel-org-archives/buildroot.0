Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C3AC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9F306F49B;
	Mon, 19 May 2025 10:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7srM3ev4TzU; Mon, 19 May 2025 10:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF62B6F4C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF62B6F4C6;
	Mon, 19 May 2025 10:48:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B080193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB4A14127A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIWD385jb-dT for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 778D640E22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 778D640E22
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7545A84A21; Mon, 19 May 2025 10:39:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Apr 2025 11:22:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 14ef1ed7d27ba2f6d99bbdd0d80f67df50fccce9
X-Git-Newrev: 280162a468dd6bc88e428636a4c3c47d58b0042e
X-Patchwork-Hint: ignore
Message-Id: <20250519103947.7545A84A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-client: bump to
 4.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=280162a468dd6bc88e428636a4c3c47d58b0042e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to the latest version of optee-client

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
[Julien: move package archive hash to the "Locally computed" section]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/optee-client/Config.in         | 4 ++--
 package/optee-client/optee-client.hash | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index efed800a87..865b0d8f31 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_CLIENT_LATEST
-	bool "4.3.0"
+	bool "4.5.0"
 	help
 	  Use the latest release tag from the optee-client official Git
 	  repository.
@@ -60,7 +60,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_CLIENT_AS_OS
-	default "4.3.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default "4.5.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
 
 config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 8904c930ee..2ef793c9d6 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,3 @@
-# From https://github.com/OP-TEE/optee_client/archive/4.3.0/optee-client-4.3.0.tar.gz
-sha256  a9a91bdb433df795c87a6d15198effbd648e3671ae611f2a3f8b41229d61cce0  optee-client-4.3.0.tar.gz
 # Locally computed
+sha256  ac6dc2c0c253ea228ea230e537211a45475771050faf4e66fe64321de3a0a652  optee-client-4.5.0.tar.gz
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
