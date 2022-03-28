Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859EAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 20:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2412C60FD2;
	Mon, 28 Mar 2022 20:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jU8ozybDDHb1; Mon, 28 Mar 2022 20:31:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 341A361013;
	Mon, 28 Mar 2022 20:31:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA1521BF388
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C18EF403A8
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7o2EVDzcz5Vp for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 20:31:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89C8D40382
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 20:31:51 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.53.199])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4ACEEB00548;
 Mon, 28 Mar 2022 22:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648499508;
 bh=JuDWUTfPD7IAnkd4Yub/SrJkQZhecuKLtJ36ofKNEH4=;
 h=From:To:Cc:Subject:Date:From;
 b=XwzdEz/+fuPXrO5e1G32V3G23Ffa3jI+XvFW0us77Eqwj6DQMm8HBYfPfuJwkwQ4k
 gQMQ6gYHQUJKD8qJ5zlE9JLdSD4Yk2IJzwOyKaBBU3K0XwXu2mCeCXIsPDrzHo1hej
 2OCQIxdot77hO4YR9iwMX5C0ZhgQArZzJLCxr0eREPQjJZ5t7E9CgNBLTw33R6AVwT
 xlgg2LijOVfD46248ZKJsLomYX5EcP/3hWV+djUMgnb71tS5ASD61hXiNlnvJ2jBMo
 76j6PnKljURUHxZo/LRLcB+q5d45P7ZgkDenCS43YEU3xjQvmsQ5UeJxdhCl6PLX16
 jcCLSd+2UuBTw==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 22:31:39 +0200
Message-Id: <20220328203139.1115402-1-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.2.6
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v2.2.5, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.6

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -p fluidsynth
    ...
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 0d41c16d8d..20eb9ec49f 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9037e703617f91c4c36039a5059e0f624164799d856af715bcd8a23c07ba03b8  fluidsynth-2.2.5.tar.gz
+sha256  ca90fe675cacd9a7b442662783c4e7fa0e1fd638b28d64105a4e3fe0f618d20f  fluidsynth-2.2.6.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index b500944c16..d7c72ed059 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.5
+FLUIDSYNTH_VERSION = 2.2.6
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
