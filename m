Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04796E7B610
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 13:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 852C76058D;
	Wed,  4 Oct 2023 13:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 852C76058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YID9wENsSQ31; Wed,  4 Oct 2023 13:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A982E605B5;
	Wed,  4 Oct 2023 13:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A982E605B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5861BF3F9
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E38BC42201
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E38BC42201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCIjClyeBJzW for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 13:02:12 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CBD5421F5
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 13:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CBD5421F5
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 71E445C92A2;
 Wed,  4 Oct 2023 15:02:07 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 15:01:34 +0200
Message-ID: <6e269338d657663f4008a5acb9da58ba26f59898.1696424479.git.stefan@agner.ch>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1696424527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=kxzleKgZJ39K2euWlTlzQqZPgcp9t8HoCFPrduHY0KI=;
 b=kLECaQixX6Yfdg9dH/hxASphl2kgfjgB0qC0G1bsORMe1BbPZhW/AKZ/9SZ7FvVdHbaGL6
 lMh5sjD4tprGkeYt5MEcr74dIPV65vdpc9avraOG2HZeYJ9cxu0oPk9QYhyRXtn9Odryw+
 kaqG7Gx+VIMQdwlewzP8EWlhvxbQrYM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=kLECaQix
Subject: [Buildroot] [PATCH] package/docker-engine: Drop experimental build
 flag
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
Cc: Stefan Agner <stefan@agner.ch>, christian@aperture.us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Docker v1.13.0 experimental only exists as a runtime flag. Drop
the config from buildroot as well.

Signed-off-by: Stefan Agner <stefan@agner.ch>
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
index a8f47254a4..369a1b2826 100644
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
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
