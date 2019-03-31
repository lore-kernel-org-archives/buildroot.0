From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:02:03 +0200
Subject: [Buildroot] [git commit] package/rpm: add optional xz dependency
Message-ID: <20190331130146.15D008B4EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa2703ab0dfea58a4fd2e71b25f278be62de10f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is not --{disable,enable}-lzma option

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpm/rpm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index e076d2a17f..78f429f8b6 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -14,6 +14,7 @@ RPM_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
 	file \
 	popt \
+	$(if $(BR2_PACKAGE_XZ),xz) \
 	zlib \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
