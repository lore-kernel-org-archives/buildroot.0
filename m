Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6E8E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B21E06125D;
	Wed,  4 Feb 2026 17:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-XN_iIH6h1j; Wed,  4 Feb 2026 17:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AE5761262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224930;
	bh=nHcXRIuZpz9nBCqlZrG6aybADVdl5I9Fu33AzX/Psks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PXJY6DrY4N/2MN8jYH0wZRs/9+Y1Ou2caD+TdgYdhJHnZyFfou6QreCMUvDIaWXfO
	 1gTChL9TOT4WjcegBQJB5RijfxbKZ1RzjY4EWJUgWa13Y5bypuMmbjCn//T8p26Dy2
	 ixgFO3E6pOu6KOX0A6IiCPcUUvMniW0pZbEI6r/Jd8ao6illYvw4gZ9HTZodFJgqR3
	 CxYkOvpwKkWEcatNyJawnMdvGBQX64om7aH2OUWNMb+/MLpOIjDavEdhzaRuzciZeW
	 NHPp9zuhiaw+JLALPMSzKxu3EuGlEmYyNaKDlN14ONG50Y2KwRW2YbENOhx0c7z8cn
	 x/nOwiFZXJq6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AE5761262;
	Wed,  4 Feb 2026 17:08:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FF8DF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 141EC405DC
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UzKH6IEOGKD for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6DF440568
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6DF440568
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA02D86983; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:32:28 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 349b1262f6240d3d6795addc7716cab13c92f65b
X-Git-Newrev: 678ec663ed713e621004f167cf4abe927aa4068d
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.DA02D86983@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 board/stmicroelectronics/stm32f4xx: exit post-build.sh on error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/678ec663ed713e621004f167cf4abe927aa4068d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3c8ecc05c6b1c30141808910653dc109a27835cc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
