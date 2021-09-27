Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE69C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 10:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C9CF60F4B
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 10:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C9CF60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC2FA605CB;
	Mon, 27 Sep 2021 10:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXQD-ID_v4lf; Mon, 27 Sep 2021 10:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE06E605D0;
	Mon, 27 Sep 2021 10:51:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9D5D1BF294
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 10:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4E16605D0
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 10:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxC7FXmFlPv8 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 10:51:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66960605CB
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 10:51:20 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 4612A24002F
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1632739877; bh=H3ze6FF/k4mki3vEOmD97ejP8fRKYsLyAUNxR+ySHco=;
 h=From:To:Cc:Subject:Date:From;
 b=Y9vECnoA3fuKJo7V0Zga5O5tvlh00YtXopiyHgfK4ABAj12/5YFHMmV621Prv/ffJ
 VOtMPIgtyYD550kbk7zDhHDSPur5Nr6GPiPyV6yLp5vy7DbDJLfBNBvrTH2sU5lMpu
 a0UKJs9IQEcdZge6hetU6jcOINUB5ZE+T+V975qT8/b5Bb375qA6Ot5crvn+xveh+2
 dMAnnUm+ypZ1bAoKeQd31czI4OI6u+aBIvQfUJKF3n8OeJ/hPXA8Wo6d2hPuaDYVTA
 tnr6d/by3pY/9JntExKaIjWnLYe63/S/j1e+3DB/6F0uHKw2k3GffAGYkeyIuo+f7m
 M7W7WRAqaBiFw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4HHzvm32Q0z6tmM;
 Mon, 27 Sep 2021 12:51:16 +0200 (CEST)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 10:51:23 +0000
Message-Id: <20210927105123.12375-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to version
 0.8.7
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/multipath-tools/multipath-tools.hash | 2 +-
 package/multipath-tools/multipath-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 7b8cfe98f641..ac41e4815b72 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  ba781d981bd6e8efa5f9f3af6727f85520af6395958e852c1907f59f6124f08e  multipath-tools-0.8.6.tar.gz
+sha256  7c5962be6068c78d5256e8fc979cf327988f7560705bb9cc25b508c50ca997c0  multipath-tools-0.8.7.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index e9db80225803..3d8095b0b093 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.8.6
+MULTIPATH_TOOLS_VERSION = 0.8.7
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
