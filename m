Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E582ECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 22:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EAD360ABD;
	Mon, 19 Sep 2022 22:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EAD360ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tgx4kGakKyT; Mon, 19 Sep 2022 22:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F23BE606DC;
	Mon, 19 Sep 2022 22:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F23BE606DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 592BD1BF39C
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 22:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34365606DC
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 22:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34365606DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nduUqcHBwozR for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 22:50:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8D7B605B1
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8D7B605B1
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 22:50:42 +0000 (UTC)
Received: from localhost.localdomain ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id aPb7ojDL8sT4eaPb7ot7bg; Tue, 20 Sep 2022 00:50:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 00:47:40 +0200
Message-Id: <20220919224740.2365011-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811224752.1a1e53b7@windsurf>
References: <20220811224752.1a1e53b7@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOJ9E1SooRlpC1IAUmOUv21rTA39MoRwbx5gJeYtIh3uIv63dCELtckJiImUN7ui+9LL7Z/LGVRfCL/paNNYMie+olKgi00TchqO3flkProH8fmTEyJi
 m0EkddqIArJ2HXZXhqq9mE1pTYU6KHoA2JIKOQWzQJmkSiUyTkZuq0s7TXyNtClQvHokwBmJIFlB+Bpyq8U8EC60cEXGhK+YYmcI5q++ThM4OEix1wRG44TF
 3AAqm2K3PnEmI7nmGD/gBMjnZdU72u6G4aC0+ggIfreDRocNA3+ygpXLcbFLH2jUxuytcQuHJTZX9Oo3eGMuww==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663627841; bh=2kBY+4uYJ0s7NN+FiANmBePP7sCgvEMiJoDn3Q5uE50=;
 h=From:To:Subject:Date:MIME-Version;
 b=F6vC3ftYWlL2w9JG7mGAkij8umFE8ehvmktwb5UrdI3qwSQPX/h/dkI8wYaAqQLgq
 p6OBPjsg0UidVh9m2bSSoHUb+tWKomQztGVemp8dJTn2t/qgDvDa8dM6MEYMQzzrKS
 yDugkFQwructiNKowUwSzUhw6amFMq7UdJ0/zOSsGMTcb3wy8H3x3nBxIStoMcqfpU
 oas9G2DahVePF9jouwsqEP36Ulv9axzz3bZlyGj4qZSkBhoCiHbhaWObB3nkKOE/wU
 baLtdrRSOev4+SNtZ33pW1Z1fiJFGVi374R4JjG0VWKI+gTwdNlKrL+gm703qsmLv1
 FCm7GeOTThq+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=F6vC3ftY
Subject: [Buildroot] [PATCH] package/nfs-utils: handle pkg-config in the
 Autotools standard way for nfsrahead
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While using the correct PKG_CHECK_MODULES() approach for libmount we end up
having host-nfs-utils needing libmount. But libmount is only needed by
nfsrahead that we don't need in host-nfs-utils. But we need host-nfs-utils
itself(rpcgen tool specifically) to build nfs-utils. To solve this
recursive situation:
1) Update the first patch with the upstreamed one that handles libmount
using PKG_CHECK_MODULES().
2) Add another patch to allow to disable nfsrahead during building for host
since this tool is not needed and requires libmount. This way the first
patch approach can be correctly used.
3) Add --disable-nfsrahead to HOST_NFS_UTILS_CONF_OPTS
4) Remove en/disable-uuid since now it's required by default:
http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=c5528f40f9db5061e06dcf1f9b7fce5185b376c6

First patch has been committed:
https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=627c95b2b853161b359095e7fdf05d3b07d51379
While the second one is pending:
https://lore.kernel.org/linux-nfs/20220919221832.2234294-1-giulio.benetti@benettiengineering.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ead-fix-linking-while-static-linking.patch | 39 ++++++++---
 ...e.ac-allow-to-disable-nfsrahead-tool.patch | 68 +++++++++++++++++++
 package/nfs-utils/nfs-utils.mk                |  7 +-
 3 files changed, 97 insertions(+), 17 deletions(-)
 create mode 100644 package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch

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
diff --git a/package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch b/package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch
new file mode 100644
index 0000000000..6bff0422de
--- /dev/null
+++ b/package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch
@@ -0,0 +1,68 @@
+From 9a0002978eb32b78d22f053302e012a4255dc4ef Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 19 Sep 2022 23:43:28 +0200
+Subject: [PATCH] configure.ac: allow to disable nfsrahead tool
+
+This allows to make libmount not mandatory but depending on nfsrahead
+since it only requires it. This is useful when cross-compiling because
+in that case we need rpcgen only built for host but not nfsrahead that
+also require libmount. So this reduces the dependencies for host
+building.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Upstream status: https://lore.kernel.org/linux-nfs/20220919221832.2234294-1-giulio.benetti@benettiengineering.com/]
+---
+ configure.ac      | 13 ++++++++++---
+ tools/Makefile.am |  6 +++++-
+ 2 files changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ff85200b..5d9cbf31 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -249,6 +249,16 @@ AC_ARG_ENABLE(nfsdcld,
+ 	enable_nfsdcld=$enableval,
+ 	enable_nfsdcld="yes")
+ 
++AC_ARG_ENABLE(nfsrahead,
++	[AS_HELP_STRING([--disable-nfsrahead],[disable nfsrahead command @<:@default=no@:>@])],
++	enable_nfsrahead=$enableval,
++	enable_nfsrahead="yes")
++	AM_CONDITIONAL(CONFIG_NFSRAHEAD, [test "$enable_nfsrahead" = "yes" ])
++	if test "$enable_nfsrahead" = yes; then
++		dnl Check for -lmount
++		PKG_CHECK_MODULES([LIBMOUNT], [mount])
++	fi
++
+ AC_ARG_ENABLE(nfsdcltrack,
+ 	[AS_HELP_STRING([--disable-nfsdcltrack],[disable NFSv4 clientid tracking programs @<:@default=no@:>@])],
+ 	enable_nfsdcltrack=$enableval,
+@@ -273,9 +283,6 @@ AC_LIBCAP
+ dnl Check for -lxml2
+ AC_LIBXML2
+ 
+-dnl Check for -lmount
+-PKG_CHECK_MODULES([LIBMOUNT], [mount])
+-
+ # Check whether user wants TCP wrappers support
+ AC_TCP_WRAPPERS
+ 
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 40c17c37..48fd0cdf 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -12,6 +12,10 @@ if CONFIG_NFSDCLD
+ OPTDIRS += nfsdclddb
+ endif
+ 
+-SUBDIRS = locktest rpcdebug nlmtest mountstats nfs-iostat rpcctl nfsdclnts nfsrahead $(OPTDIRS)
++if CONFIG_NFSRAHEAD
++OPTDIRS += nfsrahead
++endif
++
++SUBDIRS = locktest rpcdebug nlmtest mountstats nfs-iostat rpcctl nfsdclnts $(OPTDIRS)
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+-- 
+2.34.1
+
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ed205a26b1..1a4a99f566 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -34,6 +34,7 @@ HOST_NFS_UTILS_CONF_OPTS = \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--disable-caps \
+	--disable-nfsrahead \
 	--without-systemd \
 	--with-rpcgen=internal \
 	--with-tirpcinclude=$(HOST_DIR)/include/tirpc
@@ -68,12 +69,6 @@ else
 NFS_UTILS_CONF_OPTS += --disable-caps
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
-NFS_UTILS_CONF_OPTS += --enable-uuid
-else
-NFS_UTILS_CONF_OPTS += --disable-uuid
-endif
-
 define NFS_UTILS_INSTALL_FIXUP
 	cd $(TARGET_DIR) && rm -f $(NFS_UTILS_TARGETS_)
 	touch $(TARGET_DIR)/etc/exports
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
