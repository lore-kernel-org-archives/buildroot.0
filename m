Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72693EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C75860F23;
	Sat,  1 Jul 2023 14:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C75860F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OznEf8UlSL63; Sat,  1 Jul 2023 14:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56B8660ABE;
	Sat,  1 Jul 2023 14:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B8660ABE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD631BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E75A581423
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E75A581423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPDcQNW2fD_b for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:19:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 191558141B
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 191558141B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0555B85F56; Sat,  1 Jul 2023 14:19:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 16:16:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef46caffda82e23d1767247ad92891f4b5ccb9ac
X-Git-Newrev: 65e36d73f280d2f7cc109db5e77dfc6a5126612b
X-Patchwork-Hint: ignore
Message-Id: <20230701141931.0555B85F56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flac: bump version to 1.4.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1284717944130862131=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1284717944130862131==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=65e36d73f280d2f7cc109db5e77dfc6a5126612b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://xiph.org/flac/changelog.html

Updated license hash due to copyright year bump:
https://github.com/xiph/flac/commit/e00d9b881f3fb8a181699ada966e909ab6d689c0

Removed all PowerPC-related configure options, quoting changelog:
"All PowerPC-specific code has been removed, as it turned out those
 improvements didn’t actually improve anything"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flac/flac.hash | 4 ++--
 package/flac/flac.mk   | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index b993ebd759..0013a7485a 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,6 +1,6 @@
 # From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA256SUMS.txt
-sha256  e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5f57fcaa83eb5a8e4  flac-1.4.2.tar.xz
+sha256  6c58e69cd22348f441b861092b825e591d0b822e106de6eb0ee4d05d27205b70  flac-1.4.3.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
-sha256  6e58d3036f05e2a0d58af854c12a505ddbe75011d71a598a2170987f3b15408d  COPYING.Xiph
+sha256  12600ea1a7affcbf469bd0d8b2cd725e4167114a2ee834b88f5d2857bfd7ddbf  COPYING.Xiph
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 595c2379b0..ab06af826e 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.4.2
+FLAC_VERSION = 1.4.3
 FLAC_SITE = https://ftp.osuosl.org/pub/xiph/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
@@ -14,9 +14,7 @@ FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
 FLAC_CPE_ID_VENDOR = flac_project
 
 FLAC_CONF_OPTS = \
-	$(if $(BR2_POWERPC_CPU_HAS_ALTIVEC),--enable-altivec,--disable-altivec) \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
-	$(if $(BR2_POWERPC_CPU_HAS_VSX),--enable-vsx,--disable-vsx) \
 	--disable-stack-smash-protection
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)

--===============1284717944130862131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1284717944130862131==--
