Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED83E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 760A580529;
	Thu,  2 Jan 2025 10:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzGCdlvIREGu; Thu,  2 Jan 2025 10:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC4280C37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC4280C37;
	Thu,  2 Jan 2025 10:50:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25329E0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FAF240318
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJ_XggqitMEp for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.31;
 helo=smtprelay04.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFF854030E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF854030E
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.31.31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFF854030E
 for <buildroot@busybox.net>; Thu,  2 Jan 2025 10:50:54 +0000 (UTC)
Received: from [91.21.124.170] (helo=mail.go-sys.de)
 by smtprelay04.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98)
 (envelope-from <mf@go-sys.de>) id 1tTImO-000000001W7-3Ohl;
 Thu, 02 Jan 2025 11:50:17 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.43; Thu, 2 Jan
 2025 11:50:03 +0100
Received: from go-sys.de (192.168.1.210) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.43 via Frontend Transport;
 Thu, 2 Jan 2025 11:50:03 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Thu, 2 Jan 2025 11:50:02 +0100
Message-ID: <20250102105002.31920-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

patch 0002: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 .../0002-check-for-defined-FE_UNDERFLOW.patch | 32 -------------------
 package/gnuplot/gnuplot.hash                  |  8 ++---
 package/gnuplot/gnuplot.mk                    |  2 +-
 3 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch

diff --git a/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch b/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch
deleted file mode 100644
index e84c72aaed..0000000000
--- a/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 806641b5ef504488f871b5cbd9e5c356d67d0bd1 Mon Sep 17 00:00:00 2001
-From: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Date: Tue, 24 Sep 2024 20:03:18 -0700
-Subject: [PATCH] check for defined(FE_UNDERFLOW)
-
-According to fenv(3), the macro FE_UNDERFLOW is defined by fenv.h only
-if the implementation supports handling of the underflow exception. Do
-not assume the presence of fenv.h implies FE_UNDERFLOW is defined.
-
-Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/ci/926d2c26d31f4b69feda372c76a28643ef45359d/
-Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/ci/806641b5ef504488f871b5cbd9e5c356d67d0bd1/
----
- src/complexfun.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/complexfun.c b/src/complexfun.c
-index 7a5d9a13f..7ddb4ed60 100644
---- a/src/complexfun.c
-+++ b/src/complexfun.c
-@@ -86,7 +86,7 @@
- 	int_error(NO_CARET, "%s: error present on entry (errno %d %s)", who, errno, strerror(errno));
- #endif
- 
--#ifdef HAVE_FENV_H
-+#if defined (HAVE_FENV_H) && defined (FE_UNDERFLOW)
- #define handle_underflow( who, var ) \
-     if (errno) { \
- 	if (fetestexcept(FE_UNDERFLOW)) { \
--- 
-2.34.1
-
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 4072338885..8b59bf6a07 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.1/
-md5  744fde2362fb20db6cfc58de73f96e9c  gnuplot-6.0.1.tar.gz
-sha1  ce1aaeff632c78cba2b3ca8142cf130bfd411478  gnuplot-6.0.1.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.2/
+md5  ea0931758fc180e3b1950931b9869921  gnuplot-6.0.2.tar.gz
+sha1  be803916e4ea32720b4a646f2ffc98d6ad3a0dc2  gnuplot-6.0.2.tar.gz
 # Locally computed
-sha256  e85a660c1a2a1808ff24f7e69981ffcbac66a45c9dcf711b65610b26ea71379a  gnuplot-6.0.1.tar.gz
+sha256  f68a3b0bbb7bbbb437649674106d94522c00bf2f285cce0c19c3180b1ee7e738  gnuplot-6.0.1.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index adb9ce6ad1..b363e761ef 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 6.0.1
+GNUPLOT_VERSION = 6.0.2
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
