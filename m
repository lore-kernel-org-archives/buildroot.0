Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1767C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 475DE404AE;
	Wed, 28 Dec 2022 19:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 475DE404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CafmFmVypXCV; Wed, 28 Dec 2022 19:50:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EDEB40575;
	Wed, 28 Dec 2022 19:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EDEB40575
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FE761BF909
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59876404D8
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59876404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-CQPUB95TFA for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:50:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F39340002
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F39340002
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DBB286F41; Wed, 28 Dec 2022 19:50:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:50:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a04be749374c99790ee7d185427b352db84fb07a
X-Git-Newrev: ad71850aa039e344a1c32cd07876c1a83bdf5d5d
X-Patchwork-Hint: ignore
Message-Id: <20221228195043.8DBB286F41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: reorder dependencies
 alphabetically
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
