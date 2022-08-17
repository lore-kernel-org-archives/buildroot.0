Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D7CC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 21:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64DE040608;
	Wed, 17 Aug 2022 21:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64DE040608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVyUONA7sPlD; Wed, 17 Aug 2022 21:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79CEB402C3;
	Wed, 17 Aug 2022 21:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79CEB402C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6204F1BF35A
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 21:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43A3783E9F
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 21:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43A3783E9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46D020r4Yp27 for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 21:37:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E837083E81
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E837083E81
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 21:37:41 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.112.68])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CCDDD6012F;
 Wed, 17 Aug 2022 23:37:35 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 23:37:23 +0200
Message-Id: <20220817213724.10547-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660772258;
 bh=XOEzWTvyDv3JCDV4GusYHn2+SdwPQ4WBHvi40pr0D6U=;
 h=From:To:Cc:Subject:Date:From;
 b=t5lTyEaRgO6/jHd/B3ljOhlQj27iq8pPJ9foNbQLbTgmiOm5sSqTNzVIF2iuOvu/M
 t7WkRD3de7GEauI7nLZ04RiCiI+adVPbnNNgfJsG4JiMxWtiadQUEp0u64cM+ON8sn
 CGjJDiB8fgvRyx4UDsCB71a7A+br1Y3030kFMS7WPdz6caGZ3INrAcopBdao+flhOW
 F6LJ4r8HYD/TOL7QM8yMfhYT0BZN6ra0qh52SNWyDV/j/HJwmH6FNcXpiz/na3k8Dg
 hL4NeOkAuaWbEvQDlZj4TX325sFAorrpsOX7229CwvGgug0D1FTc2SILM9/NjMR94L
 VFWtdHflwfMxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t5lTyEaR
Subject: [Buildroot] [PATCH next 1/2] package/linux-backports: bump version
 to 5.10.110
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

Note:
This is not the latest package version to date. This is the latest
linux-backports version which is not changing the minimal kernel version
requirement, which is kept to kernels version >= 3.10.

For commit log details, see:
https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/log/?h=v5.10.110-1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-backports/linux-backports.hash | 4 ++--
 package/linux-backports/linux-backports.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
index 3e103424f5..83a3e54cd7 100644
--- a/package/linux-backports/linux-backports.hash
+++ b/package/linux-backports/linux-backports.hash
@@ -1,5 +1,5 @@
-# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.8/sha256sums.asc
-sha256  19b4174d89bf11ee221458e11f1e8dace26558498774b823051156f522d2036b  backports-5.8-1.tar.xz
+# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.10.110/sha256sums.asc
+sha256  3d958154080c059adaf26512430fd1a8888d65a2228e5e70e48d028201e148b1  backports-5.10.110-1.tar.xz
 # Locally computed
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
 sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 068dcffcc8..a39891336d 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_BACKPORTS_VERSION_MAJOR = 5.8
+LINUX_BACKPORTS_VERSION_MAJOR = 5.10.110
 LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
 LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
 LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
