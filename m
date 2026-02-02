Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA138E7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA09402B7;
	Mon,  2 Feb 2026 17:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Qq8uO23Grvv; Mon,  2 Feb 2026 17:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6718E409FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054246;
	bh=ORhxWMrbrAqshe9skgs2nFiRbGRbeESOjc1cFkfDQIE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fJblhUYXAScX962OFw1gncLYL39vHlJbmCpUUR+aRheEVhbhImvLkd2lGXyqocgaE
	 tMMTeqmunO3v3h4RFjNAYb3z7XuODIax63MSnSExSwACGaRIa7xIxy28t8qiDlszeG
	 BofhZDaf1aDDWfLxdAERKYBREVB0zyHVzgioDAf1R7enA2Np+alGurgAjFryRDtM7n
	 9VxufdtUnbD0G07OyuqztGY89PCBgnNngf/Jqt1a53l/IRyPzy2LmQ2PD0UgfEbM/x
	 iJ9Ip7YcS7GY35n4w4ek5e/bjrWmAUz283hQm5aEs21HiLsNqG+v/g8gwmrWFkSuUP
	 BIcBL77JXRunQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6718E409FC;
	Mon,  2 Feb 2026 17:44:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86FEC23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72FD5822A2
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTVki4kdDvGk for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6FE821C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF6FE821C0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2C578645C; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:43:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4d5b20462602aa89a7e6a5587cb187f71e31d5e
X-Git-Newrev: 71e8ca62ddf898c6278ec5d89af32afebf54ac9d
X-Patchwork-Hint: ignore
Message-Id: <20260202174403.A2C578645C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] optee-os: Add support for custom license
 files
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71e8ca62ddf898c6278ec5d89af32afebf54ac9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OP-TEE OS package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 boot/optee-os/Config.in   | 8 ++++++++
 boot/optee-os/optee-os.mk | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index e737d2a0ac..4bd7debefd 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -86,6 +86,14 @@ config BR2_TARGET_OPTEE_OS_VERSION
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
+config BR2_TARGET_OPTEE_OS_LICENSE_FILES
+	string "OP-TEE OS license files" if BR2_TARGET_OPTEE_OS_CUSTOM_GIT || \
+		BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
+	default "LICENSE"
+	help
+	  A space-separated list of license files related to the
+	  OPTEE-OS package.
+
 config BR2_TARGET_OPTEE_OS_NEEDS_DTC
 	bool "OP-TEE OS needs dtc"
 	select BR2_PACKAGE_HOST_DTC
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 25c917e2fc..1639597407 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -6,9 +6,7 @@
 
 OPTEE_OS_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_VERSION))
 OPTEE_OS_LICENSE = BSD-2-Clause
-ifeq ($(BR2_TARGET_OPTEE_OS_LATEST),y)
-OPTEE_OS_LICENSE_FILES = LICENSE
-endif
+OPTEE_OS_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_OPTEE_OS_LICENSE_FILES))
 
 OPTEE_OS_CPE_ID_PREFIX = cpe:2.3:o
 OPTEE_OS_CPE_ID_VENDOR = linaro
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
