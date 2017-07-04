From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:45 +0200
Subject: [Buildroot] [git commit] minidlna: use the new gettext logic
Message-ID: <20170704233517.C33E37FB2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a32783e38747960b2c46a370d5ddc1ff92911590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minidlna/Config.in   | 1 -
 package/minidlna/minidlna.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index c900143..a8311af 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -13,7 +13,6 @@ config BR2_PACKAGE_MINIDLNA
 	select BR2_PACKAGE_LIBEXIF
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
 	  fully compliant with DLNA/UPnP-AV clients.
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 4fa5545..d0d9136 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -10,7 +10,7 @@ MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 
 MINIDLNA_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext \
+	$(TARGET_NLS_DEPENDENCIES) \
 	ffmpeg flac libvorbis libogg libid3tag libexif jpeg sqlite \
 	host-xutil_makedepend
 
