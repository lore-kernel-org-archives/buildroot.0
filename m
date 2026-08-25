Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2BFC61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 200B6606F6;
	Tue, 25 Aug 2026 21:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IHUOj9K0FeM; Tue, 25 Aug 2026 21:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787691837;
	bh=IQNeP5A7tT1gxYGtzpHvz1XNEOgZRXxyUr4G1PocGSc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dTBY8+5rI/6rS6M+BTD8Wjgy3dnyiU/34l2rNVmJZpw7QNPxfYQyu4iElhC63YgGP
	 PZULmrkRi0sRT3gDBLXVZSqGjjoi/a9JUFmK/tIWAHU6U6QDYcpj8lauBILQSUZxM8
	 IPcrDjumO6++iAFU195RfkzaQXN37peLnzquAkMOgFQrWFnx66CTLGYvTWrBRySsho
	 d1w8GasN5bSiROWO4d8SwstBNJFPJVdpn4pOqSTzsBwX/N+nn3w3/PJoinjUYTLHjc
	 Q4OxhgTJbmAQhHM+gQ1+8ppNGMIA5peg2W81VNTDCMBSHFTvDzjkQCHnErvPeRCqwy
	 3tm4AiWLUxJwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F23B606FA;
	Tue, 25 Aug 2026 21:03:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02BB5230
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8B39606FA
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Q6Ckc3D0CKM for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35C7D606F6
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:03:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 775FE91DDA; Tue, 25 Aug 2026 21:02:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 22:48:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79066532007db8c908b40af8c39d20fd81003655
X-Git-Newrev: 198317785a89ed7fd398fda7ab8ede7dfb4871c7
X-Patchwork-Hint: ignore
Message-Id: <20260825210259.775FE91DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: security bump to
 version 3.6.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/198317785a89ed7fd398fda7ab8ede7dfb4871c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/openssl/openssl/releases/tag/openssl-3.6.4

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

Fixed client-side memory leak in OCSP response checking.
(CVE-2026-54876)

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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index fc1a125521..46ac5589dc 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.3/openssl-3.6.3.tar.gz.sha256
-sha256  243a86649cf6f23eeb6a2ff2456e09e5d77dd9018a54d3d96b0c6bdd6ba6c7f1  openssl-3.6.3.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.4/openssl-3.6.4.tar.gz.sha256
+sha256  9bffaa1ad1e07b354c21bd3324ec02fa15579f45a7d0494b3e74bc449b7333ef  openssl-3.6.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index e9f795832a..9ddc85c197 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.3
+LIBOPENSSL_VERSION = 3.6.4
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
