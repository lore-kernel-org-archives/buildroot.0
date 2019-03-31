From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:01:59 +0200
Subject: [Buildroot] [git commit] package/rpm: add optional bzip2 dependency
Message-ID: <20190331130146.0FB8888125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd3544f7c2e4f3ab7bef544882ae751d6b158e60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no --{disable,enable}-bzip2 option

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpm/rpm.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index eb9a4a5a51..e076d2a17f 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -8,7 +8,13 @@ RPM_VERSION_MAJOR = 4.14
 RPM_VERSION = $(RPM_VERSION_MAJOR).2.1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
-RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib \
+RPM_DEPENDENCIES = \
+	host-pkgconf \
+	berkeleydb \
+	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
+	file \
+	popt \
+	zlib \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
