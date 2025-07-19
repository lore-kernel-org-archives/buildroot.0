Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA8FC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 14:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E4060A5A;
	Sat, 19 Jul 2025 14:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUM4_0YX7RaR; Sat, 19 Jul 2025 14:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEED760A9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEED760A9B;
	Sat, 19 Jul 2025 14:28:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FCF4DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CBCF4041D
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4sks4cs7jem for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 14:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75113400DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75113400DD
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6451586453; Sat, 19 Jul 2025 14:28:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 16:19:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c312f149b5b92d068ad4adaa200d4f498a62220
X-Git-Newrev: d9d99eae4d735f80dc7fc30eda9dd10b36135095
X-Patchwork-Hint: ignore
Message-Id: <20250719142837.6451586453@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsniff-ng: bump to 0.6.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9d99eae4d735f80dc7fc30eda9dd10b36135095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://github.com/netsniff-ng/netsniff-ng/releases/tag/v0.6.9

Remove now upstreamed patch 0001-Detect-libpcap-dependencies-using-pkg-config.patch.
Fixes also: https://patchwork-proxy.ozlabs.org/project/buildroot/patch/20240829075015.39164-1-fede@evolware.org/

Signed-off-by: Federico Pellegrin <fede@evolware.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...ect-libpcap-dependencies-using-pkg-config.patch | 51 ----------------------
 package/netsniff-ng/netsniff-ng.hash               |  2 +-
 package/netsniff-ng/netsniff-ng.mk                 |  2 +-
 4 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b0c103ee4b..f74e107adc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -828,7 +828,6 @@ package/netplug/0002-add-missing-time-include.patch lib_patch.Upstream
 package/netplug/0003-remove-assert-fail.patch lib_patch.Upstream
 package/netplug/S29netplug Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/netplug/netplug-script Shellcheck lib_shellscript.ConsecutiveEmptyLines
-package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch lib_patch.Upstream
 package/netsnmp/S59snmpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/netsurf/0001-avoid-system-perl-dependencies.patch lib_patch.Upstream
 package/netsurf/0002-do-not-cross-compile-nsgenbind.patch lib_patch.Upstream
diff --git a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch b/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
deleted file mode 100644
index bbcbd2bfc3..0000000000
--- a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 194ec61843b9598ce90873c812b817c4b96e2e0d Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 2 Sep 2021 12:56:00 +0300
-Subject: [PATCH] Detect libpcap dependencies using pkg-config
-
-When building statically the link command line must include all
-dependencies of all libraries. libpcap can optionally depend on libnl.
-mausezahn can't build statically in this case.
-
-Use pkg-config in configure and in the link command to construct the
-library flags we need to link with libpcap.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
----
-Upstream status: commit 194ec61843b9598ce90873c812b817c4b96e2e0d
-
- configure          | 4 +++-
- mausezahn/Makefile | 2 +-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 510826a798f5..598ae2433a7a 100755
---- a/configure
-+++ b/configure
-@@ -588,7 +588,9 @@ int main(void)
- }
- EOF
- 
--	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c -lpcap >> config.log 2>&1
-+	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c \
-+		$($PKG_CONFIG --libs libpcap 2>> config.log) \
-+		>> config.log 2>&1
- 	if [ ! -x $TMPDIR/pcaptest ] ; then
- 		echo "[NO]"
- 		echo "CONFIG_LIBPCAP=0" >> Config
-diff --git a/mausezahn/Makefile b/mausezahn/Makefile
-index ca16b6579583..9544565355cc 100644
---- a/mausezahn/Makefile
-+++ b/mausezahn/Makefile
-@@ -1,6 +1,6 @@
- mausezahn-libs =	-lcli \
- 			-lnet \
--			-lpcap \
-+			$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs libpcap 2> /dev/null ) \
- 			-lrt \
- 			-lpthread \
- 			-lm
--- 
-2.33.0
-
diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index 40b015cb0d..e63963c6d7 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-sha256  77d17d4158faf1d93c7d922a1bd7f093a8b437bd658292c830708540e10894ba  netsniff-ng-0.6.8.tar.xz
+sha256  027840fa3c4e11abfe4fd0fffe9909c5c4ed1428d4b9397fb6d2f5ea69325918  netsniff-ng-0.6.9.tar.xz
 # Locally computed
 sha256  b353349ba51e0d4b59cf2f188f0c285296e154ce8c58954bc5e0dc0282a4db2d  README
 sha256  8f6d85366f3763557d6ddd0637988b9ba11edef354e3c9302fff4262a235c387  COPYING
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 2b5b19b27f..5e779f1cfb 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = 0.6.8
+NETSNIFF_NG_VERSION = 0.6.9
 NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
 NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
