Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92295C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20C614013F;
	Tue, 26 Jul 2022 20:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20C614013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8vMoWKPp5RB; Tue, 26 Jul 2022 20:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CA9C40116;
	Tue, 26 Jul 2022 20:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA9C40116
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 869171BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C84618176D
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C84618176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVkSp078SA_9 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0258A812EA
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0258A812EA
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6E4DA86025; Tue, 26 Jul 2022 20:41:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:54:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e315b0cad9b04105b5184e0a2d086c96f4b24c0
X-Git-Newrev: 39c08b2aa165040b3d29a2ebca2856d3429a9aa8
X-Patchwork-Hint: ignore
Message-Id: <20220726204126.6E4DA86025@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/double-conversion: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39c08b2aa165040b3d29a2ebca2856d3429a9aa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both the target and host variants of this package will be needed by
qt6base.

Our reading of double-conversion/utils.h in the code base seems to
show that all architectures currently supported in Buildroot (to the
exception of csky, which we intend to remove, and is anyway not
usable/testable today) are supported by double-conversion.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                       |  2 ++
 package/Config.in                                |  1 +
 package/double-conversion/Config.in              | 11 +++++++++++
 package/double-conversion/double-conversion.hash |  3 +++
 package/double-conversion/double-conversion.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4869df8bb8..23091322fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2327,6 +2327,7 @@ F:	package/bcm2835/
 F:	package/ddrescue/
 F:	package/dejavu/
 F:	package/dillo/
+F:	package/double-conversion/
 F:	package/edid-decode/
 F:	package/ell/
 F:	package/ghostscript-fonts/
@@ -2838,6 +2839,7 @@ F:	package/cloop/
 F:	package/cmake/
 F:	package/cramfs/
 F:	package/dmidecode/
+F:	package/double-conversion/
 F:	package/flashrom/
 F:	package/gcc/
 F:	package/genext2fs/
diff --git a/package/Config.in b/package/Config.in
index d78c24fd9e..ab108f679f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1953,6 +1953,7 @@ menu "Other"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
+	source "package/double-conversion/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
diff --git a/package/double-conversion/Config.in b/package/double-conversion/Config.in
new file mode 100644
index 0000000000..b858b56c27
--- /dev/null
+++ b/package/double-conversion/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DOUBLE_CONVERSION
+	bool "double-conversion"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Provides binary-decimal and decimal-binary routines for
+	  IEEE doubles.
+
+	  https://github.com/google/double-conversion
+
+comment "double-conversion needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
new file mode 100644
index 0000000000..8124ec2f82
--- /dev/null
+++ b/package/double-conversion/double-conversion.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  3dbcdf186ad092a8b71228a5962009b5c96abde9a315257a3452eb988414ea3b  double-conversion-3.2.0.tar.gz
+sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
new file mode 100644
index 0000000000..ae46fa06fe
--- /dev/null
+++ b/package/double-conversion/double-conversion.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# double-conversion
+#
+################################################################################
+
+DOUBLE_CONVERSION_VERSION = 3.2.0
+DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
+DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
+DOUBLE_CONVERSION_LICENSE_FILES = COPYING
+DOUBLE_CONVERSION_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
