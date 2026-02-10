Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93427EB271F
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 22:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D67C060E03;
	Tue, 10 Feb 2026 22:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwkICsbuq0MK; Tue, 10 Feb 2026 22:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A204260B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770763844;
	bh=pPS3Oz6oMs/c6bo2R/Tl426a25E8dRq2Yky9iV3jI3E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GZdCoWh9fXJyvmAoDKdvUHlLzyMkALmRv7xBkgNofplxqUTYzhD2tKVUqSMzT6TBJ
	 5VnW1zbz5GAZ6t64ucAf45qo24GhYtf0FkmGMi4dWQenyiDqe99NSmG0DUfBCc2jkI
	 A8cOEQQa8DzJ8sjGIZBaymqrwrIFdbW45Sk2KHgT0Ox/a1z0codfg0v5Ha4vTtrVFl
	 mSU4J1/fFa+Xj3Fp7sTJ6I1jv7E6bakeOG3DgvoellLe0IiJlGAohU+YekUIjQ0EPm
	 O8UUx/z7CnvF6UL2cJAoRQb56EmwCiGCgRJidkIqVaFZO+1ButonkvvtYAt/vB0rFo
	 oQCm9OFSKQbeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A204260B89;
	Tue, 10 Feb 2026 22:50:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84AB0F2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6922E40ABE
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQL8O5ovr53o for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 22:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2618C408D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2618C408D3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:50:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05AAF84322; Tue, 10 Feb 2026 22:50:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 23:45:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80cbcfaeadd2474c71112b4dc9fb0673c9152519
X-Git-Newrev: 7eeb574f0ec86e372bcc8a551e8e9bb88b8d6555
X-Patchwork-Hint: ignore
Message-Id: <20260210225042.05AAF84322@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlsec1: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2281872181055605759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2281872181055605759==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7eeb574f0ec86e372bcc8a551e8e9bb88b8d6555
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Introduce the libxmlsec1 library package. libxmlsec implements XML
security standards.

The library has only a few mandatory dependencies(libxml2 and libxslt
and a crypto library).  It needs one of the following cryptographic
libraries: OpenSSL, NSS, or Gcrypt/GNUTLS. Default to openssl for now to
keep the package simple.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libxmlsec1/Config.in       | 13 +++++++++++++
 package/libxmlsec1/libxmlsec1.hash |  3 +++
 package/libxmlsec1/libxmlsec1.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 296b79f9e4..63744f3f14 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -155,6 +155,7 @@ N:	Alexey Lukyanchuk <skif@skif-web.ru>
 F:	package/zabbix/
 
 N: 	Alexis Lothoré <alexis.lothore@bootlin.com>
+F:	package/libxmlsec1/
 F: 	package/python-scp
 
 N:	Alistair Francis <alistair@alistair23.me>
diff --git a/package/Config.in b/package/Config.in
index 8346ef1a0e..93d15975cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1892,6 +1892,7 @@ menu "JSON/XML"
 	source "package/libxmlb/Config.in"
 	source "package/libxmlpp/Config.in"
 	source "package/libxmlrpc/Config.in"
+	source "package/libxmlsec1/Config.in"
 	source "package/libxslt/Config.in"
 	source "package/libyaml/Config.in"
 	source "package/mxml/Config.in"
diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
new file mode 100644
index 0000000000..155efac825
--- /dev/null
+++ b/package/libxmlsec1/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBXMLSEC1
+	bool "libxmlsec1"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	help
+	  XMLSec library provides C based implementation for major XML
+	  Security standards:
+	    - XML Signature Syntax and Processing
+	    - XML Encryption Syntax and Processing
+
+	  https://www.aleksey.com/xmlsec/
+	  https://github.com/lsh123/xmlsec
diff --git a/package/libxmlsec1/libxmlsec1.hash b/package/libxmlsec1/libxmlsec1.hash
new file mode 100644
index 0000000000..9e0e67e732
--- /dev/null
+++ b/package/libxmlsec1/libxmlsec1.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  a631c8cd7a6b86e6adb9f5b935d45a9cf9768b3cb090d461e8eb9d043cf9b62f  xmlsec1-1.3.9.tar.gz
+sha256  d5e9388534256360c6a009d4f19ab2b8d6ec0aa7ff32a51e22d899ed7beb5c48  Copyright
diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
new file mode 100644
index 0000000000..08f1f9eccd
--- /dev/null
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# libxmlsec1
+#
+################################################################################
+
+LIBXMLSEC1_VERSION = 1.3.9
+LIBXMLSEC1_SOURCE = xmlsec1-$(LIBXMLSEC1_VERSION).tar.gz
+LIBXMLSEC1_SITE = https://github.com/lsh123/xmlsec/releases/download/$(LIBXMLSEC1_VERSION)
+LIBXMLSEC1_LICENSE = MIT
+LIBXMLSEC1_LICENSE_FILES = Copyright
+LIBXMLSEC1_INSTALL_STAGING = YES
+LIBXMLSEC1_DEPENDENCIES = libxml2 libxslt openssl
+HOST_LIBXMLSEC1_DEPENDENCIES = host-libxml2 host-libxslt host-openssl
+LIBXMLSEC1_AUTORECONF = YES
+
+LIBXMLSEC1_CONF_OPTS = \
+	--enable-crypto-dl=no \
+	--with-openssl \
+	--without-gnutls \
+	--without-gcrypt \
+	--without-nss
+
+HOST_LIBXMLSEC1_CONF_OPTS = \
+	--enable-crypto-dl=no \
+	--with-openssl \
+	--without-gnutls \
+	--without-gcrypt \
+	--without-nss
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))

--===============2281872181055605759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2281872181055605759==--
