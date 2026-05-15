Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9A4CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 14:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6112B4170A;
	Fri, 15 May 2026 14:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C57O4bTtLdxm; Fri, 15 May 2026 14:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 484C241444
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778854290;
	bh=lkrjzaOCJj4uAfc8H92hyO/Op9QAA80WXTdjlCx8ujo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OrtGPS83kRG0OcLhVEvGIcLDZvFZ6IshJiJ/Zd8MYRt92wDE0TIu+lTK28F9itz1i
	 4A/9Hotcs/Z6UPWa10EADdvjJI1MqZcOThFeR+d7CgoKtgE08IqI2WFV1iznHdlqkV
	 /2HcvDW0LZRXYwYYLiM7q/Xp2xE72lVq/QFcek/epJ6kfl+1eMqjX/e5cLrYTLrftd
	 Ph0hty9y9FqoWlSEWpdjIdVQiUcJ/YZgtMQG6X4Aegu3CiKvdCEG8r9C3Nk7EbaGc2
	 nX6UAqsXV2VokpZSAXixRkdsjl4o2H2JbZwgfS/XIr95zy5WhN1TOJrcnI11waVg+0
	 yn+427D/kGg/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 484C241444;
	Fri, 15 May 2026 14:11:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 599F636E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F33E40E49
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqhJLHY4FtvO for <buildroot@buildroot.org>;
 Fri, 15 May 2026 14:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE52740E24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE52740E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38DE186369; Fri, 15 May 2026 14:11:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:42:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: aec1220dc18ed70ae2fe10e07f14538be09b4525
X-Git-Newrev: f516703f3b9a524e05cd91054ace7100e0d84b25
X-Patchwork-Hint: ignore
Message-Id: <20260515141122.38DE186369@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libxmlsec1: new
 package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f516703f3b9a524e05cd91054ace7100e0d84b25
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Added from Buildroot master.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/Config.in                  |  1 +
 package/libxmlsec1/Config.in       | 12 +++++++++++
 package/libxmlsec1/libxmlsec1.hash |  3 +++
 package/libxmlsec1/libxmlsec1.mk   | 42 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 38da39033b..64225c03c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1910,6 +1910,7 @@ menu "JSON/XML"
 	source "package/libxmlb/Config.in"
 	source "package/libxmlpp/Config.in"
 	source "package/libxmlrpc/Config.in"
+	source "package/libxmlsec1/Config.in"
 	source "package/libxslt/Config.in"
 	source "package/libyaml/Config.in"
 	source "package/mxml/Config.in"
diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
new file mode 100644
index 0000000000..4a686853ae
--- /dev/null
+++ b/package/libxmlsec1/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBXMLSEC1
+	bool "libxmlsec1"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBXML2
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
index 0000000000..29222bc16f
--- /dev/null
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -0,0 +1,42 @@
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
+LIBXMLSEC1_DEPENDENCIES = libxml2 openssl
+HOST_LIBXMLSEC1_DEPENDENCIES = host-libxml2 host-openssl
+LIBXMLSEC1_AUTORECONF = YES
+
+LIBXMLSEC1_CONF_OPTS = \
+	--enable-crypto-dl=no \
+	--with-openssl \
+	--without-gnutls \
+	--without-gcrypt \
+	--without-nss \
+	--disable-des
+
+HOST_LIBXMLSEC1_CONF_OPTS = \
+	--enable-crypto-dl=no \
+	--with-openssl \
+	--without-gnutls \
+	--without-gcrypt \
+	--without-nss \
+	--without-libxslt \
+	--disable-des
+
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+LIBXMLSEC1_DEPENDENCIES += libxslt
+LIBXMLSEC1_CONF_OPTS += --with-libxslt
+else
+LIBXMLSEC1_CONF_OPTS += --without-libxslt
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
