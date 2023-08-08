Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F146EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 03:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74E2410B1;
	Tue,  8 Aug 2023 03:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74E2410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYo_ba1dXStk; Tue,  8 Aug 2023 03:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B8D4410C0;
	Tue,  8 Aug 2023 03:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B8D4410C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4C01BF29A
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 03:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43417813D5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 03:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43417813D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqYTUYy5dzIL for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 03:14:17 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E0E081442
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 03:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0E081442
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N2V4P-1pohFT1moR-013rne for <buildroot@buildroot.org>; Tue, 08 Aug 2023
 05:14:12 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 05:13:48 +0200
Message-ID: <20230808031350.116041-1-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y7N100hIJVDAW8afM+ejPm3tc6W03pwL4lsoWMkfOVPRzoRUPKL
 b1GVyUVmRXIbeNcp0sNbZb3usqGzlYeSUEwfzIGVFk/Dgd1FA+jD4h3bak750t7qBjw6EER
 5uTzM6LTGLSFrREPrqDcE6lgiqiCCir/BaOIhSWSPrTc5YOodevjeZ4iWUmH6JactsyRoXX
 gD3uwdYRzsRJfI3i65iGQ==
UI-OutboundReport: notjunk:1;M01:P0:aaicJD4t3BI=;AYRiwt+fR3yh9NpNTBV4ohlTevZ
 4Wt/SlUh29qfH4Fwuy9C7uyqN7JO/gq88kRhPJCOxieAPi6NB3aCN70PziUEd/dCx+2LA6l91
 kBp7ub1IkbZOHp1oBK3XLRYXEAbhvqIfvu/xTFwwd3YGiN4VggLOR0HhbZfRJMEvPrXzJlByQ
 oFtoltlzVi/Ki35JwTusu1yaBKU+W3m2u/iOTd1EIR+a5pTi5DJrkKmlB4wGmnRvTOTHHu7+D
 i0rQyha70QQsaDlL/GuxOyAMNFnA+6sIfusU74qs9ql9u5SYjqgPUTQ7drzOXBaWsotbJDGEZ
 YDRHNsJFZn3UHMiFdrD96h6eXloUeakQ4kN8VR5CaI6WKyIR+i5B8NhdgbkKP1JY3Dbw2FiWd
 USwF7HBPYt/L6fWac8qKzEPS0j091e22bzVirtv2eZ6nEezDEvmP3nCA8oIly4RhcwSXboovN
 eE2k1POF+6LyIiygG9ud/DwJ6md0edVo7JI16HEWCXKOwf+oRxVqP7PrtfDa4F+Aok7gB2kUZ
 eUB0T6SeKSK0711B7+VTfZXvcfphPweQaFVPuXOt1DbJwk/pJi0RtWZmwiA3HejJ20D/F0rL2
 oxVHRe75lRhXMEVLmM1xDM4wvoA4uIqC96S70ZAOoMzOUPFJoZyqMJlZspFjSROHXXvlIoa+t
 CXVdLwUbHazQE3sW4R7gsX9syeOcjdFVkKpzJPRUKidyX35OufRclpA8n+r4F7fb2njcmQdCy
 lSBNviTgCsV/Z1wFlNOh32Wl3tNQ/e16Xl8KowwfLdbNBpBvVdld2s30AZjLu1U+jP+Sg2Lw/
 lan4Q91J2mf6wnm74a1nzxtOEMHy3MwX7bwgHty4SSCGRb48G1QhIneV/8+hFspnoTNv9M2Fa
 84a4Ml9E8DFqI2uWdErNZ7AIcbizdZufJVvOe6WF128HTHTfo3+tToHbF2Rku9JJLn6g+QIdz
 +NJtQQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691464452; x=1692069252; i=dalang@gmx.at;
 bh=mUQ9O4oHEobtQEFimT/TwwQgvmKRqoEmlE0BH17pphE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=HV3HG40J8wHMJLne0AItdpxcHdfBaOXLfmfOUnCW8oq47j+6cDhIVq11KdS0KYBK97lolg0
 VhxjBEqiod63LY22kKsQcG0LcKgV8R8RmPNpzXwaC770Y7j0X/aDixwM0BWAmlr/i8n3vrLv2
 /roH+vMO+lILDUcS2QMmyKqiCUY6KTdgMsEOlgQQE4zBN3z/oZFf6eQ7vAdU/teXVdghtdep0
 qBWMKttGBzggqIx5LYKBjFlM48jQPLy3frvCSHnrPiD+kgaovbpIq1dZt2XQfOFaJSTBfiCOD
 7cgcWQnDscrxY0KVYmNdtdSFcrGHHas66nBJhr1B7gOw+gCSprtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=HV3HG40J
Subject: [Buildroot] [PATCH] package/libksba: update CPE ID
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

libksba_project:libksba has been deprecated by NVD [0],
gnupg:libksba should be used instead.

[0]: https://nvd.nist.gov/products/cpe/detail/AA709F75-0B9E-4B67-ACEA-C1DCF33E7745?namingFormat=2.3&orderBy=CPEURI&keyword=libksba&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/libksba/libksba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index b7c0508df8..122914d524 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -9,7 +9,7 @@ LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
-LIBKSBA_CPE_ID_VENDOR = libksba_project
+LIBKSBA_CPE_ID_VENDOR = gnupg
 LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
 LIBKSBA_CONF_OPTS = --with-gpg-error-prefix=$(STAGING_DIR)/usr
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
