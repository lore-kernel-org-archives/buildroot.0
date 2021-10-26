Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567FFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253F060C40
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 253F060C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBFC460ADC;
	Tue, 26 Oct 2021 20:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLhOxU2fFaq4; Tue, 26 Oct 2021 20:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C13607AE;
	Tue, 26 Oct 2021 20:02:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 563CA1BF20D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B72D9400ED
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ttRQTNg0W_L6 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 20:02:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCB9440406
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:02:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D237988F3D; Tue, 26 Oct 2021 19:58:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:59:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15a7be2c121c73f99dd699b108d817593dc86f7e
X-Git-Newrev: 53873b6daecd2a97740833cae7c5b4cdb185a6b2
X-Patchwork-Hint: ignore
Message-Id: <20211026195844.D237988F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softhsm2: new package
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5703224037037328046=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5703224037037328046==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=53873b6daecd2a97740833cae7c5b4cdb185a6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch adds a package for softhsm2.

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/softhsm2/Config.in     | 18 ++++++++++++++++++
 package/softhsm2/softhsm2.hash |  4 ++++
 package/softhsm2/softhsm2.mk   | 15 +++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 771519fd9b..82577d4a95 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1443,6 +1443,9 @@ N:	José Luis Salvador Rufo <salvador.joseluis@gmail.com>
 F:	package/zfs/
 F:	support/testing/tests/package/test_zfs.py
 
+N:	José Pekkarinen <jose.pekkarinen@unikie.com>
+F:	package/softhsm2/
+
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
diff --git a/package/Config.in b/package/Config.in
index d40eb9dabc..56276df55c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2021,6 +2021,7 @@ menu "Security"
 	source "package/libsemanage/Config.in"
 	source "package/libsepol/Config.in"
 	source "package/safeclib/Config.in"
+	source "package/softhsm2/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
new file mode 100644
index 0000000000..5d84997c07
--- /dev/null
+++ b/package/softhsm2/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_SOFTHSM2
+	bool "softhsm2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  SoftHSM is an implementation of a cryptographic store
+	  accessible through a PKCS#11 interface. You can use it
+	  to explore PKCS#11 without having a Hardware Security
+	  Module.
+
+	  https://www.opendnssec.org/softhsm
+
+comment "sofhsm2 needs a toolchain w/ C++, gcc >= 4.8 and dynamic library support"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/softhsm2/softhsm2.hash b/package/softhsm2/softhsm2.hash
new file mode 100644
index 0000000000..f59f0bf028
--- /dev/null
+++ b/package/softhsm2/softhsm2.hash
@@ -0,0 +1,4 @@
+# From https://www.opendnssec.org/2020/04/1602/
+sha256  61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2  softhsm-2.6.1.tar.gz
+# Locally computed
+sha256  230cab7102816e99f7ce03ef476352fcad09d742fcbc6580d44393db6280b64c  LICENSE
diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
new file mode 100644
index 0000000000..c418e3648e
--- /dev/null
+++ b/package/softhsm2/softhsm2.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# softhsm2
+#
+################################################################################
+
+SOFTHSM2_VERSION = 2.6.1
+SOFTHSM2_SOURCE = softhsm-$(SOFTHSM2_VERSION).tar.gz
+SOFTHSM2_SITE = https://dist.opendnssec.org/source
+SOFTHSM2_LICENSE = BSD-2-Clause
+SOFTHSM2_LICENSE_FILES = LICENSE
+SOFTHSM2_DEPENDENCIES = openssl
+SOFTHSM2_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))

--===============5703224037037328046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5703224037037328046==--
