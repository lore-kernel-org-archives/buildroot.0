Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42883C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E67296137C;
	Wed, 22 Feb 2023 20:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67296137C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-apbkZa9P4M; Wed, 22 Feb 2023 20:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1584F613A1;
	Wed, 22 Feb 2023 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1584F613A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 949C91BF97E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EA8E419D6
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EA8E419D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muaR21aQgEA3 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73FE3419D0
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FE3419D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F3FD868BE; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 21:57:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 293a878ae268cd0561fc3ab81c04b9a438acf921
X-Git-Newrev: 802cfb90d68f866bc8f61d9c6c3a764abae2580f
X-Patchwork-Hint: ignore
Message-Id: <20230222205839.5F3FD868BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: drop unrecognized volk
 variables
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=802cfb90d68f866bc8f61d9c6c3a764abae2580f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Volk submodule has been removed since version 3.9.0.0 and
https://github.com/gnuradio/gnuradio/commit/80c04479da962d048d41165081b026aafdaa0316

orc dependency can also be dropped as it was only used by volk submodule

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Gwenhael Goavec-merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/gnuradio.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index cc41f1e12b..c2fcba9586 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -22,9 +22,7 @@ GNURADIO_DEPENDENCIES = \
 GNURADIO_CONF_OPTS = \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DENABLE_DEFAULT=OFF \
-	-DENABLE_VOLK=ON \
 	-DENABLE_GNURADIO_RUNTIME=ON \
-	-DENABLE_INTERNAL_VOLK=OFF \
 	-DENABLE_TESTING=OFF \
 	-DXMLTO_EXECUTABLE=NOTFOUND
 
@@ -36,13 +34,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GNURADIO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
-ifeq ($(BR2_PACKAGE_ORC),y)
-GNURADIO_DEPENDENCIES += orc
-GNURADIO_CONF_OPTS += -DENABLE_ORC=ON
-else
-GNURADIO_CONF_OPTS += -DENABLE_ORC=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_GNURADIO_ANALOG),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
