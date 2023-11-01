Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B5CC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C97E430DE;
	Wed,  1 Nov 2023 11:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C97E430DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9BBjfO9u84x; Wed,  1 Nov 2023 11:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B7F74016C;
	Wed,  1 Nov 2023 11:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B7F74016C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2222B1BF954
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F032784937
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F032784937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Botu1LSZ95O9 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 243C4848E4
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 243C4848E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C9708631D; Wed,  1 Nov 2023 11:26:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 12:25:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdf1506e9664b7b7d2441496192723e26383623d
X-Git-Newrev: d6279bc82c02b43c9a2f28c36639e092b9e9e08b
X-Patchwork-Hint: ignore
Message-Id: <20231101112613.0C9708631D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: bump to version 0.16.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6279bc82c02b43c9a2f28c36639e092b9e9e08b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to version 0.16.2, which brings in support for a few new Wayland
protocols, and improved input device and scene graph APIs. Applications
which use wlroots might need to be adapted, and at least rebuilt. The
only packages in Buildroot which use wlroots at the moment are the Cage
and Sway compositors, to be updated in follow-up patches.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 04bbd65e43..8ab05393b1 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.15.1/downloads/wlroots-0.15.1.tar.gz.sig
-sha256  5b92f11a52d978919ed1306e0d54c9d59f1762b28d44f0a2da3ef3b351305373  wlroots-0.15.1.tar.gz
+# Generated locally, after checking https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.16.2/downloads/wlroots-0.16.2.tar.gz.sig
+sha256  83e9a11605f23d4bf781ab1947089483d9ec3f7e9ba65398e0609593b77d44aa  wlroots-0.16.2.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 5b930a51be..b478e57abb 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.15.1
+WLROOTS_VERSION = 0.16.2
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
