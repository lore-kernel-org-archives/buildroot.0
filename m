Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4702DC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC32583927;
	Mon, 20 Feb 2023 23:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC32583927
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nltdu3sXhgrG; Mon, 20 Feb 2023 23:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC86783139;
	Mon, 20 Feb 2023 23:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC86783139
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FB951BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 611CB41757
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 611CB41757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqLU_OGxcBLf for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 710D841750
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 710D841750
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6192F86495; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 08:52:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9d18ef6a0cbe81c01118f12c72eb99c09fce0994
X-Git-Newrev: a49f00010da29e904c07debea9fd1ab54f2f6c50
X-Patchwork-Hint: ignore
Message-Id: <20230220205237.6192F86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flashrom: bump to
 version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a49f00010da29e904c07debea9fd1ab54f2f6c50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch (already in version)

https://github.com/flashrom/flashrom/compare/v1.2...v1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Makefile-Fix-building-on-AArch64-NixOS.patch | 95 ----------------------
 package/flashrom/flashrom.hash                     |  4 +-
 package/flashrom/flashrom.mk                       |  2 +-
 3 files changed, 3 insertions(+), 98 deletions(-)

diff --git a/package/flashrom/0001-Makefile-Fix-building-on-AArch64-NixOS.patch b/package/flashrom/0001-Makefile-Fix-building-on-AArch64-NixOS.patch
deleted file mode 100644
index f835172e61..0000000000
--- a/package/flashrom/0001-Makefile-Fix-building-on-AArch64-NixOS.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From da6b3b70cb852dd8e9f9e21aef95fa83e7f7ab0d Mon Sep 17 00:00:00 2001
-From: Pyry Kontio <pyry.kontio@drasa.eu>
-Date: Mon, 6 Jul 2020 12:57:35 +0900
-Subject: [PATCH] Makefile: Fix building on AArch64 NixOS
-
-The parsing of the output of archtest.c produced an unexpected
-value on AArch64 NixOS. For example, the make variable ARCH was set to:
-
-```
-bit outside of fd_set selected
-arm
-```
-
-This made the arch and OS checks fail.
-
-This commit simplifies the parsing, making it more robust.
-
-The C files archtest.c, endiantest.c and os.h used to set the
-TARGET_OS, ARCH and ENDIAN variables, respectively, output
-the result of the test as the final line, so just extracting
-the final line and removing double quoting is enough.
-
-This commit also fixes a bug with debug_shell lacking escaping
-single quotes, which prevented using the single quote in the
-debug_shell calls. It used to work by accident before this fix;
-the line in the call happened to contain a balanced pair of double
-quotes and lacked other characters that needed escaping, which
-didn't break the debug_shell, but this was accidental and very
-brittle.
-
-Signed-off-by: Pyry Kontio <pyry.kontio@drasa.eu>
-Change-Id: Iaa4477a71e758cf9ecad2c22f3b77bc6508a3510
-Reviewed-on: https://review.coreboot.org/c/flashrom/+/43140
-Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
-Reviewed-by: Angel Pons <th3fanbus@gmail.com>
-
-[Retrieved from:
-https://github.com/flashrom/flashrom/commit/da6b3b70cb852dd8e9f9e21aef95fa83e7f7ab0d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index f3f7717e2..e475cbdbd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -83,7 +83,8 @@ dummy_for_make_3_80:=$(shell printf "Build started on %s\n\n" "$$(date)" >$(BUIL
- 
- # Provide an easy way to execute a command, print its output to stdout and capture any error message on stderr
- # in the build details file together with the original stdout output.
--debug_shell = $(shell export LC_ALL=C ; { echo 'exec: export LC_ALL=C ; { $(1) ; }' >&2;  { $(1) ; } | tee -a $(BUILD_DETAILS_FILE) ; echo >&2 ; } 2>>$(BUILD_DETAILS_FILE))
-+debug_shell = $(shell export LC_ALL=C ; { echo 'exec: export LC_ALL=C ; { $(subst ','\'',$(1)) ; }' >&2; \
-+    { $(1) ; } | tee -a $(BUILD_DETAILS_FILE) ; echo >&2 ; } 2>>$(BUILD_DETAILS_FILE))
- 
- ###############################################################################
- # General OS-specific settings.
-@@ -106,7 +107,8 @@ endif
- # IMPORTANT: The following line must be placed before TARGET_OS is ever used
- # (of course), but should come after any lines setting CC because the line
- # below uses CC itself.
--override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
-+override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null \
-+    | tail -1 | cut -f 2 -d'"'))
- 
- ifeq ($(TARGET_OS), Darwin)
- override CPPFLAGS += -I/opt/local/include -I/usr/local/include
-@@ -490,8 +492,10 @@ endif
- # IMPORTANT: The following line must be placed before ARCH is ever used
- # (of course), but should come after any lines setting CC because the line
- # below uses CC itself.
--override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
--override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null | grep -v '^\#'))
-+override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null \
-+    | tail -1 | cut -f 2 -d'"'))
-+override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null \
-+    | tail -1))
- 
- # Disable the internal programmer on unsupported architectures (everything but x86 and mipsel)
- ifneq ($(ARCH)-little, $(filter $(ARCH),x86 mips)-$(ENDIAN))
-@@ -1299,12 +1303,12 @@ compiler: featuresavailable
- 	@printf "Target arch is "
- 	@# FreeBSD wc will output extraneous whitespace.
- 	@echo $(ARCH)|wc -w|grep -q '^[[:blank:]]*1[[:blank:]]*$$' ||	\
--		( echo "unknown. Aborting."; exit 1)
-+		( echo "unknown (\"$(ARCH)\"). Aborting."; exit 1)
- 	@printf "%s\n" '$(ARCH)'
- 	@printf "Target OS is "
- 	@# FreeBSD wc will output extraneous whitespace.
- 	@echo $(TARGET_OS)|wc -w|grep -q '^[[:blank:]]*1[[:blank:]]*$$' ||	\
--		( echo "unknown. Aborting."; exit 1)
-+		( echo "unknown (\"$(TARGET_OS)\"). Aborting."; exit 1)
- 	@printf "%s\n" '$(TARGET_OS)'
- ifeq ($(TARGET_OS), libpayload)
- 	@$(CC) --version 2>&1 | grep -q coreboot || \
diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 97df4fe9a4..2ab463d93a 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,4 +1,4 @@
 # Locally computed after checking pgp signature
-# https://download.flashrom.org/releases/flashrom-v1.2.tar.bz2.asc
-sha256  e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b  flashrom-v1.2.tar.bz2
+# https://download.flashrom.org/releases/flashrom-v1.2.1.tar.bz2.asc
+sha256  89a7ff5beb08c89b8795bbd253a51b9453547a864c31793302296b56bbc56d65  flashrom-v1.2.1.tar.bz2
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 5554082bca..dd505987ed 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.2
+FLASHROM_VERSION = 1.2.1
 FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
