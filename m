Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FD8C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4389C81D35;
	Mon,  3 Jan 2022 22:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4u0QUj0t3R2v; Mon,  3 Jan 2022 22:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8254881BBD;
	Mon,  3 Jan 2022 22:03:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 318CF1BF9AA
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29DA940350
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xic5g3dEMYSM for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 22:03:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52D8140116
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 22:03:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8FCC682DF3; Mon,  3 Jan 2022 21:57:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jan 2022 22:22:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5c58aff5d4ff44b6b923c4a91e9beb27ee536fc
X-Git-Newrev: 0c115a09c894404d6417997dd722e3029fa71317
X-Patchwork-Hint: ignore
Message-Id: <20220103215701.8FCC682DF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: reorder enable/disable
 options alphabetically
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c115a09c894404d6417997dd722e3029fa71317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 97f9f885a1..43450a6649 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -187,39 +187,39 @@ define QEMU_CONFIGURE_CMDS
 			--audio-drv-list= \
 			--meson=$(HOST_DIR)/bin/meson \
 			--ninja=$(HOST_DIR)/bin/ninja \
-			--enable-kvm \
-			--enable-attr \
-			--enable-vhost-net \
 			--disable-bpf \
+			--disable-brlapi \
 			--disable-bsd-user \
+			--disable-cap-ng \
+			--disable-capstone \
 			--disable-containers \
-			--disable-xen \
-			--disable-virtfs \
-			--disable-brlapi \
-			--disable-curses \
 			--disable-curl \
-			--disable-vde \
-			--disable-linux-aio \
-			--disable-linux-io-uring \
-			--disable-cap-ng \
+			--disable-curses \
 			--disable-docs \
-			--disable-rbd \
-			--disable-libiscsi \
-			--disable-strip \
-			--disable-sparse \
-			--disable-mpath \
-			--disable-sanitizers \
 			--disable-hvf \
-			--disable-whpx \
+			--disable-libiscsi \
+			--disable-libxml2 \
+			--disable-linux-aio \
+			--disable-linux-io-uring \
 			--disable-malloc-trim \
 			--disable-membarrier \
-			--disable-vhost-crypto \
-			--disable-libxml2 \
-			--disable-capstone \
-			--with-git-submodules=ignore \
+			--disable-mpath \
 			--disable-opengl \
+			--disable-rbd \
+			--disable-sanitizers \
+			--disable-sparse \
+			--disable-strip \
+			--disable-vde \
+			--disable-vhost-crypto \
 			--disable-vhost-user-blk-server \
+			--disable-virtfs \
 			--disable-virtiofsd \
+			--disable-whpx \
+			--disable-xen \
+			--enable-attr \
+			--enable-kvm \
+			--enable-vhost-net \
+			--with-git-submodules=ignore \
 			$(QEMU_OPTS)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
