Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3310C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 22:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F7D81BC2;
	Mon,  3 Jan 2022 22:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnY1u3bpJJLh; Mon,  3 Jan 2022 22:03:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5350381B70;
	Mon,  3 Jan 2022 22:03:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 228551BF983
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C77A81B70
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPj_8lKL2lkQ for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 22:03:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BC7981B58
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 22:03:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9967782DF6; Mon,  3 Jan 2022 21:57:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jan 2022 22:25:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c115a09c894404d6417997dd722e3029fa71317
X-Git-Newrev: 78a989b1f15311d7e9e01717111c3dc306a0dbaa
X-Patchwork-Hint: ignore
Message-Id: <20220103215701.9967782DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: Disable new configure
 options added by Qemu 2.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=78a989b1f15311d7e9e01717111c3dc306a0dbaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable new configure options added by this release to avoid
adding new dependencies or features.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 43450a6649..e69e813059 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -187,16 +187,20 @@ define QEMU_CONFIGURE_CMDS
 			--audio-drv-list= \
 			--meson=$(HOST_DIR)/bin/meson \
 			--ninja=$(HOST_DIR)/bin/ninja \
+			--disable-alsa \
 			--disable-bpf \
 			--disable-brlapi \
 			--disable-bsd-user \
 			--disable-cap-ng \
 			--disable-capstone \
 			--disable-containers \
+			--disable-coreaudio \
 			--disable-curl \
 			--disable-curses \
 			--disable-docs \
+			--disable-dsound \
 			--disable-hvf \
+			--disable-jack \
 			--disable-libiscsi \
 			--disable-libxml2 \
 			--disable-linux-aio \
@@ -204,9 +208,13 @@ define QEMU_CONFIGURE_CMDS
 			--disable-malloc-trim \
 			--disable-membarrier \
 			--disable-mpath \
+			--disable-netmap \
 			--disable-opengl \
+			--disable-oss \
+			--disable-pa \
 			--disable-rbd \
 			--disable-sanitizers \
+			--disable-selinux \
 			--disable-sparse \
 			--disable-strip \
 			--disable-vde \
@@ -355,14 +363,24 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		--meson=$(HOST_DIR)/bin/meson \
 		--ninja=$(HOST_DIR)/bin/ninja \
+		--disable-alsa \
 		--disable-bpf \
 		--disable-bzip2 \
 		--disable-containers \
+		--disable-coreaudio \
 		--disable-curl \
 		--disable-docs \
+		--disable-dsound \
+		--disable-jack \
 		--disable-libssh \
+		--disable-linux-aio \
 		--disable-linux-io-uring \
+		--disable-netmap \
+		--disable-oss \
+		--disable-pa \
 		--disable-sdl \
+		--disable-selinux \
+		--disable-vde \
 		--disable-vhost-user-blk-server \
 		--disable-virtiofsd \
 		--disable-vnc-jpeg \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
