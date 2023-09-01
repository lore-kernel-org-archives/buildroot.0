Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5EDCA0FEC
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 20:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7FA340603;
	Fri,  1 Sep 2023 20:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7FA340603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRE_aCHn1gRL; Fri,  1 Sep 2023 20:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E96F403CA;
	Fri,  1 Sep 2023 20:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E96F403CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0681BF3FC
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 20:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64B6B403CA
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 20:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64B6B403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQ2Y6fiypNQK for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 20:56:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 593E6401A4
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 20:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 593E6401A4
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 50DD913F8A9;
 Fri,  1 Sep 2023 22:56:01 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  1 Sep 2023 22:55:55 +0200
Message-ID: <20230901205555.16734-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693601762;
 bh=KV0SglUSoEzvI58leAp2UAyB4NBwC61FzWqC/pHfDAI=;
 h=From:To:Cc:Subject:Date:From;
 b=omZduP0TvJ2JZJ3DFcRJzM+z9n/La1zgjsVJgjm4iE+8f/YYz+GR8+RRn0GQEJaba
 hzs7aLp5iq1CdK8y/TfDiO3tSd74D7PZW56S51QKCbMSYSYcXMZv2zfGrRbsLzORhO
 U+ugzSYOBbsmV0H9d3PA/NVSVpgq+AQMKTZLq3SbglDrHtXPsKJDELULHDcoVtrG4V
 TliEsDCP5oDDzfgEvEaOzZxqG0g64zL4O/A5MXycrv0iPcb6JwA01HDmbamMOH+xiq
 VvTcAnbjsVJo+PjT/Q75OBtMZBnOJz2skIpYLoVFU434ogDKmQH232x4TwMrmHmsIO
 V0Tq0RVzY4tug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=omZduP0T
Subject: [Buildroot] [PATCH next 1/1] package/ed: bump to version 1.19
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

See release announce:
https://lists.gnu.org/archive/html/bug-ed/2023-01/msg00000.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 36f9b9c1e4..007f645f51 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00000.html
-sha256  aca8efad9800c587724a20b97aa8fc47e6b5a47df81606feaba831b074462b4f  ed-1.18.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2023-01/msg00000.html
+sha256  ce2f2e5c424790aa96d09dacb93d9bbfdc0b7eb6249c9cb7538452e8ec77cd48  ed-1.19.tar.lz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 645cfb7696..a90d1f005e 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.18
+ED_VERSION = 1.19
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
