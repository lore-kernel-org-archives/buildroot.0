Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B121DCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F17481EB1;
	Mon,  1 Apr 2024 12:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQbUb0oWgvgW; Mon,  1 Apr 2024 12:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8307781EC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8307781EC4;
	Mon,  1 Apr 2024 12:28:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E84541BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E218881EC4
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omf9aJFQI6yb for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:28:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D7C281EB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D7C281EB1
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 12:28:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21202844E2; Mon,  1 Apr 2024 12:28:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 14:26:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff8f48055fb14a64b4d815fea04b75e4674fd3d2
X-Git-Newrev: ea8f0d72b305913d3349c6ab6899f653d68d1820
X-Patchwork-Hint: ignore
Message-Id: <20240401122820.21202844E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: security bump to version
 2.28.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea8f0d72b305913d3349c6ab6899f653d68d1820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tar.bz2 tarball
- Fix CVE-2024-28960

https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2024-03.md
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
