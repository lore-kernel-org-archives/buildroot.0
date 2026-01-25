Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86660D72371
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 402C88211B;
	Sun, 25 Jan 2026 21:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WL5JcX29qdf2; Sun, 25 Jan 2026 21:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636A182144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377659;
	bh=zwgDcuv2cUSpB/u19e7CvojfeTwvSRrjhgs9q3w7svs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M813FNiffmT4TEy3uaEe0VIEMEeq+5jUkz88UGQwF1MpgbwDtWNquDpqwb5jj1a3F
	 euVa8grwf1kDfX59+pNIYtNsr7cpRU7N7/1rTstHVFiwSjK+bq+1InueQHn6B/cUwt
	 uh/03bQI0ZuADHnMHCSwgUB5NUflWAulVMsvlm5ml5VnJW/Ws4Qpbod5K1mjj7BUQc
	 eFB+M6+a7l237iCySX6xjajRBvx1smBOuJ5TBU9kJqlsUriOM/GEPgAhTF3T7mhFqA
	 PGH0fQLoZuP6BhLGKPJ39Wtmqj6405Msm9ycgywJZekgePwRQ9JHZdB86mB5ie6ykO
	 /Hy5MgNHG+Kow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636A182144;
	Sun, 25 Jan 2026 21:47:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3810135C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D56D140892
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyHnyYhGDezM for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C11A440818
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C11A440818
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAC02876F1; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:57:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cedf74c1759394bb0cd8381c605664c8c20eb4f
X-Git-Newrev: 3c8ecc05c6b1c30141808910653dc109a27835cc
X-Patchwork-Hint: ignore
Message-Id: <20260125214727.AAC02876F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/stmicroelectronics/stm32f4xx: exit
 post-build.sh on error
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c8ecc05c6b1c30141808910653dc109a27835cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
index 4fcce61500..2c5b6be098 100755
--- a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
+++ b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+set -eu
 
 # Busybox is built without network support
 sed -i '/hostname/d' ${TARGET_DIR}/etc/inittab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
