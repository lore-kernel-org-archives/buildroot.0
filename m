Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611D3EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 18:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3DFF8225C;
	Fri, 21 Jul 2023 18:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3DFF8225C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_8ROK5i0JIi; Fri, 21 Jul 2023 18:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 181C682C18;
	Fri, 21 Jul 2023 18:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 181C682C18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF4701BF5B4
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87B4441FB5
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87B4441FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33WBsVfcEzAT for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 18:06:42 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 376CD41FB4
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 18:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 376CD41FB4
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F473A4C024D
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:06:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43658)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMuWU-0003kU-33
 for buildroot@buildroot.org; Fri, 21 Jul 2023 20:06:39 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 20:06:36 +0200
Message-Id: <20230721180638.215414-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689962799;
 bh=CuYxZVjL8zlAfGSLXvt4mr7Fde9aZGaYGhrYZsFcLcU=;
 h=From:To:Subject:Date:From;
 b=DGFO05O+H6Ncq+k1iD3yU5t0Lf1y1+ZgfaeDXga3mzA1rpudqhOKg1mw4SCkTHpWy
 vjFvCiOi3N+ezAEUOk0U70IuI92GiJbcNICplgvgvXC54eL/6/Lk5tGstSWKXoMvv7
 r2iw5qlXvO1oXkJHsUVhr3+N0KYqLEW/M/F9DjQWHtCx9AowhQg0JpQIaF7PXMwuSr
 4fhTMuIkEqB1nw71n29j9IaYbcOy+9weYDPvY2aAXXdNmTq+P8zbljTZPgMB5gRIKS
 sKXIseTbvBi1VLSYISedIB9pJLDbFToM+bdXMjP9gm3WPqIg7Zs1uLzj5BbadXhfPt
 Tnw+BEQ9fIvLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=DGFO05O+
Subject: [Buildroot] [PATCH 1/3] package/libopenssl: remove deprecated
 options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes configure warning:
***** Deprecated options: no-crypto-mdebug-backtrace, no-ssl2

no-ssl2 option was re-added in 2016:
https://github.com/openssl/openssl/commit/e80381e1a3309f5d4a783bcaa508a90187a48882
"We warn that it's deprecated, and ignore it otherwise."
Quoting https://www.openssl.org/docs/man3.0/man3/SSLv23_method.html
"Support for SSLv2 [... was] removed in OpenSSL 1.1.0."
Therefore we do not need any legacy handling for
BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2.

no-crypto-mdebug-backtrace was removed in OpenSSL 3.0:
https://github.com/openssl/openssl/blob/master/NEWS.md?plain=1#L161

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libopenssl/Config.in     | 4 ----
 package/libopenssl/libopenssl.mk | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 7a3f56a512..26c8f4c085 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -97,10 +97,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL
 	bool "enable SSL"
 	default y
 
-config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2
-	bool "enable SSL2"
-	default y
-
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3
 	bool "enable SSL3"
 	default y
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 7a4e0dfca2..06eac8f3d9 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -97,12 +97,11 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL),,no-whirlpool) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH),,no-bf) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL),,no-ssl) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2),,no-ssl2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3),,no-ssl3) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL),,no-weak-ssl-ciphers) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK),,no-psk) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST),,no-cast) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug-backtrace no-crypto-mdebug no-autoerrinit) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug no-autoerrinit) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
