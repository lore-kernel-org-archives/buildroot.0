Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF1BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 13:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C4A817AF;
	Sat, 11 Jun 2022 13:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B51DZU37rwiV; Sat, 11 Jun 2022 13:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25662817A3;
	Sat, 11 Jun 2022 13:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 711741BF2A5
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F7EF40A8D
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsD9WRQAq2aG for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 13:09:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FC87404F0
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 13:09:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h5so1826728wrb.0
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tHMR9vQLUZMMFn0cGf6xGgbX+KUaXA1PPSIHCV9Jl7U=;
 b=nhK1bPjBHz3+VsBnk2Yj5SJNwJ8XWpMH+V9r1Q5x7Uffo7G1D6TCtlq0h+Fv4O67Sd
 gUhW8aQ4BT9dnshfdFd0OTF1sOiFcrEZP/uGrgvGtM+aP1RatJKtbMJp7X1QS45eDPa2
 vcj9QVeUFMt8MmZKdIHti/cHV5BRUmxOyc3QVgJMwHepDrWLctU7mijouPTAoQQV2aKc
 IN/UbX9MwiTp0negOa8fhbrRAMXo9DGg9yonkyqVe+gruRIAqi9vyQY7p5E2WqqhKoUm
 GzX8kq+N3w+36Vt3RNDfYSKM32iHiq5ftETEscl/E/W5XB7Ip66SxzcihEaeOB9T80ek
 wQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tHMR9vQLUZMMFn0cGf6xGgbX+KUaXA1PPSIHCV9Jl7U=;
 b=NyXZUPNNCq2iktvMBdx8XW9U7Ntdt5nYGRdhC0QDnzji9iII8GHlv0xFmxnDCP9cY+
 rjylkH5nsGqh+YRUEZACpTrncM5x72c+Qm61EM413iuw7W1BTEsx9XJhoTTs7xzBEQo+
 qSC9SuBrtUkyCPccxsSyCEyFmb8Bs08ai57lDW86p2FfYALueQfmLld7kVwvFBaevBdg
 7go+8OofZ3F91rXsc7N4wjpNw+3a0qCCvXMu8m68IpJk/ZOgViYjYnzr1ucQ+txnhhr7
 irJWOYFRm6/m+ANhs0h9Vb4bSvroLugwePzM5EuVpbkCTVHSQM5yIxbugAA1yXxgRRLB
 mkDA==
X-Gm-Message-State: AOAM532BcD/s/TjMKuGSW5Ei8mY+W2H3ECv7H3mmNylq73jHKwdspO/p
 iHbTRmzHjtWq0MUyVZrYmIcceIzX594=
X-Google-Smtp-Source: ABdhPJxYmr/esWG/V22OHIAOtp2oYZXW9BOHPoLcfTVCZP9ZEkpMUUzAHRdxKMBb18eDKpdPez2O0A==
X-Received: by 2002:a05:6000:1861:b0:216:4519:18a1 with SMTP id
 d1-20020a056000186100b00216451918a1mr38228279wri.293.1654952951968; 
 Sat, 11 Jun 2022 06:09:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b0020c5253d8f7sm2548727wrw.67.2022.06.11.06.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:09:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 15:06:31 +0200
Message-Id: <20220611130631.359062-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libabseil-cpp: drop unrecognized
 option
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

ABSL_RUN_TESTS has been replaced by the standard BUILD_TESTING option
(which is already passed by cmake infrastructure) since version
20210324.0 and
https://github.com/abseil/abseil-cpp/commit/a50ae369a30f99f79d7559002aba3413dac1bd48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libabseil-cpp/libabseil-cpp.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 738cd03c39..7c6bda7659 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -13,14 +13,12 @@ LIBABSEIL_CPP_INSTALL_STAGING = YES
 LIBABSEIL_CPP_CONF_OPTS = \
 	-DCMAKE_CXX_STANDARD=11 \
 	-DABSL_ENABLE_INSTALL=ON \
-	-DABSL_USE_GOOGLETEST_HEAD=OFF \
-	-DABSL_RUN_TESTS=OFF
+	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
 HOST_LIBABSEIL_CPP_CONF_OPTS = \
 	-DCMAKE_CXX_STANDARD=11 \
 	-DABSL_ENABLE_INSTALL=ON \
-	-DABSL_USE_GOOGLETEST_HEAD=OFF \
-	-DABSL_RUN_TESTS=OFF
+	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
