Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26518EEA865
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 22:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D61948153E;
	Thu, 12 Feb 2026 22:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvsyZ03DEoAJ; Thu, 12 Feb 2026 22:05:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C89381570
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770933957;
	bh=0Pwj+15X8NK7mVzEEaHk6MFCVCd3VPBIRVRpM6DiAek=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pd7pDlRPUFaFzPhg2YH9PPzdKd4YtgtRYOzRT9pvCuqN4eRExaGXqvRi4+6WcOyFr
	 c/QKRAh36hBRb9Iu2zPRXqq/PRR3wV0uHAP9SUmYoq34vAKo8TWsijREY5K8fI0KDT
	 BgMsPmMRSP0GhBumgbBxLRLzTMLWR3pOJ5Dndxzswbyi/z3nBZoTeFYD+XzgDHorFG
	 7S1vi+JF0YcmtzKnjukHSW2fQyWUV2gaJtqXT/BUB/o3Vsl32QtO8GAztk+Hjvg31N
	 vnRgpTl+oLZApVZ25BylBbbHb2RHcQMiNESUopYrP15v50qhU53Ya2DRgUtVs3BvGg
	 /L8zbo6EB9sZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C89381570;
	Thu, 12 Feb 2026 22:05:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABAA71CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C0181551
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlxLd0vaPS86 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 22:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECEC98153E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECEC98153E
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:05:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D622786C99; Thu, 12 Feb 2026 22:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 23:01:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59ed1137e9bb8c0157be3dc91a1cc462211dd3c7
X-Git-Newrev: 431950769d5ca14f2c490e328a38cbf163ce2a18
X-Patchwork-Hint: ignore
Message-Id: <20260212220554.D622786C99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlsec1: drop mandatory libxslt
 dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/431950769d5ca14f2c490e328a38cbf163ce2a18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 7eeb574f0ec86e372bcc8a551e8e9bb88b8d6555 introduced the
libxmlsec1 making libxslt a mandatory dependency, which it isn't.

This commit therefore make libxslt an optional dependency of the
target libxmlsec1 package, and drops the dependency entirely for the
host package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxmlsec1/Config.in     |  1 -
 package/libxmlsec1/libxmlsec1.mk | 14 +++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
index 155efac825..4a686853ae 100644
--- a/package/libxmlsec1/Config.in
+++ b/package/libxmlsec1/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBXMLSEC1
 	bool "libxmlsec1"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBXSLT
 	help
 	  XMLSec library provides C based implementation for major XML
 	  Security standards:
diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
index 08f1f9eccd..d0d553c48c 100644
--- a/package/libxmlsec1/libxmlsec1.mk
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -10,8 +10,8 @@ LIBXMLSEC1_SITE = https://github.com/lsh123/xmlsec/releases/download/$(LIBXMLSEC
 LIBXMLSEC1_LICENSE = MIT
 LIBXMLSEC1_LICENSE_FILES = Copyright
 LIBXMLSEC1_INSTALL_STAGING = YES
-LIBXMLSEC1_DEPENDENCIES = libxml2 libxslt openssl
-HOST_LIBXMLSEC1_DEPENDENCIES = host-libxml2 host-libxslt host-openssl
+LIBXMLSEC1_DEPENDENCIES = libxml2 openssl
+HOST_LIBXMLSEC1_DEPENDENCIES = host-libxml2 host-openssl
 LIBXMLSEC1_AUTORECONF = YES
 
 LIBXMLSEC1_CONF_OPTS = \
@@ -26,7 +26,15 @@ HOST_LIBXMLSEC1_CONF_OPTS = \
 	--with-openssl \
 	--without-gnutls \
 	--without-gcrypt \
-	--without-nss
+	--without-nss \
+	--without-libxslt
+
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+LIBXMLSEC1_DEPENDENCIES += libxslt
+LIBXMLSEC1_CONF_OPTS += --with-libxslt
+else
+LIBXMLSEC1_CONF_OPTS += --without-libxslt
+endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
