Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1D7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D7C40999;
	Mon, 27 Jun 2022 21:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D7C40999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zafiS6jvSPtB; Mon, 27 Jun 2022 21:45:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B11C140939;
	Mon, 27 Jun 2022 21:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B11C140939
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61EFD1BF34B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AA9C80B0C
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA9C80B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsdHZyweuNTH for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:44:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 905EE80B07
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905EE80B07
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D00D8764D; Mon, 27 Jun 2022 21:32:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 23:44:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 613a3ac3d05f552662af49dbbb6b56296c629668
X-Git-Newrev: b598a284f120d9bda2a018e145f50ef5758a24f6
X-Patchwork-Hint: ignore
Message-Id: <20220627213216.3D00D8764D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: fix CUPS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=b598a284f120d9bda2a018e145f50ef5758a24f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CUPS_CPE_ID_VENDOR is wrong since switch to OpenPrinting upstream
repository in commit 8cf034ab0f686d0a3891b6fe5bb5a2d1bdf381d5:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenprinting%3Acups

While at it, also fix URL in Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/Config.in | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index e23f069a8a..51cf10b073 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_CUPS
 	help
 	  The Common Unix Printing System
 
-	  http://www.cups.org
+	  https://openprinting.github.io/cups
 
 comment "cups needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index ab56b23bcd..2bd5f3bbb6 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -9,7 +9,7 @@ CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
 CUPS_LICENSE_FILES = LICENSE NOTICE
-CUPS_CPE_ID_VENDOR = cups
+CUPS_CPE_ID_VENDOR = openprinting
 CUPS_SELINUX_MODULES = cups
 CUPS_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
