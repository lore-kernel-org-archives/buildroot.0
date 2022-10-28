Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8247AECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286F160AAF;
	Fri, 28 Oct 2022 06:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286F160AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H0FP7EXY2GVn; Fri, 28 Oct 2022 06:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F67D60A92;
	Fri, 28 Oct 2022 06:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F67D60A92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDBE71BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2EFF40170
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2EFF40170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzh0y08U_ZNI for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:53:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C623D400F8
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C623D400F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B14C2873C2; Fri, 28 Oct 2022 06:53:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:52:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 488055eb58ce23e28e08b9c9a0ed72c5de9ce47e
X-Git-Newrev: 8ab39ac65eab0e22e82b9b56a198a9abc83b5a9f
X-Patchwork-Hint: ignore
Message-Id: <20221028065344.B14C2873C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: bump to
 6c4826f12c4d33b8b978004bc681eb1eef2be977
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ab39ac65eab0e22e82b9b56a198a9abc83b5a9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/0001-no-bin-symlink.patch | 4 ++--
 package/luajit/0002-install-inc.patch    | 6 +++---
 package/luajit/luajit.hash               | 2 +-
 package/luajit/luajit.mk                 | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index d32ec5ad60..dc36fa58d6 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -44,8 +44,7 @@
+@@ -45,8 +45,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SOSHORT1= libluajit-$(ABIVER).so
  INSTALL_SOSHORT2= libluajit-$(ABIVER).so.$(MAJVER)
-@@ -60,7 +59,6 @@
+@@ -61,7 +60,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT1)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT2)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index 5f6547fc3f..8de777dce2 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -10,8 +10,8 @@ Index: b/Makefile
  INSTALL_BIN=   $(DPREFIX)/bin
  INSTALL_LIB=   $(DPREFIX)/$(MULTILIB)
  INSTALL_SHARE= $(DPREFIX)/share
--INSTALL_INC=   $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
-+INSTALL_INC=   $(DPREFIX)/include
+-INSTALL_DEFINC= $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
++INSTALL_DEFINC= $(DPREFIX)/include
+ INSTALL_INC=   $(INSTALL_DEFINC)
  
  INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(VERSION)
- INSTALL_JITLIB= $(INSTALL_LJLIBD)/jit
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 648d6eb181..d00cea4ee0 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e0389c7669f8e455383d8f0c9d9354d44cdd1885bbf8fd0d4bcdb8fc6f794063  luajit-5677985dc1f19cf0a67112f4365c7fb79237fa16.tar.gz
+sha256  19a911fdd77af69e48fa50749606a9009696f543cc88e898b4480d8d3c8828f5  luajit-6c4826f12c4d33b8b978004bc681eb1eef2be977.tar.gz
 
 # Locally calculated
 sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 2c1e3216e1..c79f18bf62 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 5677985dc1f19cf0a67112f4365c7fb79237fa16
+LUAJIT_VERSION = 6c4826f12c4d33b8b978004bc681eb1eef2be977
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
