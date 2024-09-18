Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859D1CDD55C
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 21:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4136C60759;
	Wed, 18 Sep 2024 21:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9tLJ__zE9l4; Wed, 18 Sep 2024 21:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28A6F607BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A6F607BC;
	Wed, 18 Sep 2024 21:02:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 946061BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 21:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90BFD81E26
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 21:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Fz85vCAJIsp for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 21:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB40681E21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB40681E21
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 21:02:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A497C83C05; Wed, 18 Sep 2024 21:02:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 22:56:51 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7f0d3201b81fc9f7bb809e6388f430adc6c1488a
X-Git-Newrev: 00cc46208b1dc5f91c1510a679e2024af1f24d85
X-Patchwork-Hint: ignore
Message-Id: <20240918210222.A497C83C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libopenssl:
 security bump to version 3.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=00cc46208b1dc5f91c1510a679e2024af1f24d85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

- CVE-2024-6119: Possible denial of service in X.509 name checks [Moderate
  severity]
  https://openssl-library.org/news/secadv/20240903.txt

- CVE-2024-5535: SSL_select_next_proto buffer overread [Low severity]
  https://openssl-library.org/news/secadv/20240528.txt

Updated _SITE and project URL according to
https://openssl-library.org/post/2024-04-30-releases-distribution-changes/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 4 ++--
 package/openssl/Config.in          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 0909784e90..e8940781b7 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.2.2.tar.gz.sha256
-sha256  197149c18d9e9f292c43f0400acaba12e5f52cacfe050f3d199277ea738ec2e7  openssl-3.2.2.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.2.3/openssl-3.2.3.tar.gz.sha256
+sha256  52b5f1c6b8022bc5868c308c54fb77705e702d6c6f4594f99a0df216acf46239  openssl-3.2.3.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 1a7e2bd54e..c3796e14ba 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.2.2
-LIBOPENSSL_SITE = https://www.openssl.org/source
+LIBOPENSSL_VERSION = 3.2.3
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
