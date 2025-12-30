Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201B2EE49B4
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE2B606CB;
	Tue, 30 Dec 2025 21:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctcFEAJgDk2w; Tue, 30 Dec 2025 21:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA50606CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767131779;
	bh=WCS7ak2z/L8mg7LKcb5xV3+Tg1hg4EBYK3P0ICghMwE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M6zZQSF473/Zt/Ru2FnVY4AqTsFGNU4RpLoV1hviYwkR9BsHa2eELPPdf1KnDnUvd
	 1I59FAncPHG2DF2jJizPBjidNToT5pKVp0wv9fCTLBA7vujnLzkmzIA6z7WoHnocCg
	 LSqPS9mdOU/8sDvEFLpIovPkrnK5SnxYMS+1pHAnhwdmAgJpzPKpxn26FALFAh1j14
	 k7NByNolXfhVaNmwNfo+sqbkDjXDDt20zf5lmvY8IvLf/Z7/ruDOYnbVIiHFyrPvGe
	 bA6spQuY6kxvfAbOEV8eywMkBBHMChOZ8nOj1+mgGwndzTxPaWMN1nQIMp8N0Epb1a
	 RhjnEdki++a7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA50606CE;
	Tue, 30 Dec 2025 21:56:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94387177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 861F980CD6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J607fgYRZHQW for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A0580C8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6A0580C8A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:56:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6268874A9; Tue, 30 Dec 2025 21:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 22:52:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3c02bca133ef6ca4f8a9abacebd1ed1580f471d
X-Git-Newrev: acba4b0fef41fcb8ffe36fd778d74a1b12156f0e
X-Patchwork-Hint: ignore
Message-Id: <20251230215617.A6268874A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdnet: drop support for Python
 module
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=acba4b0fef41fcb8ffe36fd778d74a1b12156f0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 Config.in.legacy           |  7 +++++++
 package/libdnet/Config.in  | 24 ------------------------
 package/libdnet/libdnet.mk | 11 ++---------
 3 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 258fc30968..cd5c7ed2a1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBDNET_PYTHON
+	bool "libdnet python module removed"
+	select BR2_LEGACY
+	help
+	  The libdnet Python module is no longer compatible with
+	  Python >= 3.13, so it had to be removed.
+
 config BR2_PACKAGE_LIBFREEIMAGE
 	bool "libfreeimage"
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
