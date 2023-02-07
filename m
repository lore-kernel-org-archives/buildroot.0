Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0BBC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1617860D5F;
	Tue, 21 Feb 2023 01:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1617860D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwVALwvBtYdX; Tue, 21 Feb 2023 01:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44AE46FE59;
	Tue, 21 Feb 2023 01:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44AE46FE59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA261BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D8A7610D9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D8A7610D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTWQLyUmPRj1 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 434516FC20
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 434516FC20
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F324828C8; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 09:34:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2c41fb6225632ecea0b7008969bb70cf8e2636ef
X-Git-Newrev: 82f84b4cfbe7d7631b34b67f10e9709772dd1165
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.3F324828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/tests: enable PPD,
 and thus TLPB, for systemd tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=82f84b4cfbe7d7631b34b67f10e9709772dd1165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/init/test_systemd.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 06c42736ae..ddc32b0838 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -13,6 +13,7 @@ class InitSystemSystemdBase(InitSystemBase):
         BR2_INIT_SYSTEMD=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PER_PACKAGE_DIRECTORIES=y
         """
 
     def check_systemd(self, fs):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
