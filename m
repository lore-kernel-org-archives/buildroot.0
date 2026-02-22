Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62D3C624DB
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 17:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4804360A35;
	Sun, 22 Feb 2026 17:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikwWP5UL9gKb; Sun, 22 Feb 2026 17:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5340C60B4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771782533;
	bh=ErBlSVlIRKeYebPy5ozlkbjn0itw58xwKxKTYVBGo7s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BdXFRsrG2Y2PTLX5U7aolHtBshHCozobmBlkjBJuHxikV7HqWfaY9/4zIQGZFbiSD
	 tok73Ipr69I5pQ+PeQRWvyYDtcszHkDFPi6DeJL5N4zz94zE/088jmJmdiLIJ34rkA
	 CuqYN6c97+pcMmWd7w6KNl1YuRPeuRxLbDXIMb15+0BheRdJrmLmR8xiZjaRp93SGY
	 ILOnlO68sgbtdk3ONi+dZEBNB/nFVkk9aHrCVSPRPrkaa+iP3H/Br3zwEmtiwJJ0lB
	 X0/mDFnGA8mAw3hm257AToX2UpzDwud5lrzRvoh9F/s1Y8J3f9G6pXtIAbqjXqPik8
	 FL77ukzS5tNCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5340C60B4F;
	Sun, 22 Feb 2026 17:48:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C0C2DF
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 17:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D77083D7A
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 17:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izYMC3YziVZ0 for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 559FE83D79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 559FE83D79
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 17:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E6E286F55; Sun, 22 Feb 2026 17:48:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Feb 2026 18:45:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f90d38dafcadf959e6a0383376639a137a8bae4d
X-Git-Newrev: 5e7e7c5a66f82cd6a96fc7925d99554592cca374
X-Patchwork-Hint: ignore
Message-Id: <20260222174850.3E6E286F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: Remove CRIS support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e7e7c5a66f82cd6a96fc7925d99554592cca374
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commmit edfc67fb1a5f0fe67ba9de91e90b06a44902c231 bumped the
package from 9.1.0 to 9.2.0 without removing support for CRIS which was
removed upstream in version 9.2.0:
https://gitlab.com/qemu-project/qemu/-/commit/01d01edc9fc4623e93118bc8cb8c69a46d707026

https://wiki.qemu.org/ChangeLog/9.2
"The CRIS target has been removed without replacement"

Fixes:
https://autobuild.buildroot.net/results/376/376ea96ddfc0f220bca8bd241614303747f61bd4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy       | 6 ++++++
 package/qemu/Config.in | 5 -----
 package/qemu/qemu.mk   | 2 --
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4539b19bbe..a2a7b06a6d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_QEMU_TARGET_CRIS
+	bool "qemu cris support has been removed"
+	select BR2_LEGACY
+	help
+	  CRIS support has been removed since Qemu 9.2.0.
+
 config BR2_PACKAGE_DVDRW_TOOLS
 	bool "dvdrw-tools removed"
 	select BR2_LEGACY
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e16eafe446..0b16c8c284 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -189,11 +189,6 @@ config BR2_PACKAGE_QEMU_TARGET_AVR
 	help
 	  AVR 8-bit microcontroller architecture.
 
-config BR2_PACKAGE_QEMU_TARGET_CRIS
-	bool "cris"
-	help
-	  ETRAX CRIS microcontroller architecture.
-
 config BR2_PACKAGE_QEMU_TARGET_HEXAGON
 	bool "hexagon (linux-user, only)"
 	depends on BR2_PACKAGE_QEMU_LINUX_USER
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 97f8e22091..b7007e3b98 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -65,7 +65,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64) += aarch64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AVR) += avr-softmmu
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_CRIS) += cris-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HPPA) += hppa-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-softmmu
@@ -102,7 +101,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64_BE) += aarch64_be-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARMEB) += armeb-linux-user
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_CRIS) += cris-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HEXAGON) += hexagon-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HPPA) += hppa-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-linux-user
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
