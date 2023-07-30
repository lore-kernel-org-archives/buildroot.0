Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933B7C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19FD661019;
	Sun, 30 Jul 2023 20:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19FD661019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXCRh9IPMwLS; Sun, 30 Jul 2023 20:45:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3117C61028;
	Sun, 30 Jul 2023 20:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3117C61028
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC191BF86B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 641B46101A
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 641B46101A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j3amdIU_-Gz3 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 963026101B
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 963026101B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8647783CD3; Sun, 30 Jul 2023 20:44:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 22:43:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc6fbe7954d6b289787297ac2b37bab6a832d1e5
X-Git-Newrev: 0d219fd34f280d2d4a1ff86f5fcbf451d9297576
X-Patchwork-Hint: ignore
Message-Id: <20230730204443.8647783CD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmt: bump version to 10.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d219fd34f280d2d4a1ff86f5fcbf451d9297576
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/fmtlib/fmt/blob/master/ChangeLog.rst

Updated license hash due to upstream commit, no legal changes:
https://github.com/fmtlib/fmt/commit/48dfbcaa95f2043d29e3591ffd3090af4a5f33e2

This patch depends on bumping spdlog to version 1.12.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fmt/fmt.hash | 4 ++--
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 65eeaa4ebe..279f071262 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cceb4cb9366e18a5742128cb3524ce5f50e88b476f1e54737a47ffdf4df4c996  fmt-9.1.0.zip
-sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
+sha256  4943cb165f3f587f26da834d3056ee8733c397e024145ca7d2a8a96bb71ac281  fmt-10.0.0.zip
+sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index ed0703cbc9..f2c94b8231 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 9.1.0
+FMT_VERSION = 10.0.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
