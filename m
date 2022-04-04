Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0263DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB20460D4E;
	Mon,  4 Apr 2022 12:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RHC-3iAh_OBW; Mon,  4 Apr 2022 12:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A0B60F76;
	Mon,  4 Apr 2022 12:49:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7104A1BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FC6740492
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yisKFMO_UWVV for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:49:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0F164032E
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AB6AA861DF; Mon,  4 Apr 2022 12:39:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:45:29 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1d8411cf91d3a9ddee320fe3f8f4dd3bf9cbb441
X-Git-Newrev: cea4406680c2072ea1dd4ece359458b67c1a41ec
X-Patchwork-Hint: ignore
Message-Id: <20220404123950.AB6AA861DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/apr-util: change
 URL from http to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=cea4406680c2072ea1dd4ece359458b67c1a41ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 15f76e16b30aa7555aa84c71b42bfda69c5ebda7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr-util/Config.in   | 2 +-
 package/apr-util/apr-util.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 6c5e3bbdf5..c1a967bdec 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_APR_UTIL
 	help
 	  The utility library for the apache runtime project
 
-	  http://apr.apache.org/
+	  https://apr.apache.org
 
 comment "apr-util needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index cf8407ced0..fb0735f5e7 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -6,7 +6,7 @@
 
 APR_UTIL_VERSION = 1.6.1
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
-APR_UTIL_SITE = http://archive.apache.org/dist/apr
+APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
 APR_UTIL_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
