Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE348C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 889B560E61;
	Mon, 10 Apr 2023 19:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 889B560E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItkDZofyDQ05; Mon, 10 Apr 2023 19:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F04C6FEC4;
	Mon, 10 Apr 2023 19:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F04C6FEC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 028E41C3BA6
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD51540930
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD51540930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnV8oYj0TPCi for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E38DE40376
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E38DE40376
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3BCA83DC7; Mon, 10 Apr 2023 19:37:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:03:49 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1bf2cdc30c04432a135ca7e81992743799d36127
X-Git-Newrev: 2bc49f4cb25678c2d941807c2dbfe2384a31c2b5
X-Patchwork-Hint: ignore
Message-Id: <20230410193722.D3BCA83DC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sudo: security
 bump to version 1.9.13p3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bc49f4cb25678c2d941807c2dbfe2384a31c2b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Fix CVE-2023-27320: Sudo before 1.9.13p3 has a double free in the
  per-command chroot feature.
- Update patch
- Update hash of LICENSE.md (year and indentation updated:
  https://github.com/sudo-project/sudo/commit/dd934d6a218c05d2df61b5306e38c71edaa6ac59
  https://github.com/sudo-project/sudo/commit/e5634ae99184d50afbdcb8a69dd4018b1a14871d)

https://www.sudo.ws/security/advisories/double_free
https://www.sudo.ws/releases/stable/#1.9.13p3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 556c32264c98f5696b523c3028d121adaed1e386)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-configure.ac-fix-openssl-static-build.patch | 42 +++++++++++-----------
 package/sudo/sudo.hash                             |  4 +--
 package/sudo/sudo.mk                               |  6 ++--
 3 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
index 32edd148a0..dc91af6119 100644
--- a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
+++ b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
@@ -1,6 +1,6 @@
-From 5cfc7e277d0b262a1d12e867c47a36301fb7edb7 Mon Sep 17 00:00:00 2001
+From 1fed5adc166d5f2190a6b6ad048ec2d803316327 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 22 Feb 2023 10:01:25 +0100
+Date: Wed, 22 Feb 2023 10:13:30 +0100
 Subject: [PATCH] configure.ac: fix openssl static build
 
 Do not use AX_APPEND_FLAG as it will break static builds by removing
@@ -24,26 +24,24 @@ Fixes:
  - http://autobuild.buildroot.org/results/8be59dd94e4916f9457cb435104e36e62a28373b
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/sudo-project/sudo/pull/244]
+[Retrieved from:
+https://github.com/sudo-project/sudo/commit/1fed5adc166d5f2190a6b6ad048ec2d803316327]
 ---
- configure.ac | 4 +++-
+ m4/openssl.m4 | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 8eccad7e4..523d8e56b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3082,7 +3082,9 @@ if test "${enable_openssl-no}" != no; then
- 		    SUDO_APPEND_LIBPATH([LIBTLS], [$f])
- 		    ;;
- 		*)
--		    AX_APPEND_FLAG([$f], [LIBTLS])
-+		    # Do not use AX_APPEND_FLAG as it will break static builds by removing
-+		    # duplicates such as -lz or -latomic which are needed by -lssl and -lcrypto
-+		    LIBTLS="$LIBTLS $f"
- 		    ;;
- 	    esac
- 	done
--- 
-2.39.0
-
+diff --git a/m4/openssl.m4 b/m4/openssl.m4
+index a2e4941ae8..b4cbd821db 100644
+--- a/m4/openssl.m4
++++ b/m4/openssl.m4
+@@ -44,7 +44,9 @@ AC_DEFUN([SUDO_CHECK_OPENSSL], [
+ 			SUDO_APPEND_LIBPATH([LIBTLS], [$f])
+ 			;;
+ 		    *)
+-			AX_APPEND_FLAG([$f], [LIBTLS])
++			# Do not use AX_APPEND_FLAG as it will break static builds by removing
++			# duplicates such as -lz or -latomic which are needed by -lssl and -lcrypto
++		        LIBTLS="$LIBTLS $f"
+ 			;;
+ 		esac
+ 	    done
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index c920b9fe74..720b21d849 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  b9a0b1ae0f1ddd9be7f3eafe70be05ee81f572f6f536632c44cd4101bb2a8539  sudo-1.9.12p2.tar.gz
+sha256  92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b  sudo-1.9.13p3.tar.gz
 # Locally calculated
-sha256  d2f93a3b17ed5586fddd07be33ad767146c1a81a22682baa68bb4360a31d020a  LICENSE.md
+sha256  ea33b3971e8e4d9657cd6794a952aaa71b22bd16745f1645455b6ead010e0a28  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 3b5c898917..e70e8bd31f 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.12
-SUDO_VERSION_MINOR = p2
+SUDO_VERSION_MAJOR = 1.9.13
+SUDO_VERSION_MINOR = p3
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
@@ -13,7 +13,7 @@ SUDO_LICENSE_FILES = LICENSE.md
 SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
 SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
 SUDO_SELINUX_MODULES = sudo
-# We're patching configure.ac
+# We're patching m4/openssl.m4
 SUDO_AUTORECONF = YES
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
