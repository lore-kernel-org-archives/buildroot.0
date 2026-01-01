Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B980CFA3722
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8436940523;
	Thu,  1 Jan 2026 21:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JstMxsMjPJJK; Thu,  1 Jan 2026 21:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 792FC4051F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304377;
	bh=QUom9G4vPI6gg/t8J8DqUqgANyay6fMuxPSMLb5Pbf0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kz/ev404pegePYWoz20O1w7Y5YSfHo9G/UQt0nx7bNGBG+kR9u9gSQiz02pv07IH8
	 QKqta/yrGuZ8kCDDiQS80U4y/XicL/M+M/99VlNp23uHcufLWrvCkh0MubDbhzB3FK
	 64TSylq1rTeI8wvx3EkMbY2ILDsIYzPAXVYPUlnLbyfFjH0Pf6MAJeQoO3aftDbmeo
	 1ky9uggITKgihOUe3qEE2sP/ht/gC+42YqrLWSwdc+88hEI+XH6KGi8N07FLXIN+zW
	 9XdQrekwzlXbg1nLOMM1EFEJqhtaYEUz5UfG8EswCRDZnP4I3ydzb0v0F5vhJH7gdU
	 6L/plta3Blg/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 792FC4051F;
	Thu,  1 Jan 2026 21:52:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EACF206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21C9F40578
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VjpVWLLkTap for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B034051F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47B034051F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 358B587E4C; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de970ee7838d775b1b85070a4078f3cb2c19feec
X-Git-Newrev: 37755d7275e13df42b6e897d3162b3de3c83de56
X-Patchwork-Hint: ignore
Message-Id: <20260101215251.358B587E4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/forge: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=37755d7275e13df42b6e897d3162b3de3c83de56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because the way JavaScript project development is working the chances that your
project is using the same version of the buildroot package, and you provide
this library from `/var/www` to your users is actually really low ...

If you want to bundle JavaScript libraries in your project you should probably
either use a cdn, handle the package version and location of your choice in
your external or overlay, or just bundle it in your assets from a NPM workflow
to benefit from some minifications from your bundler.

Historically many of those JavaScript libraries were added in the 2010 eras
where it could make sense for them to be part of Buildroot.

Most of them are also way outdated/not maintained.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy         |  6 ++++++
 DEVELOPERS               |  1 -
 package/Config.in        |  1 -
 package/forge/Config.in  |  7 -------
 package/forge/forge.hash |  3 ---
 package/forge/forge.mk   | 24 ------------------------
 6 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ddd837389a..2b61bd3f3b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_FORGE
+	bool "forge has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_FLOT
 	bool "flot has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index bc5f1aa7af..0623afd564 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1712,7 +1712,6 @@ F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/erlang-stun/
 F:	package/erlang-xmpp/
-F:	package/forge/
 F:	package/nginx-dav-ext/
 F:	package/vis-network/
 F:	package/vuejs/
diff --git a/package/Config.in b/package/Config.in
index 97552c6b79..48679c66bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1868,7 +1868,6 @@ endmenu
 
 menu "Javascript"
 	source "package/duktape/Config.in"
-	source "package/forge/Config.in"
 	source "package/jquery/Config.in"
 if BR2_PACKAGE_JQUERY
 menu "External jQuery plugins"
diff --git a/package/forge/Config.in b/package/forge/Config.in
deleted file mode 100644
index 86d4832101..0000000000
--- a/package/forge/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_FORGE
-	bool "forge"
-	help
-	  A native implementation of TLS (and various other
-	  cryptographic tools) in JavaScript.
-
-	  https://github.com/digitalbazaar/forge
diff --git a/package/forge/forge.hash b/package/forge/forge.hash
deleted file mode 100644
index 36e92be743..0000000000
--- a/package/forge/forge.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  77de03720cd00fafdbcda47e3e995a1f548f2e9028d11a98b0d9bef37ec2ad85  node-forge-1.3.1.tgz
-sha256  f63ff0e4e239244aa79280da2dd4811a0469e5e201caf5cbc0d97c3a1dff8e82  LICENSE
diff --git a/package/forge/forge.mk b/package/forge/forge.mk
deleted file mode 100644
index 0b81295a15..0000000000
--- a/package/forge/forge.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# forge
-#
-################################################################################
-
-FORGE_VERSION = 1.3.1
-FORGE_SITE = https://registry.npmjs.org/node-forge/-
-FORGE_SOURCE = node-forge-$(FORGE_VERSION).tgz
-FORGE_LICENSE = BSD-3-Clause, GPL-2.0, vendored dependencies licenses probably not listed
-FORGE_LICENSE_FILES = LICENSE
-FORGE_CPE_ID_VENDOR = digitalbazaar
-
-# Install .min.js as .js
-define FORGE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/forge.all.min.js \
-		$(TARGET_DIR)/var/www/forge.all.js
-	$(INSTALL) -m 644 -D $(@D)/dist/forge.min.js \
-		$(TARGET_DIR)/var/www/forge.js
-	$(INSTALL) -m 644 -D $(@D)/dist/prime.worker.min.js \
-		$(TARGET_DIR)/var/www/prime.worker.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
