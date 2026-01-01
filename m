Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B6DFA3722
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C4AB40649;
	Thu,  1 Jan 2026 21:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUp38_GNi-9t; Thu,  1 Jan 2026 21:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2986840701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304384;
	bh=vLREfAkiwop8aGbZtuK+u7JlwnmTDjs2RWK/K874N+M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VOll4mrBgc2BL3kDjC+4lt95/h+TYK9XdUPqOUcS4uXLlw+KD5J+dEC+nKN9Zm8gj
	 FoiHZ1EEj/zH8O1+KJkQAYqZridoklob4qndkgbGr9i5pO4XyY6Rwihzz/rAtaJ9+L
	 zZHvmaCYCzgzRi6OXQdsxomH+CuJg92fbY25fvJCcDBvs6KswNSP1WoLMsIdcWGXsK
	 ynJE3oWfOIOVcb1ch2yxmgEdeauIAYjK+lRGLufp48Du3o1GMhiRSlW/aEuIO8ri6J
	 4aFb8MF7d3NkofshqkfahHcMlUsmz1+nn2ADffws+O0eHfJH+Y4YRZBJ5y/IKJSHvJ
	 uZCgi8op9YXgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2986840701;
	Thu,  1 Jan 2026 21:53:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02E3D438
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 849E840523
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbAj1V1gMOTx for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B511740528
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B511740528
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F17C85E7A; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5c61cd11e894099d8342709d08cba4cfd1b2ad5
X-Git-Newrev: b0c6af9e76270a744ce4ed79158f95d719f1da01
X-Patchwork-Hint: ignore
Message-Id: <20260101215251.8F17C85E7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jszip: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0c6af9e76270a744ce4ed79158f95d719f1da01
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
 package/Config.in        |  1 -
 package/jszip/Config.in  |  7 -------
 package/jszip/jszip.hash |  3 ---
 package/jszip/jszip.mk   | 18 ------------------
 5 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b13d4bdad7..706f8b441f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_JSZIP
+	bool "jszip has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_JSON_JAVASCRIPT
 	bool "json-javascript has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index a15df179e5..a2a9f4a931 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1869,7 +1869,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/jszip/Config.in"
 	source "package/openlayers/Config.in"
 	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
diff --git a/package/jszip/Config.in b/package/jszip/Config.in
deleted file mode 100644
index 455891ab12..0000000000
--- a/package/jszip/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_JSZIP
-	bool "jszip"
-	help
-	  JSZip is a javascript library for creating, reading and
-	  editing .zip files, with a lovely and simple API.
-
-	  https://stuk.github.io/jszip
diff --git a/package/jszip/jszip.hash b/package/jszip/jszip.hash
deleted file mode 100644
index e90e9cc68b..0000000000
--- a/package/jszip/jszip.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  e873e5d0d8549c78c0eafcab8fba40f4a1e27c5a9d48f4a6b2eb122470d0d88c  jszip-3.10.1.tar.gz
-sha256  566c953c6090b1218ca6217dd7359d45dde46581968586dc607d59a78af6a9c4  LICENSE.markdown
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
deleted file mode 100644
index f038263a77..0000000000
--- a/package/jszip/jszip.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# jszip
-#
-################################################################################
-
-JSZIP_VERSION = 3.10.1
-JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
-JSZIP_LICENSE = MIT or GPL-3.0
-JSZIP_LICENSE_FILES = LICENSE.markdown
-JSZIP_CPE_ID_VALID = YES
-
-define JSZIP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/jszip.min.js \
-		$(TARGET_DIR)/var/www/jszip/js/jszip.min.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
