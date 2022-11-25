Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47A1C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 22:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71E8981D70;
	Fri, 25 Nov 2022 22:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71E8981D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riC3dwWmzZxv; Fri, 25 Nov 2022 22:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCB781E2B;
	Fri, 25 Nov 2022 22:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BCB781E2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62EE41BF3D0
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A05A81414
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A05A81414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_T1JoKjTBco for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 22:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE8C8142D
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 22:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE8C8142D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CDA3846FD; Fri, 25 Nov 2022 22:18:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 23:18:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d76a277a0e0a0f9703f0e0c2b0e313db9a834d7d
X-Git-Newrev: c45b2f2b9da5109e40a18ffdef379f5112aa7224
X-Patchwork-Hint: ignore
Message-Id: <20221125221857.3CDA3846FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/freescale/ls1028ardb:
 add more documentation
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
