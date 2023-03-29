Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEE5C74A5B
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 13:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C83B41E0A;
	Wed, 29 Mar 2023 13:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C83B41E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_-s_Fa1fwS4; Wed, 29 Mar 2023 13:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6269741E4C;
	Wed, 29 Mar 2023 13:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6269741E4C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A233F1BF966
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 13:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C42C61485
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 13:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C42C61485
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z06ge9OsyCcN for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 13:06:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 558EF60B36
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 558EF60B36
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 13:06:36 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id A61A65C3EC8;
 Wed, 29 Mar 2023 15:06:32 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 15:06:21 +0200
Message-Id: <3353638b327bdae83651d298bdf91e1db19c8f26.1680095165.git.stefan@agner.ch>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1680095192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=mj6+KSYcw28Cz4deNIXYOp+n6/f/Y/VAYSdHrUUx404=;
 b=lQganIPtmOe+msc+f9/m4rxXNh6smCWTsC97PgtFBXuyZ9+Ak06kb0wEBjymX7hkJeQZJC
 eDkTTDFxntRi4Wocxf4/7Xb3H6w9RZauF/daIR4RzGymGGHwAcQoJEXKVP5wqnNdDmLPAa
 sWXPe2+lc8TppgeGvQBZHYeU8yf0oL8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=lQganIPt
Subject: [Buildroot] [PATCH] package/docker-engine: bump version to v23.0.2
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
Cc: Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release contains some fixes and addresses CVE-2023-2605. For the
full list see:
https://github.com/moby/moby/releases/tag/v23.0.2

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 99ab5e4003..4b7c026eef 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c8e6c0ac5f0c772023e3430f80190e0f86644b6d94cac63118b03561385f7b56  docker-engine-23.0.1.tar.gz
+sha256  4caca59c774445a5aad6114d89c97c88d9705f048704fecdd3f5712cb369dc39  docker-engine-23.0.2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c61aa491c2..a27625a38e 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 23.0.1
+DOCKER_ENGINE_VERSION = 23.0.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
