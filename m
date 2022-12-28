Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBD4C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8027C815AC;
	Wed, 28 Dec 2022 19:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8027C815AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YVgVpdX3Ve5; Wed, 28 Dec 2022 19:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE50C81584;
	Wed, 28 Dec 2022 19:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE50C81584
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 922971BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C26B605AE
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C26B605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LD_y8auBdbcK for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:50:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96AAE608D8
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96AAE608D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84D0086F40; Wed, 28 Dec 2022 19:50:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:50:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f603aa8514279b56f7454726c95601b31e6064dd
X-Git-Newrev: a04be749374c99790ee7d185427b352db84fb07a
X-Patchwork-Hint: ignore
Message-Id: <20221228195043.84D0086F40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: split long lines
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

commit: https://git.buildroot.net/buildroot/commit/?id=a04be749374c99790ee7d185427b352db84fb07a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Split the list of dependencies to ease further addition.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[yann.morin.1998@free.fr: move first item also on its own line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a991d49993..cbcbbc2bc5 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -20,7 +20,13 @@ QEMU_CPE_ID_VENDOR = qemu
 # However, building is still done with configure and make as in previous versions of QEMU.
 
 # Target-qemu
-QEMU_DEPENDENCIES = host-meson host-pkgconf libglib2 zlib pixman host-python3
+QEMU_DEPENDENCIES = \
+	host-meson \
+	host-pkgconf \
+	libglib2 \
+	zlib \
+	pixman \
+	host-python3
 
 # Need the LIBS variable because librt and libm are
 # not automatically pulled. :-(
@@ -246,7 +252,13 @@ $(eval $(generic-package))
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-meson host-pkgconf host-zlib host-libglib2 host-pixman host-python3
+HOST_QEMU_DEPENDENCIES = \
+	host-meson \
+	host-pkgconf \
+	host-zlib \
+	host-libglib2 \
+	host-pixman \
+	host-python3
 
 #       BR ARCH         qemu
 #       -------         ----
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
