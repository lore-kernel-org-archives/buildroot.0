Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E30EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 14:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02BF441916;
	Sun,  5 Nov 2023 14:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02BF441916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmxYZDw1d_nk; Sun,  5 Nov 2023 14:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A9741913;
	Sun,  5 Nov 2023 14:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A9741913
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 833E11BF342
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 14:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 696A541913
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 14:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696A541913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0bpZB5TTS2w for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 14:24:10 +0000 (UTC)
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95AEC4190D
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 14:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95AEC4190D
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ze2oqa5ElNmNJze2oq1qEa; Sun, 05 Nov 2023 15:24:06 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 15:24:05 +0100
Message-Id: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHZGymYahWMGB2V0dFMkmpSrI5OlMf2Lb3z8A1lAaNIbisWkFmyb1iyblocol2prpknTlg5jZegY8qAR48Z1bhY+Q2MI5/Z5EqOCVkmFiNWIQm8ON6L+
 U5FTzjefe6Bw9a2ZGHGnbF6ZnkGr9UvX6IRMX6lwP1MhMZqqorA1iozZQFjop/qMw0sfufJ5YZnQ6bMdjNWIlBQzDJS4zOKfE90+BgcyKXY5z0y6yKbVEKOk
 5KPnJJh/E951Ws3Ha7nIdc+cUQChdPjbSTIjmBstl3CsUmyqmrI58Np2KM0BhUbo50soZ1+tyGdSJw1+j70OuwqQgQ+d6sBlyFIkWPILNFLpyuW2ToRiIFMI
 yjm/xl6fPW307V7jGfTatU1ipIQna8iXQnEuva3u9eXsK2zqd/0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699194246; bh=eZO4HV6etZuGECS46t1VAF09SqxHuCrIpS595lrnJ84=;
 h=From:To:Subject:Date:MIME-Version;
 b=bVNqdItKnk+VDZWssLWwWIV2I+1W5GpmPu5BFbKGuN9y0CD8oJ+6bBn+GpJhuMm2g
 d5oo/hJr4JfwaJ8goK6ssq3odmgC2gL8rHWIEsKR0Y3j5Q4vrQVDr0zUIJCwAtOodS
 Fh2ZuHE9izUAnkQMSDdSYhB+M52+BO5pZBgpbLv+c8InhmeO1PkuSm9j2yBbpuZXs6
 EdbrRy9R+Rmdm0jAfTkU1VSGwzwwKMWcEiSeRISe3+VvEZhcDRbwITGiu3z2GdzpH+
 0mtqpYpu/e4v7xFm+GqHYskam3o7+IUhmTxjGotMK9l73WUje7O1thyl/mzzN6YyyO
 Z/EbDLaq98ObQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=bVNqdItK
Subject: [Buildroot] [PATCH] package/nodejs/nodejs-src: fix arch check on
 additional modules
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the moment check-bin-arch script finds NodeJS modules containing
prebuilt binaries for different architectures and build fails.
So let check-bin-arch to ignore folder /usr/lib/node_modules by setting
NODEJS_SRC_BIN_ARCH_EXCLUDE to it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nodejs/nodejs-src/nodejs-src.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
index 6fb550f158..8f934202b0 100644
--- a/package/nodejs/nodejs-src/nodejs-src.mk
+++ b/package/nodejs/nodejs-src/nodejs-src.mk
@@ -244,6 +244,9 @@ define NODEJS_SRC_INSTALL_MODULES
 	# help in diagnosing the problem.
 	$(NPM) install -g $(NODEJS_SRC_MODULES_LIST)
 endef
+
+# Exclude prebuilt binaries with different architectures and OS from check
+NODEJS_SRC_BIN_ARCH_EXCLUDE = /usr/lib/node_modules/
 endif
 
 define NODEJS_SRC_INSTALL_STAGING_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
