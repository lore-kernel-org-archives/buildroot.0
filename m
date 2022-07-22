Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66671C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D21660DFD;
	Fri, 22 Jul 2022 06:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D21660DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJ4Yxls_dB65; Fri, 22 Jul 2022 06:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D24607FF;
	Fri, 22 Jul 2022 06:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11D24607FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0937C1BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 129EE847C3
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 129EE847C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8nM3j0FMFgn for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:34:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20D82847C9
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20D82847C9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 32BD8840F1; Fri, 22 Jul 2022 06:20:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 08:32:32 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d1f700b3f1c6f8e38956bb561c279bb88a43314c
X-Git-Newrev: 977644b7d1a62997bf7c4368c4198652f9cf21bb
X-Patchwork-Hint: ignore
Message-Id: <20220722062039.32BD8840F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cups: fix
 CUPS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=977644b7d1a62997bf7c4368c4198652f9cf21bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

CUPS_CPE_ID_VENDOR is wrong since switch to OpenPrinting upstream
repository in commit 8cf034ab0f686d0a3891b6fe5bb5a2d1bdf381d5:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenprinting%3Acups

While at it, also fix URL in Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b598a284f120d9bda2a018e145f50ef5758a24f6)
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
