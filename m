Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B327CD72371
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6286740854;
	Sun, 25 Jan 2026 21:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZQJNZKPXSWU; Sun, 25 Jan 2026 21:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7776F408A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377653;
	bh=5vH75RH/OebtfOaYhV9/Tv2+8BgMe1rYU6V1pjlDhXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=In4FHEupeemuihBTN9VMWlXFyihjv1gemcJofDdH3OSRgm866IWwWeFAz7y0JxS5N
	 8Lar/kZam9XBu7sEimPlxyciXqh6pcggQerYF0lUfiITZoOecSFFLH8W2DaliMI2Be
	 H7b7o0eteX0eTdM3y069hleNp/+jZVw6vxf3rAnOx+YWCPZK3099Yp6xkJrLnyeM8a
	 2FHN40A241+j7f2BGVP/jAhqn83RaGjRFb1SzZ1CAalZ+zQWDk/p0byVJcedP/nGx3
	 Vw1InovDJ3V/tlhdctGzOHV/aaByhb6M94zcKGG8ENXuaAZ2g1GK88YXjLCvWRFJOw
	 K/23YXdrVAMdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7776F408A2;
	Sun, 25 Jan 2026 21:47:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF96F1CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D290040892
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrPj2ph7X14P for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05D4840854
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05D4840854
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA0E485F1F; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:59:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c22dc1b819b3428eb0313afc5216bd69575c1021
X-Git-Newrev: 6b5c20285687abbda9ef048d6787eb487735f99e
X-Patchwork-Hint: ignore
Message-Id: <20260125214727.EA0E485F1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/stmicroelectronics/stm32f469-disco:
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b5c20285687abbda9ef048d6787eb487735f99e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32f469-disco/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/stmicroelectronics/stm32f469-disco/post-build.sh b/board/stmicroelectronics/stm32f469-disco/post-build.sh
index 03e9dcae82..74c59fdb72 100755
--- a/board/stmicroelectronics/stm32f469-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f469-disco/post-build.sh
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
