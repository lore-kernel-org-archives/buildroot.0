From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 14 Mar 2014 21:51:06 +0100
Subject: [Buildroot] [PATCH 1/2] minidlna: needs gettext and host-gettext
	tools if locale is enabled
Message-ID: <BLU0-SMTP657A1BE94A7B7893E432DAD9700@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/c6b/c6baebe005d6c024514bb1ade5ca391ea341c239/

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/minidlna/Config.in   |    2 ++
 package/minidlna/minidlna.mk |    1 +
 2 files changed, 3 insertions(+)

diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 1fcecde..02720e9 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_MINIDLNA
 	select BR2_PACKAGE_LIBEXIF
 	select BR2_PACKAGE_LIBJPEG
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT_TOOLS if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
 	  fully compliant with DLNA/UPnP-AV clients.
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 94c2641..ea6a3fc 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -10,6 +10,7 @@ MINIDLNA_LICENSE = GPLv2 BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 
 MINIDLNA_DEPENDENCIES = \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext host-gettext) \
 	ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
 	host-xutil_makedepend
 
-- 
1.7.10.4
