Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC603C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5E7F42850;
	Fri, 10 Nov 2023 21:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E7F42850
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7B5fSZmnEov; Fri, 10 Nov 2023 21:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE5542847;
	Fri, 10 Nov 2023 21:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE5542847
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2421C1BF2C4
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F140B6F6F7
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F140B6F6F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwAjtpOQFoLM for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:00:22 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3BA36F6F3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3BA36F6F3
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AAHWV9d011835; Fri, 10 Nov 2023 21:00:20 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3u9s0tt4mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Nov 2023 21:00:20 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 3AAL0I7f026748
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Nov 2023 21:00:19 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 3AAL0Ia3001758
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 10 Nov 2023 21:00:18 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 15C8F2006C;
 Fri, 10 Nov 2023 15:00:18 -0600 (CST)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 21:00:00 +0000
Message-ID: <20231110210001.58405-2-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231110210001.58405-1-brandon.maier@collins.com>
References: <20231110210001.58405-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_18,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311100175
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=978
 spamscore=0 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311100174
X-Proofpoint-ORIG-GUID: RIRELY7Iei9ic9gnlh8HmE8Kdrsz-kva
X-Proofpoint-GUID: RIRELY7Iei9ic9gnlh8HmE8Kdrsz-kva
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311100175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=S7ixYiV35v5QJKT+zXzQT7bJ4DhuTxfv5GEdzlRlFlo=;
 b=YCZt29Ktww542DFmybp/d7KIXUDLDyhL4cTYLIlQ/AoQbvGpxGGjephP35uresPKlMhE
 C6Ot6pazygtvSIxLmVWGAHuhFAvb6Idv7jj5/agklxKWuF+A3by7f01GGay0vq4IG0GL
 wDFV3DGGlXWnNTYEFnv5Pyjq3vetnxS99AGRDOa0YKCzArKn9jkBVUI7O6N9HkauuIsd
 iVAQsBz7uFjlnkZa2jwnwpORRpEa+Hqxj2APrrqlzuaGdp7R9F0aOda0a5Qr1cAmzc2b
 j5Xdwkq+Qogd0Jz8ZZYp6pj3Y1rnIzk3tzwb0hTBXUxS2VpfjaVLTt9o4Yd+U+4xm2Fn vA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=YCZt29Kt
Subject: [Buildroot] [PATCH 2/2] package/memtest86: rename package to
 memtest86plus
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Steve Kenton <skenton@ou.edu>, Brandon Maier <brandon.maier@collins.com>,
 Kalpesh Panchal <kalpesh.panchal2@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Abhishek Anand <abhishek.anand@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kalpesh Panchal <kalpesh.panchal2@collins.com>

Memtest86+, is a development fork of the original MemTest86.
But now, MemTest86(https://www.memtest86.com/) and
Memtest86+(https://memtest.org/) are two different tools and
maintained separately. The intention of this package is to use
opensource version Memtest86+. So to avoid confusion the package
is renamed to memtest86plus like the name on github.

Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
Signed-off-by: Abhishek Anand <abhishek.anand@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 Config.in.legacy                              |  8 +++++
 DEVELOPERS                                    |  2 +-
 package/Config.in                             |  2 +-
 package/memtest86/memtest86.mk                | 30 -------------------
 .../{memtest86 => memtest86plus}/Config.in    |  8 ++---
 .../memtest86plus.hash}                       |  2 +-
 package/memtest86plus/memtest86plus.mk        | 30 +++++++++++++++++++
 7 files changed, 43 insertions(+), 39 deletions(-)
 delete mode 100644 package/memtest86/memtest86.mk
 rename package/{memtest86 => memtest86plus}/Config.in (87%)
 rename package/{memtest86/memtest86.hash => memtest86plus/memtest86plus.hash} (83%)
 create mode 100644 package/memtest86plus/memtest86plus.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 312d53943c..620d890b15 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -267,6 +267,14 @@ config BR2_PACAKGE_OPENFPGALOADER_CMSIS
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_MEMTEST86
+	bool "memtest86 has been renamed"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_LEGACY
+	select BR2_PACKAGE_MEMTEST86PLUS
+	help
+	  memtest86 package has been renamed to memtest86plus.
+
 config BR2_PACKAGE_PUGIXML_HEADER_ONLY
 	bool "pugixml header-only removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d80931e84a..82fe28551c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2813,7 +2813,7 @@ F:	package/libcli/
 N:	Steve Kenton <skenton@ou.edu>
 F:	package/dvdauthor/
 F:	package/dvdrw-tools/
-F:	package/memtest86/
+F:	package/memtest86plus/
 F:	package/mjpegtools/
 F:	package/udftools/
 F:	package/xorriso/
diff --git a/package/Config.in b/package/Config.in
index dac5058bbe..eff6d227db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -556,7 +556,7 @@ endmenu
 	source "package/mdadm/Config.in"
 	source "package/mdevd/Config.in"
 	source "package/mdio-tools/Config.in"
-	source "package/memtest86/Config.in"
+	source "package/memtest86plus/Config.in"
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
 	source "package/mhz/Config.in"
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
deleted file mode 100644
index 332157ab26..0000000000
--- a/package/memtest86/memtest86.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-################################################################################
-#
-# memtest86
-#
-################################################################################
-
-MEMTEST86_VERSION = 6.20
-MEMTEST86_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86_VERSION))
-MEMTEST86_LICENSE = GPL-2.0
-MEMTEST86_LICENSE_FILES = LICENSE
-MEMTEST86_INSTALL_IMAGES = YES
-MEMTEST86_INSTALL_TARGET = NO
-
-ifeq ($(BR2_i386),y)
-MEMTEST86_BUILD_DIR = build32
-else
-ifeq ($(BR2_x86_64),y)
-MEMTEST86_BUILD_DIR = build64
-endif
-endif
-
-define MEMTEST86_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(MEMTEST86_BUILD_DIR)
-endef
-
-define MEMTEST86_INSTALL_IMAGES_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86_BUILD_DIR)/memtest.* $(BINARIES_DIR)/
-endef
-
-$(eval $(generic-package))
diff --git a/package/memtest86/Config.in b/package/memtest86plus/Config.in
similarity index 87%
rename from package/memtest86/Config.in
rename to package/memtest86plus/Config.in
index 81c69e0222..912c4ce2ec 100644
--- a/package/memtest86/Config.in
+++ b/package/memtest86plus/Config.in
@@ -1,13 +1,9 @@
-config BR2_PACKAGE_MEMTEST86
-	bool "memtest86"
+config BR2_PACKAGE_MEMTEST86PLUS
+	bool "memtest86plus"
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  Memtest86+ is a bootable standalone memory test program.
 
-	  Buildroot does not support packages with a '+' sign in their
-	  name, which explains why it is named memtest86 and not
-	  memtest86+.
-
 	  Memtest86+ is a utility designed to test whether your memory
 	  is in working order. It repeatedly writes an enormous amount
 	  of different patterns to all memory locations and reads them
diff --git a/package/memtest86/memtest86.hash b/package/memtest86plus/memtest86plus.hash
similarity index 83%
rename from package/memtest86/memtest86.hash
rename to package/memtest86plus/memtest86plus.hash
index df4699c63b..9e42583fcf 100644
--- a/package/memtest86/memtest86.hash
+++ b/package/memtest86plus/memtest86plus.hash
@@ -1,3 +1,3 @@
 # locally computed using sha256sum
-sha256  463b2db66128e45c96be76136272e2ee940f1319804b1b88cc2ef04edccd01d8  memtest86+-6.20.tar.gz
+sha256  463b2db66128e45c96be76136272e2ee940f1319804b1b88cc2ef04edccd01d8  memtest86plus-6.20.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/memtest86plus/memtest86plus.mk b/package/memtest86plus/memtest86plus.mk
new file mode 100644
index 0000000000..ad3c5c5b4c
--- /dev/null
+++ b/package/memtest86plus/memtest86plus.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# memtest86plus
+#
+################################################################################
+
+MEMTEST86PLUS_VERSION = 6.20
+MEMTEST86PLUS_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86PLUS_VERSION))
+MEMTEST86PLUS_LICENSE = GPL-2.0
+MEMTEST86PLUS_LICENSE_FILES = LICENSE
+MEMTEST86PLUS_INSTALL_IMAGES = YES
+MEMTEST86PLUS_INSTALL_TARGET = NO
+
+ifeq ($(BR2_i386),y)
+MEMTEST86PLUS_BUILD_DIR = build32
+else
+ifeq ($(BR2_x86_64),y)
+MEMTEST86PLUS_BUILD_DIR = build64
+endif
+endif
+
+define MEMTEST86PLUS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(MEMTEST86PLUS_BUILD_DIR)
+endef
+
+define MEMTEST86PLUS_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86PLUS_BUILD_DIR)/memtest.* $(BINARIES_DIR)/
+endef
+
+$(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
