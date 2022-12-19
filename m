Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9B7C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 21:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E81F6817AA;
	Mon, 19 Dec 2022 21:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E81F6817AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOrbmuabczz7; Mon, 19 Dec 2022 21:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22D21819BE;
	Mon, 19 Dec 2022 21:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22D21819BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 557561BF368
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 21:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30898817AA
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 21:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30898817AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ocF4ZrKdRa_E for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 21:33:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DF75819BE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DF75819BE
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 21:33:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.168]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N4zAs-1ohuqp2ubU-010sPR; Mon, 19 Dec 2022 22:33:43 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 22:33:43 +0100
Message-Id: <20221219213343.26475-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:62SUOUi5Oudu1sTddNS3ibw8w5gv4c2uRgfxkKevSmRY+sfOk99
 VZct+r+drZ4LWAiOwlNLho52893e4YP9AsGfRS5UhQnUPg3iHcqaMILwuuzPsmoG74RN53x
 E35wsD7GV/X8BWu7R9u9hEonPrwZiZmYQCHslBK1E+ZM3PwfjuSx8j56Ybt3Q7HY0xlSAfv
 oSNKIrAzNcdGvfDtLfZSA==
UI-OutboundReport: notjunk:1;M01:P0:H2kaTBEcBHA=;7ROA8azopC7YDSQnx3oJJ+djy3T
 e7mGw3r2vNwMZCVF1/deDEKzmqpqTVwTpU+bHCEyPtUvSefW180mm6wLm/zwOnZQlWgRxazvy
 L1bJNSiJYASlDvkGj7XdFiRtSyTjJeaT0Zp4h9jBrvPr8slQddzwW6p5vXTOE4Dy+i8uQ1raR
 rq+egvNepmCoIx1t+GgtmLcgycO6lWys1brJe6i85O4AEifY7uuCaI1PwZ9yES7VgW+lJr2XX
 C2OichILgwbD1krbM8kV2ZxeUf92Hz4eay1crHpROXnz696G1E1QYcj9m6cQhDNKnLEGr65/7
 UsZ2ffLcP6/TXXdvzCUMHzEFdPuVvtfSfNjHTvSI0ioCvML9buX5qM+fj8HCa/nBIROO5cyIB
 7EggHFmJrg0SaBVCUFiIhSvaEnR4KC+89UC1/V7nHvB0brXlPMOS8a8mpMnhQ1HY3xmee5UB8
 t/mCR9zPO72kOCwlFhBMkUyg1h8pKCMfPTB0HSFrF1oI2xaw3N9tLzC/x9xoiAWSjBTuzkhfj
 EZrycDR09L27pZxbASsJpOj2ViFjiSWIEQVfxkXg5Q3i9XV64xNShwq27B9rRL7xAT48KiGsX
 x0fSJMfQjqNG9TR3Qn/vsQwCrH9P6fAvkIql9tQOwjmYIy3gRnTa2fCF1YSNBySAuNg0PPkjh
 50NyQJZHJ3pS/o2BCSyygWq1YH3r48pDFhi82lyvH3nVjqiy1KhU0vYmKV49nZzC/yU/GFtak
 57fMdAc7vEY0VnjOm/JQzCLTfuBrfqc3RUOQqeeDoRbtD4rk4q0wlYCn2NtTNYRSAYj/LJVAj
 P9hsDjnybuSE9DcMNVQAw5FzfP50wKNeRycTI8+PEssHr4i069N9ZhF9+oA5NV6h7XnhjseQY
 MH34R+xkapOtCGCjQJVD2gIhMzBupGJXneY/ZENwrBQ/orUNL+MHaiy4/P9bQL4MmpdYjGZES
 gXL3mAS5b3fke1BCBC7KcXUkUNo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1671485623; bh=wMiK0VmO/R29+wmZ4Pd3CyxieQlkQBk3X61+PPzQa3w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Ibc4JCEDHlXn6zgaTHjY5JK32umI3juJwXdRFOi/CbjDEFag6t5zOnMG4tee8bK2W
 cEvskYjk13poQndfxn3zMg7EmSH4YnaBnngr3tv8/h5QpOwKVnESrY+36c8YQdmUDH
 NTrTWPo5VT/v1KEI37izirX2mz/7npenZ2jO1PchHN9phJb8cnCnEtq1hcgqJB0EJB
 /+NoWe21CmmJv3W28w9tnejbreRRjPW9IfOe4oQ2DzKTP5retwVxDqnAJvhPdavQRg
 hnWC8UHVWE56CUuWCm9Bk55kzsvq47hcf7KzmM5Ya6xFaPkpIqaBN3Pg0BJqmsYJvG
 AQOM10Z5b5R9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Ibc4JCED
Subject: [Buildroot] [PATCH v1] package/perl-image-exiftool: new package
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in                                  |  1 +
 package/perl-image-exiftool/Config.in              |  8 ++++++++
 .../perl-image-exiftool/perl-image-exiftool.hash   |  6 ++++++
 package/perl-image-exiftool/perl-image-exiftool.mk | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/perl-image-exiftool/Config.in
 create mode 100644 package/perl-image-exiftool/perl-image-exiftool.hash
 create mode 100644 package/perl-image-exiftool/perl-image-exiftool.mk

diff --git a/package/Config.in b/package/Config.in
index 914c3584e9..b0be98ecb7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -837,6 +837,7 @@ menu "Perl libraries/modules"
 	source "package/perl-http-multipartparser/Config.in"
 	source "package/perl-http-negotiate/Config.in"
 	source "package/perl-i18n/Config.in"
+	source "package/perl-image-exiftool/Config.in"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-interface/Config.in"
 	source "package/perl-io-socket-multicast/Config.in"
diff --git a/package/perl-image-exiftool/Config.in b/package/perl-image-exiftool/Config.in
new file mode 100644
index 0000000000..3bc72ba634
--- /dev/null
+++ b/package/perl-image-exiftool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_IMAGE_EXIFTOOL
+	bool "perl-image-exiftool"
+	help
+	  ExifTool is a customizable set of Perl modules plus a
+	  full-featured command-line application for reading and writing
+	  meta information in a wide variety of image files.
+
+	  https://metacpan.org/release/Image-ExifTool
diff --git a/package/perl-image-exiftool/perl-image-exiftool.hash b/package/perl-image-exiftool/perl-image-exiftool.hash
new file mode 100644
index 0000000000..ac148aa89b
--- /dev/null
+++ b/package/perl-image-exiftool/perl-image-exiftool.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5  75dd9d375c1c4798a082dda79eaf6ba7  Image-ExifTool-12.50.tar.gz
+sha256  bce841fc5c10302f0f3ef7678c3bf146953a8c065c0ba18c41f734007e2ec0a8  Image-ExifTool-12.50.tar.gz
+
+# computed by scancpan
+sha256  63502bb7fd68b3b8265304d88932f70f1be82751cbc37936d1d62956582310fe  README
diff --git a/package/perl-image-exiftool/perl-image-exiftool.mk b/package/perl-image-exiftool/perl-image-exiftool.mk
new file mode 100644
index 0000000000..42adb04d3a
--- /dev/null
+++ b/package/perl-image-exiftool/perl-image-exiftool.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-image-exiftool
+#
+################################################################################
+
+PERL_IMAGE_EXIFTOOL_VERSION = 12.50
+PERL_IMAGE_EXIFTOOL_SOURCE = Image-ExifTool-$(PERL_IMAGE_EXIFTOOL_VERSION).tar.gz
+PERL_IMAGE_EXIFTOOL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/EX/EXIFTOOL
+PERL_IMAGE_EXIFTOOL_LICENSE = Artistic or GPL-1.0+
+PERL_IMAGE_EXIFTOOL_LICENSE_FILES = README
+PERL_IMAGE_EXIFTOOL_DISTNAME = Image-ExifTool
+
+$(eval $(perl-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
