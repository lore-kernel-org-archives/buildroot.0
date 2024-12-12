Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044F6E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 11:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 157D141498;
	Thu, 12 Dec 2024 11:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ddy6XWRdJzN9; Thu, 12 Dec 2024 11:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5AE64148D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5AE64148D;
	Thu, 12 Dec 2024 11:59:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10854113C
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 11:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E847941489
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 11:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gC-01zCRn3Qa for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 11:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB54E4142B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB54E4142B
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 11:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7C1086DE8; Thu, 12 Dec 2024 11:58:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 12:56:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 845884d9c5709ab0b26458530c57b76e2a026963
X-Git-Newrev: 918416bf9aa17417d965a64ddf09d0b4a8fa651b
X-Patchwork-Hint: ignore
Message-Id: <20241212115857.C7C1086DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/feh: bump to version 3.10.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=918416bf9aa17417d965a64ddf09d0b4a8fa651b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1].

This commit also adds the "file" package optional dependency, for
libmagic. This support was introduced in commit [2].

This commit also updates the project home page and download site URL
to use https.

Finally, the LICENSE file hash is updated to reflect change in [3].

[1] https://github.com/derf/feh/blob/3.10.3/ChangeLog
[2] https://github.com/derf/feh/commit/4affafe91579799efd83f4c8e05c291eeb684c9c
[3] https://github.com/derf/feh/commit/1197dafc110fb0a2e322b977d2dced15456bf7df

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/feh/Config.in |  2 +-
 package/feh/feh.hash  |  4 ++--
 package/feh/feh.mk    | 11 +++++++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/feh/Config.in b/package/feh/Config.in
index 7a348a1507..6f0bdd3242 100644
--- a/package/feh/Config.in
+++ b/package/feh/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_FEH
 	help
 	  feh is an X11 image viewer aimed mostly at console users.
 
-	  http://feh.finalrewind.org/
+	  https://feh.finalrewind.org/
diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index f74b8fa335..f86a7ef6d7 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  57ab1ca61f57c96595878069f550d36f518530f88fa31b74cc39cd739f9258b6  feh-3.7.1.tar.bz2
-sha256  2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
+sha256  5426e2799770217af1e01c2e8c182d9ca8687d84613321d8ab4a66fe4041e9c8  feh-3.10.3.tar.bz2
+sha256  881f1b901b5b99bce372fd9498106724a1ea52450f7bfc6fc1cce6736a2faf4d  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index df03deedde..be3b67aff9 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,14 +4,21 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.7.1
+FEH_VERSION = 3.10.3
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
-FEH_SITE = http://feh.finalrewind.org
+FEH_SITE = https://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
 FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
 FEH_CPE_ID_VALID = YES
 
+ifeq ($(BR2_PACKAGE_FILE),y)
+FEH_DEPENDENCIES += file
+FEH_MAKE_OPTS += magic=1
+else
+FEH_MAKE_OPTS += magic=0
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 FEH_DEPENDENCIES += libcurl
 FEH_MAKE_OPTS += curl=1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
