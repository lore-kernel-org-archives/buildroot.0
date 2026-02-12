Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE67EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0CA48456E;
	Fri, 13 Feb 2026 19:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lH9Uh1J2uYte; Fri, 13 Feb 2026 19:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14DB3845C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011475;
	bh=tC/SfoSFmmAkO4yNaY8tkXx9tK26Af04S5XgCyiBP3c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rUJkwi7Mxsm3Vi3RF2t30G5jiNLTc6rQ0GoDCpK2+x0NJJZQnubLyAr2RtP9CvwKz
	 5ECNV9Fw2C8KQCgz6rreFgk48QumYlITanoFMTpcV1Uaiaaa18gGuul7f1r69g2npQ
	 /hL53uKDpnFIBHcSct3OGs61SlUu+pfkgw6wa0jjyWahC+FBdPjWzw7MLMnC4Sf7LO
	 KygZJZXxa3QFLavjp7X5vct5MaIy+o8o3y4aWDIdLhJW3kAJS33G8qOpFQHkVeBVI8
	 L/KqCWOoHQyATlMDKAQHg600Y290JY3DM8D8bmrZBCZtFqwBiR8quQlebKYgzqePLY
	 F7pgpligyGDuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14DB3845C8;
	Fri, 13 Feb 2026 19:37:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 441CA69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 351BE4133A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RULdK2M0lVp for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB6D9412CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB6D9412CB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0758857B3; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:27:51 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6673c79b99949024b1e74ba17b76d96d4a24d9f2
X-Git-Newrev: ba6335ebe87d7bdda19472df23d79b2e4fbebb5e
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.C0758857B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] optee-os: Add support for
 custom license files
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba6335ebe87d7bdda19472df23d79b2e4fbebb5e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The OP-TEE OS package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 71e8ca62ddf898c6278ec5d89af32afebf54ac9d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
