Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7ECD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B69B830FB;
	Tue, 13 Jan 2026 19:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdGTl_hZmVXv; Tue, 13 Jan 2026 19:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3BA083E4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333264;
	bh=Bb7fwXowjwvh1K+YZPMpGmBFYb9DtfupIIRWp2fiocc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LP7KrsjZXrJ2ToeXxOJWsk+AlyEhmr+ZIFVm7zHJEb3KvP5FGQRADswDixDluaIPq
	 fwxzPbSHnM/5OaMtS5H85g1WYudW2fmsrLhRPzeujsm8X4E3TeHhVlQ/hGfLtETz/t
	 aMOZo3qfKdOhTZouyvhcz2Y5jNwHMsv4bwYnnlV9ewfI6IBdRFGi5alnr29J7Kipy/
	 YZd2Ks3R8Tvsv63a+LmaGcTfgADO8+IZh5tcA8COmn7mrf9zrWDFbFFuumPj0SBWl1
	 W/60KA01GFY/XI7SdWV28LSZ5Bkej9p2xU5p+Tl9yVXOyAKeRBdMb1o84K2LfzJ4gZ
	 2ao/LYM3jj30g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BA083E4A;
	Tue, 13 Jan 2026 19:41:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5581A231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FA58406EE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tx4PYFMfWZ9 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 430B8406DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 430B8406DE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4192A86A2D; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:19:25 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a82e419c3dd25355593180264e5dd998868964fb
X-Git-Newrev: 463ee61b0f47f53472790363d284bce94f774b49
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.4192A86A2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libdnet: drop
 support for Python module
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

commit: https://git.buildroot.net/buildroot/commit/?id=463ee61b0f47f53472790363d284bce94f774b49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The libdnet Python module no longer builds with Python >= 3.13. The
issue has been reported upstream on August 17, 2025, and there has
been no feedback:

  https://github.com/ofalk/libdnet/issues/114

Until this gets resolved, we have no choice but to drop support for
the Python module of this package.

Fixes:

  https://autobuild.buildroot.net/results/4df6bcaa66d79efac3619a47b08f3cb02c13e276/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit acba4b0fef41fcb8ffe36fd778d74a1b12156f0e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy           |  7 +++++++
 package/libdnet/Config.in  | 24 ------------------------
 package/libdnet/libdnet.mk | 11 ++---------
 3 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f53fb149bf..85c6a68527 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11.1"
 
+config BR2_PACKAGE_LIBDNET_PYTHON
+	bool "libdnet python module removed"
+	select BR2_LEGACY
+	help
+	  The libdnet Python module is no longer compatible with
+	  Python >= 3.13, so it had to be removed.
+
 config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
 	bool "opencv3 ffmpeg support removed"
 	select BR2_LEGACY
diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
index 473e8aea22..9fd6a85c36 100644
--- a/package/libdnet/Config.in
+++ b/package/libdnet/Config.in
@@ -5,27 +5,3 @@ config BR2_PACKAGE_LIBDNET
 	  routines.
 
 	  http://libdnet.sourceforge.net/
-
-if BR2_PACKAGE_LIBDNET
-
-config BR2_PACKAGE_LIBDNET_PYTHON
-	bool "libdnet python module"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_STATIC_LIBS # libbsd
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
-	depends on BR2_USE_WCHAR # libbsd
-	select BR2_PACKAGE_LIBBSD
-	help
-	  dnet module for python
-
-comment "dnet module for python requires python3 package"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_PYTHON3
-
-comment "dnet module for python needs a toolchain w/ dynamic library, threads, wchar"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR
-
-endif
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 8eebd1050d..12491a93bf 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -12,18 +12,11 @@ LIBDNET_INSTALL_STAGING = YES
 LIBDNET_AUTORECONF = YES
 LIBDNET_CONF_OPTS = \
 	--with-gnu-ld \
-	--with-check=no
+	--with-check=no \
+	--without-python
 LIBDNET_CONFIG_SCRIPTS = dnet-config
 LIBDNET_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
-LIBDNET_DEPENDENCIES += libbsd host-python-cython python3
-LIBDNET_CONF_OPTS += --with-python=$(HOST_DIR)/bin
-LIBDNET_MAKE_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
-LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
-LIBDNET_INSTALL_STAGING_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
-endif
-
 # Needed for autoreconf to work properly
 define LIBDNET_FIXUP_ACINCLUDE_M4
 	ln -sf config/acinclude.m4 $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
