Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5427C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44D3181EB1;
	Tue, 21 Feb 2023 21:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D3181EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyKS916-E43S; Tue, 21 Feb 2023 21:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B67C81E9E;
	Tue, 21 Feb 2023 21:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B67C81E9E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E33FF1BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA5BE409B2
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA5BE409B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxXXW-Mnnjb4 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:25:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCA7C41859
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCA7C41859
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9C898669D; Tue, 21 Feb 2023 21:25:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 22:24:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7087e5286d8419f4625f5f6e52aa84567c6b7ed0
X-Git-Newrev: 0fd1f8a892a89d1b6d27b8e9884d645f71192813
X-Patchwork-Hint: ignore
Message-Id: <20230221212504.A9C898669D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openfpgaloader: bump
 to version 0.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fd1f8a892a89d1b6d27b8e9884d645f71192813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also adds libgpiod support.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openfpgaloader/Config.in           | 10 ++++++++++
 package/openfpgaloader/openfpgaloader.hash |  2 +-
 package/openfpgaloader/openfpgaloader.mk   |  9 ++++++++-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index 054278c256..4ba01d12d3 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -24,6 +24,16 @@ config BR2_PACAKGE_OPENFPGALOADER_CMSIS
 comment "openfpgaloader CMSIS-DAP needs udev /dev management and a toolchain w/ NPTL threads"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
+config BR2_PACKAGE_OPENFPGALOADER_LIBGPIOD
+	bool "libgpiod support"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8 # libgpiod
+	select BR2_PACKAGE_LIBGPIOD
+	help
+	  openfpgaloader libgpiod support
+
+comment "openfpgaloader libgpiod needs kernel headers >= 4.8"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 endif
 
 comment "openfpgaloader needs a toolchain w/ threads, C++, gcc >= 4.9"
diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
index 6c9d8a2b91..a8b537782c 100644
--- a/package/openfpgaloader/openfpgaloader.hash
+++ b/package/openfpgaloader/openfpgaloader.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a862a209d696becff915a77512e6a8c22f92d73480a45cc12273d9ad1db60d23  openfpgaloader-0.6.1.tar.gz
+sha256  966b4629df86b1d520ddd8a4e0a3fc00060b26b5ab4e172b596bd9d4659a196e  openfpgaloader-0.10.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 0c39aad687..042b16612e 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENFPGALOADER_VERSION = 0.6.1
+OPENFPGALOADER_VERSION = 0.10.0
 OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,v$(OPENFPGALOADER_VERSION))
 OPENFPGALOADER_LICENSE = Apache-2.0
 OPENFPGALOADER_LICENSE_FILES = LICENSE
@@ -24,4 +24,11 @@ else
 OPENFPGALOADER_CONF_OPTS += -DENABLE_CMSISDAP=OFF
 endif
 
+ifeq ($(BR2_PACAKGE_OPENFPGALOADER_LIBGPIOD),y)
+OPENFPGALOADER_DEPENDENCIES += libgpiod
+OPENFPGALOADER_CONF_OPTS += -DENABLE_LIBGPIOD=ON
+else
+OPENFPGALOADER_CONF_OPTS += -DENABLE_LIBGPIOD=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
