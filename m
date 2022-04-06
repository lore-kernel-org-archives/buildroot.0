Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B842C433FE
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 19:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D898E81365;
	Wed,  6 Apr 2022 19:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9bjYvUzH24f; Wed,  6 Apr 2022 19:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3532812E9;
	Wed,  6 Apr 2022 19:43:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12F661BF5A1
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 19:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01200409F2
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 19:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yciGpJ28tUWg for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 19:43:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA8F5408AE
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 19:43:41 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w21so4783842wra.2
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 12:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgMD88RcEt17I3xWxQTnHyEXxPfJpPWvgFb/E1LIwSM=;
 b=dKLtFnhviJqMqKJDOcMKSUKxkbbcuovzjwi18zCk/975wRzCgC8LPNxtkzQYHXA9pU
 P4vlZAM4w0uMr20lfjj9BUZNehhcLYSlCeGyfuGpo5b3PvHuqUTHEooyn6PjYHYh1F4v
 LzaUoeRdRuJ40qrbDX1nbNzqwLSyYE2wARa65mwvPlFBI2DtqW8hS3FTppNcqLvjKb3S
 05ns25G4zJVI1yWK48NMCurCdgnEoPW5vYAg3DKdnoPrhRsS2lKmhK/CGBVye8ewIyKz
 NxYm6cfeVksfmlI7En99E9Ogs1JEbOz93YA7XB7YKrzYy6OT6PqSW/LSzflfYgYQvtrR
 zi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgMD88RcEt17I3xWxQTnHyEXxPfJpPWvgFb/E1LIwSM=;
 b=Swsuk2WWtznUE8vJq0nk/viOa3xZ/nUIiCVBPvqbzcbiLhD3+9N1vrPacSL7Z40VzQ
 bGLD8ksYq3jH0G9ZM9Gqe5nw8iqcI8LUkEh0S4srpuFewAg4eSO7yLweagG+AcZwV7K5
 9D4I6h8HNzbpu3WBoaXGSfTEcYLBl84dxV5WLwN1kH47Us+7sXczIHE5KlgNDWI2DZVX
 rPdQDQPp0GSeaOANWf2RAZlx3Ke+4l/jao+bSBMKYO5GNcURA2Q+ahaOEvvS/gPF03eY
 MxTmmJkbUuqQttGTLCPzY0C+aNJIdt/BK03W3vbsT1WoPMoMciVcP3NwDTbAQq75OrZM
 RP/A==
X-Gm-Message-State: AOAM5304ACUIEr25VWDUBM65JjvrLw8T5D0AzlOF5qF77mwme2GxMez6
 XwIvbQ21h2OY35zBRJdDJKMwdJFcWco=
X-Google-Smtp-Source: ABdhPJzmQkJGdTHtcX8vtWzN4BbiESJnO0EZUp1vSSxD5xs+7jBKR+78+3nAGWQRiD+KSvwNmoNZAA==
X-Received: by 2002:a05:6000:1c18:b0:206:1029:922f with SMTP id
 ba24-20020a0560001c1800b002061029922fmr7651113wrb.709.1649274219544; 
 Wed, 06 Apr 2022 12:43:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm5503998wmb.15.2022.04.06.12.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 12:43:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 21:41:48 +0200
Message-Id: <20220406194148.39490-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libressl: bump to version 3.5.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with pure-ftpd thanks to
https://github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacefd3393affc8eb2ee2ba8:

tls.c: In function 'tls_init_options':
tls.c:329:5: warning: implicit declaration of function 'SSL_CTX_set_num_tickets'; did you mean 'SSL_CTX_set_options'? [-Wimplicit-function-declaration]
     SSL_CTX_set_num_tickets(tls_ctx, 0);
     ^~~~~~~~~~~~~~~~~~~~~~~
     SSL_CTX_set_options

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.5.0-relnotes.txt
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.5.1-relnotes.txt

Fixes:
 - http://autobuild.buildroot.org/results/f5d36180949278510199aa499e253780558c6ffe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index e923998713..5474d8e537 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d63c37f08d  libressl-3.4.3.tar.gz
+sha256  a7d0026f67622275ec8f8239ded422a653d5ccc84df55dea2acd406017185608  libressl-3.5.1.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 0bb468cedb..81b0163b93 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.4.3
+LIBRESSL_VERSION = 3.5.1
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
