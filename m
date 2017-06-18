From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 15:53:24 +0200
Subject: [Buildroot] [git commit] package/libbluray: fix build when host has
	no java support
Message-ID: <20170618135243.647FB81831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39b6ea3c61d1c0b3c639ef53f2a3c81960267343
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/630/630cfe62798d0f35fdfaed8547038ba7673cc149/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbluray/libbluray.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index d3eee5d..4928f8a 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -12,6 +12,8 @@ LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
+LIBBLURAY_CONF_OPTS = --disable-bdjava-jar
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
