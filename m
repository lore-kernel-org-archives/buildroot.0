Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6A0C3601E
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42DD060F41;
	Wed,  2 Apr 2025 19:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Shl3P3Ual1s; Wed,  2 Apr 2025 19:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE9CF6F7F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE9CF6F7F4;
	Wed,  2 Apr 2025 19:26:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B6611F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4656283B44
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQL7xRFySpli for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B023F83BDB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B023F83BDB
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:26:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D84583AC6; Wed,  2 Apr 2025 19:26:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Apr 2025 21:17:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f4fef076f99fcfc7187223a6bc154d0a751e963
X-Git-Newrev: 770f9154978c40ce5b7718174108b37c5310869d
X-Patchwork-Hint: ignore
Message-Id: <20250402192625.9D84583AC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjwt: update to 3.2.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=770f9154978c40ce5b7718174108b37c5310869d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a complete changelog see here:
https://github.com/benmcollins/libjwt/compare/v1.17.2...v3.2.0

Convert to cmake infrastructure as autotools were removed
upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Arnout: remove redundant empty line]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libjwt/libjwt.hash |  2 +-
 package/libjwt/libjwt.mk   | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
index 0049772a78..8e59d2284b 100644
--- a/package/libjwt/libjwt.hash
+++ b/package/libjwt/libjwt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f11c4544f61a31f105720b8329409fea009d6f9ef41c9361f98c2de48152eeae  libjwt-1.17.2.tar.bz2
+sha256  17ee4e25adfbb91003946af967ff04068a5c93d6b51ad7ad892f1441736b71b9  libjwt-3.2.0.tar.xz
 sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 9f94c8683e..29ca9cebf4 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -4,23 +4,24 @@
 #
 ################################################################################
 
-LIBJWT_VERSION = 1.17.2
+LIBJWT_VERSION = 3.2.0
 LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
-LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.bz2
+LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.xz
 LIBJWT_DEPENDENCIES = host-pkgconf jansson
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
 LIBJWT_CPE_ID_VENDOR = bencollins
 LIBJWT_CPE_ID_PRODUCT = jwt_c_library
-LIBJWT_CONF_OPTS = --without-examples
+
+LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBJWT_CONF_OPTS += --with-openssl
+LIBJWT_CONF_OPTS += -DWITH_OPENSSL=ON
 LIBJWT_DEPENDENCIES += openssl
 else
-LIBJWT_CONF_OPTS += --without-openssl
+LIBJWT_CONF_OPTS += -DWITH_GNUTLS=ON
 LIBJWT_DEPENDENCIES += gnutls
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
