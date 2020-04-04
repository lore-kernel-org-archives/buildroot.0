From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 22:30:44 +0200
Subject: [Buildroot] [git commit] package/libexif: annotate CVEs
Message-ID: <20200404202606.E8F2C8B62D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=094d9857bde792c5e73ea06b3c13fcafc23f3392
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libexif/libexif.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index a4ec5ed3cb..643d9ed893 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -12,4 +12,13 @@ LIBEXIF_DEPENDENCIES = host-pkgconf
 LIBEXIF_LICENSE = LGPL-2.1+
 LIBEXIF_LICENSE_FILES = COPYING
 
+# 0001-fixes-some-not-all-buffer-overreads-during-decoding-.patch
+LIBEXIF_IGNORE_CVES += CVE-2016-6328
+# 0002-On-saving-makernotes-make-sure-the-makernote-contain.patch
+LIBEXIF_IGNORE_CVES += CVE-2017-7544
+# 0004-Improve-deep-recursion-detection-in-exif_data_load_d.patch
+LIBEXIF_IGNORE_CVES += CVE-2018-20030
+# 0005-fix-CVE-2019-9278.patch
+LIBEXIF_IGNORE_CVES += CVE-2019-9278
+
 $(eval $(autotools-package))
