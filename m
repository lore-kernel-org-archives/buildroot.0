Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF4CC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A8FE83E64;
	Mon, 20 Feb 2023 23:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A8FE83E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPA-K43gd4op; Mon, 20 Feb 2023 23:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2F883E60;
	Mon, 20 Feb 2023 23:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC2F883E60
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE92C1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCC5D617A4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCC5D617A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGqRzMU92nHf for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1744F612C3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1744F612C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13B7F8648F; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:50:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f603aa8514279b56f7454726c95601b31e6064dd
X-Git-Newrev: a04be749374c99790ee7d185427b352db84fb07a
X-Patchwork-Hint: ignore
Message-Id: <20230220205217.13B7F8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: split long lines
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
