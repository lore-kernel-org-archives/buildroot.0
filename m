Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A23C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4593C40238;
	Sun, 12 Mar 2023 21:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4593C40238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFUhTuoxGlhr; Sun, 12 Mar 2023 21:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B72E41BBC;
	Sun, 12 Mar 2023 21:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B72E41BBC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 433F01BF863
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6933A60E32
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6933A60E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysTk7dJZlTd2 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8928560E1B
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8928560E1B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8757A87006; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 12:22:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cc92e463771f5542d796a73ff7aadce8cf09b0f
X-Git-Newrev: c4cad5405fdd5def2d713a0bd14dc3c29b7bfb36
X-Patchwork-Hint: ignore
Message-Id: <20230312214624.8757A87006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unrar: bump to version 6.2.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4cad5405fdd5def2d713a0bd14dc3c29b7bfb36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Uptream does not provide a change log.

The package now needs a C++11 compiler. For example, the source file
"blake2s.hpp" is using the "constexpr" keyword.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unrar/Config.in  | 4 +++-
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/unrar/Config.in b/package/unrar/Config.in
index 29696c35aa..8a3def699b 100644
--- a/package/unrar/Config.in
+++ b/package/unrar/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_UNRAR
 	bool "unrar"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
@@ -8,6 +9,7 @@ config BR2_PACKAGE_UNRAR
 
 	  http://www.rarlab.com/rar_add.htm
 
-comment "unrar needs a toolchain w/ C++, wchar, threads"
+comment "unrar needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 40e05a1a32..bc8f986875 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  de75b6136958173fdfc530d38a0145b72342cf0d3842bf7bb120d336602d88ed  unrarsrc-6.1.7.tar.gz
+sha256  0c2d4cbc8b34d0e3bec7b474e0f52bbcc6c4320ec089b4141223ee355f63c318  unrarsrc-6.2.6.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index fee9fb753b..f59d199558 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.1.7
+UNRAR_VERSION = 6.2.6
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
@@ -13,7 +13,7 @@ UNRAR_CPE_ID_VENDOR = rarlab
 
 define UNRAR_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
-		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread" \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread -std=c++11" \
 		LDFLAGS="$(TARGET_LDFLAGS) -pthread" -C $(@D)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
