Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E40C1402E2;
	Sat, 12 Feb 2022 14:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDWLr7G_nOOM; Sat, 12 Feb 2022 14:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 031C4402E7;
	Sat, 12 Feb 2022 14:33:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 059941BF5A1
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A8A883E32
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thjxuCRrf7BI for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9005E83E84
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7992782B35; Sat, 12 Feb 2022 14:25:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 15:31:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47c0176b39f7fd4eeebf19a6c29c5c967a229674
X-Git-Newrev: 9c8453734bf0f2c3e9dbf50c604952253f2b1524
X-Patchwork-Hint: ignore
Message-Id: <20220212142506.7992782B35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lilv: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c8453734bf0f2c3e9dbf50c604952253f2b1524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/lilv/Config.in | 15 +++++++++++++++
 package/lilv/lilv.hash |  4 ++++
 package/lilv/lilv.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 356e74d51f..be8231a2af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1286,6 +1286,7 @@ F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/lilv/
 F:	package/lv2/
 F:	package/pipewire/
 F:	package/python-aioconsole/
diff --git a/package/Config.in b/package/Config.in
index 86c654e3fc..f48b0c646d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1351,6 +1351,7 @@ menu "Audio/Sound"
 	source "package/libsoundtouch/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
+	source "package/lilv/Config.in"
 	source "package/lv2/Config.in"
 	source "package/mp4v2/Config.in"
 	source "package/openal/Config.in"
diff --git a/package/lilv/Config.in b/package/lilv/Config.in
new file mode 100644
index 0000000000..08d54bcf8b
--- /dev/null
+++ b/package/lilv/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LILV
+	bool "lilv"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LV2
+	select BR2_PACKAGE_SERD
+	select BR2_PACKAGE_SORD
+	select BR2_PACKAGE_SRATOM
+	help
+	  Lilv is a C library to make the use of LV2 plugins as simple
+	  as possible for applications.
+
+	  https://drobilla.net/software/lilv.html
+
+comment "lilv needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/lilv/lilv.hash b/package/lilv/lilv.hash
new file mode 100644
index 0000000000..afa20fc083
--- /dev/null
+++ b/package/lilv/lilv.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/lilv-0.24.12.tar.bz2.asc
+sha256  26a37790890c9c1f838203b47f5b2320334fe92c02a4d26ebbe2669dbd769061  lilv-0.24.12.tar.bz2
+sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/lilv/lilv.mk b/package/lilv/lilv.mk
new file mode 100644
index 0000000000..5f9186e66a
--- /dev/null
+++ b/package/lilv/lilv.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# lilv
+#
+################################################################################
+
+LILV_VERSION = 0.24.12
+LILV_SITE = https://download.drobilla.net
+LILV_SOURCE = lilv-$(LILV_VERSION).tar.bz2
+LILV_LICENSE = ISC
+LILV_LICENSE_FILES = COPYING
+LILV_DEPENDENCIES = host-pkgconf lv2 serd sord sratom
+LILV_INSTALL_STAGING = YES
+
+LILV_CONF_OPTS += \
+	--dyn-manifest \
+	--no-bash-completion \
+	--no-coverage
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LILV_DEPENDENCIES += python3
+else
+LILV_CONF_OPTS += --no-bindings
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+LILV_DEPENDENCIES += libsndfile
+endif
+
+$(eval $(waf-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
