Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0216C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A29340BFD;
	Fri, 28 Jan 2022 21:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56oVo5Ou6T0n; Fri, 28 Jan 2022 21:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39EBF40BFC;
	Fri, 28 Jan 2022 21:22:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6A911BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9573D85005
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIcxOTSkpyfx for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:22:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E116185004
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:22:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 13EC182B50; Fri, 28 Jan 2022 21:15:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:19:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4edfb8fef84d64a62d14d485e7cead3ab9e0b8b5
X-Git-Newrev: 4aecb964aff92e5cc956b2d3b700ac7841041463
X-Patchwork-Hint: ignore
Message-Id: <20220128211521.13EC182B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: bump to fix CVE-2021-4034
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

commit: https://git.buildroot.net/buildroot/commit/?id=4aecb964aff92e5cc956b2d3b700ac7841041463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are currently using the fork by Adam, with support for duktape as a
JS engine. But upstream has finally merged that just a day ago. Woohoo!

Between the fork we were using and upstream, there are very little
changes, mostly centered around:
  - translations
  - buildsystem
  - duktape
  - CVE-2021-4034

So, we just switch to using the HEAD of the repo: it has not much more
than the two important changes: duktape and the CVE fix.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index f108ac19ec..1fedb5a707 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  0a30dbc0ff798ff45f5bb303b4b40160f56679e81b139287cc0efb32aa5dfc1b  polkit-0.120.tar.gz
+sha256  243fa69d1e480510c504723487716cda7d6fb588360c7c8f7ec6ba4a3f6ae60e  polkit-a2bf5c9c83b6ae46cbd5c779d3055bff81ded683.tar.gz
 
 # Locally calculated
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index a7ab725c81..61666594a2 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,13 +4,16 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 0.120
-POLKIT_SITE = $(call github,aduskett,polkit-duktape,v$(POLKIT_VERSION))
+POLKIT_VERSION = a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
+POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VENDOR = polkit_project
 POLKIT_INSTALL_STAGING = YES
 
+# Fix was comitted in a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
+POLKIT_IGNORE_CVE = CVE-2021-4034
+
 POLKIT_DEPENDENCIES = \
 	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
