Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDAEC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 19:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9360160BA6;
	Wed, 10 Aug 2022 19:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9360160BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMsSfYr1YEVZ; Wed, 10 Aug 2022 19:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2EC760B18;
	Wed, 10 Aug 2022 19:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2EC760B18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B40681BF471
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 19:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EA464044D
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 19:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EA464044D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-9ItFG2ZQbs for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 19:10:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 742D640012
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 742D640012
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 19:10:22 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 21EF85C2FEB;
 Wed, 10 Aug 2022 21:10:19 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org,
	christian@paral.in
Date: Wed, 10 Aug 2022 21:10:17 +0200
Message-Id: <894c61eb360ab14745063a31b1ff835f9854ff3e.1660158610.git.stefan@agner.ch>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1660158619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=C8jwbdUYSJAZn2y531Hj+1LnTUQ3HnZRk+HaFOWChIo=;
 b=0KUggHye++GHdQNQPIfJGYafti75Tr3mE5yCzASsp1zjE5Jx3Z3ZiG0tskXN1nRrNX86sQ
 irf+5UiqGNBnkrU2drLG0mEnLsK/jG5U3dJhCQVNlcNiWpq9srddbaCp1zQ05vclsSMwe2
 aWFtS/By5o4CwP1ycItscWHlHBtXSQ8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=0KUggHye
Subject: [Buildroot] [PATCH v2] package/docker-proxy: bump version to
 f6ccccb1c082
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
Cc: stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Which is the version used by docker 20.10.17:
https://github.com/moby/moby/blob/v20.10.17/hack/dockerfile/install/proxy.installer

The repository also moved to the moby GitHub organization, follow
that move.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/docker-proxy/docker-proxy.hash | 2 +-
 package/docker-proxy/docker-proxy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
index 84bfa5518e..63296f14c1 100644
--- a/package/docker-proxy/docker-proxy.hash
+++ b/package/docker-proxy/docker-proxy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  335851e924078a8e274f0c27cb80aaba32d0c1059068740496f1eb31b55a6ec4  docker-proxy-339b972b464ee3d401b5788b2af9e31d09d6b7da.tar.gz
+sha256  05bf95637bae134d12d02bd7a7854cd0c768e6fccb662c2c64523f05b997b204  docker-proxy-f6ccccb1c082a432c2a5814aaedaca56af33d9ea.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index 022aa1f949..fe7982e8f6 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_PROXY_VERSION = 339b972b464ee3d401b5788b2af9e31d09d6b7da
-DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
+DOCKER_PROXY_VERSION = f6ccccb1c082a432c2a5814aaedaca56af33d9ea
+DOCKER_PROXY_SITE = $(call github,moby,libnetwork,$(DOCKER_PROXY_VERSION))
 
 DOCKER_PROXY_LICENSE = Apache-2.0
 DOCKER_PROXY_LICENSE_FILES = LICENSE
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
