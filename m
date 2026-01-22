Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907B5D3F09A
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F67E40BE5;
	Wed, 28 Jan 2026 17:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHOGQ26XBYIF; Wed, 28 Jan 2026 17:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DA6C40BC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620929;
	bh=L9Lt3qTY8IVxCui3Azj3vf9TWmezF2u4ON0WLfptKno=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jkv1BjesF3SH7O12z681pbL+QBBy5AhiA1md/gIagn9u6jYjVGCfvzwxRI2lXxmZ/
	 YEppCPcG8sW8bKUlL5ZoXYYN7Mst72ZoSyJptu2Lvg/bDSAuTXy9VOucdTFGbj10Ad
	 aeeuzmPftrUcydR7feXWyxZV0mn5HH/ejknwDFqkCh/QdrJueM5ZxypRob2RJRtiFT
	 ai7+uG2mKjyik3wSGyNzAh71DQXTgBTv86rU/zxAL+5N6ANIiRSJV7xXgQfAPg1fHo
	 Z0PnXqOxN+ADBETHzMXKKss8SurgtdOrMGpko4+bOnyHeZKjmPe9UsH6sgleQAGN/m
	 qy+kp7Nc2hEcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DA6C40BC9;
	Wed, 28 Jan 2026 17:22:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD0D1AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C42FB60788
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BdoiKDG6LYSY for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83FBD6078A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83FBD6078A
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DA8486082; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:53:03 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 79f68ee800c091d0dbd198d1ea9797fcf18a5ae8
X-Git-Newrev: 864cb60a892f7b6fbe93de172b6cf40aa9f52baa
X-Patchwork-Hint: ignore
Message-Id: <20260128172152.7DA8486082@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rp-pppoe: update
 tarball URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=864cb60a892f7b6fbe93de172b6cf40aa9f52baa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The project moved its repo to codeberg.org:
https://dianne.skoll.ca/pipermail/rp-pppoe/2025q3/000663.html

Updated tarball hash after verifying that no files changed, only the
directory name changed from rp-pppoe-4.0/ to rp-pppoe/

Fixes:
https://autobuild.buildroot.net/results/5ff/5fff21a4150a5f668d43830591e21b660299ed9d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4768a26047d31fbf0dde3a282513707f81aed52f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rp-pppoe/rp-pppoe.hash | 2 +-
 package/rp-pppoe/rp-pppoe.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
index 97bb61eaf8..89f9f5c33f 100644
--- a/package/rp-pppoe/rp-pppoe.hash
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  17d45712778f2bf6b0859ff610a3dacd24bc4462e9f53bb1466d47af391701d3  rp-pppoe-4.0.tar.gz
+sha256  459904065fd4a70c927757d84cc7b4ef70946a707fa1b83f16246f925158b13e  4.0.tar.gz
 sha256  d2767e7ffc6dc9477812f6238551fe4b29a889df6f23c3922e7b9cec92bc278d  doc/LICENSE
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 98325e7d49..562e0311f0 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 RP_PPPOE_VERSION = 4.0
-RP_PPPOE_SITE = $(call github,dfskoll,rp-pppoe,$(RP_PPPOE_VERSION))
+RP_PPPOE_SITE = https://codeberg.org/dskoll/rp-pppoe/archive
+RP_PPPOE_SOURCE = $(RP_PPPOE_VERSION).tar.gz
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
