Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5B3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F8260D93;
	Sun, 26 Dec 2021 15:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYNkiC-4bPAe; Sun, 26 Dec 2021 15:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD04160E02;
	Sun, 26 Dec 2021 15:02:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C2861BF2F4
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2660F408D4
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFd_WFMKukyP for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:02:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25F40408BD
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:02:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1B0F8819A4; Sun, 26 Dec 2021 14:56:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:01:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91ebf2b58b119a43134a95994c3cd63297f599fa
X-Git-Newrev: 30d1b3e573a852bc44e9c1e3c75c724b24dce533
X-Patchwork-Hint: ignore
Message-Id: <20211226145640.1B0F8819A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atop: bump to version 2.7.0
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
Content-Type: multipart/mixed; boundary="===============4017759116727746323=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4017759116727746323==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=30d1b3e573a852bc44e9c1e3c75c724b24dce533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://www.atoptool.nl/downloadatop.php

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-ifprop.c-fix-build-with-kernel-4.6.patch  | 51 ----------------------
 .../atop/0002-photosyst.c-fix-build-on-musl.patch  | 38 ----------------
 package/atop/atop.hash                             |  2 +-
 package/atop/atop.mk                               |  2 +-
 4 files changed, 2 insertions(+), 91 deletions(-)

diff --git a/package/atop/0001-ifprop.c-fix-build-with-kernel-4.6.patch b/package/atop/0001-ifprop.c-fix-build-with-kernel-4.6.patch
deleted file mode 100644
index 0dfe4f4301..0000000000
--- a/package/atop/0001-ifprop.c-fix-build-with-kernel-4.6.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From aff473ee28903775e1bb35793b9c4c50ee0c7270 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 22 Dec 2020 12:23:33 +0100
-Subject: [PATCH] ifprop.c: fix build with kernel < 4.6
-
-Build fails with kernel headers < 4.6 since version 2.6.0 and
-https://github.com/Atoptool/atop/commit/08c622ecaa5bb0bb260984ceaddc4730d1b312a7
-
-Indeed, ethtool_link_settings and ETHTOOL_GLINKSETTINGS are only
-available since
-https://github.com/torvalds/linux/commit/3f1ac7a700d039c61d8d8b99f28d605d489a60cf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Atoptool/atop/pull/142]
----
- ifprop.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ifprop.c b/ifprop.c
-index 60fa3fa..63fce5a 100644
---- a/ifprop.c
-+++ b/ifprop.c
-@@ -104,7 +104,9 @@ initifprop(void)
- 	char 				*cp, linebuf[2048];
- 	int				i=0, sockfd;
- 
-+#ifdef ETHTOOL_GLINKSETTINGS
- 	struct ethtool_link_settings 	ethlink;	// preferred!
-+#endif
- 	struct ethtool_cmd 		ethcmd;		// deprecated	
- 
- 	struct ifreq		 	ifreq;
-@@ -153,6 +155,7 @@ initifprop(void)
- 		strncpy((void *)&ifreq.ifr_ifrn.ifrn_name, ifprops[i].name,
- 				sizeof ifreq.ifr_ifrn.ifrn_name-1);
- 
-+#ifdef ETHTOOL_GLINKSETTINGS
- 		ethlink.cmd              = ETHTOOL_GLINKSETTINGS;
- 		ifreq.ifr_ifru.ifru_data = (void *)&ethlink;
- 
-@@ -164,6 +167,7 @@ initifprop(void)
- 			phy_addr = ethlink.phy_address;
- 		}
- 		else
-+#endif
- 		{
- 			ethcmd.cmd               = ETHTOOL_GSET;
- 			ifreq.ifr_ifru.ifru_data = (void *)&ethcmd;
--- 
-2.29.2
-
diff --git a/package/atop/0002-photosyst.c-fix-build-on-musl.patch b/package/atop/0002-photosyst.c-fix-build-on-musl.patch
deleted file mode 100644
index 8573d59d6b..0000000000
--- a/package/atop/0002-photosyst.c-fix-build-on-musl.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 34996ad1eb6d295382e7737ef34bd362abdd4944 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 19 Jan 2021 22:15:45 +0100
-Subject: [PATCH] photosyst.c: fix build on musl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Build on musl is broken since version 2.6.0 and
-https://github.com/Atoptool/atop/commit/e889c66fbe1d0b7ae38fbcbaa46cea749257f486
-because limits.h is not included:
-
-photosyst.c: In function ‘lvmmapname’:
-photosyst.c:1624:14: error: ‘PATH_MAX’ undeclared (first use in this function); did you mean ‘AF_MAX’?
-   char  path[PATH_MAX];
-              ^~~~~~~~
-              AF_MAX
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- photosyst.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/photosyst.c b/photosyst.c
-index 3de874b..67ae92f 100644
---- a/photosyst.c
-+++ b/photosyst.c
-@@ -165,6 +165,7 @@
- #include <dirent.h>
- #include <sys/ioctl.h>
- #include <sys/sysmacros.h>
-+#include <limits.h>
- 
- #define SCALINGMAXCPU	8	// threshold for scaling info per CPU
- 
--- 
-2.29.2
-
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 65148b8578..fb2eb1c727 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9ec2ca3a571692f7efaa095f99a5106432bcb71cc22cd6c49597ef0481058f72  atop-2.6.0.tar.gz
+sha256  a606705aaca940a6d44d67c886529a75db98fd88140f743eb0aaebb184c38af7  atop-2.7.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 88f292b6b3..f2a1f1de51 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.6.0
+ATOP_VERSION = 2.7.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING

--===============4017759116727746323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4017759116727746323==--
