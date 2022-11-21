Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FFBC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09D7342D27;
	Mon, 20 Feb 2023 21:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D7342D27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXzepmuFhAW6; Mon, 20 Feb 2023 21:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80EB041703;
	Mon, 20 Feb 2023 21:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80EB041703
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19F9B1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5045741597
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5045741597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nR4w8LU__I1L for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7318A4158C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7318A4158C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70EC686494; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 22:51:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 124fc473dd9298facc6f9fd58dd59a706550e29b
X-Git-Newrev: 08a013d25a09d07a3e7a89b1afbb20da206a383d
X-Patchwork-Hint: ignore
Message-Id: <20230220205152.70EC686494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8189es: bump to
 latest version to fix build failure with Linux >= 6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=08a013d25a09d07a3e7a89b1afbb20da206a383d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop local patch that has been upstreamed[0] and drop the endianness
handling too since from this commit[1] on it's handled by using Linux
macro __LITTLE_ENDIAN.

[0]: https://github.com/jwrdegoede/rtl8189ES_linux/commit/4a555ffb77a5947814b6c7f330968318e265c496
[1]: https://github.com/jwrdegoede/rtl8189ES_linux/commit/b3da33576da5359d85c7cfe82716c9a08a592aff

Fixes:
http://autobuild.buildroot.net/results/6178fbfbe9fe762645b1907c4ceb032a00e75a89/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ve-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 ----------------------
 package/rtl8189es/rtl8189es.hash                   |  2 +-
 package/rtl8189es/rtl8189es.mk                     | 10 ++----
 3 files changed, 3 insertions(+), 49 deletions(-)

diff --git a/package/rtl8189es/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189es/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
deleted file mode 100644
index dc4deff9f1..0000000000
--- a/package/rtl8189es/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4a555ffb77a5947814b6c7f330968318e265c496 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Sep 2022 21:17:17 +0200
-Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
- end of EXTRA_FLAGS assignment
-
-At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
-since it's assigned at the beginning of the Makefile. For example it's not
-possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
-allow to build these modules for big endian architectures. So let's move
-the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
-EXTRA_CFLAGS assignment.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Upstream status: https://github.com/jwrdegoede/rtl8189ES_linux/pull/83]
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 8fcb7bd..e4664e9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,3 @@
--EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
- EXTRA_CFLAGS += -O1
- #EXTRA_CFLAGS += -O3
- #EXTRA_CFLAGS += -Wall
-@@ -2239,6 +2238,8 @@ ifneq ($(USER_MODULE_NAME),)
- MODULE_NAME := $(USER_MODULE_NAME)
- endif
- 
-+EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
-+
- ifneq ($(KERNELRELEASE),)
- 
- ########### this part for *.mk ############################
--- 
-2.34.1
-
diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index d897e5e6c2..44d73e60f0 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  74325014c1a8503b3a7e48ad06997baddad8c1dae86bb79f4368532cc3e75fb2  rtl8189es-39c17661136da48f8e9c644194dce6a7f5076896.tar.gz
+sha256  96347dbfedd95a217fb89b7b295fe417b711dbad3db896ef0c2fa733c6d150fd  rtl8189es-e58bd86c9d9408c648b1246a0dd76b16856ec172.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index cddcb195f9..6acc409e73 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,20 +4,14 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = 39c17661136da48f8e9c644194dce6a7f5076896
+RTL8189ES_VERSION = e58bd86c9d9408c648b1246a0dd76b16856ec172
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
-RTL8189ES_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
-# Set endianness
-RTL8189ES_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
-
 RTL8189ES_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189ES=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR) \
-	USER_EXTRA_CFLAGS="$(RTL8189ES_USER_EXTRA_CLAGS)"
+	KSRC=$(LINUX_DIR)
 
 define RTL8189ES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
