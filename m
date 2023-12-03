Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EA5C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8F9B41684;
	Sun,  3 Dec 2023 18:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F9B41684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OlcWjhKAwJO; Sun,  3 Dec 2023 18:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC2E4162C;
	Sun,  3 Dec 2023 18:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EC2E4162C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 434701BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BD324044B
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BD324044B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x25_QeLAvfZw for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:15:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06BC440438
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06BC440438
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E632C8783E; Sun,  3 Dec 2023 18:15:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 19:15:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c8a5a97e6740e31ef62e1be9f7c640dde79db6d4
X-Git-Newrev: 029099025f81baaa6b8296bada22878751fa5025
X-Patchwork-Hint: ignore
Message-Id: <20231203181547.E632C8783E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libblockdev: drop
 unrecognized options
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

commit: https://git.buildroot.net/buildroot/commit/?id=029099025f81baaa6b8296bada22878751fa5025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The following options were wrongly kept when bumping to version 3.0.3 in
commit 18420d9b6b424492741cba495cc2e7a28a409e8b:
 - dmraid (dropped since
   https://github.com/storaged-project/libblockdev/commit/d174944a85169efae3bac0b6e76498e3d0c6c240)
 - bcache and kbd (dropped since
   https://github.com/storaged-project/libblockdev/commit/c1ff1c87e31fb2820a5694637eb221f590eb9451)
 - python2 (dropped since
   https://github.com/storaged-project/libblockdev/commit/8fc33b834529d3d18a73112e4c77ea0a5d26d62c)
 - vdo (dropped since
   https://github.com/storaged-project/libblockdev/commit/e51faac2a952da33925e3ccab0f4f0fdf3986cd3)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libblockdev/libblockdev.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 3bbc221cc5..e0fca2b95c 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -16,20 +16,15 @@ LIBBLOCKDEV_AUTORECONF = YES
 LIBBLOCKDEV_CONF_OPTS = \
 	--disable-introspection \
 	--with-loop \
-	--without-bcache \
 	--without-btrfs \
 	--without-dm \
-	--without-dmraid \
 	--without-escrow \
-	--without-kbd \
 	--without-lvm_dbus \
 	--without-mpath \
 	--without-nvdimm \
-	--without-python2 \
 	--without-python3 \
 	--without-s390 \
-	--without-tools \
-	--without-vdo
+	--without-tools
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_CRYPTO),y)
 LIBBLOCKDEV_DEPENDENCIES += cryptsetup keyutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
