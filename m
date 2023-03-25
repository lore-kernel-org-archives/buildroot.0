Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB33C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 20:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06DCC81FD9;
	Sat, 25 Mar 2023 20:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06DCC81FD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcNFqUeGHElg; Sat, 25 Mar 2023 20:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA4881FE0;
	Sat, 25 Mar 2023 20:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA4881FE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D56D1BF32D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2643060ABB
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2643060ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OY_DQfHgVkoT for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 20:38:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DBE460AB1
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DBE460AB1
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 20:38:11 +0000 (UTC)
Received: from localhost.localdomain ([146.241.96.213])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gAePpG6KeCGgNgAePp7Fh8; Sat, 25 Mar 2023 21:38:10 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:38:08 +0100
Message-Id: <20230325203808.1272652-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCCEG8TizCBJ9Y3tSbBw75r3FQQGzVlejkYC1PI9GQ60KucGsLo3sijv1mZaP+JFYzERuN+lAOw26ZRYDV6nCSGA3Xk92UCZm4onIHAd7Xf2ltfrt9lr
 Ao1GtyFgCg6Lqt3xzg6fdsfJ8UO3gELrM4SnBUIyhMGzOq1Z0ndtaKemyPAd5Mji/dapTYfCn/XV6kYR60x9Xm49HaGvOFqr9d6ldIQUIaVMRpRYQv2Svh7r
 W0IZOTkSyGAPyM81ZoumK4kidmEzHvPAMmCXeXrapCiQAfwmL0M2UPhGbQntrxwu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679776690; bh=XawBCfYbW8xiSicHguDk+UmSUiP/fRdZsCrCycBNEj4=;
 h=From:To:Subject:Date:MIME-Version;
 b=dWm5wbXoCYCuJEvFgfU8jN1tltX7acIN0lqgp67jDn+mHW3FohwKpRJk2CiawQ6zw
 WipbLV51FNWk39C/K+vOObePzq3zTYYG+UkPTlETcDeeke+Vega6/pxooB5f4OESsj
 baaRFjkOBRghFZbe0IoyEyfZftyeDDPOgBD3gKhurjZVg49KBawVNBlDYsNrplrD1C
 MRycQbJfeQt/Kt5w9I9BB+RTdxRbCw1GDu57sVz5Na3aEJ2TTeNd0OgMO+DRAuNY90
 frrOGN+7AW+b+MwFQ1tyTzedXrqrb0/OaxKoV1RZbbn5woUrCIdME5koM8ABj5pPC0
 SNnbvqpZdS9LA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dWm5wbXo
Subject: [Buildroot] [PATCH] package/bind: fix build failure due to gcc bug
 101737
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bind package exhibits gcc bug 101737 when built for the SH4
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101737=y.
To achieve this we need to correct the override of CFLAGS by using:
BIND_CONF_OPTS += CFLAGS="$(BIND_CFLAGS)"
instead of:
BIND_CONF_ENV = BUILD_CFLAGS"$(BIND_CFLAGS)"
since the latter doesn't work as expected and doesn't override CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/e7b/e7b9a4cbee8bb16431609182b96d1ac1ccec10e7/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bind/bind.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 70987a9823..83e37c8467 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -28,7 +28,6 @@ BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
 BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
-	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 BIND_CONF_OPTS = \
 	--without-cmocka \
@@ -39,6 +38,14 @@ BIND_CONF_OPTS = \
 
 BIND_DEPENDENCIES = host-pkgconf libuv openssl
 
+BIND_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
+BIND_CFLAGS += -O0
+endif
+
+BIND_CONF_OPTS += CFLAGS="$(BIND_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BIND_CONF_OPTS += --with-zlib
 BIND_DEPENDENCIES += zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
