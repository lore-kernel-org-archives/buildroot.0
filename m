Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0072BCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADEB360F01;
	Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I43NKXRCKF8n; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D62F260EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263342;
	bh=Lr0agBaiWFO77IVDRqOpc7lVbj/PWa4aGQKb5LXsEwA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IEGcozJ9YPy0nwWnDiE3LsoRaggxZq2qHxhK3qkotxGBcNXpxCSLWs66goQLpmhBw
	 Vr+LTvjhB6HlGX1BVIM9CkJkPmb7XWp3lKWhQCQwe7QQmLz2+yodLdse1Vfcrfluth
	 FUvo5ZKTIakGlIPWrArghUp22+ELYhYcqGFkgIBqqC9HiP8TFhiX1eqMsjrbtZqsSz
	 wwz++CtYeu8VwyArV9OswMLB9GrKzM+pl7QN/+sRq7ckesY8w7hNqZQc3GBh7ac6fA
	 gj6ksV+uDyxr+OHVsG8L+Qcj8rnedIN3utEvFS4RkRT5YOBuavr00cg0gz3IU+K06K
	 eF7NdeO8ozyXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62F260EF8;
	Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85084F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 772A260EF8
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1sjqOnJTLB1 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3130C60EF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3130C60EF3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1C04880E6; Fri, 12 Jun 2026 11:22:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:05:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a20dafe5c190a7d083de3c1a219f27aff7450ebb
X-Git-Newrev: 36067ebde25a1dfd4724d278baded0ae84a3faf0
X-Patchwork-Hint: ignore
Message-Id: <20260612112200.F1C04880E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/poppler: needs
 zlib
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36067ebde25a1dfd4724d278baded0ae84a3faf0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit cdd1c5ca55620a4bdd1574d41fc5538d50f7359a bumped the
package from version 22.12.0 to 25.10.0 but forgot to change zlib into
a mandatory dependency. This is necessary due to upstream commit
https://gitlab.freedesktop.org/poppler/poppler/-/commit/7d87c7d2c6ca4f814f87329534a17dbf30203313
since version 23.07.0.

Fixes:
https://autobuild.buildroot.net/results/85f/85fb6c2945101b8d4ee86dbc32700293e7b35a86/

CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:290 (message):
  Could NOT find ZLIB (missing: ZLIB_LIBRARY ZLIB_INCLUDE_DIR)
Call Stack (most recent call first):
  /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:654 (_FPHSA_FAILURE_MESSAGE)
  /usr/share/cmake/Modules/FindZLIB.cmake:242 (find_package_handle_standard_args)
  CMakeLists.txt:309 (find_package)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7a9486d7d6595d37b0a8c096408a51503a1d1f59)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/poppler/Config.in  | 1 +
 package/poppler/poppler.mk | 9 +--------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 21c4d86cf6..208126a327 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_POPPLER
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_ZLIB
 	help
 	  Poppler is a PDF rendering library based on the xpdf-3.0
 	  code base.
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 08214d38b4..535c2b7b10 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -7,7 +7,7 @@
 POPPLER_VERSION = 25.10.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = https://poppler.freedesktop.org
-POPPLER_DEPENDENCIES = fontconfig host-pkgconf
+POPPLER_DEPENDENCIES = fontconfig host-pkgconf zlib
 POPPLER_LICENSE = GPL-2.0+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_CPE_ID_VENDOR = freedesktop
@@ -95,13 +95,6 @@ else
 POPPLER_CONF_OPTS += -DENABLE_UTILS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-POPPLER_DEPENDENCIES += zlib
-POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=ON
-else
-POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 POPPLER_DEPENDENCIES += cairo
 POPPLER_CONF_OPTS += -DWITH_Cairo=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
