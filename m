Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09A0C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54EE341504;
	Mon, 15 Aug 2022 09:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54EE341504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTsQTLU9DjtB; Mon, 15 Aug 2022 09:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2BE7409EB;
	Mon, 15 Aug 2022 09:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2BE7409EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2881BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C0140159
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06C0140159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQ05ZEhqfZDW for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:34:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 328C240146
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 328C240146
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3196E875BF; Mon, 15 Aug 2022 09:19:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:34:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c00fa1062e8bd48799f506b998c3e2737215c24e
X-Git-Newrev: 106e2b448c5249aa905aeaa0a5a1d1f87cf8f694
X-Patchwork-Hint: ignore
Message-Id: <20220815091958.3196E875BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdill: bump to latest git commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=106e2b448c5249aa905aeaa0a5a1d1f87cf8f694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following openssl static build failure raised
since the addition of the package in commit
d4b13b21024a894a2fc682090f3e01d53bd699e9 thanks to
https://github.com/sustrik/libdill/commit/b3b81d2c7bf4daf8a57925ddd40f5b6f13484187:

checking for SSL_ctrl  in -lssl... no
configure: error: libssl not found; install OpenSSL

Fixes:
 - http://autobuild.buildroot.org/results/0b5c1f8675d218e0abf57b4d46428fe06e28431e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdill/libdill.hash | 2 +-
 package/libdill/libdill.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdill/libdill.hash b/package/libdill/libdill.hash
index 4a1fb91a57..2f74b762c6 100644
--- a/package/libdill/libdill.hash
+++ b/package/libdill/libdill.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  6df7527e8f1e91f5106c21c5bfeaa69eee470bec476c74585143e3e439864404  libdill-fa01648cf2a8d06e53c965b45eeacfb3ac57bd04.tar.gz
+sha256  a883a38d4073f43612b3221f908428ce9f663f940e5dd89c8dfad14058890380  libdill-32d0e8b733416208e0412a56490332772bc5c6e1.tar.gz
 sha256  3f78d9c42c8919cb6dc63e51de17b9eb40a49d9cdd876ce59e77392721e8c2c6  COPYING
diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index 117e8254e0..9dda81d085 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
+LIBDILL_VERSION = 32d0e8b733416208e0412a56490332772bc5c6e1
 LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
 LIBDILL_LICENSE = MIT
 LIBDILL_LICENSE_FILES = COPYING
@@ -19,7 +19,7 @@ LIBDILL_CONF_OPTS += --disable-threads
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBDILL_DEPENDENCIES += openssl
+LIBDILL_DEPENDENCIES += host-pkgconf openssl
 LIBDILL_CONF_OPTS += --enable-tls
 else
 LIBDILL_CONF_OPTS += --disable-tls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
