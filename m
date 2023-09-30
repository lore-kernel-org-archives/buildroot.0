Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADA1E7737B
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 17:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 782ED404FF;
	Sat, 30 Sep 2023 17:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 782ED404FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqtEvatTcBDz; Sat, 30 Sep 2023 17:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78C9C415C1;
	Sat, 30 Sep 2023 17:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78C9C415C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8C2F1BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9391283CCA
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9391283CCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jecYoEAvC2b0 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 17:18:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7747283CC2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 17:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7747283CC2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E12B83C57; Sat, 30 Sep 2023 17:18:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 19:18:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13b0e6bbf3b1473993972fff8e4590a28749d823
X-Git-Newrev: bcfcc07413c9e5222ad82552208c7b17ffb17105
X-Patchwork-Hint: ignore
Message-Id: <20230930171850.5E12B83C57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/powertop: picutils is optional,
 not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcfcc07413c9e5222ad82552208c7b17ffb17105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pciutils is optional, not mandatory since version 2.1 and the addition
of the package in commit 0adc0e24eed72efca0097c7567319f07b8af6d94 and
https://github.com/fenrus75/powertop/commit/98ca605e7cf856795facc4a3a4f9c5b9baf1cab1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - one item per multi-line in _DEPENDENCIES
  - reorder _DEPENDENCIES
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/powertop/Config.in   |  1 -
 package/powertop/powertop.mk | 10 ++++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/powertop/Config.in b/package/powertop/Config.in
index 0f323a7bfb..fd88a3d0eb 100644
--- a/package/powertop/Config.in
+++ b/package/powertop/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_POWERTOP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_LIBNL
 	help
 	  A tool to diagnose issues with power consumption and power
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index c3e8d2549c..e035868fa9 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -6,10 +6,16 @@
 
 POWERTOP_VERSION = 2.13
 POWERTOP_SITE = https://01.org/sites/default/files/downloads
-POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
-	$(TARGET_NLS_DEPENDENCIES)
 POWERTOP_LICENSE = GPL-2.0
 POWERTOP_LICENSE_FILES = COPYING
+
+POWERTOP_DEPENDENCIES = \
+	host-pkgconf \
+	libnl \
+	ncurses \
+	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
+	$(TARGET_NLS_DEPENDENCIES)
+
 POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 # 0001-dont-force-stack-smashing-protection.patch
 POWERTOP_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
