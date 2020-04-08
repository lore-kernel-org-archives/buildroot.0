From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 16:15:11 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libexif: annotate
 CVEs
Message-ID: <20200408141053.7F52B8DFA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fead6f65e7165083ebd4168aca1f28db2e9490d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 094d9857bde792c5e73ea06b3c13fcafc23f3392)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
