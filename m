Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79700C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 23:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37C0060BE2;
	Fri,  3 Dec 2021 23:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XnDuGwgmHJL; Fri,  3 Dec 2021 23:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3D960BE7;
	Fri,  3 Dec 2021 23:11:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F35C1BF3FB
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EB28833DB
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6cVlP47RKOh for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 23:11:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D771833CE
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 23:11:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v11so8725461wrw.10
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 15:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1GlwLkZP6vwB5QVHMUrHRUpWeiskww03KzaS8AevJ4w=;
 b=QeonP5MsszZwhZ8YtlH3XIXaxgMzkHqzVDo83HrtL0eOja90lP4MQk2Rwiegwf02CP
 ePOpKYVuhseu2Y4CPKtcKkj8I2orsy5AIb/5xHgvmg25OyqxH0bwietxHS6lJCL7/Z+0
 gvTc0YOTwym3hOAWp2t2Wx8hu4Qr7JeqCpdwV2npdgLB+W19ioOCR+5dh9CQeaz5bv4F
 xThscvXZYPLEAKVDVHs36KA1IaaN8Okjrnc+dalIN7Jw5UTWwh+1fBxE0WchDYREAuty
 N3/jNsM+NE30fOP8Ff0tLfyVZS4d1xaC8sGj+3+youXQOcQiAaSImrAnSXF7eav1iz4Q
 /kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1GlwLkZP6vwB5QVHMUrHRUpWeiskww03KzaS8AevJ4w=;
 b=FSStHapQXh4/1fDo5HS7JaI54l3RIy7Ybc5cyAtHU+CxQsrJ7Fa6OIYEL2Tkvz6PWz
 a/XeteTXVmH9J6BN5xEzwQ54624MxLqXPYGZm7OHK2LkYFxnZjrsneCWs1Bj92wfb268
 SY4IGQeZDNQG2ScScev9m34SXwT6euL5TxzXMiRaKhYxvt1a8ZrHHiw+WYzKfqcRvMQi
 B/59VbsNdgGc8nYnLdus4jCdshrUx+VTtQl7mOfYMoMWVZKKhKjSqPgQaIRuNZ8ahU5c
 b1qwUEPH0JrduoOJGTwheSf2lrCTIhb0eq+JIVqGiOoEZTpKKtRe32q3JLqx3GjR5RZI
 mWyA==
X-Gm-Message-State: AOAM532CVBl/ks6A9wkS15yymR89+0CnbznY6I5TdwIVRq8u/4aWr/Ib
 Cc71aLraCVfNLowHw3uNoS+QlUZXSYMIPQ==
X-Google-Smtp-Source: ABdhPJxAjJmAW94a3ythVm7nPRLBl7NStxaIlVp4Std94DyEOgdqbnXfvdqJC1h+2mKXbBXFiYBeJg==
X-Received: by 2002:adf:e3c3:: with SMTP id k3mr24018378wrm.599.1638573093445; 
 Fri, 03 Dec 2021 15:11:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u23sm4240926wru.21.2021.12.03.15.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:11:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 00:11:39 +0100
Message-Id: <20211203231139.2013369-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libffi: add LIBFFI_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:libffi_project:libffi is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibffi_project%3Alibffi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libffi/libffi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 85b4ab5b84..093256a629 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -9,6 +9,7 @@ LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
+LIBFFI_CPE_ID_VENDOR = libffi_project
 LIBFFI_INSTALL_STAGING = YES
 # We're patching Makefile.am
 LIBFFI_AUTORECONF = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
