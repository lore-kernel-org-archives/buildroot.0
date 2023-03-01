Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8036CC64ED6
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 09:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE9860ACC;
	Wed,  1 Mar 2023 09:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE9860ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id saSB5Yy0O5hF; Wed,  1 Mar 2023 09:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5928860DFF;
	Wed,  1 Mar 2023 09:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5928860DFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE5D91BF86B
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 09:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A50BF81DCA
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 09:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A50BF81DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id miiyFHK0oK8f for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 09:46:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 089CE81D68
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 089CE81D68
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 09:46:52 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 5B17D5C4FFF;
 Wed,  1 Mar 2023 10:46:50 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 10:46:40 +0100
Message-Id: <c5c998e135a5915b35bde46cd6c191610777aaf8.1677663986.git.stefan@agner.ch>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1677664010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=387sCP3ZxAiF1hx2+LV+BkqFTXrDNRgMbbas4oNiLoY=;
 b=Z9aOfZkoUA3e+OCAnDbEFrpyfJ02JhjhafEhqv/kE33EvU4MpO4mGAK8DAomGhZ6j+QW1m
 TtnH99ESq4OxUy66irlLEfJWiEchW+wB5keFKuvRPJu+HaUJYW3iP9BiY9fh1iugB6Wwjd
 25JSMU+1MbC0mLA6aYplvDl0GBZNFtA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=Z9aOfZko
Subject: [Buildroot] [PATCH] package/docker-engine: remove non-existing
 build tags
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

The seccomp and apparmor build tags have been removed in 23.0.0. Don't
use those buildtags anymore.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/docker-engine/docker-engine.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ca1aa27b0a..0ecb5d2251 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -28,11 +28,9 @@ DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
-DOCKER_ENGINE_TAGS += apparmor
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_ENGINE_TAGS += seccomp
 DOCKER_ENGINE_DEPENDENCIES += libseccomp
 endif
 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
