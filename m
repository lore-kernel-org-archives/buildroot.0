Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C387EC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D762360754;
	Sun, 14 Jul 2024 15:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1vgQ4oXPjFX; Sun, 14 Jul 2024 15:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA03A60643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA03A60643;
	Sun, 14 Jul 2024 15:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4E51BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F78440165
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgCtal-tHrqg for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1450040106
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1450040106
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:41:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F26D886865; Sun, 14 Jul 2024 15:41:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 17:40:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14b3ca20c9cb15f688dc164bb22c3c3712301d15
X-Git-Newrev: 3a5c045fd3ef30d62c551dbfa3756f5ee657f866
X-Patchwork-Hint: ignore
Message-Id: <20240714154117.F26D886865@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chicken: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7294711989849145376=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7294711989849145376==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3a5c045fd3ef30d62c551dbfa3756f5ee657f866
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently everything is installed to target. There is also a possibility
to build a cross-compiler for the host, but that's for future work.
Currently also more is installed to the target than strictly necessary
for the interpreter to work.

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
[Arnout:
 - Rename to "chicken" instead of "libchicken".
 - Fix alphabetical ordering in package/Config.in.
 - Fix check-package warnings.
 - Drop BR2_CHICKEN_INSTALL_INTERPRETER, always install everything to
   target.
 - Set ARCH=unused otherwise autodiscovery is triggered.
 - Drop '-feature' argument, it is only used for external code and we
   can't know what kind of "feature" values that that code expects.
 - Make staging and target install identical.
 - _MAKE_ARGUMENTS -> _MAKE_OPTS.
 - Move DESTDIR to install commands only.
 - Use MAKE1 only when installing and don't add variable for it.
 - Add hash file.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/chicken/Config.in    |  7 +++++++
 package/chicken/chicken.hash |  4 ++++
 package/chicken/chicken.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f8239ca23..37c7305cc7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3277,6 +3277,7 @@ N:	Wojciech Niziński <niziak@spox.org>
 F:	package/fwup/
 
 N:	Woodrow Douglass <wdouglass@carnegierobotics.com>
+F:	package/libchicken
 F:	package/opencv4
 F:	package/opencv4-contrib
 
diff --git a/package/Config.in b/package/Config.in
index 980ffaaa72..1c9e284a64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -662,6 +662,7 @@ endmenu
 
 menu "Interpreter languages and scripting"
 	source "package/4th/Config.in"
+	source "package/chicken/Config.in"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
diff --git a/package/chicken/Config.in b/package/chicken/Config.in
new file mode 100644
index 0000000000..dce0581951
--- /dev/null
+++ b/package/chicken/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CHICKEN
+	bool "chicken"
+	depends on BR2_USE_MMU
+	help
+	  libchicken is the runtime library for chicken scheme.
+
+	  https://call-cc.org
diff --git a/package/chicken/chicken.hash b/package/chicken/chicken.hash
new file mode 100644
index 0000000000..5a553da792
--- /dev/null
+++ b/package/chicken/chicken.hash
@@ -0,0 +1,4 @@
+# From https://code.call-cc.org/releases/5.3.0/chicken-5.3.0.tar.gz.sha256
+sha256  c3ad99d8f9e17ed810912ef981ac3b0c2e2f46fb0ecc033b5c3b6dca1bdb0d76  chicken-5.3.0.tar.gz
+# Locally computed
+sha256  b434ac92e094214136a6b5032f0dc9da97f22cef084ac1d0131b02a09e2caa37  LICENSE
diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
new file mode 100644
index 0000000000..9f296a1ce3
--- /dev/null
+++ b/package/chicken/chicken.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# chicken
+#
+################################################################################
+
+CHICKEN_VERSION = 5.3.0
+CHICKEN_SITE = https://code.call-cc.org/releases/$(CHICKEN_VERSION)
+CHICKEN_LICENSE = BSD-3-Clause
+CHICKEN_LICENSE_FILES = LICENSE
+CHICKEN_INSTALL_STAGING = YES
+
+# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
+CHICKEN_MAKE_OPTS = \
+	ARCH=unused \
+	C_COMPILER="$(TARGET_CC)" \
+	CXX_COMPILER="$(TARGET_CXX)" \
+	PREFIX=/usr \
+	PLATFORM=linux \
+	LIBRARIAN="$(TARGET_AR)"
+
+ifeq ($(BR2_STATIC_LIBS),y)
+CHICKEN_MAKE_OPTS += STATICBUILD=1
+endif
+
+define CHICKEN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(CHICKEN_MAKE_OPTS) all
+endef
+
+# README states that parallel builds are not supported..
+define CHICKEN_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
+		$(CHICKEN_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+endef
+
+define CHICKEN_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
+		$(CHICKEN_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))

--===============7294711989849145376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7294711989849145376==--
