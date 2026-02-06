Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DDEEE6B60
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 21:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46DF240A3C;
	Fri,  6 Feb 2026 21:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRRqUZQifes3; Fri,  6 Feb 2026 21:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55B5140A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770413810;
	bh=418eplElHWb+AvLjZRaw5E4ec9hRlMFNlOFX+d5aAwE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a9J+IRQKXJGEimRUfCQBdv0sCUqVKcn9ar5WyKwe4veadSKtmKqEhi7h1nOOcUHV1
	 +3WDNzC0tdwKuNO0FAirHHPnTvrzKZSMUYkQSgakntYz227dcgMIQxdOCeKE7zh/Z0
	 cmt3MP7FfpVfQi4wSHLwzTO+/EEzqGzPzUtPkKHGxetd0NvaBVY56UT60ggLjXfpyB
	 satXwrENjaEYEjGlHjFywGtevHElTfNwlEzUBnRvZD9FH18TXnyL8jgEuQxcNVbIoL
	 WxoNWThw6tsWYf3qOwfFz77T4yCCtXx0I8JFrBsIBA/KGq7ww17uUkztlOJ1tEXEwq
	 jggYc3Yvd6COg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55B5140A98;
	Fri,  6 Feb 2026 21:36:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6EB12C5
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B94D6840E8
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dn5TYrfj8P8z for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 21:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDD72840DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDD72840DC
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:36:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF80C86AD4; Fri,  6 Feb 2026 21:36:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Feb 2026 22:28:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48186093fd355ede91151b2342e222cef303a6ca
X-Git-Newrev: 10033b62c498418d9cb5dbc5d07026bd3cc398dd
X-Patchwork-Hint: ignore
Message-Id: <20260206213648.BF80C86AD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump to v0.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10033b62c498418d9cb5dbc5d07026bd3cc398dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.0

This commit also reorder _LICENSE and _LICENSE_FILES to make
license maintenance easier.

Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
[Julien: add commit log comment about license reordering]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcamera/libcamera.hash |  2 +-
 package/libcamera/libcamera.mk   | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 4e79be844e..e00e1257ad 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  85d85409d6e04bcf2e1ed57d9b59ebcc9fb770e5d39690d7ac233e9784835b89  libcamera-v0.6.0-git4.tar.gz
+sha256  9e684bfcb8679e5e7ec7fb0da9dec68e71f0b75a6b0c8edcd892b26a92726a92  libcamera-v0.7.0-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index e86e05328c..e8f502b253 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.6.0
+LIBCAMERA_VERSION = v0.7.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
@@ -23,23 +23,23 @@ LIBCAMERA_CONF_OPTS = \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
-	LGPL-2.1+ (library), \
-	GPL-2.0+ (utils), \
-	MIT (qcam/assets/feathericons), \
 	BSD-2-Clause (raspberrypi), \
-	GPL-2.0 with Linux-syscall-note or BSD-3-Clause (linux kernel headers), \
+	CC-BY-SA-4.0 (doc), \
 	CC0-1.0 (meson build system), \
-	CC-BY-SA-4.0 (doc)
+	GPL-2.0 with Linux-syscall-note or BSD-3-Clause (linux kernel headers), \
+	GPL-2.0+ (utils), \
+	LGPL-2.1+ (library), \
+	MIT (qcam/assets/feathericons)
 LIBCAMERA_LICENSE_FILES = \
-	LICENSES/LGPL-2.1-or-later.txt \
-	LICENSES/GPL-2.0-or-later.txt \
-	LICENSES/MIT.txt \
 	LICENSES/BSD-2-Clause.txt \
-	LICENSES/GPL-2.0-only.txt \
-	LICENSES/Linux-syscall-note.txt \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/CC-BY-SA-4.0.txt \
 	LICENSES/CC0-1.0.txt \
-	LICENSES/CC-BY-SA-4.0.txt
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/Linux-syscall-note.txt \
+	LICENSES/MIT.txt
 
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
 LIBCAMERA_CXXFLAGS = -faligned-new
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
