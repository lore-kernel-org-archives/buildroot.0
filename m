Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDE2C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B2614F355;
	Mon, 20 Feb 2023 22:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B2614F355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oK72aaMAIkqK; Mon, 20 Feb 2023 22:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FE134F331;
	Mon, 20 Feb 2023 22:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FE134F331
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA5C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E012C416E4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E012C416E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4q2vBagNNUj for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24B674170B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24B674170B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 224D086494; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:50:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a04be749374c99790ee7d185427b352db84fb07a
X-Git-Newrev: ad71850aa039e344a1c32cd07876c1a83bdf5d5d
X-Patchwork-Hint: ignore
Message-Id: <20230220205217.224D086494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: reorder
 dependencies alphabetically
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad71850aa039e344a1c32cd07876c1a83bdf5d5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cbcbbc2bc5..be84452862 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -23,10 +23,10 @@ QEMU_CPE_ID_VENDOR = qemu
 QEMU_DEPENDENCIES = \
 	host-meson \
 	host-pkgconf \
+	host-python3 \
 	libglib2 \
-	zlib \
 	pixman \
-	host-python3
+	zlib
 
 # Need the LIBS variable because librt and libm are
 # not automatically pulled. :-(
@@ -253,12 +253,12 @@ $(eval $(generic-package))
 # Host-qemu
 
 HOST_QEMU_DEPENDENCIES = \
-	host-meson \
-	host-pkgconf \
-	host-zlib \
 	host-libglib2 \
+	host-meson \
 	host-pixman \
-	host-python3
+	host-pkgconf \
+	host-python3 \
+	host-zlib
 
 #       BR ARCH         qemu
 #       -------         ----
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
