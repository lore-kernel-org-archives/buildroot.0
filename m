Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A3DC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:48:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D186B610A0
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D186B610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D132404AB;
	Thu, 19 Aug 2021 20:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7-AeWFrOoQo; Thu, 19 Aug 2021 20:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C41DD42513;
	Thu, 19 Aug 2021 20:48:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B25D51BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF6181A47
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-LFakefcUsX for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:48:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2F9A818A1
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:48:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8F7BE8D5C3; Thu, 19 Aug 2021 20:47:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:48:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75b02d6f3d2ce2478ffd41a856b24dde353583b5
X-Git-Newrev: d19077677fc71fc8c8cd73945606f773d907a99a
X-Patchwork-Hint: ignore
Message-Id: <20210819204735.8F7BE8D5C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sentry-cli: remove package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d19077677fc71fc8c8cd73945606f773d907a99a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package has had build failures for a very long time, and these
issues have not been fixed, and it is now the number 1 build failure
reason in our autobuilders. It is time to acknowledge that the package
needs to be removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                         |  1 -
 package/Config.in.host             |  1 -
 package/sentry-cli/Config.in.host  | 10 ----------
 package/sentry-cli/sentry-cli.hash |  3 ---
 package/sentry-cli/sentry-cli.mk   | 32 --------------------------------
 5 files changed, 47 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5f90dbfc1f..7d2fbf4cf3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1444,7 +1444,6 @@ F:	package/python-schedule/
 F:	package/python-sentry-sdk/
 F:	package/python-websockets/
 F:	package/python-xlib/
-F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 8d443ea255..551352482e 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -79,7 +79,6 @@ menu "Host utilities"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
-	source "package/sentry-cli/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
deleted file mode 100644
index 3124015367..0000000000
--- a/package/sentry-cli/Config.in.host
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_HOST_SENTRY_CLI
-	bool "host sentry-cli"
-	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
-	select BR2_PACKAGE_HOST_RUSTC
-	help
-	  Official Sentry command line interface
-
-	  For managing debug information files and source maps.
-
-	  https://docs.sentry.io/cli/
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
deleted file mode 100644
index 3b0733a276..0000000000
--- a/package/sentry-cli/sentry-cli.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally calculated
-sha256  5d0f7acf6a139d1c1716b9a8ff76c8bfaab09104ba663c957bb9a5dba2ffbabd  sentry-cli-1.57.0.tar.gz
-sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
deleted file mode 100644
index 7e53f16026..0000000000
--- a/package/sentry-cli/sentry-cli.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# sentry-cli
-#
-################################################################################
-
-SENTRY_CLI_VERSION = 1.57.0
-SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
-SENTRY_CLI_LICENSE = BSD-3-clause
-SENTRY_CLI_LICENSE_FILES = LICENSE
-
-HOST_SENTRY_CLI_DEPENDENCIES = host-rustc host-zlib
-
-HOST_SENTRY_CLI_CARGO_ENV = \
-	CARGO_HOME=$(HOST_DIR)/share/cargo \
-	RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
-
-HOST_SENTRY_CLI_CARGO_OPTS = \
-	--release \
-	--manifest-path=$(@D)/Cargo.toml
-
-define HOST_SENTRY_CLI_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_SENTRY_CLI_CARGO_ENV) \
-		cargo build $(HOST_SENTRY_CLI_CARGO_OPTS)
-endef
-
-define HOST_SENTRY_CLI_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/target/release/sentry-cli \
-		$(HOST_DIR)/bin/sentry-cli
-endef
-
-$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
