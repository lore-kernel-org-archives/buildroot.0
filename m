Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCDDC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B76104368D;
	Mon,  1 Jan 2024 21:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76104368D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ckutwk-RlAqX; Mon,  1 Jan 2024 21:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C833243691;
	Mon,  1 Jan 2024 21:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C833243691
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 155A91BF3F0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D43E8184F
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D43E8184F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYbi18fff3UC for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:18:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F9358367C
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F9358367C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BEE083B64; Mon,  1 Jan 2024 21:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:15:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 292bb525c7957324c6eed3eaa56a61aed9cbcb16
X-Git-Newrev: f9b465c66c42e936a80292f7854f605d4c88564e
X-Patchwork-Hint: ignore
Message-Id: <20240101211802.2BEE083B64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rhash: bump to version 1.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9b465c66c42e936a80292f7854f605d4c88564e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

build-shared has been replaced by "build" with
https://github.com/rhash/RHash/commit/851d459dbf530b7e1f64d4140d3c314ad054c70a

https://github.com/rhash/RHash/releases/tag/v1.4.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rhash/rhash.hash | 6 +++---
 package/rhash/rhash.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
index 355b5c275b..4e03de8722 100644
--- a/package/rhash/rhash.hash
+++ b/package/rhash/rhash.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/rhash/files/rhash/1.4.3/
-sha1  6e698e6d5b13aeac55076d6a53dc4dab55f2114e  rhash-1.4.3-src.tar.gz
+# From https://sourceforge.net/projects/rhash/files/rhash/1.4.4/
+sha1  feaee551aec9cc9a303a45aa8c864f97ece9ed2d  rhash-1.4.4-src.tar.gz
 # Locally calculated
-sha256  1e40fa66966306920f043866cbe8612f4b939b033ba5e2708c3f41be257c8a3e  rhash-1.4.3-src.tar.gz
+sha256  8e7d1a8ccac0143c8fe9b68ebac67d485df119ea17a613f4038cda52f84ef52a  rhash-1.4.4-src.tar.gz
 sha256  953e55838353335148c90b5a38a4894292680b1d4c37228ffddddbf18ce54bf5  COPYING
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 1f7456e4e7..99762ec0c7 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RHASH_VERSION = 1.4.3
+RHASH_VERSION = 1.4.4
 RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
@@ -36,13 +36,13 @@ define RHASH_CONFIGURE_CMDS
 endef
 
 ifeq ($(BR2_SHARED_LIBS),y)
-RHASH_BUILD_TARGETS = lib-shared build-shared
+RHASH_BUILD_TARGETS = lib-shared build
 RHASH_INSTALL_TARGETS = install-lib-shared install-so-link
 else ifeq ($(BR2_STATIC_LIBS),y)
 RHASH_BUILD_TARGETS = lib-static
 RHASH_INSTALL_TARGETS = install-lib-static
 else
-RHASH_BUILD_TARGETS = lib-static lib-shared build-shared
+RHASH_BUILD_TARGETS = lib-static lib-shared build
 RHASH_INSTALL_TARGETS = install-lib-static install-lib-shared install-so-link
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
