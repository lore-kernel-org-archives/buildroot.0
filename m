Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39713C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 11:24:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376A2610A1
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 11:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 376A2610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5E340703;
	Thu, 21 Oct 2021 11:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLJemws-g9rT; Thu, 21 Oct 2021 11:24:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 332754053F;
	Thu, 21 Oct 2021 11:24:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC22D1BF616
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 11:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB1994053F
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 11:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mu_-pwCsKT1L for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 11:24:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C91FF40533
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 11:24:29 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4D6761FDAF;
 Thu, 21 Oct 2021 11:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1634815467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yKbrpGKtFnPM2wj1rcLbjPRvg8GcknfTURFJXW2Gw2o=;
 b=XF4cpoONBaadRYTzFFF3uoAx3XRhntw4Imej/xikUrEYwXgIFPw+Uho8Uz6GYD/J/RNHIB
 FpC/jWiYKKRXB9KRctMYiBxeOhqdNOugIEdj8Ucwy11odgtP3jblkWbFe78aaxV8G7R97x
 YK0RbvPYfbrTZbARYlNzGPrtOnVueRc=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id CA922A3B81;
 Thu, 21 Oct 2021 11:24:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 12:23:58 +0100
Message-Id: <20211021112358.8769-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ltp-testsuite: Add Open POSIX and
 realtime test suite opts
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
From: Richard Palethorpe via buildroot <buildroot@buildroot.org>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: io@richiejp.com, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During LTP and/or kernel development it's very rare that I want the
Open POSIX and the realtime tests. Open POSIX in particular takes
considerable time to build. So this adds the option of disabling them.

They default to on so as not to break existing test automation.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Cc: io@richiejp.com
---
 package/ltp-testsuite/Config.in        | 16 ++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.mk | 12 +++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 32e1b6ad76..272c2ede37 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -20,6 +20,22 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://linux-test-project.github.io
 
+if BR2_PACKAGE_LTP_TESTSUITE
+
+config BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX
+	bool "Open POSIX testsuite"
+	default y
+	help
+	  Test suite for POSIX compliance. Included with the LTP.
+
+config BR2_PACKAGE_LTP_TESTSUITE_REALTIME
+	bool "Realtime testsuite"
+	default y
+	help
+	  Test suite for realtime kernels. Included with the LTP.
+
+endif
+
 comment "ltp-testsuite needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 3d8fe3b78c..cc6d3c63b6 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -11,9 +11,15 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
-LTP_TESTSUITE_CONF_OPTS += \
-	--with-realtime-testsuite --with-open-posix-testsuite \
-	--disable-metadata
+LTP_TESTSUITE_CONF_OPTS += --disable-metadata
+
+ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
+LTP_TESTSUITE_CONF_OPTS += --with-open-posix-testsuite
+endif
+
+ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_REALTIME),y)
+LTP_TESTSUITE_CONF_OPTS += --with-realtime-testsuite
+endif
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 LTP_TESTSUITE_DEPENDENCIES += linux
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
