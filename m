Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7B7C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 21:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 346F9410C6;
	Tue,  4 Jan 2022 21:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xquJwzLrmVxR; Tue,  4 Jan 2022 21:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8406F410DC;
	Tue,  4 Jan 2022 21:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 001721BF281
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 21:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9AAF410DC
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 21:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rKEUBQz60o3 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 21:08:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2C14410D7
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 21:08:25 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id e5so23672329wmq.1
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 13:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMDXjVbcWJscaUFx9kgSKA5ZkbH+dfvBcGY4GM/XLbQ=;
 b=Whz8XDYYtCIBwVUvicVzhwTyu/IXLMR8tkdhTWkd7z4fkMuOhKjzoYgoiAYRRPkW42
 +BNvWy+AN9lIw7kZIBQvSQjw7i9N41hHRY9aK9kS3IDq+49CFQF7s0qtHPDUGzVZ9HCk
 gRPnYeKYOw7LjxdH6sHSHO2OfyazAYl3DZuBx+CxYSxjCdcR/I0rYp19pNuX4kjDYd/O
 CaxQ8So7vMojewXDm2mF0+U030Sf4XX61Q4rzDdsEIgFfPSQpoaD271gG32c66M24sKb
 82AI/r9BG4B9jEkRGmWyW7qS3E7BE3Tz0PwqgIvX2sMUEYNA+RwoPx/sQCxOVyS+XQf2
 p/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMDXjVbcWJscaUFx9kgSKA5ZkbH+dfvBcGY4GM/XLbQ=;
 b=rZ8mPz6/y9wF+k0V7lC+TwvDDRcDKU2u96f5n5yRjaa//9MJ7tGkrLNAvk+I3v4hrQ
 fGAo4vX7/wfEGURujbox3g//TwO06HopdsUi9jABk/lcaWn3zo2Rqn9ERoymIRksvmz0
 KVeF5w/eFstdzkNTMwcGuuCXytcxoMpDQ2MpoiE8Ots3pBiY7jH0uA35flMA6j7epyi2
 ZgLqrSowO6ZbAG/X5llmgDB3u+CrRVOpY7VDbewgWRjbir04DWLnneHOYT5Mq9eGxJyl
 Jn2YsjwpQq+/tYRA8vRk9TChbL8PqqM7HpNKJiShiur6VWcMzI5R5XXHhAKo0jFPFxCZ
 k2cg==
X-Gm-Message-State: AOAM5321TfHNTZPY3GsHpMvFstDdtgd6nyBlsnwIsKh1X0iqlMmUCRuq
 55yZzxLxDPPg71vWGYGHeGmNU5zcw+o=
X-Google-Smtp-Source: ABdhPJzGrQkkTnuVZ35b1c/kGzsvQo70Im4+NdSXHJ0KypW7ze+akS3E4UsLDrNlrPWUIK/Qjf41bg==
X-Received: by 2002:a05:600c:384c:: with SMTP id
 s12mr163664wmr.108.1641330503905; 
 Tue, 04 Jan 2022 13:08:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id p1sm486550wma.42.2022.01.04.13.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 13:08:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 22:07:27 +0100
Message-Id: <20220104210727.3634208-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qpdf: needs atomic
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qpdf needs atomic since bump to version 10.5.0 in commit
b5352c2177011ca389cbb7c68e78447549cbdaaa and
https://github.com/qpdf/qpdf/commit/c5c1a028cdd3cf345046c46963fb0fdacfb2c33c:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: /home/buildroot/autobuild/instance-2/output-1/build/qpdf-10.5.0/libqpdf/build/.libs/libqpdf.a(QPDF.o): in function `QPDF::QPDF()':
QPDF.cc:(.text+0x48de): undefined reference to `__atomic_fetch_add_8'

Fixes:
 - http://autobuild.buildroot.org/results/7e18689670dcbe491c35f0597e5c3c787936263f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups-filters/Config.in | 2 ++
 package/qpdf/Config.in         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index 32381e6c1f..ded99a4774 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # qpdf
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
@@ -33,6 +34,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 
 comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 5"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index 047c4c8a75..accf2b5f34 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QPDF
 	bool "qpdf"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
@@ -16,5 +17,6 @@ config BR2_PACKAGE_QPDF
 	  http://qpdf.sourceforge.net/
 
 comment "qpdf needs a toolchain w/ C++, gcc >= 5"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
