Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC39D72371
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0A560AEF;
	Sun, 25 Jan 2026 21:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaJAcOkFBKiM; Sun, 25 Jan 2026 21:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2928B60ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377656;
	bh=Na+sFLub0DLIDsaKIQOA5UfFce/aQrrt/a5YvUNBhxk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VFRfhQaNd2qzX9ynpX3MLN8P+Ii6z9JZpODfXkpA5I+JdHmWay1An1rjPMuVjHlQb
	 Sk8BdoK29tIQRfEqDHXlsOR9RiitpRKorvariMKOERLPgtsMULa6SkfaRcvrtLuImc
	 DHHZDZVG9gJVUZtjAQJi06kPt8qcJrr/xcfkmHi/C0XZZyUPkWnJalCsk8klKsAPgt
	 bv1M8H2kML8oO33TnnAVPuPL8vaVmZ/JLMBID1osm9iZUp3ek9ez36RERuZwC361jM
	 FKSbL48DRFB8cU77p1zu3YuAFFubEXplr6Vm8MniznuwHzX3KEn4iCrmpCFLYuXT0v
	 Rux+jc0nzlHbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2928B60ADC;
	Sun, 25 Jan 2026 21:47:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 721D535C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 600ED40854
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPzne2W0NDG4 for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246DF4088F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 246DF4088F
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21F2485F1F; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:59:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 374f5b66cbecf0254cf1b50ee106a15011d527b7
X-Git-Newrev: fb847e83797022dceedbcf92c5c2c72cffc32883
X-Patchwork-Hint: ignore
Message-Id: <20260125214728.21F2485F1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/bsh/imx8mn-bsh-smm-s2: exit
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb847e83797022dceedbcf92c5c2c72cffc32883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx8mn-bsh-smm-s2/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
index 49df4cd6fb..ede1738ecb 100755
--- a/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
+++ b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname $0)"
 
 cp ${BOARD_DIR}/nand-full.lst ${BINARIES_DIR}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
