Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC00C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C30DC60AFC;
	Mon,  3 Jul 2023 20:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C30DC60AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51mWpki4RLcU; Mon,  3 Jul 2023 20:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1402060D9D;
	Mon,  3 Jul 2023 20:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1402060D9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01BF01BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF2A060D9D
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF2A060D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jW5ioQuw6z0q for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:27:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 212C760AFC
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 212C760AFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0674D8658E; Mon,  3 Jul 2023 20:27:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 22:26:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cef05ae1566a4a62915362a46f17ace581908881
X-Git-Newrev: 6255ea2f6591ae294d1a354d6a30e8b5b245d3d6
X-Patchwork-Hint: ignore
Message-Id: <20230703202723.0674D8658E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnatpmp: fix header install
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6255ea2f6591ae294d1a354d6a30e8b5b245d3d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream renamed declspec.h to natpmp_declspec.h
https://github.com/miniupnp/libnatpmp/commit/1d113363980a98a5868ff2c2b05d7c94e3a18a70

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnatpmp/libnatpmp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnatpmp/libnatpmp.mk b/package/libnatpmp/libnatpmp.mk
index 3a625ea0fe..99d46d814a 100644
--- a/package/libnatpmp/libnatpmp.mk
+++ b/package/libnatpmp/libnatpmp.mk
@@ -18,7 +18,7 @@ endef
 define LIBNATPMP_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		PREFIX=$(STAGING_DIR) \
-		HEADERS='declspec.h natpmp.h' \
+		HEADERS='natpmp_declspec.h natpmp.h' \
 		$(TARGET_CONFIGURE_OPTS) install
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
