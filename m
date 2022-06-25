Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EA7C43334
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C03F607B5;
	Sat, 25 Jun 2022 06:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C03F607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSkgDMhUk-qD; Sat, 25 Jun 2022 06:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266FA60640;
	Sat, 25 Jun 2022 06:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 266FA60640
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EEA11BF2C6
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08A5B84387
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A5B84387
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46C3W5dW0WBJ for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F50084746
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F50084746
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E78C8754F; Sat, 25 Jun 2022 06:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 08:44:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3cd65d4e74c03f55ac10f103cfae505637c9630
X-Git-Newrev: c34bea0ec35b459a27b91cea3256a281eac7ed4d
X-Patchwork-Hint: ignore
Message-Id: <20220625063418.6E78C8754F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetfilter_cttimeout: bump to
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

commit: https://git.buildroot.net/buildroot/commit/?id=c34bea0ec35b459a27b91cea3256a281eac7ed4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version) and so also drop autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetfilter_cttimeout/0001-uclinux.patch  | 26 ----------------------
 .../libnetfilter_cttimeout.hash                    |  7 +++---
 .../libnetfilter_cttimeout.mk                      |  3 +--
 3 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/package/libnetfilter_cttimeout/0001-uclinux.patch b/package/libnetfilter_cttimeout/0001-uclinux.patch
deleted file mode 100644
index 5d462d8fec..0000000000
--- a/package/libnetfilter_cttimeout/0001-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d8d2ec14bc192f998afae2b71c69248e73518ddf Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 16:09:14 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d79e941..aeb6ad0 100644
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
diff --git a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.hash b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.hash
index af5a281e4d..81d54dd645 100644
--- a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.hash
+++ b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.hash
@@ -1,6 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_cttimeout/libnetfilter_cttimeout-1.0.0.tar.bz2.{md5sum,sha1sum}
-md5	7697437fc9ebb6f6b83df56a633db7f9	libnetfilter_cttimeout-1.0.0.tar.bz2
-sha1	24cba24b0371e80007be4ea0fa9d872df63b8a7a	libnetfilter_cttimeout-1.0.0.tar.bz2
+# From http://ftp.netfilter.org/pub/libnetfilter_cttimeout/libnetfilter_cttimeout-1.0.1.tar.bz2.sha256sum
+sha256  0b59da2f3204e1c80cb85d1f6d72285fc07b01a2f5678abf5dccfbbefd650325  libnetfilter_cttimeout-1.0.1.tar.bz2
 
 # Hash for license file:
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
index f5c5067b64..dcdf34c71e 100644
--- a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBNETFILTER_CTTIMEOUT_VERSION = 1.0.0
+LIBNETFILTER_CTTIMEOUT_VERSION = 1.0.1
 LIBNETFILTER_CTTIMEOUT_SOURCE = libnetfilter_cttimeout-$(LIBNETFILTER_CTTIMEOUT_VERSION).tar.bz2
 LIBNETFILTER_CTTIMEOUT_SITE = http://www.netfilter.org/projects/libnetfilter_cttimeout/files
 LIBNETFILTER_CTTIMEOUT_INSTALL_STAGING = YES
 LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkgconf libmnl
-LIBNETFILTER_CTTIMEOUT_AUTORECONF = YES
 LIBNETFILTER_CTTIMEOUT_LICENSE = GPL-2.0+
 LIBNETFILTER_CTTIMEOUT_LICENSE_FILES = COPYING
 LIBNETFILTER_CTTIMEOUT_CPE_ID_VENDOR = netfilter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
