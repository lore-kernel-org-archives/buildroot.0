Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E30DC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 13:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0082F40544;
	Sun,  5 May 2024 13:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOmCig1EwAhq; Sun,  5 May 2024 13:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00AF9400F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00AF9400F9;
	Sun,  5 May 2024 13:01:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 534D11BF4E6
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4071E60765
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSlaQ7lGJKrY for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 13:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.65;
 helo=mout01.posteo.de; envelope-from=egorenar-dev@posteo.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 744DB6075B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 744DB6075B
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 744DB6075B
 for <buildroot@buildroot.org>; Sun,  5 May 2024 13:01:01 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 80FB5240029
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:00:58 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VXPmT6wXXz9rxL;
 Sun,  5 May 2024 15:00:57 +0200 (CEST)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 13:00:51 +0000
Message-ID: <20240505130051.17240-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.net; s=2017; 
 t=1714914058; bh=f9yD3iNzKMfgIIab6o4CSFi8S1BJQXxcqPeyCimoNAQ=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=EQHdAQT7Dxn749BCtozjIDYQ/A45sxugQeXSKAnGPVz9QhCxOakLCwREEJZG4XBPV
 +/hHUvMxmFBq3SUKsALKXmNlOExnJ+K7VWlj1BW0eKA2PNNw/j78HDbhhI/n9x1a10
 wP8glKRz/BEVf52WEGWQbBL+GnDvQXeJsPdKqbX85qip67HP9P6mKI6XqyoMRrWzDW
 JoeyWDa+0dqV66JBbMVLRtCh4lbqhUAhyWGjiSECn2De9VZi1KofeIm7arD9u2V+mD
 y2cBS2fPfMe8n7FHy7VgEK1fWgk4aCEFRL8QtF3Mg6kOWbJpyk4MHcIrcPoqC4KtDa
 O4RXLJRgpm8gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256
 header.s=2017 header.b=EQHdAQT7
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: bump version to
 0.9.8
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
index 03a2867144a7..03b36f008ec4 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  8f0a7ddc01137d0f90ac3ef5700131dfbd6cf3bbbccdcfa317e8379efa328d59  multipath-tools-0.9.7.tar.gz
+sha256  0f8cfe691d54192c7593cd932e3080bcd35d25454ae2ebb4043213b38eec34ab  multipath-tools-0.9.8.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index 164d85060046..7547f02dbe63 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.9.7
+MULTIPATH_TOOLS_VERSION = 0.9.8
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
