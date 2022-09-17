Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1CBECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2635861036;
	Sat, 17 Sep 2022 08:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2635861036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rP1HlLzlE72; Sat, 17 Sep 2022 08:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD4160BE4;
	Sat, 17 Sep 2022 08:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD4160BE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD7D1BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB6CD402E0
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB6CD402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8israsPrKwZ for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:13:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AC2B40298
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC2B40298
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 76A7583F32; Sat, 17 Sep 2022 08:13:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:12:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24261a1762a0017cba8128935a37280c7b876468
X-Git-Newrev: a7295520a9358929c9655ac4b0a533b4e81119bd
X-Patchwork-Hint: ignore
Message-Id: <20220917081315.76A7583F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: security bump to version
 2.10.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7295520a9358929c9655ac4b0a533b4e81119bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING was a link to Copyright, this link is now removed

with 2.10.0, fix CVE-2022-2309

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxml2/libxml2.hash | 6 +++---
 package/libxml2/libxml2.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index e67d3b0b8a..4d24c60132 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.14.sha256sum
-sha256  60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee  libxml2-2.9.14.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.10/libxml2-2.10.2.sha256sum
+sha256  d240abe6da9c65cb1900dd9bf3a3501ccf88b3c2a1cb98317d03f272dda5b265  libxml2-2.10.2.tar.xz
 # License files, locally calculated
-sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  COPYING
+sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 3647549a4b..37a4396cbe 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-LIBXML2_VERSION_MAJOR = 2.9
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).14
+LIBXML2_VERSION_MAJOR = 2.10
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).2
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
-LIBXML2_LICENSE_FILES = COPYING
+LIBXML2_LICENSE_FILES = Copyright
 LIBXML2_CPE_ID_VENDOR = xmlsoft
 LIBXML2_CONFIG_SCRIPTS = xml2-config
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
