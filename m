Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C506DFF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 18:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C78842A59;
	Sun, 26 Apr 2026 18:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0oKRmco5cPp; Sun, 26 Apr 2026 18:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0F2A42A5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777228969;
	bh=SP8eBIkVPzdCL1Yj3P+gBJQlzK1ncRxemRCnB79PpDA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i2u+Uk5mlFE6BX7LSKDo7ndHhGFAaMFrp9xf6OcY7lAWgKk60th2tVfXFSTLUyTqT
	 66Hk25mZInosXZqRY0xiYO20Awlq5kpPHJWg+fWSsCsTFmc/OSAKNKJWHyNTbFc+rL
	 StVDEttPW1mWFNCurzGYZ8sOy6qJE5G2/sVWSKkXcGO8k8BdXp8pIZdsGxJsZ/B/2Z
	 MwKyod96C/b2YF5I/YKCRZDZ2ObUqEEibFFVdFuKUE4lem4wbFppRg17eQbaMmCpZy
	 WJI+SjNVg3xfzD/AB0EVZJfpNb5Pj/hoGv3LqRdAzQ9MijVWwFS8HmYAL9H2u7TJQ1
	 WeN3vrKINc1Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0F2A42A5B;
	Sun, 26 Apr 2026 18:42:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 191D1231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDEDC42A5B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_g2hWDrT1Wx for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 18:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A0C642A59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A0C642A59
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:42:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D807836EA; Sun, 26 Apr 2026 18:42:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 20:37:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9d2a12b45b786f6702446536560e3e80af839fe
X-Git-Newrev: 45d056e7bf69aca4a036aba83e2573301996e9e0
X-Patchwork-Hint: ignore
Message-Id: <20260426184247.0D807836EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stunnel: bump version to 5.78
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45d056e7bf69aca4a036aba83e2573301996e9e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/mtrojnar/stunnel/blob/stunnel-5.78/NEWS.md

Removed patch which is included in this commit:
https://github.com/mtrojnar/stunnel/commit/1c06022093a4eb60aa1754fecbc68b37610d4b4d#diff-0134ab37004b3e923ee2e697976e032c32b114839ca0a697b01111d1381e8d08

Updated license hash due to copyright year bump:
https://github.com/mtrojnar/stunnel/commit/4c8a77e374ae3326a52d2f90c1e5248079aee008

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch | 45 ----------------------
 package/stunnel/stunnel.hash                       |  6 +--
 package/stunnel/stunnel.mk                         |  2 +-
 3 files changed, 4 insertions(+), 49 deletions(-)

diff --git a/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch b/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch
deleted file mode 100644
index a8edc1d465..0000000000
--- a/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 93e5cdd68b13cc3161d9b0094b0f331bdaf07cbc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 6 Jan 2024 17:28:20 +0100
-Subject: [PATCH] src/ocsp.c: fix build with OPENSSL_NO_PSK
-
-Fix the following build failure with OPENSSL_NO_PSK:
-
-ocsp.c: In function 'ocsp_init':
-ocsp.c:112:20: error: 'SERVICE_OPTIONS' {aka 'struct service_options_struct'} has no member named 'psk_keys'
-  112 |         if(!section->psk_keys) {
-      |                    ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/1707beea413a8da8713ad2dc59db947329da45d2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/mtrojnar/stunnel/pull/18
----
- src/ocsp.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/ocsp.c b/src/ocsp.c
-index 5073ded..12792af 100644
---- a/src/ocsp.c
-+++ b/src/ocsp.c
-@@ -109,12 +109,16 @@ int ocsp_init(SERVICE_OPTIONS *section) {
-         s_log(LOG_DEBUG, "OCSP: Client OCSP stapling enabled");
-     } else {
- #if OPENSSL_VERSION_NUMBER>=0x10002000L
-+#ifndef OPENSSL_NO_PSK
-         if(!section->psk_keys) {
-+#endif
-             if(SSL_CTX_set_tlsext_status_cb(section->ctx, ocsp_server_cb)==TLSEXT_STATUSTYPE_ocsp)
-                 s_log(LOG_DEBUG, "OCSP: Server OCSP stapling enabled");
-+#ifndef OPENSSL_NO_PSK
-         } else {
-             s_log(LOG_NOTICE, "OCSP: Server OCSP stapling is incompatible with PSK");
-         }
-+#endif
- #else /* OpenSSL version 1.0.2 or later */
-         s_log(LOG_NOTICE, "OCSP: Server OCSP stapling not supported");
- #endif /* OpenSSL version 1.0.2 or later */
--- 
-2.43.0
-
diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 6bfbc6d0b2..c06f1c0774 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.71.tar.gz.sha256
-sha256  f023aae837c2d32deb920831a5ee1081e11c78a5d57340f8e6f0829f031017f5  stunnel-5.71.tar.gz
+# From http://www.usenix.org.uk/mirrors/stunnel/stunnel-5.78.tar.gz.sha256
+sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
 # Locally calculated
-sha256  c172514e95e387eb4c77cdfbb55b635bf96e2dfcb85d785d993f64c40c4f89c4  COPYING.md
+sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 9e9cf35554..9c8b4b870e 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).71
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).78
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
