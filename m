Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EB0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:41:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C586108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4C586108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C5A24050D;
	Mon, 18 Oct 2021 19:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umgsqt5TKNIv; Mon, 18 Oct 2021 19:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 053D74048A;
	Mon, 18 Oct 2021 19:41:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 631191BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 600B480D7B
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrGDvfaxbxC2 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:41:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A6E180CC0
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:41:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 258688763F; Mon, 18 Oct 2021 19:38:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:41:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25ef2c26dabaf1553f1724214a4fa5e3ce48dfc8
X-Git-Newrev: 40cc40ce24c4612e78dfa7a82bc53693c3d07b05
X-Patchwork-Hint: ignore
Message-Id: <20211018193815.258688763F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: fix build with
 automake 1.16.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=40cc40ce24c4612e78dfa7a82bc53693c3d07b05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with convolution raised since bump of
automake to version 1.16.5 in commit
446d9f510255dda094d2ea89ad4f24a334b0ecc7 and
https://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624:

configure.ac:305: error: AM_INIT_AUTOMAKE expanded multiple times
/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
configure.ac:6: the top level
/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
configure.ac:305: the top level

Fixes:
 - http://autobuild.buildroot.org/results/464148bdccb705d8992dc860262bfdeb01b7e2a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nfigure.ac-fix-build-with-automake-1.16.5.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch b/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
new file mode 100644
index 0000000000..2ee8f59fee
--- /dev/null
+++ b/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
@@ -0,0 +1,48 @@
+From ad22edb303a470b6f9eda9fd9d3f588bb2eff8cb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 15 Oct 2021 08:02:23 +0200
+Subject: [PATCH] configure.ac: fix build with automake 1.16.5
+
+Fix the following build failure with convolution raised since automake
+1.16.5 and
+https://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624:
+
+configure.ac:305: error: AM_INIT_AUTOMAKE expanded multiple times
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
+configure.ac:6: the top level
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
+configure.ac:305: the top level
+
+Fixes:
+ - http://autobuild.buildroot.org/results/464148bdccb705d8992dc860262bfdeb01b7e2a1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mikebrady/shairport-sync/pull/1314]
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f77087c5..aa533a2d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@
+ 
+ AC_PREREQ([2.50])
+ AC_INIT([shairport-sync], [3.3.8], [4265913+mikebrady@users.noreply.github.com])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([subdir-objects])
+ AC_CONFIG_SRCDIR([shairport.c])
+ AC_CONFIG_HEADERS([config.h])
+ AC_PROG_RANLIB
+@@ -302,7 +302,6 @@ AM_CONDITIONAL([USE_PA], [test "x$with_pa" = "xyes"])
+ # Look for Convolution flag
+ AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP convolution support])])
+ if test "x$with_convolution" = "xyes" ; then
+-  AM_INIT_AUTOMAKE([subdir-objects])
+   AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
+   AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
+ fi
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
