Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4651CC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA17B60D74;
	Wed, 27 Jul 2022 14:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA17B60D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOEvtA_a_y3y; Wed, 27 Jul 2022 14:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E45FE60AEB;
	Wed, 27 Jul 2022 14:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E45FE60AEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACB401BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86CA94092B
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86CA94092B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFVNMRPvL3Fp for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:38:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 759B5403CC
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 759B5403CC
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3A6928661B; Wed, 27 Jul 2022 14:25:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:57:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42f7f451ecd27dfe721092515eef09c47bc03bc5
X-Git-Newrev: f986b7fd27aef50c0d9e5261e26595f647464dba
X-Patchwork-Hint: ignore
Message-Id: <20220727142508.3A6928661B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libutp: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f986b7fd27aef50c0d9e5261e26595f647464dba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for upcoming version bump of transmission.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libutp/Config.in   | 10 ++++++++++
 package/libutp/libutp.hash |  3 +++
 package/libutp/libutp.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8adbc420a1..5864601dd8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -391,6 +391,7 @@ F:	package/libsoundtouch/
 F:	package/libsquish/
 F:	package/libudfread/
 F:	package/liburiparser/
+F:	package/libutp/
 F:	package/libva/
 F:	package/libva-intel-driver/
 F:	package/libva-utils/
diff --git a/package/Config.in b/package/Config.in
index 1711ee69a6..58ceaaa70b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1888,6 +1888,7 @@ menu "Networking"
 	source "package/libupnp/Config.in"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
+	source "package/libutp/Config.in"
 	source "package/libuwsc/Config.in"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsock/Config.in"
diff --git a/package/libutp/Config.in b/package/libutp/Config.in
new file mode 100644
index 0000000000..6382913103
--- /dev/null
+++ b/package/libutp/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBUTP
+	bool "libutp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  uTorrent Transport Protocol library
+
+	  https://github.com/bittorrent/libutp
+
+comment "libutp support needs a toolchain with C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libutp/libutp.hash b/package/libutp/libutp.hash
new file mode 100644
index 0000000000..38d46b0ae5
--- /dev/null
+++ b/package/libutp/libutp.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c515e6f9add47d3d202389e8a62feb765f0ae41d6398cc238e44028be520774e  libutp-fda9f4b3db97ccb243fcbed2ce280eb4135d705b.tar.gz
+sha256  4441418beb8e352b6e2aa09083b4c51a86814a49878dbb1a81936b466cd5badd  LICENSE
diff --git a/package/libutp/libutp.mk b/package/libutp/libutp.mk
new file mode 100644
index 0000000000..c926c290d2
--- /dev/null
+++ b/package/libutp/libutp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libutp
+#
+################################################################################
+
+LIBUTP_VERSION = fda9f4b3db97ccb243fcbed2ce280eb4135d705b
+LIBUTP_SITE = $(call github,transmission,libutp,$(LIBUTP_VERSION))
+LIBUTP_LICENSE = MIT
+LIBUTP_LICENSE_FILES = LICENSE
+LIBUTP_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
