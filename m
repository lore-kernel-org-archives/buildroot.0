Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED04C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 14:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 880FD41E02;
	Mon, 18 Apr 2022 14:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8T6OJcMDkHH; Mon, 18 Apr 2022 14:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4559741DF3;
	Mon, 18 Apr 2022 14:29:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 712221BF376
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 14:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DDA941DF3
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 14:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QO639T7c2Zhc for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 14:29:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D73341DD2
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/vh/i
 ww5Ca5Asb1SCMwdW7/Pq9fA+/8bvBKqw/Fsu/k=; b=RopKHuwIDWlh2WMXdYik8
 zINuemcNnssgxuwKF3YeBI3ukf5HxD6GzOsKkV2kZ87rkFlHSoj0PbP8c2FNBtwV
 xePQt5bDYYoINj0L4iZbVITMhD/hhQ5KrWO43MbrLreXl2Gh8GTFgVDuPl0TA6Qb
 PhrW9HeyHpsy/s48P7jSkQ=
Received: from localhost.localdomain (unknown [123.185.181.60])
 by smtp7 (Coremail) with SMTP id C8CowAAH8ZvHdV1in3yiBw--.54S2;
 Mon, 18 Apr 2022 22:29:27 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 07:28:55 -0700
Message-Id: <20220418142855.3489541-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: C8CowAAH8ZvHdV1in3yiBw--.54S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryDWrW8WrW3trW5Wr15Jwb_yoW8WrW7pr
 ZxGw17t3s5Kr4UXFyUJr47ur93Wrs0gF1DJw45Jw4xt3yxGr45X3Z8ta1jqF13ZrW7J3W5
 AayDXry5WFy3Ka7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJ5r8UUUUU=
X-Originating-IP: [123.185.181.60]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbB2A-mjWBHJ2M2nAAAs1
Subject: [Buildroot] [PATCH] package/rtl8188eu: bump to 903b6fc (v5.2.2.4
 branch HEAD)
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This allows to build against newer kernels (up to 5.18).
Tested on kernel v5.15.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 37767f5d16..9c7f2de4b6 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2b06c842bccd730d68a26b1c1b5a24f18373401e907147bf5e775fa42a36bbb  rtl8188eu-60cb0b5a3cfc95e3f2e6fc294a28d987096b0559.tar.gz
+sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index b2066080f3..fa420b0d57 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 60cb0b5a3cfc95e3f2e6fc294a28d987096b0559
+RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
