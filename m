Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B7EE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8717280BDF;
	Wed,  8 Jan 2025 21:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSaRbLypn3hV; Wed,  8 Jan 2025 21:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4D8D8049F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4D8D8049F;
	Wed,  8 Jan 2025 21:44:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0DF51FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEFAB8049F
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgu3Dje0JEcd for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0B0580BDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B0580BDE
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:44:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBDF481479; Wed,  8 Jan 2025 21:44:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 21:51:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1220b505bc454643b1d7e7d812669beb9afc8dc9
X-Git-Newrev: 0f3791f25f5039904765c33f1d8a812290caebb9
X-Patchwork-Hint: ignore
Message-Id: <20250108214419.BBDF481479@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: add custom version option
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
Content-Type: multipart/mixed; boundary="===============4586920213481619037=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4586920213481619037==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0f3791f25f5039904765c33f1d8a812290caebb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add custom version option, to enable easily specifying an official OP-TEE
version to use.
This is similar to what is done in other packages, such as linux, uboot or
arm-trusted-firmware.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Étienne Carrière <etienne.carriere@foss.st.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/optee-os/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index cc0044f00a..6c4afccc7a 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -25,6 +25,11 @@ config BR2_TARGET_OPTEE_OS_LATEST
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
 
+config BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official version
+
 config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	bool "Custom tarball"
 	help
@@ -43,6 +48,10 @@ config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
 endchoice
 
+config BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE
+	string "OP-TEE version"
+	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
+
 if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 
 config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION
@@ -71,6 +80,8 @@ endif
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
 	default "4.3.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
+		if BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT

--===============4586920213481619037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4586920213481619037==--
