Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474C3FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 197C8607A8;
	Thu, 26 Feb 2026 20:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5Wvlwit5R15; Thu, 26 Feb 2026 20:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 168C960794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138741;
	bh=HPD4rMEGD1urgBBaIkH1ELJ7DIdvxa58xEeqo3iu96s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IX92HDDLhvOHnfM2aMaFIuW1D0EUXtZvwEIutTVMio7QAHpO6VCjiE+ISHUeHESDg
	 NLGk0dbCLiaqWR8O/Ih4xj0M0aKTg698jAuIoIbecmqWGWOWIyRvZ/TOdAHPuavgSi
	 AGkc1I5ke8SBgcuB+FWpVu9I1M6gxRxl/eIxWJSNlEEv8FD8WsbirlUYH4+soHEVfJ
	 i4Alm9Pudut+7gNNpBegW23170oHLzjVkNQK3GG08N943fSZV5B3lyu9U9PXECf5ml
	 GGgtmVl0wOgXBj5qRJAz+md5GfemhT05SHH78Uo3C72LnnwB3tkxQhwvVmozztmLOf
	 TGOizDUPHIlfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 168C960794;
	Thu, 26 Feb 2026 20:45:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE2E91F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C56040246
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRE_YfasYVKf for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4D6740269
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4D6740269
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB9708755F; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:29:08 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 22cfd2c9afb9059e730dbfd055dd630960e01633
X-Git-Newrev: 558e05f6057f59a7f10db344b9fa44fa24cd8252
X-Patchwork-Hint: ignore
Message-Id: <20260226204529.DB9708755F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/qemu: Remove CRIS
 support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/558e05f6057f59a7f10db344b9fa44fa24cd8252
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit 5e7e7c5a66f82cd6a96fc7925d99554592cca374)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy       | 8 ++++++++
 package/qemu/Config.in | 5 -----
 package/qemu/qemu.mk   | 2 --
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 11679c3c9a..50d7253221 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.11.3"
+
+config BR2_PACKAGE_QEMU_TARGET_CRIS
+	bool "qemu cris support has been removed"
+	select BR2_LEGACY
+	help
+	  CRIS support has been removed since Qemu 9.2.0.
+
 comment "Legacy options removed in 2025.11.2"
 
 config BR2_PACKAGE_DVDRW_TOOLS
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ff7423bc4c..31f2981077 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -174,11 +174,6 @@ config BR2_PACKAGE_QEMU_TARGET_AVR
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
index 5cc98138d9..02d8888d5b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -52,7 +52,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64) += aarch64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AVR) += avr-softmmu
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_CRIS) += cris-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HPPA) += hppa-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-softmmu
@@ -89,7 +88,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64_BE) += aarch64_be-linux-user
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
