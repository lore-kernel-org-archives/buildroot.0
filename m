Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999BEC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E0B7605A2;
	Mon,  5 Dec 2022 12:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E0B7605A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BWClAOo3MCTQ; Mon,  5 Dec 2022 12:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C78F60A47;
	Mon,  5 Dec 2022 12:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C78F60A47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B87FC1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FCC8416BC
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FCC8416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1ompJS6atnx for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E24B416BA
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E24B416BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B38585BBE; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 23:18:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d76a277a0e0a0f9703f0e0c2b0e313db9a834d7d
X-Git-Newrev: c45b2f2b9da5109e40a18ffdef379f5112aa7224
X-Patchwork-Hint: ignore
Message-Id: <20221205112612.2B38585BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale/ls1028ardb: add more
 documentation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c45b2f2b9da5109e40a18ffdef379f5112aa7224
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/ls1028ardb/readme.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 2dd2e2d84b..cfd1c8c490 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -8,6 +8,16 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
   - https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB
   - https://www.nxp.com/LS1028A
 
+for the software NXP LSDK (Layerscape Software Development Kit), see
+  - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
+
+the components from NXP are:
+  - rcw, LSDK 21.08
+  - atf (fork), LSDK 21.08
+  - uboot (fork), LSDK 21.08
+  - cadence-dp-firmware (blob), LSDK 20.12
+  - linux (fork), LSDK 21.08
+
 Build
 =====
 
@@ -67,3 +77,11 @@ The Cadence DP (Display Port) firmware must loaded from uboot with the following
   Loading hdp firmware from 0x0000000080000000 offset 0x0000000000002000
   Loading hdp firmware Complete
   => boot
+
+The interfaces of Ethernet switch (Felix DSA) are bring up with the following commands:
+
+  ip link set eno2 up
+  ip link set swp0 up
+  ip link set swp1 up
+  ip link set swp2 up
+  ip link set swp3 up
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
