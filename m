Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D3CCDB482
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40F480D0F;
	Fri, 13 Oct 2023 06:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40F480D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WFOHFFknpq38; Fri, 13 Oct 2023 06:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF80E82871;
	Fri, 13 Oct 2023 06:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF80E82871
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 287CA1BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04BC041C22
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04BC041C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9WZE0OfOKxO for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9A7E41BC3
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A7E41BC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9C94846B4; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:21:36 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7943809590aa15c997c4e8b9ce31065e3b682c53
X-Git-Newrev: dd6ec5949eee32654709b074e20ca11046ad4f3b
X-Patchwork-Hint: ignore
Message-Id: <20231013062403.B9C94846B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/powertop:
 picutils is optional, not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd6ec5949eee32654709b074e20ca11046ad4f3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

pciutils is optional, not mandatory since version 2.1 and the addition
of the package in commit 0adc0e24eed72efca0097c7567319f07b8af6d94 and
https://github.com/fenrus75/powertop/commit/98ca605e7cf856795facc4a3a4f9c5b9baf1cab1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - one item per multi-line in _DEPENDENCIES
  - reorder _DEPENDENCIES
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bcfcc07413c9e5222ad82552208c7b17ffb17105)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
