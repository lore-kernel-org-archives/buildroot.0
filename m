Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D9EC83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4229883DB5;
	Fri, 11 Jul 2025 10:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOZ7JJG5ncF5; Fri, 11 Jul 2025 10:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F079E83C1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F079E83C1C;
	Fri, 11 Jul 2025 10:10:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6D67114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63E9F403E4
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0r0KIf_oFEU for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81D8A40C7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81D8A40C7B
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BD9A86330; Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:22:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 220bfdd747c652506159dadad11f353e658ce61f
X-Git-Newrev: 10a2f91394a064e3bb3bbc866570b5efb2a6d4a8
X-Patchwork-Hint: ignore
Message-Id: <20250711100952.7BD9A86330@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libolm: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=10a2f91394a064e3bb3bbc866570b5efb2a6d4a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Upstream has explicitely stated that libolm is now deprecated.
Since no other package depend on libolm, we can easily remove it from
Buildroot. If any user is interested in this feature, we can add its
successor: vodozemac.

More information here:
https://gitlab.matrix.org/matrix-org/olm#important-libolm-is-now-deprecated

Also, there is CVE reported on this latest 3.2.16 version declared
as no longer maintained. See:
https://www.cve.org/CVERecord?id=CVE-2024-45191
https://www.cve.org/CVERecord?id=CVE-2024-45192
https://www.cve.org/CVERecord?id=CVE-2024-45193

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add a note about CVE reported on this package]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit edf08553ddf1345341743b02d767978c941bda0e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy           |  7 +++++++
 DEVELOPERS                 |  1 -
 package/Config.in          |  1 -
 package/libolm/Config.in   | 12 ------------
 package/libolm/libolm.hash |  3 ---
 package/libolm/libolm.mk   | 18 ------------------
 6 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2aa1b31df6..5092cbf32c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02.5"
 
+config BR2_PACKAGE_LIBOLM
+	bool "libolm has been removed"
+	select BR2_LEGACY
+	help
+	  libolm is deprecated and has been removed from Buildroot.
+	  https://gitlab.matrix.org/matrix-org/olm#important-libolm-is-now-deprecated
+
 config BR2_PACKAGE_MBEDTLS_COMPRESSION
 	bool "mbedtls compression support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index a35e297637..fd683db4a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1248,7 +1248,6 @@ F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
 F:	package/libeXosip2/
-F:	package/libolm/
 F:	package/libosip2/
 F:	package/ocrad/
 F:	package/opencl-clhpp/
diff --git a/package/Config.in b/package/Config.in
index 9157c00c9c..dda6722d7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1608,7 +1608,6 @@ menu "Crypto"
 	source "package/libmd/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
-	source "package/libolm/Config.in"
 	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
diff --git a/package/libolm/Config.in b/package/libolm/Config.in
deleted file mode 100644
index a863216d5c..0000000000
--- a/package/libolm/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_LIBOLM
-	bool "libolm"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	help
-	  libolm is an implementation of the Double Ratchet
-	  cryptographic ratchet in C++
-
-	  https://gitlab.matrix.org/matrix-org/olm
-
-comment "libolm needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
deleted file mode 100644
index a95115d2fe..0000000000
--- a/package/libolm/libolm.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  1e90f9891009965fd064be747616da46b232086fe270b77605ec9bda34272a68  olm-3.2.16.tar.gz
-sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
deleted file mode 100644
index 5c8bcd1f59..0000000000
--- a/package/libolm/libolm.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# libolm
-#
-################################################################################
-
-LIBOLM_VERSION = 3.2.16
-LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
-LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
-LIBOLM_LICENSE = Apache-2.0
-LIBOLM_LICENSE_FILES = LICENSE
-LIBOLM_CPE_ID_VENDOR = matrix
-LIBOLM_CPE_ID_PRODUCT = olm
-LIBOLM_INSTALL_STAGING = YES
-
-LIBOLM_CONF_OPTS = -DOLM_TESTS=OFF
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
