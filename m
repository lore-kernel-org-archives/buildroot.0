Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833DDC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 15:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5123B40147;
	Sun, 28 Apr 2024 15:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83YxNdRz79Q7; Sun, 28 Apr 2024 15:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4195940429
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4195940429;
	Sun, 28 Apr 2024 15:10:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3FA1BF8B4
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 15:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54DC1404C3
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 15:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vILN7yE-Ne_R for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 15:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D96C40147
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D96C40147
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 15:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8665B8618D; Sun, 28 Apr 2024 15:09:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 16:29:04 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: eece956d7a9a44745c51cdea967ace6c4aa85f43
X-Git-Newrev: ee27dfff40c4e9c6a084c1f64e7604a02ff3ff1c
X-Patchwork-Hint: ignore
Message-Id: <20240428150947.8665B8618D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mbedtls: security
 bump to version 2.28.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee27dfff40c4e9c6a084c1f64e7604a02ff3ff1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

- Use official tar.bz2 tarball
- Fix CVE-2024-28960

https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2024-03.md
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ea8f0d72b305913d3349c6ab6899f653d68d1820)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 3ec151a859..5466b0e7de 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.7:
-sha256  1df6073f0cf6a4e1953890bf5e0de2a8c7e6be50d6d6c69fa9fefcb1d14e981a  mbedtls-2.28.7.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.8:
+sha256  241c68402cef653e586be3ce28d57da24598eb0df13fcdea9d99bfce58717132  mbedtls-2.28.8.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index cdb4aef4f4..9757b8b080 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.7
-MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
+MBEDTLS_VERSION = 2.28.8
+MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
+MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
