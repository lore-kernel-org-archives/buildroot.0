Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3100BD7237C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FED4095F;
	Sun, 25 Jan 2026 21:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iU4qfECmJskv; Sun, 25 Jan 2026 21:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5850B408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377658;
	bh=XePR5DjDsqVlqhKM6dHq5hm/2ix6pGRArReUHCW0wUA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WAu83REaO/PcoCLWv4v07NL2QTNgdEVOjgIY0VwJ3PlK8elJuOf1cGC62zZOpae4b
	 P4+PdijighFXy4r+GKoZphBsOCOVPN9DUHSckRZsIOVw79W+9PCq37vS+BpH2AnnUl
	 0J5UilZAe0WY8OjvM59p80hUjAVi7hxusHIDCSAHv3tTdNKpQmT2gJCLn8aesitCWY
	 Dw5YqlY3OmfqIV7rg7FOQh8kU91TuTevdyAMjE2f4uoKMyPBowGHq9SR8yB6jC7gpc
	 WsAL2ZiFXn3orLZbZkXAyCqdaIsc8WsrU+t709psom8XUo1HaeJ4lsaV/yWPSoZMED
	 tp9Od36VCV78Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5850B408FF;
	Sun, 25 Jan 2026 21:47:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E66C735C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDD0810E2
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_R_Uf_XnrQM for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 307C48141F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 307C48141F
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DE098364A; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:59:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb847e83797022dceedbcf92c5c2c72cffc32883
X-Git-Newrev: 42411aa324f5e70dc42e9b83824cb8758207158a
X-Patchwork-Hint: ignore
Message-Id: <20260125214728.2DE098364A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/stmicroelectronics/stm32f769-disco:
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

commit: https://git.buildroot.net/buildroot/commit/?id=42411aa324f5e70dc42e9b83824cb8758207158a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32f769-disco/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/stmicroelectronics/stm32f769-disco/post-build.sh b/board/stmicroelectronics/stm32f769-disco/post-build.sh
index 4510050941..293bf30cb3 100755
--- a/board/stmicroelectronics/stm32f769-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f769-disco/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 # Kernel is built without devpts support
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
