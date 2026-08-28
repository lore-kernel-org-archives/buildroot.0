Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2845FC61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF7D76082D;
	Fri, 28 Aug 2026 14:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMWfkaBoRsAY; Fri, 28 Aug 2026 14:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927041;
	bh=6LF9Dr1+UPeCwRX+hvVdEanQnZLELY93z/tWcb02zFg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a/GzzQIbf0da8iGwm7lxCE7/fvHUA8NV4Dcps1/ziZfLjRL2bxm8PQ9YOCVzZqZ0G
	 ZQJXvpITTvFe/bLM2ssHLZuoeeFRkGy38PTQbu7s4h8nfb+QUwMU2ycqC3wvcpoWC+
	 eJsiWI8Z1Fj8/KC28QiXbeDC2PIldgVxTrZcK1RuMcaV9jRBGYqTNWstSMyB3OTSUD
	 lBEJZOqJ5jRWAg+nZz46A6raIKKf+jrN/ymWdXiJYQnxAy3D1SAzLWMZQeXnjpPx6w
	 T2K3JfeRTli3D4D8Qu3UPWJwU+E440+MTtsm/WhvYR7l/B7E9t6SU10Cbjw/Nhvj7x
	 M3WqeE1p6WDDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 143046083B;
	Fri, 28 Aug 2026 14:24:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8584D2A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A647D6072C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GF2w6J4ezIsw for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E69126078A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E513F9215F; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8024b6c3f0da2c711a6fe5f964fe1298e682e8d9
X-Git-Newrev: 4013d1965ef6236305e70050daaddffaeb23aa09
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.E513F9215F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libopenssl:
 security update to 3.5.8
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4013d1965ef6236305e70050daaddffaeb23aa09
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

OpenSSL 3.5.8 is a security patch release. The most severe CVE fixed
in this release is Moderate.

This release incorporates the following bug fixes and mitigations:

    Fixed QUIC server being able to trigger double free when processing
    INITIAL packet.
    (CVE-2026-18798)

    Fixed heap buffer overflow in CMS key unwrapping.
    (CVE-2026-63072)

    Fixed invalid pointer dereference in CMP server via crafted protectionAlg.
    (CVE-2026-63076)

    Fixed unbounded memory growth in QUIC server incoming channel queue.
    (CVE-2026-14456)

    Fixed RPK server signature algorithm selection being able to dereference
    a missing certificate.
    (CVE-2026-14457)

    Fixed excessive memory use buffering DTLS records for a future epoch.
    (CVE-2026-54874)

    Fixed untrusted Sender DN being used as a format string in CMP response
    validation.
    (CVE-2026-63073)

    Fixed CMP indefinite cache growth of extraCerts.
    (CVE-2026-63074)

    Fixed QUIC ACK-only packet retention being able to cause memory exhaustion.
    (CVE-2026-63075)

    Fixed possibility of AEAD forgeries with empty ciphertext when using
    EVP_Cipher().
    (CVE-2026-75803)

    Fixed checking of authentication tags for empty ciphertexts for AEAD ciphers
    in CCM cipher mode.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 8a7186d669..814b4eb0dc 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.7/openssl-3.5.7.tar.gz.sha256
-sha256  a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8  openssl-3.5.7.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.8/openssl-3.5.8.tar.gz.sha256
+sha256  a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2  openssl-3.5.8.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index a9e18f96ac..674a85be02 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.7
+LIBOPENSSL_VERSION = 3.5.8
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
