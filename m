Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7773DD5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F2ED60DB6;
	Sun, 14 Dec 2025 17:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rA3m1k9Mb74Q; Sun, 14 Dec 2025 17:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D9ED60DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734480;
	bh=QoIHBTqDc4Ei9+Xd/KeC6+QE611CUJwYnw+ZoTiEyNU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XmmlYLYrJ9UbmYsMouqtyVVepsmI9s73MC+sz62b3iI+N5XA3BRfRdWJAgahtY4ue
	 2tZe1kjfcTEEzHXV+63U8dgw4wjn1fPd5NQp0Srz1/8X2d/0txPWLkUMPIiPMHwVE1
	 MraP0zDNwu1bnssg0gbaZlg4uQqL3lIuz8cK4b+1WCrOF4UoCsm/KXLLhA/hIB2hIB
	 osKy8k3HqglZhIjQJM/7VOdgunT61BHf1NeO03ucYgv02wGeA0o/aD/hUMnAG1cnXt
	 t2fDTQMhPfl7gx7+n1n8xmuUtp3/vXAb/3YQr5vopLK4G6LZg7DLE5SJpWZNPD2NJy
	 9KX3Apt9dAzTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9ED60DBB;
	Sun, 14 Dec 2025 17:48:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 659402D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 407EB4005F
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyRFEtgf3b6l for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA16A4069E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA16A4069E
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9CE086A25; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d075b6a238806234241a2f6bde8faa2e2627b871
X-Git-Newrev: 1be3962f8f7c479eff8420e0c6227af13ef1d639
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.E9CE086A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{avro-c,
 python-avro}: bump to version 1.12.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1be3962f8f7c479eff8420e0c6227af13ef1d639
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://avro.apache.org/blog/2025/10/16/avro-1.12.1/

Updated help text URL.

Upstream does not provide hashes anymore for avro-c.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/avro-c/Config.in             | 2 +-
 package/avro-c/avro-c.hash           | 6 ++----
 package/avro-c/avro-c.mk             | 2 +-
 package/python-avro/Config.in        | 2 +-
 package/python-avro/python-avro.hash | 4 ++--
 package/python-avro/python-avro.mk   | 4 ++--
 6 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/avro-c/Config.in b/package/avro-c/Config.in
index 76d9123a4e..2789e12ad8 100644
--- a/package/avro-c/Config.in
+++ b/package/avro-c/Config.in
@@ -24,4 +24,4 @@ config BR2_PACKAGE_AVRO_C
 	  - Code generation as an optional optimization,
 	    only worth implementing for statically typed languages.
 
-	  http://avro.apache.org/
+	  https://avro.apache.org/
diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index 8c6b4b625c..9a53346cd1 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,3 @@
-# From https://downloads.apache.org/avro/avro-1.12.0/c/avro-c-1.12.0.tar.gz.sha512
-sha512  71f0a8b63e212a12d38c05ef0c8e17822af7eb38698e07550a15f49d3f976f015f31cd804784df76c16e6cf7129c0d1a5028cb78032ad0259b4d151dcf022099  avro-c-1.12.0.tar.gz
-
-# License files
+# Locally computed
+sha256  b64e31b94719499549622aa92f1d96d1742967ced261a0931b63be3bbe907f2c  avro-c-1.12.1.tar.gz
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index 0f1ada72f8..3e41716836 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update python-avro
-AVRO_C_VERSION = 1.12.0
+AVRO_C_VERSION = 1.12.1
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/Config.in b/package/python-avro/Config.in
index 1f67732ce0..6a76c60f2d 100644
--- a/package/python-avro/Config.in
+++ b/package/python-avro/Config.in
@@ -16,4 +16,4 @@ config BR2_PACKAGE_PYTHON_AVRO
 	  - Code generation as an optional optimization,
 	    only worth implementing for statically typed languages.
 
-	  http://avro.apache.org/
+	  https://avro.apache.org/
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index 3556692398..f7a241b14d 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/avro/json
-md5  03dbb66d68ad18a332a4f4bce0700ca9  avro-1.12.0.tar.gz
-sha256  cad9c53b23ceed699c7af6bddced42e2c572fd6b408c257a7d4fc4e8cf2e2d6b  avro-1.12.0.tar.gz
+md5  e2debe491ace30e479944ac4e8e832d9  avro-1.12.1.tar.gz
+sha256  c5b8dd2dd4c10816f0dc127cc29cfd43b5e405cf7e6840e89460a024bf3d098d  avro-1.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index e1cbea8971..f13ea9d2ca 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # When updating the version, please also update avro-c
-PYTHON_AVRO_VERSION = 1.12.0
+PYTHON_AVRO_VERSION = 1.12.1
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
-PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/e6/73/48668732bbc8ae1e79b237f84e761204c8dd266c5e16e7601000aba471d3
+PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/60/00/af1eec633637e12d0945a97f05a429eed83ac45865af60cb453db4689d95
 PYTHON_AVRO_LICENSE = Apache-2.0
 PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
 PYTHON_AVRO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
