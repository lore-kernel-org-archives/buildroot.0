Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DD4EC8739
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1DCD83BEA;
	Thu,  7 Sep 2023 15:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1DCD83BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ypGap_iF7nvp; Thu,  7 Sep 2023 15:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D02F683BF4;
	Thu,  7 Sep 2023 15:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D02F683BF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06C3D1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FCFA41DCA
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FCFA41DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTDz7pAPMffk for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E198B41DD5
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E198B41DD5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D14C586A1F; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Aug 2023 20:36:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6a6e3a8363a32e5443c9eadc2ee047853640d1a
X-Git-Newrev: c614a7d003baa678273d51bef5a5f37fdb5fffc4
X-Patchwork-Hint: ignore
Message-Id: <20230907145129.D14C586A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtextstyle: drop useless host
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c614a7d003baa678273d51bef5a5f37fdb5fffc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we build the full host-gettext-gnu, we don't need the
standalone libtextstyle anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[yann.morin.1998@free.fr: split off to its own commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtextstyle/libtextstyle.hash |  6 ------
 package/libtextstyle/libtextstyle.mk   | 24 ------------------------
 2 files changed, 30 deletions(-)

diff --git a/package/libtextstyle/libtextstyle.hash b/package/libtextstyle/libtextstyle.hash
deleted file mode 100644
index 5c5aee85bf..0000000000
--- a/package/libtextstyle/libtextstyle.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
-sha1  62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90  gettext-0.20.1.tar.xz
-
-# Locally calculated
-sha256  53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800  gettext-0.20.1.tar.xz
-sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/libtextstyle/libtextstyle.mk b/package/libtextstyle/libtextstyle.mk
deleted file mode 100644
index a5afad04b3..0000000000
--- a/package/libtextstyle/libtextstyle.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# libtextstyle
-#
-################################################################################
-
-# Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-LIBTEXTSTYLE_VERSION = 0.20.1
-LIBTEXTSTYLE_SITE = $(BR2_GNU_MIRROR)/gettext
-LIBTEXTSTYLE_SOURCE = gettext-$(LIBTEXTSTYLE_VERSION).tar.xz
-LIBTEXTSTYLE_INSTALL_STAGING = YES
-LIBTEXTSTYLE_LICENSE = GPL-3.0+
-LIBTEXTSTYLE_LICENSE_FILES = COPYING
-HOST_LIBTEXTSTYLE_DL_SUBDIR = gettext-gnu
-HOST_LIBTEXTSTYLE_SUBDIR = libtextstyle
-
-# gettext-tools require libtextstyle.m4
-define HOST_LIBTEXTSTYLE_INSTALL_M4
-	$(INSTALL) -D -m 0755 $(@D)/libtextstyle/m4/libtextstyle.m4 \
-		$(ACLOCAL_HOST_DIR)/libtextstyle.m4
-endef
-HOST_LIBTEXTSTYLE_POST_INSTALL_HOOKS += HOST_LIBTEXTSTYLE_INSTALL_M4
-
-$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
