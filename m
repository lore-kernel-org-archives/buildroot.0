Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBFDC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 09:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F54C41B62;
	Sat, 18 Mar 2023 09:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F54C41B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6e7VAyb6l-eK; Sat, 18 Mar 2023 09:32:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB02941BE8;
	Sat, 18 Mar 2023 09:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB02941BE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 665221BF859
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 09:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E47240147
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 09:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E47240147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qE0lF6atP-wm for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 09:32:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51AE340102
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 09:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51AE340102
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DD7486F8A; Sat, 18 Mar 2023 09:32:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 10:29:04 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0399011fa8f9dfe96a82dd55abe71cc823116132
X-Git-Newrev: 24f0af804e6a0ff2704a22ba7c222862b1b43ec2
X-Patchwork-Hint: ignore
Message-Id: <20230318093210.3DD7486F8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libmodsecurity:
 bump to version 3.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=24f0af804e6a0ff2704a22ba7c222862b1b43ec2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Switch to pcre2 as pcre is deprecated

https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ea746f312844df298bbc9a697ca178f3a3c67a8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0004-build-pcre.m4-fix-build-without-pcre.patch | 29 ++++++++++++++++++++++
 package/libmodsecurity/libmodsecurity.hash         |  4 +--
 package/libmodsecurity/libmodsecurity.mk           |  9 ++++---
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch b/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch
new file mode 100644
index 0000000000..5a5baeacee
--- /dev/null
+++ b/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch
@@ -0,0 +1,29 @@
+From af96f4fe916adc7dc6d649a07c10b45c978d31a1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 27 Jul 2022 14:17:20 +0200
+Subject: [PATCH] build/pcre.m4: fix build without pcre
+
+Don't raise an error if pcre is disabled now that pcre2 is supported
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent (no feedback on
+https://github.com/SpiderLabs/ModSecurity/pull/2596)]
+---
+ build/pcre.m4 | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/build/pcre.m4 b/build/pcre.m4
+index f6c9ae18..3e40f5c9 100644
+--- a/build/pcre.m4
++++ b/build/pcre.m4
+@@ -99,7 +99,6 @@ AC_SUBST(PCRE_LD_PATH)
+ 
+ if test -z "${PCRE_VERSION}"; then
+     AC_MSG_NOTICE([*** pcre library not found.])
+-    ifelse([$2], , AC_MSG_ERROR([pcre library is required]), $2)
+ else
+     AC_MSG_NOTICE([using pcre v${PCRE_VERSION}])
+     ifelse([$1], , , $1) 
+-- 
+2.35.1
+
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 341dbc3765..087157d162 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.6/modsecurity-v3.0.6.tar.gz.sha256
-sha256  06315d9a32fc830997178f30a69e933c9c2364b263a2f036959bebc4dde59a08  modsecurity-v3.0.6.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.7/modsecurity-v3.0.7.tar.gz.sha256
+sha256  cfd8b7e7e6a0e9ca4e19b9adeb07594ba75eba16a66da5e9b0974c0117c21a34  modsecurity-v3.0.7.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 8fa3d59845..916ba8fbcb 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.6
+LIBMODSECURITY_VERSION = 3.0.7
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
@@ -12,12 +12,13 @@ LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
-# We're patching build/libmaxmind.m4
+# We're patching build/libmaxmind.m4 and build/pcre.m4
 LIBMODSECURITY_AUTORECONF = YES
 
-LIBMODSECURITY_DEPENDENCIES = pcre
+LIBMODSECURITY_DEPENDENCIES = pcre2
 LIBMODSECURITY_CONF_OPTS = \
-	--with-pcre="$(STAGING_DIR)/usr/bin/pcre-config" \
+	--without-pcre \
+	--with-pcre2="$(STAGING_DIR)/usr" \
 	--disable-examples \
 	--without-lmdb \
 	--without-ssdeep \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
