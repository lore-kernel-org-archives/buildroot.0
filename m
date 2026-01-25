Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D243D7237B
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 245C1813FF;
	Sun, 25 Jan 2026 21:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rlHOU90dmgo; Sun, 25 Jan 2026 21:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4881B8143B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377651;
	bh=j5h/SvcpvDCnDl2FjY04BvjHC01e60eJTL9G5/n3xVs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gKItUKCVEDu6dcVnhZDCCHtLMhLnmC5fRZ4xtsU9frZhz2HViIvynX/mG/6Ev1lHK
	 cLj3VAXsSDWMNVoibrvCNf3Ff1mN0CamMhjCB1fNDz8uZvFvrNHoZX9z2R2ERcNFKR
	 dPwH0XTqd0jIX8qwaVowprecs68vhB/TdeSNJvjhmdbnjz7AmzX5oRUHbSnyZwFFf1
	 E9utXi+yy4sANioF7bVj/5NXxWo1SJdPac8lNYHhP/+L3WPZsLXE6TDd+okTBDm6EN
	 mQocXtfLHdCn42+xoUB4rk2E/9FxOOAs/1VJJr6PPo3yd7gG83K2lZNtSpELxlFIVX
	 CmatvM1awsmZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4881B8143B;
	Sun, 25 Jan 2026 21:47:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D80C6972
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7E3D401DA
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnduKc9tkSMJ for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E168A40085
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E168A40085
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFB32876F4; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:59:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcb1764e6f0cd00bf5346711598fd43fb48608c8
X-Git-Newrev: 3eec14e664c475b6574d2858a3c63b7c6126e91e
X-Patchwork-Hint: ignore
Message-Id: <20260125214727.CFB32876F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/stmicroelectronics/stm32f746-disco:
 exit post-build.sh on error
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3eec14e664c475b6574d2858a3c63b7c6126e91e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
