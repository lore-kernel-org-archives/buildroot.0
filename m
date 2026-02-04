Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEBBE9D41C
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA5761289;
	Wed,  4 Feb 2026 17:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4u-ToRiirKe; Wed,  4 Feb 2026 17:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8960F6128A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224942;
	bh=S2/fOV6oEBMtLFAX6IUAVJA08KHBkcw+GlSxG+GctGI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ujruxp+63KKV+2YkuXooXqFlwx59Iq+ZRMAgYitZGXUS7UnZafXRB/ZquHY8STOjZ
	 RVyFW94fm0wJEaYS60me7/7J5hol1Ev6782QPVlI1hBajfknH+jnFwVhawqDCAuQBf
	 eSHxYTE4QvdDjqzBrsZVwEHecjRtbXyE6PK89VprtpGmrkWZyZsa5EffgcZfcPk/Mu
	 UyVeQaIGA8+Ir/r7DT1zLblThTLRHdPxmkWU+iJ+ITcXYgHxg7YrLgMnxbpmoQgTU+
	 35sp2CrS4CcGsvJBBIq2O1HgKg5SbQ6R3dkAfdmWciSvvAOXHYkWOWzaVJAfVo46nn
	 3gP+WNB0e7yDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8960F6128A;
	Wed,  4 Feb 2026 17:09:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A39E1F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C2D40567
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhB_2jz-u3A5 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06CE14056B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06CE14056B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDA948697C; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:32:41 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f9255641795381605c301ac2821031c01761d7fe
X-Git-Newrev: 6ab145e751c895a443d6b5b21a4aeef4f367619b
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.EDA948697C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 board/stmicroelectronics/stm32f746-disco: exit post-build.sh on error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ab145e751c895a443d6b5b21a4aeef4f367619b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3eec14e664c475b6574d2858a3c63b7c6126e91e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/stmicroelectronics/stm32f746-disco/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/stmicroelectronics/stm32f746-disco/post-build.sh b/board/stmicroelectronics/stm32f746-disco/post-build.sh
index 03e9dcae82..74c59fdb72 100755
--- a/board/stmicroelectronics/stm32f746-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f746-disco/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
