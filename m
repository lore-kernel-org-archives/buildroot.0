Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C881AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C0426103E;
	Thu, 24 Mar 2022 21:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0j8Kk7pHxEC; Thu, 24 Mar 2022 21:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2AB66101E;
	Thu, 24 Mar 2022 21:16:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11AEA1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9D864106F
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIyo53iyM2ie for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:15:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C6EF4108D
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:15:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E715585C5B; Thu, 24 Mar 2022 21:06:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 21:51:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49413c6d97b72ef5f44341a3dc720b902a88279b
X-Git-Newrev: 0bdf40b1b0a36212fefef0b19632545f94c06423
X-Patchwork-Hint: ignore
Message-Id: <20220324210619.E715585C5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dav1d: use official tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bdf40b1b0a36212fefef0b19632545f94c06423
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dav1d/dav1d.hash | 3 ++-
 package/dav1d/dav1d.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index b0f163bae7..5e838b0951 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,4 @@
+# From http://download.videolan.org/pub/videolan/dav1d/0.9.2/dav1d-0.9.2.tar.xz.sha256
+sha256  e3235ab6c43c0135b0db1d131e1923fad4c84db9d85683e30b91b33a52d61c71  dav1d-0.9.2.tar.xz
 # Locally computed
-sha256  0d198c4fe63fe7f0395b1b17de75b21c8c4508cd3204996229355759efa30ef8  dav1d-0.9.2.tar.bz2
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index d7224625c8..ecc4cc55c3 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 DAV1D_VERSION = 0.9.2
-DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
-DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
+DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
+DAV1D_SITE = http://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
 DAV1D_LICENSE_FILES = COPYING
 DAV1D_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
