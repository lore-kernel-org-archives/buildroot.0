Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3D8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D655F417E6;
	Sat, 25 Jun 2022 06:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D655F417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5s-naatP4EA; Sat, 25 Jun 2022 06:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F79417D3;
	Sat, 25 Jun 2022 06:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F79417D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39C4B1BF2C6
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DEC94263C
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DEC94263C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3SsUrCVLd87 for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83EDA4263B
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83EDA4263B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 648F887539; Sat, 25 Jun 2022 06:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 08:44:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aca69596a8463772912b5f28815d8bca71157401
X-Git-Newrev: c3cd65d4e74c03f55ac10f103cfae505637c9630
X-Patchwork-Hint: ignore
Message-Id: <20220625063418.648F887539@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetfilter_cthelper: bump to
 version 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3cd65d4e74c03f55ac10f103cfae505637c9630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version) and so also drop autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetfilter_cthelper/0001-uclinux.patch   | 26 ----------------------
 .../libnetfilter_cthelper.hash                     |  7 +++---
 .../libnetfilter_cthelper/libnetfilter_cthelper.mk |  3 +--
 3 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/package/libnetfilter_cthelper/0001-uclinux.patch b/package/libnetfilter_cthelper/0001-uclinux.patch
deleted file mode 100644
index 7a6ca70b53..0000000000
--- a/package/libnetfilter_cthelper/0001-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d028334281b218209412ec6e1dba56ca96320bd9 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 16:08:29 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d52b1ce..9389b70 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,7 +22,7 @@ AC_DISABLE_STATIC
- LT_INIT
- CHECK_GCC_FVISIBILITY
- case "$host" in
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux only, dude!]);;
- esac
- 
--- 
-1.8.1.5
-
diff --git a/package/libnetfilter_cthelper/libnetfilter_cthelper.hash b/package/libnetfilter_cthelper/libnetfilter_cthelper.hash
index 42deade7dd..93b9f8da8e 100644
--- a/package/libnetfilter_cthelper/libnetfilter_cthelper.hash
+++ b/package/libnetfilter_cthelper/libnetfilter_cthelper.hash
@@ -1,6 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_cthelper/libnetfilter_cthelper-1.0.0.tar.bz2.{md5sum,sha1sum}
-md5	b2efab1a3a198a5add448960ba011acd	libnetfilter_cthelper-1.0.0.tar.bz2
-sha1	5d0a82794bd46aafde20c16800edca23d563de66	libnetfilter_cthelper-1.0.0.tar.bz2
+# From http://ftp.netfilter.org/pub/libnetfilter_cthelper/libnetfilter_cthelper-1.0.1.tar.bz2.sha256sum
+sha256  14073d5487233897355d3ff04ddc1c8d03cc5ba8d2356236aa88161a9f2dc912  libnetfilter_cthelper-1.0.1.tar.bz2
 
 # Hash for license file:
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
index d74ea4d0fd..e0bbbab833 100644
--- a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
+++ b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBNETFILTER_CTHELPER_VERSION = 1.0.0
+LIBNETFILTER_CTHELPER_VERSION = 1.0.1
 LIBNETFILTER_CTHELPER_SOURCE = libnetfilter_cthelper-$(LIBNETFILTER_CTHELPER_VERSION).tar.bz2
 LIBNETFILTER_CTHELPER_SITE = http://www.netfilter.org/projects/libnetfilter_cthelper/files
 LIBNETFILTER_CTHELPER_INSTALL_STAGING = YES
 LIBNETFILTER_CTHELPER_DEPENDENCIES = host-pkgconf libmnl
-LIBNETFILTER_CTHELPER_AUTORECONF = YES
 LIBNETFILTER_CTHELPER_LICENSE = GPL-2.0+
 LIBNETFILTER_CTHELPER_LICENSE_FILES = COPYING
 LIBNETFILTER_CTHELPER_CPE_ID_VENDOR = netfilter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
