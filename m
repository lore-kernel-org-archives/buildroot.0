Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EEC10ED651
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B60416A4;
	Fri, 27 Mar 2026 09:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0ce1LVRtwc2; Fri, 27 Mar 2026 09:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1EDE416B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605572;
	bh=21UJFEgufaFfaRl7bAb1aHK5eSxT0O5ssxaEfIx3bSY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UeQZTA6zhy7xVOIs0VWxBXfBfT+9pjngwGUM2uTRqfeuV9TiD6zb+kDzZsw+Tgeu4
	 bMEuHUyUHa0yld8/aenXFJoDoUAUQPCUNtj4xotxZLwG+uPxy3xgjEXS0cd+wtxbE7
	 tHk/03FOuS7LPssYi0SLKLXkKZUNjRBgTxcUYGK7iu/0zvK4F/0BnnrbW76LgxwC/Q
	 cZT5/6lCxPh9aWDW0KyiBWC7lbNgKGYPVhHIDGDmLauKyAuiPR8AWQJH8nSJpJ9SJv
	 BN+F5dtrkETQNrGAgWU+LFZsv1oekpnQCA23EriSTCrL/k0a9N5PH6xVhwdbUB5Ww6
	 5cTevbUPr5pig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1EDE416B7;
	Fri, 27 Mar 2026 09:59:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 086E61D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5756F612A7
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOFzTLWYs89G for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BD626129C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BD626129C
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 520357FB6C; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ae1d606f48cc2fbf2fb0bb425f08699ad5297746
X-Git-Newrev: 0f53b596f15ca98cba142921cfad43503da3377c
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.520357FB6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mongoose: patch
 CVE-2025-65502
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f53b596f15ca98cba142921cfad43503da3377c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2025-65502:
    Null pointer dereference in add_ca_certs() in Cesanta Mongoose before
    7.2 allows remote attackers to cause a denial of service via TLS
    initialization where SSL_CTX_get_cert_store() returns NULL.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-65502
  - https://github.com/cesanta/mongoose/commit/64abf061bf018fd78f31c200a57a3fb04f9f3ef2

(cherry picked from commit f536fd4a2e883309ab2fe97532fc94f608e31de1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mongoose/0001-improve-resiliency.patch | 37 ++++++++++++++++++++++++++
 package/mongoose/mongoose.mk                   |  3 +++
 2 files changed, 40 insertions(+)

diff --git a/package/mongoose/0001-improve-resiliency.patch b/package/mongoose/0001-improve-resiliency.patch
new file mode 100644
index 0000000000..edeea4efba
--- /dev/null
+++ b/package/mongoose/0001-improve-resiliency.patch
@@ -0,0 +1,37 @@
+From 64abf061bf018fd78f31c200a57a3fb04f9f3ef2 Mon Sep 17 00:00:00 2001
+From: "Sergio R. Caprile" <scaprile@cesanta.com>
+Date: Mon, 13 Oct 2025 10:43:45 -0300
+Subject: [PATCH] improve resiliency
+
+CVE: CVE-2025-65502
+Upstream: https://github.com/cesanta/mongoose/commit/64abf061bf018fd78f31c200a57a3fb04f9f3ef2
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ mongoose.c        | 1 +
+ src/tls_openssl.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/mongoose.c b/mongoose.c
+index 4c72be8201..f860ab3b07 100644
+--- a/mongoose.c
++++ b/mongoose.c
+@@ -14581,6 +14581,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
+ static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
+   int i;
+   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
++  if (cert_store == NULL) return false;
+   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
+     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
+     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
+diff --git a/src/tls_openssl.c b/src/tls_openssl.c
+index 37838d95ba..f51d6dd8b7 100644
+--- a/src/tls_openssl.c
++++ b/src/tls_openssl.c
+@@ -39,6 +39,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
+ static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
+   int i;
+   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
++  if (cert_store == NULL) return false;
+   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
+     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
+     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 8316a8d59a..02c2ac5626 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -13,6 +13,9 @@ MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
 
+# 0001-improve-resiliency.patch
+MONGOOSE_IGNORE_CVES += CVE-2025-65502
+
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
