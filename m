Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42156C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 07:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4DF6410A5;
	Tue, 13 Jun 2023 07:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4DF6410A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6qgjLapzoQf; Tue, 13 Jun 2023 07:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3599408AF;
	Tue, 13 Jun 2023 07:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3599408AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7F851BF341
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE81682305
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE81682305
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUyj6AmOpVrW for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 07:05:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE48F82265
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 07:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE48F82265
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD0AB828A4; Tue, 13 Jun 2023 07:05:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 08:37:35 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 83137bd8ea8cfb35b0e5c99049997799a980cc10
X-Git-Newrev: 07e3ba7ecc553c8a2a1c7e1241971180cd436adb
X-Patchwork-Hint: ignore
Message-Id: <20230613070545.CD0AB828A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/qemu: change
 project and download URL to https
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=07e3ba7ecc553c8a2a1c7e1241971180cd436adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 33bb76627b4bb8c70b90ebf78dbe24b3eceff729)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 154b98a541..31cbf09644 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -43,7 +43,7 @@ menuconfig BR2_PACKAGE_QEMU
 	  Linux. When using KVM, QEMU can virtualize x86, server and
 	  embedded PowerPC, and S390 guests.
 
-	  http://qemu.org/
+	  https://www.qemu.org/
 
 if BR2_PACKAGE_QEMU
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cc8dc42a24..47ea75681f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -8,7 +8,7 @@
 # needs to be updated.
 QEMU_VERSION = 7.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
-QEMU_SITE = http://download.qemu.org
+QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
