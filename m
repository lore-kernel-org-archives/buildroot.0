Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50EFC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9384F8176D;
	Tue, 26 Jul 2022 20:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9384F8176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zj5qZ9-qufWR; Tue, 26 Jul 2022 20:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EBC881766;
	Tue, 26 Jul 2022 20:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBC881766
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10F631BF9D1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF80A40124
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF80A40124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDfVQHOGkGTp for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 094A640012
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 094A640012
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7C5DA86026; Tue, 26 Jul 2022 20:41:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:54:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39c08b2aa165040b3d29a2ebca2856d3429a9aa8
X-Git-Newrev: 2156c6d216dea9f45cae9374e8f7d475fe2f1f54
X-Patchwork-Hint: ignore
Message-Id: <20220726204126.7C5DA86026@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libb2: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2156c6d216dea9f45cae9374e8f7d475fe2f1f54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both the target and host variants of this package will be needed for
qt6base.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS               |  2 ++
 package/Config.in        |  1 +
 package/libb2/Config.in  |  6 ++++++
 package/libb2/libb2.hash |  3 +++
 package/libb2/libb2.mk   | 19 +++++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 23091322fe..164df02aec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2335,6 +2335,7 @@ F:	package/gstreamer1/gst1-devtools/
 F:	package/gstreamer1/gst1-interpipe/
 F:	package/gstreamer1/gstreamer1-editing-services/
 F:	package/iwd/
+F:	package/libb2/
 F:	package/libcamera-apps/
 F:	package/libevdev/
 F:	package/libuev/
@@ -2851,6 +2852,7 @@ F:	package/hiawatha/
 F:	package/igh-ethercat/
 F:	package/intltool/
 F:	package/jh71xx-tools/
+F:	package/libb2/
 F:	package/libcap/
 F:	package/libffi/
 F:	package/libsha1/
diff --git a/package/Config.in b/package/Config.in
index ab108f679f..79ef303bc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1416,6 +1416,7 @@ menu "Crypto"
 	source "package/gnutls/Config.in"
 	source "package/libargon2/Config.in"
 	source "package/libassuan/Config.in"
+	source "package/libb2/Config.in"
 	source "package/libgcrypt/Config.in"
 	source "package/libgpg-error/Config.in"
 	source "package/libgpgme/Config.in"
diff --git a/package/libb2/Config.in b/package/libb2/Config.in
new file mode 100644
index 0000000000..5cb462eb19
--- /dev/null
+++ b/package/libb2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBB2
+	bool "libb2"
+	help
+	  C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp.
+
+	  https://github.com/BLAKE2/libb2
diff --git a/package/libb2/libb2.hash b/package/libb2/libb2.hash
new file mode 100644
index 0000000000..6ef24a98ca
--- /dev/null
+++ b/package/libb2/libb2.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  10053dbc2fa342516b780a6bbf6e7b2a2360b8d49c5ac426936bf3df82526732  libb2-0.98.1.tar.gz
+sha256  6a1ee543e5282cd9061881edf462e6fdab181f328da71fc2c9a6950a80e94d01  COPYING
diff --git a/package/libb2/libb2.mk b/package/libb2/libb2.mk
new file mode 100644
index 0000000000..761c0599e3
--- /dev/null
+++ b/package/libb2/libb2.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libb2
+#
+################################################################################
+
+LIBB2_VERSION = 0.98.1
+LIBB2_SITE = $(call github,BLAKE2,libb2,v$(LIBB2_VERSION))
+LIBB2_LICENSE =  CC0-1.0
+LIBB2_LICENSE_FILES = COPYING
+LIBB2_INSTALL_STAGING = YES
+LIBB2_AUTORECONF = YES
+LIBB2_DEPENDENCIES = host-pkgconf
+LIBB2_CONF_OPTS = --disable-fat --disable-native
+HOST_LIBB2_DEPENDENCIES = host-pkgconf
+HOST_LIBB2_CONF_OPTS = --disable-fat --enable-native
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
