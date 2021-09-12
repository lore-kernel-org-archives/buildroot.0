Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8528C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:00:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A619B61039
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A619B61039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C8F96075B;
	Sun, 12 Sep 2021 20:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xb9wJ9nRvJ3R; Sun, 12 Sep 2021 20:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB10560772;
	Sun, 12 Sep 2021 20:00:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1101BF95A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6055960030
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYXye9eHhIhN for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:58:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F3876071B
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 24C488A43C; Sun, 12 Sep 2021 19:57:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 20:55:34 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7743b25600d845a1773c0e91d46ef61a907c9cee
X-Git-Newrev: 1bfe3f48af349a75a883836f8ca7141394a604d0
X-Patchwork-Hint: ignore
Message-Id: <20210912195706.24C488A43C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gnutls: bump to
 version 3.7.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1bfe3f48af349a75a883836f8ca7141394a604d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4bdb9111894dd083d531177b3ffdd41451dde7f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/Config.in   | 2 +-
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index cd853d1e74..cd83b375aa 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_GNUTLS
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
 
-	  http://www.gnutls.org
+	  https://www.gnutls.org/
 
 if BR2_PACKAGE_GNUTLS
 
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 0788a7a6f0..5d4fd1a0dc 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.1.tar.xz.sig
-sha256  3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e5cac6f  gnutls-3.7.1.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.2.tar.xz.sig
+sha256  646e6c5a9a185faa4cea796d378a1ba8e1148dbb197ca6605f95986a25af2752  gnutls-3.7.2.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 14855bcebc..be5af1933e 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).1
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).2
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
