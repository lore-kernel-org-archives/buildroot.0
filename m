Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5381EC47074
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E04FC613D3;
	Wed, 10 Jan 2024 10:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E04FC613D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4yJpr4DXNqnQ; Wed, 10 Jan 2024 10:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F1461418;
	Wed, 10 Jan 2024 10:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40F1461418
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2253D1BF354
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0407A4014E
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0407A4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuPEtiYes6BO for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 10:26:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDDB0435DB
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDDB0435DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB34785536; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 11:21:48 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: d1a9aa8f92214c2d40b2d2e4c1999a16ced4ac1b
X-Git-Newrev: c0c62f8cf03c2fd25e4efec114474ac8263416c0
X-Patchwork-Hint: ignore
Message-Id: <20240110102650.CB34785536@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/wolfssl: security
 bump to version 5.6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0c62f8cf03c2fd25e4efec114474ac8263416c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

- Use official tarball and so drop autoreconf
- Fix CVE-2023-6935, CVE-2023-6936 and CVE-2023-6937

https://github.com/wolfSSL/wolfssl/releases/tag/v5.6.6-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d0c4bd703a424f69451d7774727680fae2b4daa3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index fb5a570de8..59e42e98b9 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  031691906794ff45e1e792561cf31759f5d29ac74936bc8dffb8b14f16d820b4  wolfssl-5.6.4.tar.gz
+sha256  75aaafe3b8c776d1ac417288116c8d444115f9fac5acb382a39a7d163dfd618d  wolfssl-5.6.6.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 17452fdcaf..68c69afd59 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.6.4
-WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
+WOLFSSL_VERSION = 5.6.6
+WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/releases/download/v$(WOLFSSL_VERSION)-stable
 WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0+
@@ -14,10 +14,6 @@ WOLFSSL_CPE_ID_VENDOR = wolfssl
 WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
 WOLFSSL_DEPENDENCIES = host-pkgconf
 
-# wolfssl's source code is released without a configure
-# script, so we need autoreconf
-WOLFSSL_AUTORECONF = YES
-
 WOLFSSL_CONF_OPTS = --disable-examples --disable-crypttests
 
 ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
