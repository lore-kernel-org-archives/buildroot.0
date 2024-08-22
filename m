Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDDDC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 12:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3ED860BB2;
	Thu, 22 Aug 2024 12:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXZYUqYjfqUc; Thu, 22 Aug 2024 12:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5F32606F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F32606F8;
	Thu, 22 Aug 2024 12:39:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 151441BF3DF
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 12:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0EE240580
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 12:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hS4kGiIJiqJa for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 12:39:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6B0A40154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6B0A40154
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6B0A40154
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 12:39:39 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 505422C85C6D;
 Thu, 22 Aug 2024 14:39:37 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 14:39:36 +0200
Message-Id: <20240822123936.726609-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724330377; bh=L4wtnm9uYHk9wfqRwGHd2L+sW5te9+0MPQw7bL5CZdk=;
 h=From:To:Cc:Subject:Date;
 b=aucD2+wIF5Xyk/yto2dbe9oQpnV+jjZmgI9CHkr8W8dyxXuC8101DClc5KE8h3T2G
 H6uyo5pat7KBw+fnMfgsWdu+bfsBJPQAO3TRpimubfbRNpXIUa5mi0Ds9Ka2tKJGEj
 CirN4sotnHKfnMgmGKH4Y5rjPHHN31HNcHXKcxcMhPXMV/GTFDAlRhiqSv2uylyGfz
 Y9BxnkkH5j0+MJlJfKthqhLpbWNH/9P61/Sw3N2RKt9VqrS5/J7F08iYqMixbg0sbd
 e6SkPPzz941ryykD/FFqXAy8OBDGJEtKt/tTDxBdlJPz2we6N9NvP8CjK5ac8Zs1HM
 haK+4yAXV42Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=aucD2+wI
Subject: [Buildroot] [PATCH] package/python-dotenv: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/Config.in                        |  1 +
 package/python-dotenv/Config.in          | 10 ++++++++++
 package/python-dotenv/python-dotenv.hash |  5 +++++
 package/python-dotenv/python-dotenv.mk   | 13 +++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-dotenv/Config.in
 create mode 100644 package/python-dotenv/python-dotenv.hash
 create mode 100644 package/python-dotenv/python-dotenv.mk

diff --git a/package/Config.in b/package/Config.in
index 07bd1499d8..0b789f8def 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1090,6 +1090,7 @@ menu "External python modules"
 	source "package/python-docopt/Config.in"
 	source "package/python-docutils/Config.in"
 	source "package/python-dominate/Config.in"
+	source "package/python-dotenv/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
diff --git a/package/python-dotenv/Config.in b/package/python-dotenv/Config.in
new file mode 100644
index 0000000000..ff8f3a0289
--- /dev/null
+++ b/package/python-dotenv/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_DOTENV
+	bool "python-dotenv"
+	help
+	  Python-dotenv reads key-value pairs from a .env file
+	  and can set them as environment variables.
+
+	  It helps in the development of applications following
+	  the 12-factor principles.
+
+	  https://pypi.org/project/python-dotenv/
diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
new file mode 100644
index 0000000000..710922fba3
--- /dev/null
+++ b/package/python-dotenv/python-dotenv.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-dotenv/json
+md5  68abb78e05460ce558ca255de550e1ea  python-dotenv-1.0.1.tar.gz
+sha256  e324ee90a023d808f1959c46bcbc04446a10ced277783dc6ee09987c37ec10ca  python-dotenv-1.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
new file mode 100644
index 0000000000..324eea239e
--- /dev/null
+++ b/package/python-dotenv/python-dotenv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-dotenv
+#
+################################################################################
+
+PYTHON_DOTENV_VERSION = 1.0.1
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/bc/57/e84d88dfe0aec03b7a2d4327012c1627ab5f03652216c63d49846d7a6c58
+PYTHON_DOTENV_SETUP_TYPE = setuptools
+PYTHON_DOTENV_LICENSE = BSD-3-Clause
+PYTHON_DOTENV_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
