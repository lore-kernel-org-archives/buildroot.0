Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ADDC4167D
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1893607E3;
	Sat,  4 Nov 2023 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1893607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRYnPwgmPwhE; Sat,  4 Nov 2023 20:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5779D608A6;
	Sat,  4 Nov 2023 20:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5779D608A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1CE1BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA24C608A6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA24C608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6pq0l7eR6FS for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:45:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DADCB607D0
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DADCB607D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAC768285B; Sat,  4 Nov 2023 20:45:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:43:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a29c3144a49758f7c9cd9ff5cbb8e446bfc605f1
X-Git-Newrev: 2eff004fe61177b35a09f944eaa5c616ff36838e
X-Patchwork-Hint: ignore
Message-Id: <20231104204539.CAC768285B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: drop experimental
 build flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=2eff004fe61177b35a09f944eaa5c616ff36838e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Docker v1.13.0 experimental only exists as a runtime flag. Drop
the config from buildroot as well.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-engine/Config.in        | 3 ---
 package/docker-engine/docker-engine.mk | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 570b2ff681..71bf670f17 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -19,9 +19,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
 
 if BR2_PACKAGE_DOCKER_ENGINE
 
-config BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL
-	bool "build experimental features"
-
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 	bool "btrfs filesystem driver"
 	depends on BR2_USE_MMU # btrfs-progs
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 34e74c09c6..262be2df20 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -34,9 +34,6 @@ ifeq ($(BR2_INIT_SYSTEMD),y)
 DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
 endif
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
-DOCKER_ENGINE_TAGS += experimental
-endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
 DOCKER_ENGINE_DEPENDENCIES += btrfs-progs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
