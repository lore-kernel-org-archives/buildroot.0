Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B1EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AA804107B;
	Mon, 21 Aug 2023 20:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AA804107B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xe2-WLYPSgqL; Mon, 21 Aug 2023 20:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A85414BE;
	Mon, 21 Aug 2023 20:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A85414BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6F7E1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 456FC410A5
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 456FC410A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5Zm-7MSWwhu for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E1DE410A1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1DE410A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79C3D86023; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 23:03:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b84ffd85e2900741bb97325b53d09e170e941e6c
X-Git-Newrev: 3bdc3f58cc0bf50baa0f3b9a50e1ee61081c8cae
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.79C3D86023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xlib_libXpresent: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3bdc3f58cc0bf50baa0f3b9a50e1ee61081c8cae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Needed for mpv since version 0.35.0:
https://github.com/mpv-player/mpv/commit/3d459832a88a9bd2835b339cf6ca98f84aad0115

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: improved thanks to feedback from a similar patch submitted by
Bernd Kuhls.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                          |  1 +
 package/x11r7/Config.in                             |  1 +
 package/x11r7/xlib_libXpresent/Config.in            |  9 +++++++++
 .../x11r7/xlib_libXpresent/xlib_libXpresent.hash    |  6 ++++++
 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk  | 21 +++++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f6cb75e0e..6ffa3ee693 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1025,6 +1025,7 @@ F:	package/tinycbor/
 F:	package/tinydtls/
 F:	package/tinymembench/
 F:	package/whois/
+F:	package/x11r7/xlib_libXpresent/
 F:	package/zeek/
 
 N:	Fabrice Goucem <fabrice.goucem@oss.nxp.com>
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4de8922e0d..b91f97bb34 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -42,6 +42,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXinerama/Config.in
 		source package/x11r7/xlib_libXmu/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
+		source package/x11r7/xlib_libXpresent/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
 		source package/x11r7/xlib_libXres/Config.in
diff --git a/package/x11r7/xlib_libXpresent/Config.in b/package/x11r7/xlib_libXpresent/Config.in
new file mode 100644
index 0000000000..f6e2d93fab
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XLIB_LIBXPRESENT
+	bool "libXpresent"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  X.Org Xpresent library
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
new file mode 100644
index 0000000000..e7f6ac9e5a
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
@@ -0,0 +1,6 @@
+# From https://lists.x.org/archives/xorg-announce/2022-October/003225.html
+sha256  b964df9e5a066daa5e08d2dc82692c57ca27d00b8cc257e8e960c9f1cf26231b  libXpresent-1.0.1.tar.xz
+sha512  a4551f49a68f4487eb70dc5b50b7f745fbc8b6842cfa60422afe3834af41c504a37bcfddb4e7e9ee084b250df256034290776c8eb7d8838e392eb626fff55d25  libXpresent-1.0.1.tar.xz
+
+# Locally calculated
+sha256  d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
new file mode 100644
index 0000000000..4cb4fd193a
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# xlib_libXpresent
+#
+################################################################################
+
+XLIB_LIBXPRESENT_VERSION = 1.0.1
+XLIB_LIBXPRESENT_SOURCE = libXpresent-$(XLIB_LIBXPRESENT_VERSION).tar.xz
+XLIB_LIBXPRESENT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPRESENT_LICENSE = MIT
+XLIB_LIBXPRESENT_LICENSE_FILES = COPYING
+XLIB_LIBXPRESENT_INSTALL_STAGING = YES
+
+XLIB_LIBXPRESENT_DEPENDENCIES = \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXfixes \
+	xlib_libXrandr \
+	xorgproto
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
