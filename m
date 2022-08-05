Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B675C25B07
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8982660008;
	Fri,  5 Aug 2022 16:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8982660008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOtxFjdrmTln; Fri,  5 Aug 2022 16:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 176CA60586;
	Fri,  5 Aug 2022 16:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 176CA60586
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 076861BF9CB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF7D960586
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7D960586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAGJ1CL5e5mC for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 16:32:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79AA660008
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 16:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79AA660008
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7743A86E9C; Fri,  5 Aug 2022 16:18:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Aug 2022 18:32:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32e97c658860572ca7a2dd22dc6bea0ca6f04eb4
X-Git-Newrev: 416e5fac062df6bcd5bb2872004c750714c7980e
X-Patchwork-Hint: ignore
Message-Id: <20220805161835.7743A86E9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcnano-binaries: set Version:
 field in .pc files
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

commit: https://git.buildroot.net/buildroot/commit/?id=416e5fac062df6bcd5bb2872004c750714c7980e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All .pc files have a Version field set to #VERSION#, which needs to be
replaced, otherwise packages checking the version of OpenGL ES, EGL,
GBM, etc. will fail. For example:

Dependency gbm found: NO unknown version, but need: ['>=17.1.0']

Such problems have been seen with both libepoxy and SDL2.

The version 21.1.1 is chosen because it matches what the Yocto recipe
is doing for this package:

  https://github.com/STMicroelectronics/meta-st-stm32mp/blob/kirkstone/recipes-graphics/gcnano-userland/gcnano-userland.inc#L42

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcnano-binaries/gcnano-binaries.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index ce9b24cc3a..d9c47bf64e 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -60,7 +60,7 @@ define GCNANO_BINARIES_INSTALL
 	ln -sf gbm/gbm.h $(1)/usr/include/gbm.h
 	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
 	for file in *.pc ; do \
-		sed -e "s|#PREFIX#|/usr|" $$file > $$file.temp ; \
+		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|21.1.1|" $$file > $$file.temp ; \
 		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
 	done
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
