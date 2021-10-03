Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D81C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:10:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2306611EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2306611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F487844CF;
	Sun,  3 Oct 2021 20:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8vu68YTxhjl; Sun,  3 Oct 2021 20:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF967844C0;
	Sun,  3 Oct 2021 20:10:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFF271BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC999844C0
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBurtUmHyUJg for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 270B784439
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7398587C0E; Sun,  3 Oct 2021 20:07:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 22:09:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6ea44910889862f7a2ff992b78ae54eb6164dde
X-Git-Newrev: b97e8a79f955812284e52ad3c0b6d41a41142d47
X-Patchwork-Hint: ignore
Message-Id: <20211003200752.7398587C0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: add pipewire user to
 audio/video groups
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

commit: https://git.buildroot.net/buildroot/commit/?id=b97e8a79f955812284e52ad3c0b6d41a41142d47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
ALSA lib seq_hw.c:466:(snd_seq_hw_open) open /dev/snd/seq failed: Permission denied
v4l2: Cannot open '/dev/video0': 13, Permission denied

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pipewire/pipewire.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 87e747e917..272cd046aa 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -171,7 +171,7 @@ endif
 PIPEWIRE_CONF_OPTS += -Dsession-managers='$(subst $(space),$(comma),$(PIPEWIRE_SESSION_MANAGERS_LIST))'
 
 define PIPEWIRE_USERS
-	pipewire -1 pipewire -1 * - - - PipeWire System Daemon
+	pipewire -1 pipewire -1 * - - audio,video PipeWire System Daemon
 endef
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
