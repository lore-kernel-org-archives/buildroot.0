Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C390C77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 07:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09D164118A;
	Tue,  2 May 2023 07:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09D164118A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GG7ew3l3bAtz; Tue,  2 May 2023 07:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CEE64064E;
	Tue,  2 May 2023 07:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CEE64064E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4168D1BF861
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A765405EE
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A765405EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c64zzNf-EUTU for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 07:27:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2823240124
 for <buildroot@buildroot.org>; Tue,  2 May 2023 07:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2823240124
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16CE785484; Tue,  2 May 2023 07:27:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 09:27:06 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 275f7014e3263c8426d21a831e88488032b24b50
X-Git-Newrev: 033a81dfec9e465786330e2d81bafc6cd94f4658
X-Patchwork-Hint: ignore
Message-Id: <20230502072743.16CE785484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libxml2: switch
 to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=033a81dfec9e465786330e2d81bafc6cd94f4658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4426874cd337e59db0fed846e625ba45a4fd43fe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 2 +-
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 00daa21a83..6957e2ed87 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.10/libxml2-2.10.3.sha256sum
+# From https://download.gnome.org/sources/libxml2/2.10/libxml2-2.10.3.sha256sum
 sha256  5d2cc3d78bec3dbe212a9d7fa629ada25a7da928af432c93060ff5c17ee28a9c  libxml2-2.10.3.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 321e8b756b..7a01dc4259 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -8,7 +8,7 @@ LIBXML2_VERSION_MAJOR = 2.10
 LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
+	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
