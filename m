Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C6DC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 18:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE1EF82032;
	Sun, 18 Feb 2024 18:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8C5XwRBUiWS; Sun, 18 Feb 2024 18:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4AE48200D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4AE48200D;
	Sun, 18 Feb 2024 18:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95AD41BF41F
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB0DD405DE
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulXwSoe2GtOQ for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BED9405DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BED9405DF
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BED9405DF
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 18:45:41 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmASrFAK1ce1vbmAVrHZJU; Sun, 18 Feb 2024 19:45:39 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 19:45:33 +0100
Message-Id: <20240218184536.1922309-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfM5bVStyuEg/PFO9WDQTlguQPcEoYBDZLKCwJKFa6k8+f5aTUsDdbKjs/7CA5LwWGd5FmZdCjvwzqE+l5D6DN+Pajlik/nYLAAQQKkq3ASbRcYE4HJWi
 oxumAjqQZ4tWptsVvZZ6uOk6SwTFdeiXw0AeuETdVsm8NsBiR8WsW3Kzn/JNaG1FcdlptRVmQaTXhwZ0lR+QPDXGSBlAXkLcG/DV4tFt9Aoly5Sa9IliWXt6
 N7XzOotdDiS3j3rLjk/JkFmRGzVpvhDCdEDtsc5RpYA2lH4vO7k9kj6FW5YqvqaAEl5vBbYHiBonqRwPFzLj7nk8Lt6QL+fuDNw5TWjbW6SPbmUo+MKgnz8V
 KMONOD+myt/7x1c5kkDqaW3OR/UyIMd2UY2OjQoIKGrY/7cWtKMEy4s1Pp9FlEjEx9slS9YB1twI0gWq9UivvFfwlCikjPU7kpn47n0aoHAyGzWqTTlPcTq/
 gKDU9q/AaQrfhv7XtgLup/yBfKw0Yn8zOsW+mxIPkVtYv078vSlbuQdS6uLHh7jPxK17MHoJW1hk14H2AfrXJ2GDRxmJBvNKsvTgOIyMnCJ4+DUPeo5rrDKw
 7uk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708281939; bh=z1hzkh09ILz/tu+sRc5dw1QM+OxUAQBE5w3hkpk3CA0=;
 h=From:To:Subject:Date:MIME-Version;
 b=KRH32R+Ud7ouYZV+rovV2wxmbtqxBM8Qe2x0/5uEuWlDeixH56PRafTGuWPYWw0TF
 QAIbOJg3VTcajbz+1oG+CFE4N002lnhzIazy8mSBpBiicb9AorP5lMKWl9iT1e7+PW
 1CImcbiSL0MgQhRsQi2C6Lb5NNJMJE7Z65jyj8pyhRim0itLM299KA8szph995GgEN
 mk9wu/2oHmcd8l8EYQ4dvFi3Tz9ZwCYOr/FLNoX721BX9aBDPhJQZk6/4Hz7l+tDXH
 PbZnjBlfZQ5FITMFno7d6sbhXPZtciDO3Af6Sgqlf7Wd3BE71ET26PjAz38P3YFFLS
 ujDuAkzDUPOIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KRH32R+U
Subject: [Buildroot] [PATCH 5/8] package/libgeos: drop nios2 binutils bug
 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libgeos/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 2a27c6f2a4..76cbb9bdcd 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -14,8 +13,7 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads not binutils bug 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
