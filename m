Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DD2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D2A4043D;
	Sat, 12 Feb 2022 14:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFSvGbjdzDqM; Sat, 12 Feb 2022 14:33:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB2A2408E0;
	Sat, 12 Feb 2022 14:33:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78ABD1BF956
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DFC783E87
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vgWW1ulE9cf for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77DC883E32
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 603B482B35; Sat, 12 Feb 2022 14:25:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 15:28:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d4c8ce8a2f26989e0e2d95b977d60e450c090a9
X-Git-Newrev: b066f1756f9af4a8577321ec09c17796bfb153d7
X-Patchwork-Hint: ignore
Message-Id: <20220212142506.603B482B35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lv2: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b066f1756f9af4a8577321ec09c17796bfb153d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/lv2/Config.in |  8 ++++++++
 package/lv2/lv2.hash  |  4 ++++
 package/lv2/lv2.mk    | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bdea8142e0..5573c62f0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1286,6 +1286,7 @@ F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/lv2/
 F:	package/pipewire/
 F:	package/python-aioconsole/
 F:	package/python-aiodns/
diff --git a/package/Config.in b/package/Config.in
index 0b533ce999..d95257e7aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1351,6 +1351,7 @@ menu "Audio/Sound"
 	source "package/libsoundtouch/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
+	source "package/lv2/Config.in"
 	source "package/mp4v2/Config.in"
 	source "package/openal/Config.in"
 	source "package/opencore-amr/Config.in"
diff --git a/package/lv2/Config.in b/package/lv2/Config.in
new file mode 100644
index 0000000000..aeeb6d0451
--- /dev/null
+++ b/package/lv2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LV2
+	bool "lv2"
+	help
+	  LV2 is a plugin standard for audio systems. It defines
+	  a minimal yet extensible C API for plugin code and a
+	  format for plugin "bundles".
+
+	  https://lv2plug.in/
diff --git a/package/lv2/lv2.hash b/package/lv2/lv2.hash
new file mode 100644
index 0000000000..ed21620bee
--- /dev/null
+++ b/package/lv2/lv2.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://lv2plug.in/spec/lv2-1.18.2.tar.bz2.asc
+sha256  4e891fbc744c05855beb5dfa82e822b14917dd66e98f82b8230dbd1c7ab2e05e  lv2-1.18.2.tar.bz2
+sha256  0b0b07d852e3ce7fa04986e141f73001bd7f260683968f0a19e02dbcc4131aa6  COPYING
diff --git a/package/lv2/lv2.mk b/package/lv2/lv2.mk
new file mode 100644
index 0000000000..13ffaa34b0
--- /dev/null
+++ b/package/lv2/lv2.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# lv2
+#
+################################################################################
+
+LV2_VERSION = 1.18.2
+LV2_SITE = https://lv2plug.in/spec
+LV2_SOURCE = lv2-$(LV2_VERSION).tar.bz2
+LV2_LICENSE = ISC
+LV2_LICENSE_FILES = COPYING
+LV2_DEPENDENCIES = host-pkgconf
+LV2_INSTALL_STAGING = YES
+
+LV2_CONF_OPTS += \
+	--no-coverage \
+	--no-check-links \
+	--copy-headers
+
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+LV2_DEPENDENCIES += cairo
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+LV2_DEPENDENCIES += libsndfile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+LV2_DEPENDENCIES += libgtk2
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LV2_CONF_OPTS += --no-plugins
+endif
+
+$(eval $(waf-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
