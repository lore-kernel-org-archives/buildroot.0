Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471D1C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C2742EA1;
	Sat, 13 May 2023 08:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C2742EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5cQwmpweT-y; Sat, 13 May 2023 08:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70A9D42E7E;
	Sat, 13 May 2023 08:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70A9D42E7E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 911E61BF86B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6892C42CBD
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6892C42CBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBYDHXsbzp4s for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:16:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6455942CB3
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6455942CB3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AD7F84067; Sat, 13 May 2023 08:16:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 10:02:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3668c1f381a1f48593c03142cb47f4e24b742e98
X-Git-Newrev: 33bb76627b4bb8c70b90ebf78dbe24b3eceff729
X-Patchwork-Hint: ignore
Message-Id: <20230513081614.3AD7F84067@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: change project and download
 URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=33bb76627b4bb8c70b90ebf78dbe24b3eceff729
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index a446c0cf68..235fdb9ce6 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -43,7 +43,7 @@ menuconfig BR2_PACKAGE_QEMU
 	  Linux. When using KVM, QEMU can virtualize x86, server and
 	  embedded PowerPC, and S390 guests.
 
-	  http://qemu.org/
+	  https://www.qemu.org/
 
 if BR2_PACKAGE_QEMU
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3cbeffe213..3f51cb572b 100644
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
