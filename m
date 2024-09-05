Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AA7CD4F54
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 06:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3752B405E1;
	Thu,  5 Sep 2024 06:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hry6PKXKPsJR; Thu,  5 Sep 2024 06:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5EE4403E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5EE4403E2;
	Thu,  5 Sep 2024 06:19:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA6831BF2B9
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 06:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE33460631
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 06:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDV7yknFKhCM for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 06:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFB7A605BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFB7A605BA
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 06:19:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C679586DB6; Thu,  5 Sep 2024 06:19:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 08:04:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efd5f1aae45e841bf1a40c977253f1cb5e229396
X-Git-Newrev: 8de200895c9ee06d6d8e20fb5809a143dcead6a5
X-Patchwork-Hint: ignore
Message-Id: <20240905061953.C679586DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: security bump version
 to 3.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8de200895c9ee06d6d8e20fb5809a143dcead6a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2024-6119: Possible denial of service in X.509 name checks [Moderate
  severity]
  https://openssl-library.org/news/secadv/20240903.txt

- CVE-2024-5535: SSL_select_next_proto buffer overread [Low severity]
  https://openssl-library.org/news/secadv/20240528.txt

Updated _SITE and project URL according to
https://openssl-library.org/post/2024-04-30-releases-distribution-changes/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: add CVE details]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 4 ++--
 package/openssl/Config.in          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index dd1c99f7a7..52fce1eb3a 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.3.1.tar.gz.sha256
-sha256  777cd596284c883375a2a7a11bf5d2786fc5413255efab20c50d6ffe6d020b7e  openssl-3.3.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.3.2/openssl-3.3.2.tar.gz.sha256
+sha256  2e8a40b01979afe8be0bbfb3de5dc1c6709fedb46d6c89c10da114ab5fc3d281  openssl-3.3.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 89a9189bb8..82b924c557 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.3.1
-LIBOPENSSL_SITE = https://www.openssl.org/source
+LIBOPENSSL_VERSION = 3.3.2
+LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
 LIBOPENSSL_LICENSE_FILES = LICENSE.txt
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 30db152fad..d255a05596 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_LIBOPENSSL
 	  (TLS v1) as well as a full-strength general-purpose
 	  cryptography library.
 
-	  http://www.openssl.org/
+	  https://openssl-library.org/
 
 	  Note: Some helper scripts need perl.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
