Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9EBD10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4C740993;
	Sat, 26 Oct 2024 11:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uo6nAf9QH2h; Sat, 26 Oct 2024 11:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73DB14027E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73DB14027E;
	Sat, 26 Oct 2024 11:55:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17CFF2318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA954401DD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqnwjJifoHlm for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4358A401CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4358A401CC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:55:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B5F0839E9; Sat, 26 Oct 2024 11:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:53:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 954098b1423d3095112f49a6ac236ddb98236292
X-Git-Newrev: 7334d816976636f1e544711da08ba42cc77029f5
X-Patchwork-Hint: ignore
Message-Id: <20241026115532.3B5F0839E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oath-toolkit: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7334d816976636f1e544711da08ba42cc77029f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/oath-toolkit/Config.in         | 27 +++++++++++++++++++++++++
 package/oath-toolkit/oath-toolkit.hash | 12 +++++++++++
 package/oath-toolkit/oath-toolkit.mk   | 37 ++++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9afd19d406..d606caa179 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1798,6 +1798,7 @@ F:	package/kexec/
 F:	package/libjxl/
 F:	package/libopenmpt/
 F:	package/mokutil/
+F:	package/oath-toolkit/
 F:	package/octave/
 F:	package/ola/
 F:	package/openblas/
diff --git a/package/Config.in b/package/Config.in
index b43e11b806..fa010e231f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1612,6 +1612,7 @@ menu "Crypto"
 	source "package/libxcrypt/Config.in"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
+	source "package/oath-toolkit/Config.in"
 	source "package/openssl/Config.in"
 	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
diff --git a/package/oath-toolkit/Config.in b/package/oath-toolkit/Config.in
new file mode 100644
index 0000000000..f2d697a7c9
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
+	bool "enable PSKC"
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
index 0000000000..a89dd6bb94
--- /dev/null
+++ b/package/oath-toolkit/oath-toolkit.hash
@@ -0,0 +1,12 @@
+# After checking pgp signature from:
+# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.12.tar.gz.sig
+# using key A3CC9C870B9D310ABAD4CF2F51722B08FE4745A2
+# From release announce:
+# https://mail.gnu.org/archive/html/oath-toolkit-help/2024-10/msg00002.html
+sha1  0bfb6ad29d59628487c9e180c7a43f4ca301e4d1  oath-toolkit-2.6.12.tar.gz
+sha256  cafdf739b1ec4b276441c6aedae6411434bbd870071f66154b909cc6e2d9e8ba  oath-toolkit-2.6.12.tar.gz
+# Locally calculated
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  liboath/COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  oathtool/COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  pam_oath/COPYING
diff --git a/package/oath-toolkit/oath-toolkit.mk b/package/oath-toolkit/oath-toolkit.mk
new file mode 100644
index 0000000000..b36cd47053
--- /dev/null
+++ b/package/oath-toolkit/oath-toolkit.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# oath-toolkit
+#
+################################################################################
+
+OATH_TOOLKIT_VERSION = 2.6.12
+OATH_TOOLKIT_SITE = https://download.savannah.nongnu.org/releases/oath-toolkit
+OATH_TOOLKIT_LICENSE = GPL-3.0+ (tools), LGPL-2.1+ (libraries)
+OATH_TOOLKIT_LICENSE_FILES = \
+	COPYING \
+	liboath/COPYING \
+	oathtool/COPYING \
+	pam_oath/COPYING
+OATH_TOOLKIT_CPE_ID_VENDOR = nongnu
+OATH_TOOLKIT_CPE_ID_PRODUCT = oath_toolkit
+OATH_TOOLKIT_INSTALL_STAGING = YES
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
