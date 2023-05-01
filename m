Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCBAC77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9956132F;
	Mon,  1 May 2023 07:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9956132F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZFHprK5QPsF; Mon,  1 May 2023 07:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DCD6605AF;
	Mon,  1 May 2023 07:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DCD6605AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EB8C1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64CD7416AC
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64CD7416AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9K3xPtNrooA for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:18:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 540B4416AF
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 540B4416AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 422528467C; Mon,  1 May 2023 07:18:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 09:14:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83f6a498718dbb00684e3f954d96695557c3885f
X-Git-Newrev: 162053090f891036106a5c70f423eb7fbdb8ca4a
X-Patchwork-Hint: ignore
Message-Id: <20230501071802.422528467C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: security bump to version
 2.10.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=162053090f891036106a5c70f423eb7fbdb8ca4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- [CVE-2023-29469] Hashing of empty dict strings isn't deterministic
- [CVE-2023-28484] Fix null deref in xmlSchemaFixupComplexType
- schemas: Fix null-pointer-deref in xmlSchemaCheckCOSSTDerivedOK

https://gitlab.gnome.org/GNOME/libxml2/-/tags/v2.10.4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
