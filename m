From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 19:34:42 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/qpdf: fix license
Message-ID: <20191222204327.69CE3812A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f46163d71426b9640cd50e916e46daf5deedb98d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

qpdf is also licensed under Apache-2.0 since version 7.0.0 and
https://github.com/qpdf/qpdf/commit/07c8bb2843f1a975a27d396da33d813a1537ee3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 984bdfb0276e313c770061c7793fa8b30f34f04a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qpdf/qpdf.hash | 1 +
 package/qpdf/qpdf.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 825d2048e6..0ab4e0af4e 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,4 +1,5 @@
 # From https://sourceforge.net/projects/qpdf/files/qpdf/8.4.0/qpdf-8.4.0.sha512/download
 sha512	13225c6285311e8fe89970971b082b9613e70d474ee71dd5572f1ae268234d366c2c9c7bf427c4758a746a1a27ecc0127d31044ab501dbc08885c8aa0a514028  qpdf-8.4.0.tar.gz
 # Locally computed:
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 6ed3195733..728ecc9289 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -7,8 +7,8 @@
 QPDF_VERSION = 8.4.0
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
-QPDF_LICENSE = Artistic-2.0
-QPDF_LICENSE_FILES = Artistic-2.0
+QPDF_LICENSE = Apache-2.0 or Artistic-2.0
+QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
 QPDF_DEPENDENCIES = pcre zlib jpeg
 
 QPDF_CONF_OPTS = --without-random
