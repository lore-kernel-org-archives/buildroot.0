Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E37C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:33:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A86A760E05
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A86A760E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75AEB606A0;
	Tue, 26 Oct 2021 18:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqbvAFwAtAz2; Tue, 26 Oct 2021 18:33:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4BBF60A57;
	Tue, 26 Oct 2021 18:33:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBDE81BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA8D240261
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udHaXMKD9Kic for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:33:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B48134024A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:33:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E136688DD9; Tue, 26 Oct 2021 18:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:16:14 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: bd7e0a0b600ad43f6d3d936cc242d3b1827f0e00
X-Git-Newrev: 6b471a330e54c1c2ff2a66e13e8ddfd98eeee33c
X-Patchwork-Hint: ignore
Message-Id: <20211026182958.E136688DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/qemu: disable doc
 generation for host build
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b471a330e54c1c2ff2a66e13e8ddfd98eeee33c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- disable doc generation (via sphinx) for host build

Reduces host-qemu build time from (on a system with sphinx installed):

	real    2m5,522s
	user    9m41,292s
	sys     1m9,732s

to:
	real	1m9,183s
	user	8m40,131s
	sys	1m9,533s

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit df857f6e0fd9d0815c12519ca239de0b0fd2b96b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 520618cd55..69949cfd7b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -354,6 +354,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-bzip2 \
 		--disable-containers \
 		--disable-curl \
+		--disable-docs \
 		--disable-libssh \
 		--disable-linux-io-uring \
 		--disable-sdl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
