Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F492E9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D75496111C;
	Wed,  4 Feb 2026 17:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vljM4rd6ZMAh; Wed,  4 Feb 2026 17:08:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A83D16123D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224919;
	bh=FJWftB6at2AN8tSnvXAJrzquZs2pnKPkww7Ql4HPA+I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cX+YOkzII59/Yx/aQA1D6KctocGF46/l4k9buJFKgtHki1qpP+tTTHpdOyQx2UhZh
	 4oEkT3CkuLjq86cRtLXmwzTllHa1NCFGU2Cx7spqrD6sQ5RJRbvWq3hPK3UlMlAe3o
	 br5LOLP5RcKlC0lnWwhH5G4bWJFPuWnU5JHNyWLe2WtClnOP5F7tTylVcjTUnH+1Zg
	 ne/hjx+NAOwvujyPYizwdu3E9FZ3ekxDllm4q2wvNfedSmG7K4NmeVwzZN0W2GfdJx
	 tomElt48mtWCgjvRALFZWN9p1Y03RZGjPVfd/oWKBojsrFddvVGx4h1VUZRLsHjCaB
	 j8U/j5NCF3bNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A83D16123D;
	Wed,  4 Feb 2026 17:08:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B87E2EB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F6FD40029
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXUY7MIOuQaM for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D76AF40135
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D76AF40135
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C897B8697F; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:32:14 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5c36e119491db230aa04d919514403b1a346fe18
X-Git-Newrev: 7fce5929f028dc44b0cc3879d89c98de11dc3537
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.C897B8697F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 board/stmicroelectronics/stm32f469-disco: fix typo in readme.txt
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fce5929f028dc44b0cc3879d89c98de11dc3537
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Add a missing space in the "Creating SD card" section of the
documentation.

Fixes: 04a0094f0ef0778d1f3c4056ac0005218126147e ("configs/stm32f469_disco: fix kernel bootup")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cd10beb0e8cef0ab3e1c199085751dc732d8d043)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/stmicroelectronics/stm32f469-disco/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
index 99d26ccb66..6d46f7c31a 100644
--- a/board/stmicroelectronics/stm32f469-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
@@ -20,7 +20,7 @@ It will flash the U-boot bootloader.
 Creating SD card
 ----------------
 
-Buildroot prepares an"sdcard.img" image in the output/images/ directory,
+Buildroot prepares an "sdcard.img" image in the output/images/ directory,
 ready to be dumped on a SD card. Launch the following command as root:
 
   dd if=output/images/sdcard.img of=/dev/<your-sd-device>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
