Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941FFCF319E
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 19:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D7C61122;
	Wed,  2 Oct 2024 19:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS8yZtVU2TCK; Wed,  2 Oct 2024 19:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C97C61125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C97C61125;
	Wed,  2 Oct 2024 19:26:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 358931BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24F9480A4A
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-sgGsriuoiX for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 19:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAA65809F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA65809F5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAA65809F5
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:26:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8BD18B0053D;
 Wed,  2 Oct 2024 21:26:33 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  2 Oct 2024 21:26:20 +0200
Message-ID: <20241002192621.14605-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727897196;
 bh=2OUoAU7Tso2HB0WwjeqwPCiRazXSxHJgccdYYK68z3Q=;
 h=From:To:Cc:Subject:Date:From;
 b=NVXjSqmj4+wY5V97a6AY8WZB0aOJileBLN9FG9m8xagZ2YebVl7rXY7HZ9stWShAW
 rC52vkbwg53LpuVqgRFnBWk9SKiekvJl7WNMFSMJNHXwbkGBVbU3qFAcUSmEfXYpJ2
 pay/tkBwD/v82wb4WCIEYrWgf38a5tUE3AZ0VMnJFMRdbGpuR5O1A65URiBjhnAnfb
 fmOlccRqtemPpaBimlkdnA5B7D/g2PO0AiMAbb6iIBPThjpGPyeaLndjwYImdWnZl2
 5c0cBpyyltzRXE7zQptD+guvTupVJQDxjsGgP0tWsQzcYUCPWoVbUXQpgoJKet/6jW
 TeRfVyx9t4MJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NVXjSqmj
Subject: [Buildroot] [PATCH 1/2] package/oath-toolkit: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OATH Toolkit provide components to build one-time password
authentication systems. It contains shared C libraries,
command line tools and a PAM module. Supported technologies
include the event-based HOTP algorithm (RFC 4226), the
time-based TOTP algorithm (RFC 6238), and Portable Symmetric
Key Container (PSKC, RFC 6030) to manage secret key
data. OATH stands for Open AuTHentication, which is the
organization that specify the algorithms.

https://www.nongnu.org/oath-toolkit/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/oath-toolkit/Config.in         | 27 +++++++++++++++++++
 package/oath-toolkit/oath-toolkit.hash | 13 ++++++++++
 package/oath-toolkit/oath-toolkit.mk   | 36 ++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/oath-toolkit/Config.in
 create mode 100644 package/oath-toolkit/oath-toolkit.hash
 create mode 100644 package/oath-toolkit/oath-toolkit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ea4ee3377f..505ca3f4ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1812,6 +1812,7 @@ F:	package/kexec/
 F:	package/libjxl/
 F:	package/libopenmpt/
 F:	package/mokutil/
+F:	package/oath-toolkit/
 F:	package/octave/
 F:	package/ola/
 F:	package/openblas/
diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0..ca5508fbfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1611,6 +1611,7 @@ menu "Crypto"
 	source "package/libxcrypt/Config.in"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
+	source "package/oath-toolkit/Config.in"
 	source "package/openssl/Config.in"
 	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
diff --git a/package/oath-toolkit/Config.in b/package/oath-toolkit/Config.in
new file mode 100644
index 0000000000..106fdf7457
--- /dev/null
+++ b/package/oath-toolkit/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_OATH_TOOLKIT
+	bool "oath-toolkit"
+	depends on BR2_USE_WCHAR
+	help
+	  OATH Toolkit provide components to build one-time password
+	  authentication systems. It contains shared C libraries,
+	  command line tools and a PAM module. Supported technologies
+	  include the event-based HOTP algorithm (RFC 4226), the
+	  time-based TOTP algorithm (RFC 6238), and Portable Symmetric
+	  Key Container (PSKC, RFC 6030) to manage secret key
+	  data. OATH stands for Open AuTHentication, which is the
+	  organization that specify the algorithms.
+
+	  https://www.nongnu.org/oath-toolkit/
+
+if BR2_PACKAGE_OATH_TOOLKIT
+
+config BR2_PACKAGE_OATH_TOOLKIT_PSKC
+	bool "enable PSCK"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Enable the Portable Symmetric Key Container (PSKC) support.
+
+endif
+
+comment "oath-toolkit needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/oath-toolkit/oath-toolkit.hash b/package/oath-toolkit/oath-toolkit.hash
new file mode 100644
index 0000000000..04282fa040
--- /dev/null
+++ b/package/oath-toolkit/oath-toolkit.hash
@@ -0,0 +1,13 @@
+# After checking pgp signature from:
+# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.11.tar.gz.sig
+# using key A3CC9C870B9D310ABAD4CF2F51722B08FE4745A2
+# From release announce:
+# https://mail.gnu.org/archive/html/oath-toolkit-help/2024-01/msg00004.html
+sha1  7e365d0fa892c4d1493585751adaec0ebd07d66e  oath-toolkit-2.6.11.tar.gz
+sha224  a6a91cfe8aa5498d032278aa4e759e39c9b87e04f68aed55a68c9efa  oath-toolkit-2.6.11.tar.gz
+# Locally calculated
+sha256  fc512a4a5b46f4c43ab0586c3189fece4d54f7e649397d6fa1e23428431e2cb4  oath-toolkit-2.6.11.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  liboath/COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  oathtool/COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  pam_oath/COPYING
diff --git a/package/oath-toolkit/oath-toolkit.mk b/package/oath-toolkit/oath-toolkit.mk
new file mode 100644
index 0000000000..9d4082a686
--- /dev/null
+++ b/package/oath-toolkit/oath-toolkit.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# oath-toolkit
+#
+################################################################################
+
+OATH_TOOLKIT_VERSION = 2.6.11
+OATH_TOOLKIT_SITE = https://download.savannah.nongnu.org/releases/oath-toolkit
+OATH_TOOLKIT_LICENSE = GPL-3.0+ (tools), LGPL-2.1+ (libraries)
+OATH_TOOLKIT_LICENSE_FILES = \
+	COPYING \
+	liboath/COPYING \
+	oathtool/COPYING \
+	pam_oath/COPYING
+OATH_TOOLKIT_CPE_ID_VENDOR = nongnu
+OATH_TOOLKIT_CPE_ID_PRODUCT = oath_toolkit
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+# Set the pam directory defined in linux-pam (see --enable-securedir
+# in LINUX_PAM_CONF_OPTS in package/linux-pam/linux-pam.mk).
+OATH_TOOLKIT_CONF_OPTS += \
+	--enable-pam \
+	--with-pam-dir=/lib/security
+OATH_TOOLKIT_DEPENDENCIES += linux-pam
+else
+OATH_TOOLKIT_CONF_OPTS += --disable-pam
+endif
+
+ifeq ($(BR2_PACKAGE_OATH_TOOLKIT_PSKC),y)
+OATH_TOOLKIT_CONF_OPTS += --enable-pskc
+OATH_TOOLKIT_DEPENDENCIES += libxml2
+else
+OATH_TOOLKIT_CONF_OPTS += --disable-pskc
+endif
+
+$(eval $(autotools-package))
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
