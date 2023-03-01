Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27435C7EE30
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 09:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AABFD611F9;
	Wed,  1 Mar 2023 09:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AABFD611F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egeeyrr6Q9Ca; Wed,  1 Mar 2023 09:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF8060E9D;
	Wed,  1 Mar 2023 09:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAF8060E9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D53951BF94D
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 09:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEBAC418E9
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 09:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEBAC418E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VG4y82KZWi8y for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 09:46:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0787B418A9
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0787B418A9
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 09:46:52 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id E3BD35C5002;
 Wed,  1 Mar 2023 10:46:50 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 10:46:41 +0100
Message-Id: <f757263ae4444a2a3e4ff4dae9223364c229a426.1677663986.git.stefan@agner.ch>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <c5c998e135a5915b35bde46cd6c191610777aaf8.1677663986.git.stefan@agner.ch>
References: <c5c998e135a5915b35bde46cd6c191610777aaf8.1677663986.git.stefan@agner.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1677664010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHWJzZfgCTwZXJzFeP1KQzNIL4aiygA7o36hvHDwOL8=;
 b=RIwpdDUQZkRYGCVUaXxbVyq/iqn3uXEkscV9lvSGmKUU+7lb5K6629JtwUCQqBsCBXExlP
 7BLH7toG4WLOKxcQ6dPlAQar0eGu1E2WQjxKyibz5QZIh+8oHljclAnvKhz9C5UIC14rBV
 YsQDrn8O18lfm6pv7oH2G1HkqA/QTzw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=RIwpdDUQ
Subject: [Buildroot] [PATCH] package/docker-engine: bump version to v23.0.1
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

This release contains some fixes and an improved error message. For the
full list see:
https://github.com/moby/moby/releases/tag/v23.0.1

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/docker-cli/docker-cli.hash       | 2 +-
 package/docker-cli/docker-cli.mk         | 2 +-
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index ff981be963..9b231f03b1 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3379d06cd6177832b91f4796c680b6bf15c7895773448716b4c3c5253f611d1b  docker-cli-23.0.0.tar.gz
+sha256  37bc1c71a782fc10d35aa6708c1b3c90a71f3947c33665cb0de68df25dc14d94  docker-cli-23.0.1.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index d61f47e46e..38d903150c 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 23.0.0
+DOCKER_CLI_VERSION = 23.0.1
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 670cbd414b..99ab5e4003 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  94492508260e57eb93399257d53435cd5308ca6330e173ca6e6f3dbf4c6e12f3  docker-engine-23.0.0.tar.gz
+sha256  c8e6c0ac5f0c772023e3430f80190e0f86644b6d94cac63118b03561385f7b56  docker-engine-23.0.1.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 0ecb5d2251..f8d31de0fe 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 23.0.0
+DOCKER_ENGINE_VERSION = 23.0.1
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
