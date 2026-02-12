Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9585FEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5973561386;
	Fri, 13 Feb 2026 19:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7mzxOntcf-r; Fri, 13 Feb 2026 19:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7901C61387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011335;
	bh=F9g9ygnvoqlvI65nDvXfdFC4TPIlUzgotrsouGvIrvA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I2DpN8YagiMKnLXcUn7PsW+xS0ixvufg2WYZ6GNMijvQNolE03jFAGfnJS40apnpd
	 4RZgnyXIwwqlp98e07ssoVfBWo2EKZ+hpolJhi6BxOQmNC44NLrQhfqg/r2NKYVbjb
	 tECtcW7pKw5DmlzrBnjceq4l2g79p6jx+GKJs3oawxG41plTVLceXcKySI4VQ7a7CW
	 kctwrFcWtP/0GciDQjLBz8LW8KmQ0ZKfnJTvNMr66W1DpJQlz7e3wkVBiTMOGteAYY
	 rYASGWoW0euYJEBTIMyZ1of9tkvp3aaBy5puhCjykC06sYLsSnIoFpq0CH521gVsXy
	 0LIYPa9455iKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7901C61387;
	Fri, 13 Feb 2026 19:35:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32DE769
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E14AE41280
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tff1qrzAuE6k for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ABCD40380
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ABCD40380
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F34F483B01; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:27:48 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d9d7fa67d7d784d3d1bc31a625794ad3beaa42c0
X-Git-Newrev: d09650eb9575a49e9b7246d47ae521014d69d8c3
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.F34F483B01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] optee-os: Add support for
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d09650eb9575a49e9b7246d47ae521014d69d8c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 6c4afccc7a..ff18236843 100644
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
