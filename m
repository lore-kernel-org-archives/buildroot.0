Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB59C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:40:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CED56120F
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CED56120F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B92C405FC;
	Thu,  4 Nov 2021 21:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkNyg3kLUXpG; Thu,  4 Nov 2021 21:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 609EB40604;
	Thu,  4 Nov 2021 21:40:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6F3A1BF8A8
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94B02401FC
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9p9F37dVjhnZ for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 21:40:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 653A140114
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 21:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5FA6A8A5BD; Thu,  4 Nov 2021 21:36:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 4 Nov 2021 22:13:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be5e0230c68c453dac9869f84d5b266d2e4983b2
X-Git-Newrev: dd1412c06072705398a44688c43b15687775fe76
X-Patchwork-Hint: ignore
Message-Id: <20211104213649.5FA6A8A5BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/transmission: fix build with
 autoconf >= 2.71
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd1412c06072705398a44688c43b15687775fe76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of autoconf to version
2.70 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work.

Fixes:
 - http://autobuild.buildroot.org/results/e8bea26f6b12adf16335b24836a7c5c31911af6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...gure.ac-fix-autoreconf-with-autoconf-2.70.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
new file mode 100644
index 0000000000..bfb0084bc4
--- /dev/null
+++ b/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
@@ -0,0 +1,42 @@
+From 857ac91a03a096601f62b358fc61355d4cc25b9b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Oct 2021 18:51:13 +0200
+Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
+
+Remove the whitespace before IT_PROG_INTLTOOL as suggested in
+https://www.mail-archive.com/bug-autoconf@gnu.org/msg04851.html
+to avoid the following build failure with autoconf >= 2.70:
+
+ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work.
+
+The problem has been introduced by upstream autoconf commit
+http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=b3b3af821a0b9e82ebe56b77b1731d2fe58f52de
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e8bea26f6b12adf16335b24836a7c5c31911af6a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable as upstream swicthed to cmake (
+https://github.com/transmission/transmission/issues/1573)]
+---
+ configure.ac | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fd1132fda..04e0e19bb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -555,9 +555,7 @@ dnl it should be safe to re-edit 0.40 back down to 0.23
+ use_nls=no
+ if test "x$enable_nls" = "xyes" ; then
+     use_nls=yes
+-    m4_ifdef([IT_PROG_INTLTOOL],
+-             [IT_PROG_INTLTOOL([0.35.0],[no-xml])],
+-             [AC_MSG_ERROR("--enable-nls requires intltool to be installed.")])
++IT_PROG_INTLTOOL([0.35.0],[no-xml])
+     AC_CHECK_HEADERS([libintl.h])
+     GETTEXT_PACKAGE=transmission-gtk
+     AC_SUBST(GETTEXT_PACKAGE)
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
