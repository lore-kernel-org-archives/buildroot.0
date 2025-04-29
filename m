Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DD4C3ABA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 20:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3683660F20;
	Tue, 29 Apr 2025 20:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBJ09ObfKp8D; Tue, 29 Apr 2025 20:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3DA60F16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3DA60F16;
	Tue, 29 Apr 2025 20:04:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C8CAE4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35BF240422
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKcFnsnMWz2z for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 20:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B9D404E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79B9D404E6
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66A0486433; Tue, 29 Apr 2025 20:04:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Apr 2025 21:50:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 972bbabdcb785932c94a2908368a3e0473aef8bf
X-Git-Newrev: 4e271e6dccdd9b712077c12a4aa5aa8d82527531
X-Patchwork-Hint: ignore
Message-Id: <20250429200444.66A0486433@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: bump to 4.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e271e6dccdd9b712077c12a4aa5aa8d82527531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest version of optee-client

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/optee-client/Config.in         | 4 ++--
 package/optee-client/optee-client.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 865b0d8f31..ac3b680743 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_CLIENT_LATEST
-	bool "4.5.0"
+	bool "4.6.0"
 	help
 	  Use the latest release tag from the optee-client official Git
 	  repository.
@@ -60,7 +60,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_CLIENT_AS_OS
-	default "4.5.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default "4.6.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
 
 config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 2ef793c9d6..a5d98521a3 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac6dc2c0c253ea228ea230e537211a45475771050faf4e66fe64321de3a0a652  optee-client-4.5.0.tar.gz
+sha256  a970338c9f69861901336716d89684646e4480b9970996a5b3581ae7d49fdaa3  optee-client-4.6.0.tar.gz
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
