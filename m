Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41160EEE25C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5B4405E1;
	Thu,  1 Jan 2026 21:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L60I_ZWLyCxX; Thu,  1 Jan 2026 21:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02FF740528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304374;
	bh=Jj+TZ8SIMGlT5OlFzc1OgSlnUdUhnPYZ0ICr3396W3o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aQuPhW9zFduj/8TNXpcyyUgEWwlF6RIg1n3rmDZENkvQK2dd0u7Osf+mSS4s2Vpyv
	 ZSdXclGgXpz6R9sq8Lef3YIR230T6SY0XbSb98eLLHEYXTBO37Fmuc7dDA5Abnj26L
	 5h6UoyXkuv6P/b+1mAI0tvbc7bYNdUigKkiswN93s8if0PymhO9XH4nvH8nFitB/pY
	 2C6uUd3XafyGZ9m1igb/5feVGmIOKkSbZa9d94yuCNZzRGfRWqRVnGBBtFwJlDsIpJ
	 FYr+FuN0FTRGDFh58PRjJyckOwzQGSlkEW87c4IucH03nj4LvO58UH44rrRjbmGOwc
	 XSP87EbKZiTGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02FF740528;
	Thu,  1 Jan 2026 21:52:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CEECD438
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5BA040392
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLdbECI65CS9 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDE0740387
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDE0740387
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B757787F14; Thu,  1 Jan 2026 21:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca4d9af913c8f88abda8a0f216fc7eb642b1648e
X-Git-Newrev: 7b6d47d78889cf825d489ae6feaed2d82fc2a1ed
X-Patchwork-Hint: ignore
Message-Id: <20260101215250.B757787F14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootstrap: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b6d47d78889cf825d489ae6feaed2d82fc2a1ed
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
 Config.in.legacy                 |  6 ++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/bootstrap/Config.in      |  7 -------
 package/bootstrap/bootstrap.hash |  3 ---
 package/bootstrap/bootstrap.mk   | 28 ----------------------------
 6 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 10c35610b9..b380f256af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_BOOTSTRAP
+	bool "bootstrap has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_SOFTETHER
 	bool "softether has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 718bb7ecf2..bc5f1aa7af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3482,7 +3482,6 @@ F:	package/acl/
 F:	package/attr/
 F:	package/avrdude/
 F:	package/boost/
-F:	package/bootstrap/
 F:	package/cannelloni/
 F:	package/can-utils/
 F:	package/circus/
diff --git a/package/Config.in b/package/Config.in
index 500725d1d4..86e82960a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1867,7 +1867,6 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
-	source "package/bootstrap/Config.in"
 	source "package/chartjs/Config.in"
 	source "package/datatables/Config.in"
 	source "package/datatables-buttons/Config.in"
diff --git a/package/bootstrap/Config.in b/package/bootstrap/Config.in
deleted file mode 100644
index 743d8a324a..0000000000
--- a/package/bootstrap/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_BOOTSTRAP
-	bool "bootstrap"
-	help
-	  Bootstrap is the most popular HTML, CSS, and JS framework
-	  for developing responsive, mobile first projects on the web.
-
-	  http://getbootstrap.com
diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
deleted file mode 100644
index a9602f7e49..0000000000
--- a/package/bootstrap/bootstrap.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  888ffd30b7e192381e2f6a948ca04669fdcc2ccc2ba016de00d38c8e30793323  bootstrap-4.3.1-dist.zip
-sha256  35fbb6dc3891aacaf1ffa07abec2344fdbc454aab533a2a03bcf93577eb7837b  css/bootstrap.css
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
deleted file mode 100644
index eba1244ad3..0000000000
--- a/package/bootstrap/bootstrap.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# bootstrap
-#
-################################################################################
-
-BOOTSTRAP_VERSION = 4.3.1
-BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
-BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
-BOOTSTRAP_LICENSE = MIT
-BOOTSTRAP_LICENSE_FILES = css/bootstrap.css
-BOOTSTRAP_CPE_ID_VENDOR = getbootstrap
-
-define BOOTSTRAP_EXTRACT_CMDS
-	$(UNZIP) $(BOOTSTRAP_DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
-	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)
-endef
-
-define BOOTSTRAP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css \
-		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css
-	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css.map \
-		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css.map
-	$(INSTALL) -m 0644 -D $(@D)/js/bootstrap.min.js \
-		$(TARGET_DIR)/var/www/bootstrap/js/bootstrap.min.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
