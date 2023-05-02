Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C471CC77B7E
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 07:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72EC041696;
	Tue,  2 May 2023 07:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72EC041696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_vDrFUOIwMD; Tue,  2 May 2023 07:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CBA44168C;
	Tue,  2 May 2023 07:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CBA44168C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 137CF1BF400
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2921660BA8
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2921660BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTXQJKFbI7ZO for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 07:27:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F51160BCA
 for <buildroot@buildroot.org>; Tue,  2 May 2023 07:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F51160BCA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F8CE854A5; Tue,  2 May 2023 07:27:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 09:27:16 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 033a81dfec9e465786330e2d81bafc6cd94f4658
X-Git-Newrev: 1bd059e7075c2cf1a34da510675a1a9a9c14b522
X-Patchwork-Hint: ignore
Message-Id: <20230502072743.1F8CE854A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libxml2: security
 bump to version 2.10.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=1bd059e7075c2cf1a34da510675a1a9a9c14b522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- [CVE-2023-29469] Hashing of empty dict strings isn't deterministic
- [CVE-2023-28484] Fix null deref in xmlSchemaFixupComplexType
- schemas: Fix null-pointer-deref in xmlSchemaCheckCOSSTDerivedOK

https://gitlab.gnome.org/GNOME/libxml2/-/tags/v2.10.4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 162053090f891036106a5c70f423eb7fbdb8ca4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 6957e2ed87..37030bdfaa 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.10/libxml2-2.10.3.sha256sum
-sha256  5d2cc3d78bec3dbe212a9d7fa629ada25a7da928af432c93060ff5c17ee28a9c  libxml2-2.10.3.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.10/libxml2-2.10.4.sha256sum
+sha256  ed0c91c5845008f1936739e4eee2035531c1c94742c6541f44ee66d885948d45  libxml2-2.10.4.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 7a01dc4259..cf26a36cc4 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.10
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
