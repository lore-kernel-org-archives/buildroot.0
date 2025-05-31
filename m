Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70444C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 08:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19C4A60790;
	Sat, 31 May 2025 08:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0O0YlSFxEJm8; Sat, 31 May 2025 08:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E93F60AFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E93F60AFB;
	Sat, 31 May 2025 08:26:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 849E4117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B4B660DE9
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqxPk3xi1at7 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 08:26:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A944E607B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A944E607B1
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:26:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98170876D5; Sat, 31 May 2025 08:26:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 31 May 2025 10:25:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5cff68d42c80e2ce619a3dc7c0f6c87d0f037e8f
X-Git-Newrev: b9a9930de0c873e68de1c8242ff9281d87eda722
X-Patchwork-Hint: ignore
Message-Id: <20250531082606.98170876D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/polkit: bump version
 to 126
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b9a9930de0c873e68de1c8242ff9281d87eda722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop the -Djs_engine=duktape option as mozjs support has been removed entirely
and as such, the option no longer exists.

Tested with `./support/testing/run-tests tests.package.test_polkit`
Both tests pass.

Also tested with `./utils/test-pkg -p polkit -a`
40 builds, 8 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index a3855adecd..f8499f5ed2 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ea5cd6e6e2afa6bad938ee770bf0c2cd9317910f37956faeba2869adcf3747d1  polkit-125.tar.gz
+sha256  2814a7281989f6baa9e57bd33bbc5e148827e2721ccef22aaf28ab2b376068e8  polkit-126.tar.gz
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 234e1cf415..653a2819c4 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 125
+POLKIT_VERSION = 126
 POLKIT_SITE = $(call github,polkit-org,polkit,$(POLKIT_VERSION))
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
@@ -20,8 +20,7 @@ POLKIT_LDFLAGS = $(TARGET_NLS_LIBS)
 POLKIT_CONF_OPTS = \
 	-Dman=false \
 	-Dexamples=false \
-	-Dsession_tracking=ConsoleKit \
-	-Djs_engine=duktape
+	-Dsession_tracking=ConsoleKit
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 POLKIT_CONF_OPTS += -Dintrospection=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
