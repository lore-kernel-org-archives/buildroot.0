Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F8DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 742B240761;
	Sat,  8 Jan 2022 23:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JON6VAWE720w; Sat,  8 Jan 2022 23:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A88D34055E;
	Sat,  8 Jan 2022 23:17:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 269431BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 217AC40227
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Iz6EbIaWSfH for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:17:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FB7640116
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:17:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E7FB6813CA; Sat,  8 Jan 2022 23:11:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 00:17:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5138621497a9a6621d1ef36faf66a3e1ac1677f0
X-Git-Newrev: cc232de771baf51f17f59264246d722ff241e125
X-Patchwork-Hint: ignore
Message-Id: <20220108231108.E7FB6813CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmd: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc232de771baf51f17f59264246d722ff241e125
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This library provides message digest functions found on BSD systems
either on their libc (NetBSD, OpenBSD) or libmd (FreeBSD, DragonflyBSD,
macOS, Solaris) libraries and lacking on others like GNU systems.

https://www.hadrons.org/software/libmd/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/libmd/Config.in  |  9 +++++++++
 package/libmd/libmd.hash |  5 +++++
 package/libmd/libmd.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 690a43f81b..3b544cae6b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -904,6 +904,7 @@ F:	package/libidn2/
 F:	package/libjpeg/
 F:	package/liblockfile/
 F:	package/libmatroska/
+F:	package/libmd/
 F:	package/libmpdclient/
 F:	package/libnetfilter_conntrack/
 F:	package/libnetfilter_queue/
diff --git a/package/Config.in b/package/Config.in
index 54d9f81e87..378d6e8c0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1415,6 +1415,7 @@ menu "Crypto"
 	source "package/libgpgme/Config.in"
 	source "package/libkcapi/Config.in"
 	source "package/libksba/Config.in"
+	source "package/libmd/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
 	source "package/libolm/Config.in"
diff --git a/package/libmd/Config.in b/package/libmd/Config.in
new file mode 100644
index 0000000000..63139ad69b
--- /dev/null
+++ b/package/libmd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBMD
+	bool "libmd"
+	help
+	  This library provides message digest functions found on BSD
+	  systems either on their libc (NetBSD, OpenBSD) or libmd
+	  (FreeBSD, DragonflyBSD, macOS, Solaris) libraries and lacking
+	  on others like GNU systems.
+
+	  https://www.hadrons.org/software/libmd/
diff --git a/package/libmd/libmd.hash b/package/libmd/libmd.hash
new file mode 100644
index 0000000000..1a3c9d80df
--- /dev/null
+++ b/package/libmd/libmd.hash
@@ -0,0 +1,5 @@
+# From https://lists.freedesktop.org/archives/libbsd/2021-October/000311.html
+sha512  731553ecc5e0e1eb228cced8fccd531fe31fb5c7627ca30013d287e1aeb8222959cf7498fbb7414bbabb967b25d4e8b0edd54fc47f6ccf55fc91087db0725ce3  libmd-1.0.4.tar.xz
+
+# Hash for license file
+sha256  4365ef6255ad553fce69dd4bc0e093472c5d0e41b8ea493a545cc926ce171aa6  COPYING
diff --git a/package/libmd/libmd.mk b/package/libmd/libmd.mk
new file mode 100644
index 0000000000..19a2458982
--- /dev/null
+++ b/package/libmd/libmd.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libmd
+#
+################################################################################
+
+LIBMD_VERSION = 1.0.4
+LIBMD_SOURCE = libmd-$(LIBMD_VERSION).tar.xz
+LIBMD_SITE = https://archive.hadrons.org/software/libmd
+LIBMD_LICENSE = BSD-2-Clause, BSD-3-Clause, Beerware, ISC, Public Domain
+LIBMD_LICENSE_FILES = COPYING
+LIBMD_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
