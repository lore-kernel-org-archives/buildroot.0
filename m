Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1A3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A41408FE;
	Mon,  4 Apr 2022 17:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yxglJCb9amW; Mon,  4 Apr 2022 17:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BE1E408A1;
	Mon,  4 Apr 2022 17:51:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 431D61BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4098B60FF0
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZf2dBnk4Vmr for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:51:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DBD460FE1
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:51:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1309C80E61; Mon,  4 Apr 2022 17:42:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:50:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4bba8d0b64d5dc70aa3e5bb6eec7a6b87d4930b4
X-Git-Newrev: 2e088c7aca10578157fd175f216319c286541dea
X-Patchwork-Hint: ignore
Message-Id: <20220404174212.1309C80E61@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/htop: use
 official tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e088c7aca10578157fd175f216319c286541dea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c49b46e9cc90e4c974225413bde15fdeb5de446c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/htop/htop.hash | 4 +++-
 package/htop/htop.mk   | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index dffe5ca1ad..d7c39be4d0 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,5 @@
+# From https://github.com/htop-dev/htop/releases/download/3.1.2/htop-3.1.2.tar.xz.sha256
+sha256  884bce5b58cb113127860b9e368609019e92416a81550fdf0752052f3a64b388  htop-3.1.2.tar.xz
+
 # Locally calculated
-sha256  fe9559637c8f21f5fd531a4c072048a404173806acbdad1359c6b82fd87aa001  htop-3.1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 210518da2f..1e7b171a17 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 HTOP_VERSION = 3.1.2
-HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
+HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
+HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
 # Prevent htop build system from searching the host paths
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
