Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122DEC44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0BD640FE8;
	Fri,  3 Jul 2026 14:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmxToDFA9XZT; Fri,  3 Jul 2026 14:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8114241145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088811;
	bh=qSsJVB1X+V4520COefiGz1mTpTbyS4O0By6N0i/OY7U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K4DVW1KAlzm0SJCEjERXF+YgNWW9xFuQH+WkANl6BC8HAkn/LBBEKBGkAgjnWyV5W
	 w4QBs6dJw4RddiilwkbyBdVx5YIwkolWOcLHatbsrjUTbBmSRmJCiUeQIFjpsG005F
	 CmY3ZO2br/C0gpsRPCL1M01BNT41GmYR0+7qNq2srWDMP5DHVlm5eMP+XQtgbcXW2Y
	 2iAlaBNMMJfLBDASR8NMzOenXV8QIdmP2wXa+8nlrUwZlsf4EXaKhCC03czq63n7po
	 QrkzNrGu7Rb9eBPEx3pv4Df1H+HI0rWDBT4B/Hl/v5/sGJDrl74RcTbSmjsjUh5EN8
	 tDlnotru2zOrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8114241145;
	Fri,  3 Jul 2026 14:26:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A097F79DB
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8363A80A84
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzgmIhZZT1O3 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB60C80A75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB60C80A75
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41548883A3; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:34:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 353fb2cbe8ef550c5ae6a5eb313b76aa8952712b
X-Git-Newrev: a175b0592ce010b16bedfd0fee33fb77c1615c03
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.41548883A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mongoose:
 security bump to v7.22
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a175b0592ce010b16bedfd0fee33fb77c1615c03
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

As indicated in the release notes:
https://github.com/cesanta/mongoose/releases/tag/7.22

    This release includes a substantial number of security fixes,
    reflecting increased use of AI-powered security tools and valuable
    contributions from the security research community.

    Please note that many of the resolved issues have not yet been assigned
    CVE identifiers. The assignment process is underway, and these release
    notes will be updated as additional CVEs become available.

Given the large number of security fixes included in that release, bump the
version for Buildroot LTS instead of applying individual patches

Along with the version bump:
- Remove patch for a security issue fixed by the version bump
- Update license hash following the update of the copyright year in
  https://github.com/cesanta/mongoose/commit/1f9e1a38b55455ed63a616aeb7b1070f2a2d4ddd

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 8fe41d5506d1d1c7a453be9977a4ffa65d39e886)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mongoose/0001-improve-resiliency.patch | 37 --------------------------
 package/mongoose/mongoose.hash                 |  4 +--
 package/mongoose/mongoose.mk                   |  5 +---
 3 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/mongoose/0001-improve-resiliency.patch b/package/mongoose/0001-improve-resiliency.patch
deleted file mode 100644
index edeea4efba..0000000000
--- a/package/mongoose/0001-improve-resiliency.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 64abf061bf018fd78f31c200a57a3fb04f9f3ef2 Mon Sep 17 00:00:00 2001
-From: "Sergio R. Caprile" <scaprile@cesanta.com>
-Date: Mon, 13 Oct 2025 10:43:45 -0300
-Subject: [PATCH] improve resiliency
-
-CVE: CVE-2025-65502
-Upstream: https://github.com/cesanta/mongoose/commit/64abf061bf018fd78f31c200a57a3fb04f9f3ef2
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- mongoose.c        | 1 +
- src/tls_openssl.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/mongoose.c b/mongoose.c
-index 4c72be8201..f860ab3b07 100644
---- a/mongoose.c
-+++ b/mongoose.c
-@@ -14581,6 +14581,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
- static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
-   int i;
-   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
-+  if (cert_store == NULL) return false;
-   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
-     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
-     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
-diff --git a/src/tls_openssl.c b/src/tls_openssl.c
-index 37838d95ba..f51d6dd8b7 100644
---- a/src/tls_openssl.c
-+++ b/src/tls_openssl.c
-@@ -39,6 +39,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
- static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
-   int i;
-   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
-+  if (cert_store == NULL) return false;
-   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
-     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
-     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 18b5e222ac..1a60b0c89c 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b6a6f69912c2cd0c67f85633c6b578d4dcdf385c3628acdcd21de28787c676e5  mongoose-7.17.tar.gz
-sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
+sha256  87727cd2c240ff559b16e9710d44b61ba3513dbee50428bd8ee1596d7c58460a  mongoose-7.22.tar.gz
+sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 9b8920a9f3..207d31cdfa 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.17
+MONGOOSE_VERSION = 7.22
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
@@ -13,9 +13,6 @@ MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
 
-# 0001-improve-resiliency.patch
-MONGOOSE_IGNORE_CVES += CVE-2025-65502
-
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
