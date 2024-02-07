Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B153C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 08:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA3C81EA9;
	Wed,  7 Feb 2024 08:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDucpKz-Q3rO; Wed,  7 Feb 2024 08:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C997281EDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C997281EDB;
	Wed,  7 Feb 2024 08:21:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39BED1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1593961317
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2cPPsEUIc7g for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 08:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2616E60BBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2616E60BBF
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 08:21:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 001BE874DA; Wed,  7 Feb 2024 08:21:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 09:20:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e1b7be3abb5424a906d57fb4e5bcb64db5b4fda
X-Git-Newrev: d90ac63d9b3448a239bb9aa8030326699a3fdc3d
X-Patchwork-Hint: ignore
Message-Id: <20240207082105.001BE874DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minisign: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d90ac63d9b3448a239bb9aa8030326699a3fdc3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
[Peter: Fix check-package warnings, move to "Shell and utilities" and add
	DEVELOPERS entry]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                      |  3 +++
 package/Config.in               |  1 +
 package/Config.in.host          |  1 +
 package/minisign/Config.in      |  9 +++++++++
 package/minisign/Config.in.host |  7 +++++++
 package/minisign/minisign.hash  |  3 +++
 package/minisign/minisign.mk    | 19 +++++++++++++++++++
 7 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fc47c51d33..471c739678 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2402,6 +2402,9 @@ N:	Patrick Havelange <patrick.havelange@essensium.com>
 F:	support/testing/tests/package/test_lxc.py
 F:	support/testing/tests/package/test_lxc/
 
+N:	Patrick Oppenlander <patrick.oppenlander@gmail.com>
+F:	package/minisign/
+
 N:	Paul Cercueil <paul@crapouillou.net>
 F:	package/libiio/
 F:	package/lightning/
diff --git a/package/Config.in b/package/Config.in
index 047877c960..24e5f04ed6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2685,6 +2685,7 @@ comment "Utilities"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
 	source "package/logsurfer/Config.in"
+	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
 	source "package/pdmenu/Config.in"
 	source "package/pinentry/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a..f03ca16b7b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -64,6 +64,7 @@ menu "Host utilities"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/microchip-hss-payload-generator/Config.in.host"
+	source "package/minisign/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/moby-buildkit/Config.in.host"
 	source "package/mosquitto/Config.in.host"
diff --git a/package/minisign/Config.in b/package/minisign/Config.in
new file mode 100644
index 0000000000..b852903921
--- /dev/null
+++ b/package/minisign/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MINISIGN
+	bool "minisign"
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_LIBSODIUM_FULL
+	help
+	  Minisign is a dead simple tool to sign files and verify
+	  signatures.
+
+	  https://github.com/jedisct1/minisign
diff --git a/package/minisign/Config.in.host b/package/minisign/Config.in.host
new file mode 100644
index 0000000000..99a89b7cf3
--- /dev/null
+++ b/package/minisign/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_MINISIGN
+	bool "host minisign"
+	help
+	  Minisign is a dead simple tool to sign files and verify
+	  signatures.
+
+	  https://github.com/jedisct1/minisign
diff --git a/package/minisign/minisign.hash b/package/minisign/minisign.hash
new file mode 100644
index 0000000000..12cde42a43
--- /dev/null
+++ b/package/minisign/minisign.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  74c2c78a1cd51a43a6c98f46a4eabefbc8668074ca9aa14115544276b663fc55  minisign-0.11.tar.gz
+sha256  d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b  LICENSE
diff --git a/package/minisign/minisign.mk b/package/minisign/minisign.mk
new file mode 100644
index 0000000000..34b3f4046e
--- /dev/null
+++ b/package/minisign/minisign.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# minisign
+#
+################################################################################
+
+MINISIGN_VERSION = 0.11
+MINISIGN_SITE = $(call github,jedisct1,minisign,$(MINISIGN_VERSION))
+MINISIGN_LICENSE = ISC
+MINISIGN_LICENSE_FILES = LICENSE
+MINISIGN_DEPENDENCIES = libsodium
+HOST_MINISIGN_DEPENDENCIES = host-libsodium
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MINISIGN_CONF_OPTS += -DBUILD_STATIC_EXECUTABLES=1
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
