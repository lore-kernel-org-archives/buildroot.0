Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DD7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F74060C14;
	Sat,  5 Feb 2022 14:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsU3HWDz3ROR; Sat,  5 Feb 2022 14:32:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CEFD60BE4;
	Sat,  5 Feb 2022 14:32:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 329171BF33C
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B65B40291
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9k5MuYgfPaH for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:32:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4AE240018
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:32:55 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k1so95028wrd.8
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 06:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kJCy+s9zDES3fSk/ugZMo1r5yHSjxj3T/Im/mtiyqo=;
 b=CO4j5x0NP/7qEzY+r//AXpmOMInFvu04NJtYP/r1BiN+EKze+Y+0/iEgyAZPY9uLR8
 tApy97SClA96v7h0Zc+0R6URgQOSpSJyNvH9KzJ6AshnvecbbfqtTM3Ac1pT1lqBG6kf
 brvPS4ZwjENr6mRfy5GzNU5gbWUec0g0WtgCckBZ5jHg/GQDUzebEYt0SgymEl5tPh2Y
 ejPmR9ogplexGfhb553yHk3xXiJWtzj/i2G3havNRMSqvQ7j1PCNMONas4EfSEAZEt0h
 knsxf3BlHmRQoYGJlKLf9CKK3o8ppJM79ibj49VpfnepyJH2IR+n1wBfvwVMwAduKtl8
 MaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kJCy+s9zDES3fSk/ugZMo1r5yHSjxj3T/Im/mtiyqo=;
 b=hagUmb8WchzcpSKiFwCIzAl0PI8IwEtqm9YCfzs/1pc33V6GJQW4cbkcPhRnoFYQ2x
 28Tc6fv2GlarJBFNHhwNmjNP713LleYyd6+e4dGeM19YFmJQasz/20LNGSgkMyc/ktX+
 +O+i2FwCKYEq39rT9Kp0d3cRnJQxOSVl9S4WFiE022Y8lQUegbBY9K7O0U3bHbU5f4C5
 InmM0ICyHOBbUGGjg0hZN9Up+UP8qBjoXtFy+TdHaYuISRrPfmT5hshMtrQMZl2ztJfn
 Dwzg/f9A0jHFxFRtkxi5QBJaxyzo0i6JCNxYMs5Zt9wKh4JoFLStMP0BHJytsrMtNsmA
 BNmg==
X-Gm-Message-State: AOAM533Vvm/YurmwbolZwSXQKlZHVWGRfQLsRSLpJJBx37dYHu9JWo+r
 kx1Az5ZbW/T2VByTC5kdLH1fSiIHxPo=
X-Google-Smtp-Source: ABdhPJyp/7BW8kg5ddP9M925vabPEfF21z4gg6yQxfuXXL/KNYyUobHlqaKmUwK1kMHF4SaZXl44ww==
X-Received: by 2002:a5d:6489:: with SMTP id o9mr3088906wri.628.1644071573811; 
 Sat, 05 Feb 2022 06:32:53 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n2sm5487609wrw.63.2022.02.05.06.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 06:32:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 15:30:43 +0100
Message-Id: <20220205143043.427517-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: needs C++
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
Cc: Julian Scheel <julian@jusst.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
bf4cf9de833e2d571d98d1ca935ea08a3468e463:

no -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -fPIC -DCRYPTOPP_DISABLE_ARM_NEON -c cryptlib.cpp
make[1]: no: Command not found

Fixes:
 - http://autobuild.buildroot.org/results/fa90b416a219a512a482e7dc63e2d72b184307c7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptopp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cryptopp/Config.in b/package/cryptopp/Config.in
index feb945db2f..1648a73f9d 100644
--- a/package/cryptopp/Config.in
+++ b/package/cryptopp/Config.in
@@ -1,9 +1,11 @@
 config BR2_PACKAGE_CRYPTOPP
 	bool "cryptopp"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	help
 	  A free C++ class library of cryptographic schemes
 
-comment "cryptopp needs a toolchain w/ dynamic library, wchar"
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+comment "cryptopp needs a toolchain w/ C++, dynamic library, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
