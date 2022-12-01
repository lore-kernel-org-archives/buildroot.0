Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417D0C43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 20:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C222E610ED;
	Thu,  1 Dec 2022 20:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C222E610ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjmZvVKPXIja; Thu,  1 Dec 2022 20:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F12A0610F1;
	Thu,  1 Dec 2022 20:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F12A0610F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 153A01BF379
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E43AB820FA
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E43AB820FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9HqO8LeHE-b for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 20:00:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 942AB81C40
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTP id 942AB81C40
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 20:00:46 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 0pjgpVAHvTSJi0pjhp6i3y; Thu, 01 Dec 2022 21:00:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 21:00:44 +0100
Message-Id: <20221201200044.2138064-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGGBNx20fLWg1shZW4pYJpIMYVhgdrqCGnJASZId1GZ7RVX8RuDz+z4FTRbkxQOvchisW+JpIORW8aaRZuuK01BsvJdTW0HJNhlxA6MJKEKLftXTqwU/
 faWLai2/ujjxEn2B4Unew6UdxBzadr1HttFtLcn7JPNFiw8wPu6+J0eycIjAWPSquTsnFj3x1ntzmQoEnQ4RAiFrJ5GZudGusV2PwKau8xCxOv9OvCwKF+bJ
 stCEZQKdKZ/sK31cE15c365R/tpvVx7wTWP8NYiLQNInFhYRS0Z4hftLNbciFlzCzjojnfp3mBhFdHL3qgabB2Im+WCZrmgnSjqScFVt5X0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669924845; bh=P//T73lMJtI995tl+COCSSPfuVbMC9h2G2ElIkgATds=;
 h=From:To:Subject:Date:MIME-Version;
 b=CJ55HPh9B5w47P5Redc2OGmq6reORqe7T04pBUqYSh0FVNj93DBkiwY4z0dRkhza/
 /H9/dkXax9veW4Nx2lq+1QNjFHHTPCBiOht0LdAt7CC5mSa4mWH858vOg/sbMdKsU9
 pd/T71SHmg81R2/BSiHEnO98n8tjOz4erXb0cbv2UFGi6X2BNTmOUCY0y4G2/JlwqJ
 kLsk9fULvjvIWEIrJ0WK9fDimpi6arBzG6uYjqqBEEU8FKR4Cn6s+k9I+9Sue3Aarp
 pe5jiBjH/MFhhPja/0SK0D2b8Wfh/i2bnPuNAkNLbrmlfA1XmveOEdh0REZPMWYZ68
 l/20VL15dumYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CJ55HPh9
Subject: [Buildroot] [PATCH] package/rtl8723ds: bump to 2022-12-01 version
 on master branch
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop local patch that has been upstreamed.

Fixes:
http://autobuild.buildroot.net/results/fa2/fa2482674d789e7674dc0d83c5f54393beed4d70/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 39 -------------------
 package/rtl8723ds/rtl8723ds.hash              |  2 +-
 package/rtl8723ds/rtl8723ds.mk                |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

diff --git a/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
deleted file mode 100644
index 4495817358..0000000000
--- a/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 769a1943cb409f89f3c91208294a89b09bf47b86 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 16 Nov 2022 16:08:21 +0100
-Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
- end of EXTRA_FLAGS assignment
-
-At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
-since it's assigned at the beginning of the Makefile. For example it's not
-possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
-allow to build these modules for big endian architectures. So let's move
-the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
-EXTRA_CFLAGS assignment.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index aa57f85..3d91574 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,3 @@
--EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
- EXTRA_CFLAGS += -O1
- #EXTRA_CFLAGS += -O3
- #EXTRA_CFLAGS += -Wall
-@@ -1738,6 +1737,8 @@ ifneq ($(USER_MODULE_NAME),)
- MODULE_NAME := $(USER_MODULE_NAME)
- endif
- 
-+EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
-+
- ifneq ($(KERNELRELEASE),)
- 
- rtk_core :=	core/rtw_cmd.o \
--- 
-2.34.1
-
diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index cbc77e14c1..d5abf9913c 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  691040a85d838f8d8d7da0f2ed460f1ea5f6734c40dc73770ba7e260b6cda9cc  rtl8723ds-5ab2d3f3858dc4c833013c47a79faa05b10198f6.tar.gz
+sha256  97f3ebc5d977ba35d10c9c06e6817e4a00458727b651b56fc00c207c05a61995  rtl8723ds-a638cc8639015b8b9390af3350fab0366b6c87e7.tar.gz
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 0d96e6b03a..7e27fa75ea 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 5ab2d3f3858dc4c833013c47a79faa05b10198f6
+RTL8723DS_VERSION = a638cc8639015b8b9390af3350fab0366b6c87e7
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
