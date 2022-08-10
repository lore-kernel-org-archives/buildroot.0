Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B94C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 23:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8195140B67;
	Wed, 10 Aug 2022 23:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8195140B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4a_MAf40CU7; Wed, 10 Aug 2022 23:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51ED440B54;
	Wed, 10 Aug 2022 23:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51ED440B54
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4BF11BF2CD
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 23:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD57E80DAD
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 23:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD57E80DAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1v5yaK-9iOon for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 23:38:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F3980024
Received: from smtpcmd13158.aruba.it (smtpcmd13158.aruba.it [62.149.156.158])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31F3980024
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 23:38:28 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LvHOoysf5TCpULvHPoDWJ1; Thu, 11 Aug 2022 01:38:27 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 01:38:24 +0200
Message-Id: <20220810233824.714623-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810215104.107714-1-giulio.benetti@benettiengineering.com>
References: <20220810215104.107714-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHGCHXVzJYgQsbz5JcdPdqtvhUo3nLIv5m+JGBndpnTKpwoWClLhFdj69dzo6lfHG1xhaouNPbF+2bY/7aAnx9bYwuTc51TG46PuLARuSHWrELA5HiOY
 mZct0LK3U2N/QBjRsbPeQ9wbBQBKweV5ut0+Lu94W6jgsGZiRryEZ5CpYot0aTFbSjejemDZCdTDSFloNbqM/fgK+LI5X+KLHfoNOzFntUBKVCQVTiAnZwKR
 54YdnDFLAdw/6iqz6GSG9x0bb6TZAdjvXeDnOHdLlVeYyE4vXRX3vcLnxaq3gdnl8AY2+NyrPNdznQ0Dd3gcTCbe38YajY5o2PX54MnM9wU11uRfjjQvVTe+
 UFkfs3Pi
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660174707; bh=ilJQpfhHwvDa+umLxtsz0XsHPifVlBTCvSVRypzZjSk=;
 h=From:To:Subject:Date:MIME-Version;
 b=L+bDnUZpqfFbRgNqElVQ4SVfdl6C+FdZfGnAJDtiaoko9GbDPasV0RT7mpFNOCXy0
 HfBf6YqjU9XmSNqpmti1TC4HaWyxjRuCsfu4tpRimsn4SjOYM4T6HCf3rgliwUUkgg
 qS9ma1VCZzMEPmG0cAhtp6svW0RQ/5g3Ry3UKEOWKlKD5tc1/ig7CqW9Oo29rGQbPq
 bVeRvzAq+nAMlIqnPQbvi0TWuYAgHch75WpKmIBaU5ZAMO97YilKBhhwSC0PkYv2Xu
 xCaBNub7Zdq0sMg/5hN2P1PntEgKZluC51zwF5VPztfxc11amLi4wPSqA7LI/GSZOF
 3Mk1kvx68wsoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=L+bDnUZp
Subject: [Buildroot] [PATCH v2] package/nfs-utils: improve local patch
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As Thomas Petazzoni made me notice the actual local patch is not a good way
at all to deal with pkg-config with Autotools. So let's rework the patch
according to his comment that represents the standard of Autotools
pkg-config usage. This impacts host-nfs-utils too that is used to build
nfs-utils and so libmount must be present in host. We do this by adding
host-util-linux to HOST_NFS_UTILS_DEPENDENCIES since it is the libmount
provider.

I've respinned this new patch upstream.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add host-util-linux to HOST_NFS_UTILS_DEPENDENCIES for host libmount
---
 ...ead-fix-linking-while-static-linking.patch | 39 +++++++++++++------
 package/nfs-utils/nfs-utils.mk                |  2 +-
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
index b8dcea63f7..9477415296 100644
--- a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
+++ b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
@@ -1,31 +1,48 @@
-From a69014a1b4e5b8068630abe3109f31eb64b6a076 Mon Sep 17 00:00:00 2001
+From d9abb221cea81dee5956bd987c6efa680c03571a Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 10 Aug 2022 00:10:51 +0200
+Date: Wed, 10 Aug 2022 23:38:17 +0200
 Subject: [PATCH] nfsrahead: fix linking while static linking
 
--lmount must preceed -lblkid and to obtain this let's add:
-`pkg-config --libs mount`
-in place of:
-`-lmount`
-This ways the library order will always be correct.
+-lmount must preceed -lblkid and to obtain this let's add in configure.ac:
+PKG_CHECK_MODULES([LIBMOUNT], [mount])
+and in tools/nfsrahead/Makefile.am let's substitute explicit `-lmount`
+with:
+$(LIBMOUNT_LIBS)
+This way all the required libraries will be present and in the right order
+when static linking.
 
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 ---
 Pending Upstream:
-https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/
+https://patchwork.kernel.org/project/linux-nfs/patch/20220810214554.107094-1-giulio.benetti@benettiengineering.com/
 ---
+ configure.ac                | 3 +++
  tools/nfsrahead/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 2 files changed, 4 insertions(+), 1 deletion(-)
 
+diff --git a/configure.ac b/configure.ac
+index f1c46c5c..ff85200b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -273,6 +273,9 @@ AC_LIBCAP
+ dnl Check for -lxml2
+ AC_LIBXML2
+ 
++dnl Check for -lmount
++PKG_CHECK_MODULES([LIBMOUNT], [mount])
++
+ # Check whether user wants TCP wrappers support
+ AC_TCP_WRAPPERS
+ 
 diff --git a/tools/nfsrahead/Makefile.am b/tools/nfsrahead/Makefile.am
-index 845ea0d5..280a2eb4 100644
+index 845ea0d5..7e08233a 100644
 --- a/tools/nfsrahead/Makefile.am
 +++ b/tools/nfsrahead/Makefile.am
 @@ -1,6 +1,6 @@
  libexec_PROGRAMS = nfsrahead
  nfsrahead_SOURCES = main.c
 -nfsrahead_LDFLAGS= -lmount
-+nfsrahead_LDFLAGS= `pkg-config --libs mount`
++nfsrahead_LDFLAGS= $(LIBMOUNT_LIBS)
  nfsrahead_LDADD = ../../support/nfs/libnfsconf.la
  
  man5_MANS = nfsrahead.man
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ed205a26b1..c42138ac1d 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -22,7 +22,7 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
-HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-util-linux
 
 HOST_NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
