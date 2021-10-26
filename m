Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE7BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:35:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 865E26103C
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 865E26103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 600FC60644;
	Tue, 26 Oct 2021 18:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLy87CSIHQ5p; Tue, 26 Oct 2021 18:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD66E606A0;
	Tue, 26 Oct 2021 18:35:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4201BF9B2
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5776C4023B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdOF-IQCcXnN for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 820F54011F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ACDEF88E6D; Tue, 26 Oct 2021 18:30:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:11:36 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 4663ab07cad9723818045a1a519756998cdb00ba
X-Git-Newrev: a447dd793d1c95e857d227b2b267004604bda48b
X-Patchwork-Hint: ignore
Message-Id: <20211026183005.ACDEF88E6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/qemu: disable doc
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

commit: https://git.buildroot.net/buildroot/commit/?id=a447dd793d1c95e857d227b2b267004604bda48b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index b552ea139e..8a5e1f917c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -341,6 +341,7 @@ define HOST_QEMU_CONFIGURE_CMDS
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
